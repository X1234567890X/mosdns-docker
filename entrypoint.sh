#!/bin/sh
DATA_DIR="/etc/mosdns"
RULE_DIR="/etc/mosdns/rules"

url_china_domains="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt"
url_gfwlist_domains="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt"
url_block_domains="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt"
url_china_ips="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt"

if [ ! -f "$RULE_DIR/hosts.txt" ];then
    touch $RULE_DIR/hosts.txt
    echo "[INFO] hosts.txt inited!"
fi

if [ ! -f "$RULE_DIR/china_domains.txt" ];then
    wget -q $url_china_domains $RULE_DIR/china_domains.txt
    echo "[INFO] china_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/gfwlist_domains.txt" ];then
    wget -q $url_gfwlist_domains $RULE_DIR/gfwlist_domains.txt
    echo "[INFO] gfwlist_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/block_domains.txt" ];then
    wget -q $url_block_domains $RULE_DIR/block_domains.txt
    echo "[INFO] block_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/china_ips.txt" ];then
    wget -q $url_china_ips $RULE_DIR/china_ips.txt
    echo "[INFO] china_ips.txt inited!"
fi

/usr/bin/mosdns start