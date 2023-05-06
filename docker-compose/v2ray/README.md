# v2ray

## Usage

### install docker compose

ref: [Install Docker Engine](https://docs.docker.com/engine/install/)

``` bash
# Remove old version
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Set up Docker's apt repository.
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

```

### run v2ray using docker compose

The confs directory maintains the v2ray configuration.If you need to modify it, please refer to the [v2ray document](https://www.v2fly.org/v5/config/overview.html).

``` bash
# run
docker compose up -d

# logs
docker compose logs -f

# restart
docker compose logs -f

# stop
docker compose stop

# remove
docker compose rm
```

## ChatGPT

You can use cloudflare warp to proxy chatgpt traffic. By default, warp is not started, you shold enter v2ray container to start it up.(If the proxy IP is unavailable, restart warp several times and wait to switch to an available IP.)

``` bash
docker exec -it ${v2ray-container-id} bash

# in container
warp-svc > warp.log 2>&1 &
warp-cli disconnect && sleep 3 && warp-cli connect && sleep 3
# in container, get proxy ip
export ALL_PROXY=socks5://127.0.0.1:40000 && curl myip.ipip.net
# in container, request chatgpt page to determine if chatgpt can be accessed
export ALL_PROXY=socks5://127.0.0.1:40000 && curl -s https://chat.openai.com/ -I | grep "text/plain"
```
