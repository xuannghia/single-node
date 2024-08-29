# Deploy web apps to a single node

## Init
```bash
docker swarm init
```

## Build

```bash
docker build -t whoami-curl:latest .
```

## Deploy 

```bash
SERVICE_NAME=whoami docker stack deploy -c apps.compose.yml whoami --detach
```

## Rollout

- `--force` - force the update even if the image is not changed
- `--update-parallelism 1` - update one container at a time
- `--update-delay 5s` - wait 5 seconds between updates

```bash
docker service update --force --update-parallelism 1 --update-delay 5s whoami_app

```

## Check

> Install [Gum](https://github.com/charmbracelet/gum?tab=readme-ov-file) first!

```bash
bash check.sh
```
