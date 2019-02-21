# A Docker Setup for the RIPE RPKI Validator 3

## Prerequisites

To create and run the docker container(s) you need a host system with
Docker and docker-compose installed. This may need superuser rights
e.g. `sudo`.

## Configuration

The RPKI Validator will download (rsync) ROAs from the 5 major RIRs, i.e.
AFRINIC, APNIC, ARIN, LACNIC, and RIPE, also refered to as trust anchors.
For downloading TRUST ANCHOR LOCATOR (TAL) files are required, the RPKI
Validator comes with 4 of them, however the TAL for ARIN is not included.
Thus, download the TAL file from [ARIN] and save it into theconfig folder 
`rpki-validator/conf/tals/` (use the RIPE validator format).

Afterwards, check the RPKI validator configuration file, which is found in
`rpki-validator/conf/application.properties`. This will be mounted into the 
running container and can be changed later, too. In case of memory errors 
increase the values of `jvm.memory.*` and restart the container afterwards.

Do the same for the RPKI RTR server configuration, which can be found in 
`rpki-rtr-server/conf/application.properties`.

In general, there is no need to make any changes to the configuration(s).

**Note(1)**: do not change host/server or port settings in the `.properties`
files, this can be done in the `docker-compose.yml`. To do so, open the yml
file and change the values in section `ports`, format is `HOST_PORT:DOCKER_PORT`.
For instance to remap the web UI to `9090` change `8080:8080` to `9090:8080`.

**Note(2)**: the HTTP port (default 8080) binds to localhost (::1) and is
thus not reachable from the outside by default. It is recommended to use
a HTTP proxy (apache or nginx) because there is no HTTPS support by the
RPKI validator itself.

**Note(3)**: the services are set to restart always, i.e., on any errors or
restart of the host system.  See section `restart` in `docker-compose.yml` 
to change this if needed.

## Run the RPKI-Validator and RTR-Server in Docker

Using `docker-compose` this is easy, simply run `docker-compose up -d`.

**Note**: the service is run as non-root, i.e., with user `rpki` (uid=323).

## Updating and Troubleshooting

The `docker-compose` command may require super user rights, i.e., run it 
with `sudo` or as `root`.

Changes to the configuration or new/added TAL files require a service restart.
To restart the service run `docker-compose restart`, if that does not help
run `docker-compose down && docker-compose up -d`.

To update the container(s) or recreate them in case of errors:
1. Stop any running services: `docker-compose down`
2. Force rebuild of the containers: `docker-compose build`
3. Start the service: `docker-compose up -d`

To just stop the container for a moment and start it again use commands
`docker-compose stop` and `docker-compose start`. This halts and
starts the container without deleting or recreating it.

## Copyright and License

For the [ARIN] TAL and the RPKI Validator3 (see [GitHub]) refer to the respective licenses.
For everything else in this repo the MIT License applies, see LICENSE file for details.

[ARIN]: https://www.arin.net/resources/rpki/tal.html
[RIPE]: https://www.ripe.net
[GitHub]: https://github.com/RIPE-NCC/rpki-validator-3
