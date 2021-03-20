#!/bin/bash

xowa_version=v4.6.15.2101
mkdir -p /opt/xowa
cd /opt/xowa
wget https://github.com/gnosygnu/xowa/releases/download/${xowa_version}/xowa_app_linux_64_${xowa_version}.zip
unzip xowa_app_linux_64_${xowa_version}.zip
rm xowa_app_linux_64_${xowa_version}.zip

#download simplewikipedia
mkdir -p /opt/xowa/wiki
