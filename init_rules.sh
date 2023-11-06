#!/bin/sh

url_china_domains="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt"
url_gfwlist_domains="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt"
url_block_domains="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt"
url_china_ips="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt"

wget -q $url_china_domains -O /root/china_domains.txt
wget -q $url_gfwlist_domains -O /root/gfwlist_domains.txt
wget -q $url_block_domains -O /root/block_domains.txt
wget -q $url_china_ips -O /root/china_ips.txt
