#!/bin/sh
DATA_DIR="/etc/mosdns"
RULE_DIR="/etc/mosdns/rules"

if [ ! -f "$DATA_DIR/config.yaml" ];then
    cp /root/config.yaml $DATA_DIR/config.yaml
    echo "[INFO] config.yaml inited!"
fi

if [ ! -d "$RULE_DIR" ];then
    mkdir $RULE_DIR
    echo "[INFO] $RULE_DIR inited!"
fi

if [ ! -f "$RULE_DIR/hosts.txt" ];then
    touch $RULE_DIR/hosts.txt
    echo "[INFO] hosts.txt inited!"
fi

if [ ! -f "$RULE_DIR/china_domains.txt" ];then
    cp /root/china_domains.txt $RULE_DIR/china_domains.txt
    echo "[INFO] china_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/gfwlist_domains.txt" ];then
    cp /root/gfwlist_domains.txt $RULE_DIR/gfwlist_domains.txt
    echo "[INFO] gfwlist_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/block_domains.txt" ];then
    cp /root/block_domains.txt $RULE_DIR/block_domains.txt
    echo "[INFO] block_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/china_ips.txt" ];then
    cp /root/china_ips.txt $RULE_DIR/china_ips.txt
    echo "[INFO] china_ips.txt inited!"
fi

if [ ! -f "$RULE_DIR/custom_china_domains.txt" ];then
    touch $RULE_DIR/custom_china_domains.txt
    echo "[INFO] custom_china_domains.txt inited!"
fi

if [ ! -f "$RULE_DIR/custom_global_domains.txt" ];then
    touch $RULE_DIR/custom_global_domains.txt
    echo "[INFO] custom_global_domains.txt inited!"
fi

/usr/bin/mosdns start