## Zercurity

Zercurity provides cybersecurity as a service to help businesses identify and close risks, ensure compliance and provide infrastructure intelligence on an ongoing and measurable basis.

### Quick start

Zercurity uses both [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) to install and manage your Zercurity installation.

Once installed. Run `./setup.sh` this simply configures the `production.env` file used for configuring the containers managed by `docker-compose`.

```
./setup.sh
```

Zercurity should now be accessible via `https://app.zercurity.local` or the provided domain.

#### Getting started

To create your initial user account you can either register a new account via the app. Or if
you want to skip the initial email check use this command to generate a signup like:

```
docker exec zercurity_backend_1 ./zercurity --register --name "Your name" --email "your@email.com"
```

#### Updating

```
./update.sh
```

#### Zercurity documentation

A full guide to Zercurity is available here: [https://docs.zercurity.com](https://docs.zercurity.com). Or for more information on setting up and configuring docker please see our in-depth [install guide](https://docs.zercurity.com/onprem/index.html).
