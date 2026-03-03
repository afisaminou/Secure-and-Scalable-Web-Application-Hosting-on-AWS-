#!/bin/bash

dnf update -y
dnf install -y python3 python3-pip

pip3 install flask pymysql

cat <<EOF > /home/ec2-user/app.py
from flask import Flask
import pymysql

app = Flask(_name_)

@app.route("/api")
def api():
    return "Backend is working"

if _name_ == "_main_":
    app.run(host="0.0.0.0", port=3000)
EOF

cat <<EOF > /etc/systemd/system/backend.service
[Unit]
Description=Backend Flask App
After=network.target

[Service]
User=ec2-user
WorkingDirectory=/home/ec2-user
ExecStart=/usr/bin/python3 /home/ec2-user/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reexec
systemctl daemon-reload
systemctl enable backend
systemctl start backend