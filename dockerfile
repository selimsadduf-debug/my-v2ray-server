FROM teddysun/xray:latest

RUN echo '{\
  "inbounds": [{\
    "port": 8080,\
    "protocol": "vless",\
    "settings": {\
      "clients": [{"id": "05d7a479-a099-40cf-aecf-41aa934767b0"}],\
      "decryption": "none"\
    },\
    "streamSettings": {\
      "network": "ws",\
      "wsSettings": {"path": "/api/v1/events"}\
    }\
  }],\
  "outbounds": [{"protocol": "freedom"}]\
}' > /etc/xray/config.json

CMD ["xray", "run", "-config", "/etc/xray/config.json"]
