# Docker Image for Firefox in Ubuntu

# Build the Docker Image

From the project folder, run the command below:

```bash build.sh```

# Run docker container

## Standard approach (recommended)

From the project folder, run the command below:

```docker-compose up -d```

Once you start the container, you can access the terminal from broswer (see "Use the Docker container" section below) or run the following command:

```docker exec -it firefox-ubuntu bash```

## Alternative approach

You can run the following command:

```docker run -it -d -p 5800:5800 gnasello/firefox-ubuntu:latest```

# Use the Docker container

Open ```localhost:5800``` in your browser to get a virtual desktop.