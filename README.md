## Zercurity

Zercurity provides cybersecurity as a service to help businesses identify and close risks, ensure compliance and provide infrastructure intelligence on an ongoing and measurable basis.

Zercurity leverages a number of open-source projects including [Osquery](https://github.com/osquery/osquery) and [Google's Santa](https://github.com/google/santa) to provide a single platform for 
[Asset inventory management](https://docs.zercurity.com/inventory/assets/index.html), 
[Patch management](https://docs.zercurity.com/inventory/updates.html), 
[Vulnerability assessments](https://docs.zercurity.com/inventory/vulnerabilities.html), 
[Compliance](https://docs.zercurity.com/compliance/frameworks/index.html), 
[SIEM](https://docs.zercurity.com/compliance/siem.html), 
[Device monitoring](https://docs.zercurity.com/inventory/devices.html),
[File integrity monitoring](https://docs.zercurity.com/compliance/fim.html),
[Ad-hoc device queries](https://docs.zercurity.com/osquery/live_workbench.html), 
[Network monitoring](https://docs.zercurity.com/), 
[Application whitelisting](https://docs.zercurity.com/santa/index.html), 
[Issue & risk tracking](https://docs.zercurity.com/overview/issues.html), 
[Investigations](https://docs.zercurity.com/), 
[Workflows (SAM)](https://docs.zercurity.com/overview/workflows/index.html), 
[File retrieval](https://zercurity.medium.com/file-retrieval-with-osquery-using-carves-on-zercurity-9b157f7c0801), 
[User focused security](https://zercurity.medium.com/managing-compliance-with-osquery-for-local-remote-workers-4fbf7c3dc406), 
[Applications & Packages](https://docs.zercurity.com/inventory/applications.html),
[Integrations](https://docs.zercurity.com/integrations/index.html)

![Zercurity screenshots](https://raw.githubusercontent.com/zercurity/zercurity/main/screenshots/zercurity.gif)

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

