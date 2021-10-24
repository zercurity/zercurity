## Release notes

#### 28/09/2021 (eeb624a)

* Added support in the GUI for USB device owners
* Added support in the GUI for the configuration of Google Santa, rule sets and rule configuration. The configuration applies for companies, teams and assets.
* Prevent duplicate results being ingested upon network retries for ad-hoc Osquery results

*On-prem*
* Added monitoring for PostgreSQL with Grafana and Prometheus
* Added device sync with Zercurity data services for device types


#### 14/09/2021 (2bd52f6)

* Added User risk alpha based of online data leaks
* Added support for paging on Zercurity data services
* Added support for Osquery 4.6.0-4.6.9
* Added support for asset filtering for FIM events
* Added the ability to remove compliance frameworks
* Added the ability to remove compliance framework rules
* Added HTTP/HTTPS as a remote logging endpoint for Zercurity events
* Added new compliance frameworks for MacOSX 16, Linux distributions and the latest Windows 10 releases
* Improved CVE reporting for Ubuntu packages
* Improved compliance reporting for markdown parsing
* Fixed XAR timestamp package signing for compatibility with some MDM providers
* Fixed the deprecation of whitelist and blacklist from Google Santa and Osquery
* Re-write of our Windows update recommendation engine. Zercurity now no longer includes intermediate KB patches

*On-prem*
* Added support for synchronising Windows updates
* Added OS release information for synced operating system releases
* Added package and application data is now synced even if the server isn't licensed
* Improved package and application sync
* Improved the default postgres instance params
* Improved OS vulnerability sync
* New OS and Windows data added to the Zercurity data services platform
* Fixed a number of issues relating to the reporting generation based on prior weeks

#### 13/06/2021 (4e1dc77)

* Zercurity investigations is now in Alpha
* Added a new search engine across both your Zercurity account and Zercurity's new data services platform
* Added Markdown formatting for generated reports
* Added an Osquery flag checker to prevent performance issues when overriding the defaults
* Fixed an issue when manually running compliance checks. Zercurity wouldn't use overridden configurations
* Fixed several UI issues when generating IAM policies
* Fixed several IAM nesting issues within the UI when inheriting from other policies
* Fixed a UI issue with the process explorer results not being rendered
* Fixed a UI issue with the workflow execution states not being correctly rendered post execution
* Fixed trailing whitespace for text inputs

*On-prem*
* Improved data services sync times
* Added sync support for external IP address enrichment
* Reduced the backend image size by 60%

#### 13/05/2021 (4e1dc77)

* Zercurity investigations is now in Alpha
* Added a new search engine across both your Zercurity account and Zercurity's new data services platform
* Added Markdown formatting for generated reports
* Added an Osquery flag checker to prevent performance issues when overriding the defaults
* Fixed an issue when manually running compliance checks. Zercurity wouldn't use overridden configurations
* Fixed several UI issues when generating IAM policies
* Fixed several IAM nesting issues within the UI when inheriting from other policies
* Fixed a UI issue with the process explorer results not being rendered
* Fixed a UI issue with the workflow execution states not being correctly rendered post execution
* Fixed trailing whitespace for text inputs

*On-prem*
* Improved data services sync times
* Added sync support for external IP address enrichment
* Reduced the backend image size by 60%

#### 14/02/2021 (ae7648b)

* Added Identity and access management (IAM) to Zercurity.
* Added additional configuration parameters for on-prem deployments to manage SMTP mailer settings
* Added community support for Kubernetes.
* Added support for Osquery up to 4.6.0.
* Improved the Windows installer update system. There were a few cases when downgrading to prior versions the installer wouldn’t handle database migrations and configuration changes correctly.
* Frontend package dependencies have been updated to their latest versions.

#### 01/11/2020 (575dff9)

* The Zercurity frontend now loads UI components in chunks to reduce the landing size from 6MB to 2MB.
* Added sections for assets view. (Support for multiple query params added)
* Added new carver view for quick access to carved files via Osquery as well as their status.
* Added new dashboard for process that have triggered a ruleset rule.
* Added support for Google's Santa 1.15.
* Added new policy builder for IAM.
* Added support to attach multiple policies to a single user, team or asset.
* Fixed an issue with application rulesets not being correctly applied when an asset changed team.
* Fixed support for older versions of Google Santa to apply allow and block paths using the older `whitelist_path` and `blacklist_last` config options.

#### 11/10/2020 (4f0b436)

* Overhauled asset risk management for patches and vulnerabilities. Asset scores now take into account the length of time the asset has remained un-patched in determining the risk of the asset.
* Added support for Allow/Deny regex for Google's Santa to include or exclude paths and binaries.
* Added additional CEF extension fields for Zercurity events.
* Including service accounts for Windows logon audits.


#### 04/10/2020 (a0bb5a2)

* Added new configuration support for Google Santa 1.14 (Not yet released).
* Added FCM settings for Google Santa.
* Added assets view for users.
* New configuration page for assets. Lets you better control over global settings.
* New mobileconfig profile for MacOSX hosts.
* New logging integration. Lets you forward Zercurity event logs to an external source. Syslog, CEF, JSON and ElasticSearch are supported.
* Included new Sectigo CA certificates for the migration away from COMODO.
* Made some mobile config changes for user overrideable options. See included comments.
* Fixed an issue when updating a rule for an asset sometimes the new configuration change would not be recognised.
* Fixed a few UI issues and grammar mistakes.
* Fixed a permissions for the LaunchDaemon issue on MacOSX.
* Fixed an issue with complex sub-queries for the Osquery workbench not being able to correctly map inferred column names.

*API changes*

* Users email address now returned in user related JSON sub docs. This can be disabled as per GDPR.

#### 30/08/2020 (f900e53)

* Fixed the Santa installer to improve both the install time and user experience during a re-install.
* Fixed an issue when when enrolling an asset on a new team. Zercurity would use the old team.
* Fixed an issue where the /opt directory would be removed by the Debian installer if Zercurity was the only application installed to that directory.
* Fixed the search for Santa rulesets.
* Fixed a performance issue for application, package and process hash lookups.
* Fixed use a different name format for Certificates.
* Fixed an issue with time syncs for Santa rulesets. Milliseconds are now included.
* Fixed an issue for Santa rulesets to perform a clean re-sync when re-installing the Santa agent.


#### 17/08/2020 (2b5d64f)

* Added new IAM dashboard for companies. Administrators can now create and attach policies to users and groups. This feature is currently in BETA.
* Added new investigations pane for exploring data within Zercurity. This is an early access preview.
* Added support for SAML2. We've tested support in Okta, Auth0 and Google G-suite. SAMl2 can now be integrated via the settings menu.
* Added alerts are now marked as "seen" in the UI. Rather than the bell icon always showing a new alert before its acknowledged.
* Added new alerts modal with a quick link to all the events.
* Added support for Osquery 3.4.0 (Windows, Linux and OSX agent have had their versions bumped)
* Added parser for Windows firewall system event logs. Event information is also sent and compared to the system socket information.
* Added new menu option for assets to quickly show their system logs.
* Added support for Osquery to also log to the logs directory as well as sending Osquery logs to Zercurity.
* Added namespace names can now be up-to 50 characters.
* Added support for Windows Server 2013,2016 and 2019 for CIS benchmarks.
* Added new network view.
* Added new network traffic view.
* Added loading spinners have been added to UI list components when searching.
* Updated and fixed several compliance rules across multiple frameworks.
* Fixed an issue when resetting a users password. If the users account had been updated during the password reset it would fail.
* Fixed a typo for "Google" in the UI when creating an integration.
* Fixed a bug causing a 500 internal server error when viewing specific system event logs.
* Fixed an issue with the Heatgrid in the compliance view when hovering over specific items. Causing the table to "glitch".
* Fixed static widths have been removed from the UI for smaller screens.
* Removed old Sectigo Root Certificate which expired back on May 30th

*On-prem*

* New configuration option for file repository URL for the creation of packages when they're being built.
* Support for Let's encrypt has been added though the `LETSENCRYPT` environment variable for the NGINX docker container.
* Upgrade to PostgreSQL 12.3
* Fixed a uniqueness check for deleted rules within a ruleset.

#### 23/05/2020 (b7dc8996)

* Added new global search function in the application header. You can also use the hotkey "Shift + S".
* Added new weekly email template to provide a better summary of the progress made during the last week and months.
* Added the ability to filter assets under the SIEM filter menu.
* Updated existing email templates with the new theme.

*On-prem*

* Added logger for backend web requests.
* Updated NGINX LUA scripts to process larger payloads when written to disk.
* Fixed Windows update descriptions instead of the default URL.


#### 10/05/2020 (16e8ccf)

* Added new progress bar and job summary information for Osquery jobs.
* Added issues now carry risk scores. This is different to the issue priority. This is the average of the underlying component risk.
* Added "asset" field to issues to directly tie an issue to an asset. Rather than relying on a component.
* Updated new issues section under Assets to show the open and resolved issues. Rather than before having a list of individual issue components.
* Updated event change information now shows user and team information, when modified rather than the UUID.
* Fixed an issue with conflicting hostname information. Some updates would use the FQDN and others would rely on the local machine name.
* Fixed an issue when searching for Rulesets and Rules under the Santa view.
* Fixed an issue when searching for Rulesets under the Asset view.
* Fixed an issue with fully encrypted Windows drives sometimes not being registered.

*On-prem*

* Updated NGINXs max client body size default has been from 60MB to 128MB.
* Fixed an issue when creating a new discovered asset without a MAC address.
* Fixed an issue when a USB device is inserted with no Vendor or Model information.

*API changes*

* **BREAKING** The API resource `/asset/{uuid}/issues` now shows actual issue hits. Rather than the at risk asset components.
* The API resource `/events` now includes User and Team object in event changes.


#### 03/05/2020 (42148ac)

* Added Team migration support. Assets can now be moved between teams.
* Added Compliance frameworks & rules created by Zercurity can now be updated and overridden by the user.
* Added Asset compliance rules can now be reset if a specific change was made for the Asset.
* Updated We've made some configuration tweaks to the Osquery flags file Osquery is deployed with around the Osquery Watchdog.
* Updated We've adjusted the fuzzy matching for system owners when using Google G-suite integrations.
* Updated Compliance and Rulesets API now mirror one another to improve user experience via the API.
* Fixed On Mac OSX Zercurity's `audit_control` config wasn't being installed to the correct directory due to a typo.
* Fixed Some Windows event's were being reported with malformed JSON due to encoding issues.
* Fixed The Assets menu was being displayed for Compliance rules under the compliance frameworks tab.
* Fixed The `assessed_at` time on the Asset view was showing the current timestamp if the Asset had yet to be assessed for its cybersecurity posture.


*On-prem*

* Fixed a connection saturation issue for scheduled jobs.
* Fixed a bug for Windows updates having a "duplicate" UUID for product matches.

*API changes*

* The API resource `/asset/{uuid}/summary` now returns the rule name and binding instead of the rule id.
* The API resource `/compliance/{company}/framework/{namespace}/configuration` now returns the user's configuration in the `config` key rather than being set over the top of the existing object.
* The API resource `/compliance/{company}/rule/{uuid}/configuration` now also returns a `config` object.
* The API resource `/asset/{uuid}/compliance` now also returns a `config` object.


#### 25/04/2020 (1c5a72e)

* Added Google Santa 1.13.
* Added compliance namespace to breadcrumbs when viewing rule.
* Added workflow name to breadcrumbs when viewing execution.
* Added new event filter drop down.
* Added Zercurity now install installs its server and CA certificates into Apple's Keystore if those certificates are not already present.
* Added more checks on workflows in the UI to improve the user experience.
* Added Osquery and Google Santa check-in times to the Asset view.
* Updated NPM packages (frontend libraries) to their latest versions.
* Fixed "tabbing" index on modals such as Login to prevent accidental SSO login.
* Fixed the Google Santa installer when installing as a user on 10.15 and above to improve the user experience.
* Fixed a bug where you weren't able to update the rule name when creating a pre-populated rule from the applications or asset menu.
* Removed Google Santa 1.11 and 1.12 (due to vulnerabilities).
* Removed the default Google Santa rulesets from the Create rule modal.

*On-prem*

* Added some additional database indexes to improve performance.
* Added revision hashes and version information is now present on the /v1/healthcheck resource.
* Fixed the way Zercurity issues self-signed certificates to make sure they adhere to Apple's ATS policies.


#### 11/04/2020 (889b45e)

* Added new visual workflow builder. JSON workflows can now be visualised.
* Updated all JS libraries.
* New Zercurity installer to identify and exclude common and invalid UUIDs from being enrolled.
* New configuration options for custom Osquery deployments.
* Removed old ReactJS state hooks.
* Fixed an issue when creating a Santa rule not redirecting to the correct page.
* Fixed UUID asset processes for on-prem deployments.


#### 06/04/2020 (ade3c6f)

* Added SSO support for Google.
* Added SSO support for Github.
* Added support to disable/enable compliance rules at the namespace, team, asset and rule level.
* Added additional asset information when filtering for assets.
* Added dry-run feature to Osquery workbench.
* Added additional tests for workflow JSON syntax.
* Added hostnames are now shown in Osquery results.
* Compliance rules are now run as an ad-hoc query rather than as a scheduled query.
* Fixed an error when trying to delete an Organisation.
* Fixed when applying filters to Osquery results if would fail.
* Global compliance rules (owned by Zercurity) are now customisable.
* Zercurity builder now bumped to 2.3.


#### 15/03/2020 (c0676560)

* 502 errors are now handled gracefully for the NGINX proxy when services are still starting up for on-prem.
* Fixed an issue when sorting packages by their vendor.
* Added initial support for IAM roles to provide granular permissions over APIs and features.
* Updated Osquery to 4.2.0
* Updated Google Santa to 1.10.0
* For the Mac OSX installer you can now remove either Osquery or Santa as a module through the GUI.
* Applications may now be added to rulesets straight from the applications or processes list.


#### 28/02/2020 (8781b83)

* Deprecated Kubernetes on-premise deployment in favour of docker-compose.
* New documentation website.
* Workflows are now public for pro customers.
* Osquery support updated to 4.2.0
* Santa support for 1.3.0 (Beta) needs to be selected manually.


#### 25/12/2019 (e1ddfdc)

* Workflows now available to Enterprise customers.
* General availability for slack integration.
* General availability for Atlassian JIRA integration.
* Added new event hooks for compliance, system upgrades and policy changes.
* Added new search and date time scrubbing for asset processes, devices, applications, packages, updates and compliance changes.
* Improved syslog/ASL/Windows event search performance.
* Improved documentation to reflect new features.
* download.zercurity.com is now no longer using an AWS certificate, due to compatibility issues.

*API changes*

* Network interface information now returned as part of the `/assets` resource.


#### 27/10/2019 (360b9aa)

* Added new updates page under inventory to show all outstanding system and applications that require updates.
* Added support to specify compliance rule level filtering against assets rather than a compliance level filter.
* Compliance rule reports now provide more asset detail about their platform and type.


#### 19/10/2019 (ec620a5)

* Added the ability to disable compliance frameworks
* Added the ability to force schedule a check against a compliance rule
* Added the ability to update custom compliance rules
* Windows installer now modifies the Zercurity service to recover should there be a crash
* Fixed menu sizes for ultra-wide monitors


#### 30/09/2019 (3c9ed26)

* Added Osquery 4.0.2 to the installers
* Added Google Santa 0.9.33 to the installers
* Added support for Mac OSX 10.15 Catalina, including OSX TCC policies
* Added the ability to set what version of Osquery or Google Santa will be bundled with the installer
* Added the ability to update an assets type
* Added the ability to add notes to an asset
* Fixed some issues with the Windows installer whilst updating

* BETA - JIRA integration now available for public testing


#### 22/09/2019 (e63a154)

* Added compliance user interface overhaul. Zercurity now providers better visibility of failing compliance rules.
* Added the ability for users to now create their own compliance frameworks and rules.
* Added an additional cookie to track the last company you were working on in the event of full-page navigation.
* Fixed an issue when checking for Windows disk encryption.
* Fixed an issue when trying to filter issues for backlogged items.
* Fixed an issue where some interfaces were missing if they had none or an invalid netmask.
* Fixed an issue where if a logged in user was deleted. They would start getting errors from the UI. They are now instead gracefully logged out.
* Global events will now only show the last 7 days in the UI by default

* ALPHA - Workflows new UI components added for better visualisation of state between actors.

*API changes*

* The compliance API has been completely reworked. The existing API resources still exist but now return additional information. There are now new APIs to create new compliance namespaces and create and edit rules.


#### 02/09/2019

* Added the ability to now force an update of every asset component, disk info, device info, updates etc.
* Added a new vulnerability view under each asset
* Fixed font awesome icon packs not showing sometimes
* Fixed issues regarding Windows updates being marked as missing when they were in fact installed
* Fixed an issue where issue components kept removing themselves
* Fixed a bug for UI CVE names
* Fixed an issue when sorting issues
* Updated asset network history is now stored instead of a snapshot to help aid network discovery
* Updated the colour or tags to be the same across the application when denoting Critical, High, Medium or low tasks

* ALPHA - JIRA integration added
* ALPHA - Workflows made available for testing

*API changes*

* Zercurity reports have now been bumped to version 2. Changes have been made to the issues object to better summerise issue activity


#### 10/08/2019

* Added issues. Zercurity will now create issues for risks that need to be addressed. Issues can be marked as acknowledged to suppress them. Zercurity will use these issues to trigger future workflows to automate tasks.
* Added the ability to create assets manually as a discovered asset. You can import asset inventories from external sources to marry up what assets Zercurity has discovered versus those enrolled. Assets can also now be tagged with barcodes.
* Added windows patch management. Zercurity can now automatically work out what patches have not been applied to a system as well as the vulnerabilities the un-patched system are vulnerable too.
* Added Osquery progress tracking. The UI will now show the number of assets a given query has been run against.
* Updated assets view to show compliance, update and vulnerability issues.
* Zercurity will now check the last time we received events for Osquery and Google Santa. Should we not receive telemetry for a month or more an issue will be raised.
* Improvement all mac addresses are now presented as lowercase. Zercurity will now accept a range of mac address formats via the API e.g. (aa:bb:cc, aabbcc, aa-bb-cc).
* Fixed an issue when running queries against teams, resulting in an error.
* Fixed an issue for drop-downs with more than 50 items. Zercurity will now collapse menu items down into searchable lists.
* Fixed some UI bugs that in certain cases the browser would go blank.


#### 28/07/2019

* Added the ability to add assets to asset discovery
* Added the ability to assign serial numbers in asset discovery
* Added the ability to assign owners in asset discovery
* Added the ability to change the type of an asset in asset discovery. Zercurity will try and guess the type based on the discovered MAC address
* Added type filter for assets
* Added "open in new tab" support to links
* Updated the help menu to provide more support options if the chat window fails to load (usually due to browser plugins)
* More performance improvements.
* Fixed column sort for certificates
* Migrated to new AWS lambda function version for package deployment and builds
* Released zercurity-2.2.pkg. MacOSX Osquery now installs to the /usr/local/zercurity/. Deploying the new release to remove the existing Osquery daemon and move it to the new directory to avoid conflicts with other software using Osquery such as JumpCloud.

* BETA - New issues view for assigned users


#### 24/07/2019

* Added issues platform now in Alpha. Any problems that are detected are now managed as a ticket.
* Added the ability to remove FIM rules.
* Added the ability to view deployed FIM rules.
* Lots of improvements to performance. We've spent a lot of time performance profiling the platform.
* Improved Ubuntu CVE parser
* Fixed encryption marking for disks in the UI. No longer just marking parent disks


Older release information has been pruned.
