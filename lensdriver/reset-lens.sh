#! /bin/bash

mkdir -p /data/bai-cm/template-data/lens
cat << EOF > /data/bai-cm/template-data/lens/config.json
{
    "lens_current": {
        "zoom_percent": "0",
        "iris_percent": "0",
        "focus_percent": "0"
    }
}
EOF

cat << EOF | ./lensDriver
setzoom 100
setiris 100
setfocus 100
ircuton
EOF
