#!/bin/bash
TO=
FROM=
SUB="Nuevo arranque de "
TMP="/tmp/datos"$(date +%y%m%d%H%M%S)
sleep 15
echo "To: " $TO >$TMP
echo "Subject: " $SUB $(hostname) $(hostname -i | cut -d' ' -f1) >> $TMP
echo "From: " $FROM >> $TMP
figlet YoVirtualizador >>$TMP

echo "-------------------Host------------------" >>$TMP
hostname >>$TMP

echo "-------------------LAN-------------------" >>$TMP
ip -o -4 addr show scope global | awk '{print $2, "\t\t\t", $4}' >>$TMP
ip -o -4 r show scope global  | grep default | awk '{print $1, "Gateway", $3}' >>$TMP

echo "-------------------WAN-------------------" >>$TMP
WAN_IP=""
for i in {1..30}; do
    WAN_IP=$(curl -s ifconfig.me)
    if [[ "$WAN_IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        break
    fi
    sleep 2
done
# Si no hay IP válida, marcarlo
if [[ ! "$WAN_IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    WAN_IP="No disponible"
fi
echo "$WAN_IP" >> $TMP
LAST_EVENT=$(journalctl -b -1 --no-pager 2>/dev/null | tail -n 1)
if [[ -z "$LAST_EVENT" ]]; then
   LAST_EVENT="No disponible (posible primer arranque o journal vacío)"
fi

echo "-------------------Último evento antes de la caída------------------" >> "$TMP"
echo "$LAST_EVENT" >> "$TMP"
echo "-----------------------------------------" >>$TMP

cat $TMP | sendmail -f $FROM $TO
