# RDesktop Docker Image README

This Docker Compose configuration sets up an RDesktop container for remote desktop access. The container includes NetBeans 17 IDE and other utilities like vim, wget, and unzip.

## Prerequisites

Before you begin, ensure you have the following software installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Usage

1. Clone the repository or copy the Dockerfile and the `docker-compose.yml` file into a new directory.
2. (Optional) Create a `netbeans.desktop` file in the same directory as the Dockerfile, as described in the previous answer.
3. Open a terminal or command prompt and navigate to the directory containing the Dockerfile and `docker-compose.yml` file.
4. Run `docker-compose build` to build the Docker image.
5. Run `docker-compose up -d` to start the RDesktop container in detached mode.
6. Connect to the RDesktop container using an RDP client with the following connection details:
   - Host: `<your_docker_host_ip>`
   - Port: `3389`
7. To stop and remove the container, run `docker-compose down`.

## Configuration

The `docker-compose.yml` file includes several optional settings that you can customize:

- `seccomp:unconfined`: This setting disables the default seccomp profile for the container. Uncomment this line if you experience issues with the container.
- `/var/run/docker.sock:/var/run/docker.sock`: This volume mount allows the container to access the Docker daemon on the host. Uncomment this line if needed.
- `./config:/config`: This volume mount maps the current directory to the `/config` directory in the container. Uncomment this line to persist configuration files between container runs.
- `/dev/dri:/dev/dri`: This device mapping enables hardware acceleration for the container. Uncomment this line if your system supports it.
- `shm_size: "1gb"`: This setting increases the shared memory size for the container. Uncomment this line if you experience performance issues.

## Troubleshooting

If you encounter issues or need to customize the container further, you can modify the environment variables and volume mounts in the `docker-compose.yml` file. Make sure to rebuild the image and recreate the container using `docker-compose build` and `docker-compose up -d` after making changes.
