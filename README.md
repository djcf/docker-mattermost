# Docker Mattermost

Simple Docker image to run Mattermost with a Postgres database.

This image does not include the database.

Use the official Docker image https://hub.docker.com/r/mattermost/platform/ for a full install in a single container.

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
            - "8065:8065"
        environment:
            - POSTGRES_USER=mmuser
            - POSTGRES_PASSWORD=mmuser_password
            - POSTGRES_DB=mattermost
        links:
            - postgres

Pull the images

    docker-compose pull

Build the database first to avoid connection issues

    docker-compose up postgres

Launch the app

        docker-compose up

Browse your web-server on port `8065`.
