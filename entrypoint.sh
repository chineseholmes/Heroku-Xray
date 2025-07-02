#!/bin/sh

#Xray-Config

rm -rf /etc/xray/config.json
cat << EOF > /etc/xray/config.json
{
  "inbounds": [
    {
      "port": 80,
      "protocol": "vless",
      "settings": {
        "decryption": "none",
        "clients": [
          {
            "id": "$UUID"
          }
        ]
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

#Deploy-Xray

xray -c /etc/xray/config.json
