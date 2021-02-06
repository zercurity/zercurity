# Installing Zercurity on Kubernetes

## Prerequisite

You will obviously need a Kubernetes cluster. No special permissions are required at present. 

The only real requirement is an NFS server. To share compiled and signed binaries between the backend, and the NGINX proxy for download. 

If your kubernetes cluster supports shared disks you can also provision a shared PVC.

## Installing via Kubectl

This guide is designed to get you up and running with Zercurity on Kubernetes via the provided configuration.

### Creating a namespace

The default namespace used in this configuration is `zercurity` this can be overridden with your own namespace using the `-n` flag within your kubectl command. All the commands shown will use this flag to specify the `namespace`.

```
kubectl create ns zercurity
```

### Applying ConfigMaps and Secrets

There are two configuration files. The non-sensitive configuration parameters are in `cm-config.yaml`, and the secrets are stored within `sc-config.yaml`.

The only three things I would change for the initial configuration are the application domain name `ZERCURITY_DOMAIN` (which can be changed at anytime). I'd also change the application secret and database password.

```
kubectl apply -n zercurity -f cm-config.yaml
kubectl apply -n zercurity -f sc-config.yaml
```

### Applying PersistentVolumeClaims

We've currently designed the deployment to work around an NFS server. The NFS server is used to store and serve the installation binaries via the NGINX pod. Which is configured to be `readOnly` and backend pods will generate and store the installer binaries to these NFS server.

If your kubernetes cluster supports shared PVCs you can just use a shared PVC instead. 

You will need to edit the `pv-nfs.yaml` with your server information.

```
kubectl apply -n zercurity -f pv-nfs.yaml
kubectl -n zercurity get pv
```

Once the `PersistentVolume` has been created. Make sure the status is `Bound`. We can now create our `PersistentVolumeClaims`.

This command will also create the PVC for our database server too. Feel free to resize as needed. Though we'd recommend using something like [https://google.com|pgo] for database management.

```
kubectl apply -n zercurity -f pvc-*.yaml
kubectl -n zercurity get pvc
```

### Applying the Deployments

Now for the fun part. Once the volumes are showing they've been successfully `Bound`. You can now deploy Zercurity.

```
kubectl apply -n zercurity -f dp-*.yaml
kubectl -n zercurity get deploy
kubectl -n zercurity get pods
```

It will take a few minutes to download the images and start the containers.

### Applying the services and load-balancer

Whilst this is happening you can deploy the services and load balancers.

```
kubectl apply -n zercurity -f svc-*.yaml
kubectl -n zercurity get svc
```

### Initialising the database and running the migration scripts

When the postgres container successfully comes up. It maybe the case that other containers are in a `CrashBackOff` state. This is because database hasn't been configured.

We can fix this by running this migrations job. This needs to be run post an update.

```
kubectl apply -n zercurity -f job-*.yaml
```

This will now initialise the database. Post the migrations job running. It maye take the jobs a few more minutes to come up. However, once they're all in the running state you'll be able to visit the app via the LoadBalancer's IP address or hostname if you've already configured your DNS.

### Accessing the web application

If you've left the defaults as they are. Zercurity will be bound to the following hostname `https://app.zercurity.local`.

You can also check the API server is happy and healthy like so:

```
curl -k -vvv https://<Load balancer IP>/v1/healthcheck | json_pp
{
  "status": "HEALTHY"
}
```

### Creating your initial user

You can create your first account using the Register button from within the app. However, if you're having issues with SMTP or the mailer and want to create an account to just get going. You can exec the following to create a registration link to create an account.

This link is short-lived and unique to the email address provided.

```
kubectl -n zercurity exec backend-77c9cbf84d-lhg2g -- ./zercurity --register --name "Tom" --email "tom@jerry.com"
https://app.zercurity.local/register/3bUJQ7z..aJLGC7W9S
```
