FROM debian:11
LABEL maintainer="yilei <yilei108@gmaill.com>"

RUN set -ex \
    && apt update \
    && apt install -y curl tzdata ca-certificates desktop-file-utils gnupg2 unzip

# install v2ray
RUN mkdir -p /etc/v2ray && mkdir -p /var/log/v2ray && mkdir -p /tmp/v2ray \
    && V2RAY_VERSION=$(curl https://api.github.com/repos/v2ray/v2ray-core/releases/latest | grep 'tag_name' | sed -E 's/.*"([^"]+)".*/\1/') \
    && curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/download/${V2RAY_VERSION}/v2ray-linux-64.zip \
    && unzip /tmp/v2ray-linux-64.zip -d /tmp/v2ray \
    && mv /tmp/v2ray/v2ray /usr/bin/v2ray \
    && mv /tmp/v2ray/v2ctl /usr/bin/v2ctl \
    && mv /tmp/v2ray/geoip.dat /usr/bin/geoip.dat \
    && mv /tmp/v2ray/geosite.dat /usr/bin/geosite.dat \
    && rm -rf /tmp/v2ray /tmp/v2ray-linux-64.zip

# install cloudflare warp
RUN curl -L -H "Cache-Control: no-cache" -o /tmp/cloudflare_warp_2023_3_398_1_amd64_002e48d521.deb https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2023_3_398_1_amd64_002e48d521.deb \
    && apt install -y /tmp/cloudflare_warp_2023_3_398_1_amd64_002e48d521.deb \
    && rm -rf cloudflare_warp_2023_3_398_1_amd64_002e48d521.deb

ENV TZ=Asia/Shanghai

CMD [ "v2ray", "-confdir", "/etc/v2ray/confs" ]
