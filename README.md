# Docker Mattermost

Simple Docker image to run Mattermost with a Postgres database.

This image does not include the database.

Use the official Docker image https://hub.docker.com/r/mattermost/platform/ for a full install in a single container.


## Usage

Start a database container

    docker run -it --link my-postgres:postgres --rm postgres sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U mmuser dbmattermost'

Start the Mattermost container

    docker run --name my-mmapp --link my-postgres:db -e DB_USER=mmuser -e DB_PASS=secret -e DB_NAME=dbmattermost -p 0.0.0.0:8065:8065 -d geelweb/mattermost

Browse localhost on port `8065`.


## Env properties

*DB_USER*:
The PostgreSQL database user.

*DB_PASS*:
The PostgreSQL database password.

*DB_NAME*:
The PostgreSQL database name


## Example of usage with Compose

Create a Compose file

    # docker-compose.yml
    postgres:
        image: postgres:9.4
        environment:
            - POSTGRES_USER=mmuser
            - POSTGRES_PASSWORD=mmuser_password
            - POSTGRES_DB=mattermost
    app:
        image: geelweb/mattermost:latest
        ports:
            - "0.0.0.0:8065:8065"
        environment:
            - DB_USER=mmuser
            - DB_PASS=mmuser_password
            - DB_NAME=mattermost
        links:
            - postgres:db

Pull the images

    docker-compose pull

Build the database first to avoid connection issues

    docker-compose up postgres

Launch the app

    docker-compose up

Browse your web-server on port `8065`.
