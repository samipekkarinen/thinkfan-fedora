ThinkFan Fedora Installer
Automaattinen ThinkFan-asennus Fedora Linuxille ThinkPad E595.

Skripti:

Asentaa thinkfan- ja lm_sensors-paketit
Suorittaa sensors-detectin oletusvastauksilla
Ottaa ThinkPadin tuuletinohjauksen käyttöön
Kopioi mukana tulevan thinkfan.conf-tiedoston järjestelmään
Ottaa ThinkFan-palvelun käyttöön ja käynnistää sen
Sisältö
.
├── install-thinkfan.sh
├── thinkfan.conf
└── README.md

git clone https://github.com/samipekkarinen/thinkfan-fedora.git
cd thinkfan-fedora
chmod +x install-thinkfan.sh
./install-thinkfan.sh
