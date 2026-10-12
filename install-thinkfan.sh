#!/usr/bin/env bash

set -e

echo "Asennetaan paketit..."
sudo dnf install -y thinkfan lm_sensors

echo "Suoritetaan sensors-detect oletusvastauksilla..."
yes "" | sudo sensors-detect

echo "Otetaan ThinkPadin tuuletinohjaus käyttöön..."
sudo mkdir -p /etc/modprobe.d
echo "options thinkpad_acpi fan_control=1" | sudo tee /etc/modprobe.d/thinkpad_acpi.conf > /dev/null

echo "Ladataan thinkpad_acpi uudelleen..."
sudo modprobe -r thinkpad_acpi || true
sudo modprobe thinkpad_acpi

echo "Kopioidaan thinkfan.conf..."
sudo cp thinkfan.conf /etc/thinkfan.conf

echo "Otetaan thinkfan käyttöön..."
if [ -f /etc/default/thinkfan ]; then
    sudo sed -i 's/^START=.*/START=yes/' /etc/default/thinkfan
else
    echo "START=yes" | sudo tee /etc/default/thinkfan > /dev/null
fi

echo "Käynnistetään palvelu..."
sudo systemctl enable --now thinkfan

echo
echo "Valmis."
echo
sudo systemctl status thinkfan --no-pager