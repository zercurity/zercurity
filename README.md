## Zercurity

Zercurity provides cybersecurity as a service to help businesses identify and close risks, ensures compliance and provides infrastructure intelligence on an ongoing and measurable basis.

### Quick start

Zercurity uses both [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) to install and manage your Zercurity installation.

Once installed. Run setup.sh this simply configures the `production.env` file.

```
./setup.sh
```

Once configured start the containers like so:

````
docker-compose --env-file ../dev_local.env up
````

Zercurity should now be accessible via `https://zercurity.local`

#### Updating

```
./update.sh
docker-compose --env-file ../dev_local.env down
docker-compose --env-file ../dev_local.env up
```

#### Getting started

To create your initial user account you can either register a new account via the app. Or if
you want to skip the initial email check use this command to generate a signup like:

```
docker exec dev_backend_1 ./zercurity --register --name "Your name" --email "your@email.com"
```


#### Zercurity documentation

A full guide to Zercurity is available here: [https://docs.zercurity.com](https://docs.zercurity.com). Or for more information on setting up and configuring docker please see our in-depth [install guide](https://docs.zercurity.com/onprem/index.html).
