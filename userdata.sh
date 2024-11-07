#!/bin/bash
yum update -y
yum install -y git python3
git clone https://github.com/Waltzi/TestMarketPlace.git
cd TestMarketPlace || exit 1
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp marketplace.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable marketplace
systemctl start marketplace
