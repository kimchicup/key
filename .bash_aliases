# ShortCut Key for Local Maintenance, geth & prysm ver. 23/9/29
# # 은 메모기능으로 사용    # echo -  echo \”화면에표시\"   # read -p "표시하고싶은말"
# 최초 단축키 설치시 jq, curl install, curl 명령어로 aliases file 다운로드 & source 명령어로 탄축키를 로드시킴.
# sudo apt install jq -y
# sudo apt install curl
# curl -O https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases
# source ~/.bash_aliases
alias key.down='curl -O https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases'
alias key.reload='source ~/.bash_aliases'
alias key.edit='sudo nano ~/.bash_aliases'
alias key.update='cd ~ && rm ~/.bash_aliases \
                 && curl -s -O https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases \
                 && source ~/.bash_aliases \
                 && echo \“*** Shortcut Keys Updated Successfully...\"'
alias key.list="alias"
alias acc.list='sudo -u validator /home/eth2/validator/bin/prysm.sh validator accounts list \
                 --wallet-dir=/home/eth2/validator/wallet/prysm-wallet \
                 --wallet-password-file=/home/eth2/validator/wallet/password '
alias acc.json='sudo mv /home/eth2/validator/wallet/prysm-wallet/direct/accounts/all-accounts.keystore.json.old \
                 /home/eth2/validator/wallet/prysm-wallet/direct/accounts/all-accounts.keystore.json'
alias acc.old='sudo mv /home/eth2/validator/wallet/prysm-wallet/direct/accounts/all-accounts.keystore.json \
                 /home/eth2/validator/wallet/prysm-wallet/direct/accounts/all-accounts.keystore.json.old'
alias all.start='echo \"All start!!! \" \
                 && echo \"geth, beacon, validator, mevboost를 순차적으로 실행합니다. \" \
                 && echo \"메인넷입니다. 다른컴퓨와 validator가 중복실행되지 않는지 반드시 확인하세요.  geth+beacon 만 실행하시려면 node.start를 실행하세요.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요." \
                 && sudo systemctl start geth \
                 && echo \"Geth start\" \
                 && echo \"Beacon start\" \
                 && sudo systemctl start beacon \
                 && echo \"geth node와 beacon node를 실행했습니다. \" \
                 && echo \"메인넷입니다. 다른컴퓨터와 validator가 중복실행되지 않는지 한번 더 확인하세요.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요." \
                 && echo \"validator start\" \
                 && sudo systemctl start validator \
                 && echo \"MEV Boost start\" \
                 && sudo systemctl start mevboost \
                 && echo \"Done.\"'
alias all.stop='echo \"All Stop!!! \" \
                 && echo \"mevboost, validator, beacon, geth를 순차적으로 종료합니다. \" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요. " \
                 && sudo systemctl stop mevboost \
                 && echo \“MEV Boost stop\" \
                 && echo \“validator stop\" \
                 && sudo systemctl stop validator \
                 && echo \"Beacon stop\" \
                 && sudo systemctl stop beacon \
                 && echo \"Geth stop\" \
                 && sudo systemctl stop geth \
                 && echo \"Done.\"'
alias all.restart='echo \"All restart!!! \" \
                 && echo \"geth, beacon, validator, mevboost를 재실행합니다. \" \
                 && echo \"메인넷입니다. 다른컴퓨와 validator가 중복실행되지 않는지 반드시 확인하세요.  만일 geth와 beacon만 재실행하시려면 node.restart를 실행하세요.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요." \
                 && echo \"mevboost, validator, beacon, geth를 순차적으로 종료합니다. \" \
                 && sudo systemctl stop mevboost \
                 && echo \“MEV Boost stop\" \
                 && echo \“validator stop\" \
                 && sudo systemctl stop validator \
                 && echo \"Beacon stop\" \
                 && sudo systemctl stop beacon \
                 && echo \"Geth stop\" \
                 && sudo systemctl stop geth \
                 && echo \"All Stop Done.\" \
                 && echo \"geth, beacon, validator, mevboost를 순차적으로 다시 실행합니다. \" \
                 && sudo systemctl start geth \
                 && echo \"Geth start\" \
                 && echo \"Beacon start\" \
                 && sudo systemctl start beacon \
                 && echo \"geth node와 beacon node를 재실행했습니다. \" \
                 && echo \"메인넷입니다. 다른컴퓨터와 validator가 중복실행되지 않는지 한번 더 확인하세요.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요. " \
                 && echo \"validator start\" \
                 && sudo systemctl start validator \
                 && echo \"MEV Boost start\" \
                 && sudo systemctl start mevboost \
                 && echo \"All Restart Done.\"'
alias node.start='echo \"Node start!!! \" \
                 && echo \"geth와 beacon 노드를 순차적으로 실행합니다. geth,beacon,validator,MEV\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요. " \
                 && sudo systemctl start geth \
                 && echo \"Geth start\" \
                 && echo \"Beacon start\" \
                 && sudo systemctl start beacon \
                 && echo \"Done.\"'
alias node.stop='echo \"Node Stop!!! \" \
                 && echo \"beacon과 geth를 순차적으로 종료합니다. \" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요. " \
                 && sudo systemctl stop beacon \
                 && echo \"Beacon stop\" \
                 && echo \"Geth stop\" \
                 && sudo systemctl stop geth \
                 && echo \"Done.\"'
alias node.restart='echo \"Node restart!!! \" \
                 && echo \"geth, beacon을 재실행합니다. \" \
                 && echo \"메인넷인지 다른컴퓨와 validator가 중복실행되지 않는지 반드시 확인하세요. geth,beacon,validator,MEV를 모두 재실행하시려면 all.node를 실행하세요.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요." \
                 && echo \"beacon과 geth를 순차적으로 종료합니다. \" \
                 && sudo systemctl stop beacon \
                 && echo \"Beacon stop\" \
                 && echo \"Geth stop\" \
                 && sudo systemctl stop geth \
                 && echo \"Done.\" \
                 && echo \"geth와 beacon 노드를 순차적으로 재실행합니다. \" \
                 && sudo systemctl start geth \
                 && echo \"Geth start\" \
                 && echo \"Beacon start\" \
                 && sudo systemctl start beacon \
                 && echo \"Done.\"'
alias node.check='echo \"Geth version\" \
                 && g.ver \
                 && echo \"Prysm version\" \
                 && b.ver \
                 && echo \"MEV version\" \
                 && m.ver \
                 && echo \"Geth Peer\" \
                 && g.peer \
                 && echo \"Geth sync\" \
                 && g.sync \
                 && echo \"Beacon peer\" \
                 && b.peer \
                 && echo \"Beacon sync\" \
                 && b.sync \
                 && echo \"Temperature\" \
                 && n.itemp \
                 && echo \"node Size\" \
                 && n.size \
                 && echo \"SSD Speed\" \
                 && n.speed '
alias n.reload='sudo systemctl daemon-reload'
alias n.update='sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y'
alias n.disable='echo \"Auto start Disable!!! \" \
                 && echo \"geth, beacon, validator 및 mevboost의 자동실행을 해지합니다.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요. " \
                 && sudo systemctl disable geth \
                 && sudo systemctl disable beacon \
                 && sudo systemctl disable validator \
                 && sudo systemctl disable mevboost \
                 && echo \”Done.\"'
alias n.enable='echo \"Auto start enable!!! \" \
                 && echo \"부팅시 geth, beacon, validator 및 mevboost를 자동실행합니다.\" \
                 && read -p "계속하려면 아무키나 누르세요. 원치 않을시 Ctrl + C로 종료하세요. " \
                 && sudo systemctl enable geth \
                 && sudo systemctl enable beacon \
                 && sudo systemctl enable validator \
                 && sudo systemctl enable mevboost \
                 && echo \”Done.\"'
alias n.speed='cd ~ \
               && echo \“Writing...\" \
               && dd if=/dev/zero of=deleteme.dat bs=32M count=64 oflag=direct \
               && echo \“Reading...\" \
               && dd if=deleteme.dat of=/dev/null bs=32M count=64 iflag=direct \
               && echo \“*** Done ***\" \
               && rm deleteme.dat'
alias n.itemp="cat /sys/class/thermal/thermal_zone*/temp"
alias n.size='sudo du -hs /home/eth2/eth1 && sudo du -hs /home/eth2/beacon && sudo du -hs /home/eth2/validator && df -h --total | grep total'
alias n.check='g.sync && sleep 1s && b.sync && sleep 1s && g.peer && sleep 1s && echo \“Beacon Peers\" && b.peer && sleep 1s && b.health && sleep 1s && v.health'
alias g.start='sudo systemctl start geth'
alias g.restart='sudo systemctl restart geth'
alias g.stop='sudo systemctl stop geth'
alias g.log='sudo journalctl -f -u geth.service'
alias g.init='sudo systemctl start geth && sudo journalctl -f -u geth.service'
alias g.edit='sudo nano /etc/systemd/system/geth.service'
alias g.status='sudo systemctl status geth'
alias g.peer='curl -s http://localhost:6060/debug/metrics/prometheus | grep p2p_peers'
alias g.sync="curl -s -X POST 127.0.0.1:8545 -H \"Content-Type: application/json\" --data '{\"jsonrpc\":\"2.0\",\"method\":\"eth_syncing\",\"id\":1}' | jq"
alias g.enable="sudo systemctl enable geth"
alias g.disable="sudo systemctl disable geth"
alias g.ver="geth version"
alias g.error="journalctl -u geth | grep -e warning -e level=error | tail -30"
alias g.error1="journalctl -u geth | grep -e warning -e error | tail -30"
alias b.start='sudo systemctl start beacon'
alias b.restart='sudo systemctl restart beacon'
alias b.stop='sudo systemctl stop beacon'
alias b.log='sudo journalctl -f -u beacon.service'
alias b.init='sudo systemctl start beacon && sudo journalctl -f -u beacon.service'
alias b.edit='sudo nano /etc/systemd/system/beacon.service'
alias b.status='sudo systemctl status beacon'
alias b.peer='curl -s "localhost:3500/eth/v1alpha1/node/peers" | jq ".peers[].address" | wc -l'
alias b.health='curl http://localhost:8080/healthz'
alias b.chain="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/beacon/chainhead\" -H \"accept: application/json\" | jq"
alias b.sync="curl -s http://localhost:3500/eth/v1/node/syncing | jq"
alias b.prate="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/validators/participation\" -H \"accept: application/json\" | jq"
alias b.enable="sudo systemctl enable beacon"
alias b.disable="sudo systemctl disable beacon"
alias b.chealth="curl -X GET \"https://beaconcha.in/api/healthz\" -H \"accept: text/plain\" -w \"\n\""
alias b.connect="curl -s http://localhost:3500/eth/v1alpha1/node/eth1/connections | jq"
alias b.tpeer="curl -s http://localhost:8080/metrics | grep \"p2p_topic_peer_count\""
alias b.error="journalctl -u beacon | grep -e warning -e level=error | tail -30"
alias b.error1="journalctl -u beacon | grep -e warning -e error | tail -30"
alias b.ver="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/node/version\" -H \"accept: application/json\" | jq [.version]"
alias p.ver="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/node/version\" -H \"accept: application/json\" | jq [.version]"
alias v.start='sudo systemctl start validator'
alias v.restart='sudo systemctl restart validator'
alias v.stop='sudo systemctl stop validator'
alias v.log='sudo journalctl -f -u validator.service'
alias v.init='sudo systemctl start validator && sudo journalctl -f -u validator.service'
alias v.edit='sudo nano /etc/systemd/system/validator.service'
alias v.status='sudo systemctl status validator'
alias v.health='curl http://localhost:8081/healthz'
alias v.idist="sudo journalctl -u validator | grep -a -i averageInclusionDistance | tail -30"
alias v.enable="sudo systemctl enable validator"
alias v.disable="sudo systemctl disable validator"
alias v.error="journalctl -u validator | grep -e warning -e level=error | tail -30"
alias v.error1="journalctl -u validator | grep -e warning -e error | tail -30"
alias v.vote='journalctl --since -60min -u validator | grep "Previous epoch aggregated voting summary"'
alias m.start='sudo systemctl start mevboost'
alias m.restart='sudo systemctl restart mevboost'
alias m.stop='sudo systemctl stop mevboost'
alias m.disable='sudo systemctl disable mevboost'
alias m.edit='sudo nano /etc/systemd/system/mevboost.service'
alias m.enable='sudo systemctl enable mevboost'
alias m.error='journalctl -u mevboost | grep -e warning -e level=error | tail -30'
alias m.error1='journalctl -u mevboost | grep -e warning -e error | tail -30'
alias m.init='sudo systemctl start mevboost && sudo journalctl -f -u mevboost.service'
alias m.log='sudo journalctl -f -u mevboost.service'
alias m.status='sudo systemctl status mevboost'
alias m.ver='sudo /home/eth2/mevboost/bin/mev-boost -version'
# SSH setting(원격접속)
# ssh-keygen -t rsa   =키를 만든다.(이때 설정하는 비번은 키로 접속시 쓰이는 비번이니 주의)
# ssh-copy-id -i ~/.ssh/id_rsa.pub username@192.168.219.10x =키를 username@10x 로 보낸다. (이때 물어보는 비번은 컴퓨터 로그인비번)
# ssh username@192.168.219.10x -p 22 (username, 10x의 22번 포트로 접속하는 방법)
# ssh.edit를 통해 포트변경, 비번접속을 없애기, 키접속만 가능하게하게 하기.)
# Port 22 -> xxxx,   PubkeyAuthentication yes, PasswordAuthentication no, KbdInteractiveAuthentication no
alias ssh.cinstall="sudo apt-get install openssh-client"
alias ssh.sinstall="sudo apt install openssh-server"
alias ssh.edit="sudo nano /etc/ssh/sshd_config"
alias ssh.start="sudo systemctl start ssh"
alias ssh.stop="sudo systemctl stop ssh"
alias ssh.restart="sudo systemctl restart ssh"
alias ssh.enable="sudo systemctl enable ssh"
alias ssh.disable="sudo systemctl disable ssh"
alias ssh.log="sudo journalctl -f -u ssh"
alias ssh.status="sudo systemctl status ssh"
alias ssh.mainnet='ssh prysm@192.168.219.101 -p 32501'
alias ssh.backup='ssh prysm@192.168.219.108 -p 32508'
# grafana(브라우저모니터링)
alias prometheus.edit="sudo nano /etc/prometheus/prometheus.yml"
alias grafana.enable='sudo systemctl enable node_exporter \
                      && sleep 1s \
                      && sudo systemctl enable blackbox_exporter \
                      && sleep 1s \
                      && sudo systemctl enable ethereum-address-exporter \
                      && sleep 1s \
                      && sudo systemctl enable ethereum-metrics-exporter \
                      && sleep 1s \
                      && sudo systemctl enable json_exporter \
                      && sleep 1s \
                      && sudo systemctl enable prometheus \
                      && sleep 1s \
                      && sudo systemctl enable grafana-server'
alias grafana.disable='sudo systemctl disable node_exporter \
                      && sleep 1s \
                      && sudo systemctl disable blackbox_exporter \
                      && sleep 1s \
                      && sudo systemctl disable ethereum-address-exporter \
                      && sleep 1s \
                      && sudo systemctl disable ethereum-metrics-exporter \
                      && sleep 1s \
                      && sudo systemctl disable json_exporter \
                      && sleep 1s \
                      && sudo systemctl disable prometheus \
                      && sleep 1s \
                      && sudo systemctl disable grafana-server'
alias grafana.start='sudo systemctl start node_exporter \
                      && sleep 1s \
                      && sudo systemctl start blackbox_exporter \
                      && sleep 1s \
                      && sudo systemctl start ethereum-address-exporter \
                      && sleep 1s \
                      && sudo systemctl start ethereum-metrics-exporter \
                      && sleep 1s \
                      && sudo systemctl start json_exporter \
                      && sleep 1s \
                      && sudo systemctl start prometheus \
                      && sleep 1s \
                      && sudo systemctl start grafana-server'
alias grafana.stop='sudo systemctl stop node_exporter \
                      && sleep 1s \
                      && sudo systemctl stop blackbox_exporter \
                      && sleep 1s \
                      && sudo systemctl stop ethereum-address-exporter \
                      && sleep 1s \
                      && sudo systemctl stop ethereum-metrics-exporter \
                      && sleep 1s \
                      && sudo systemctl stop json_exporter \
                      && sleep 1s \
                      && sudo systemctl stop prometheus \
                      && sleep 1s \
                      && sudo systemctl stop grafana-server'
#validator exit
#cd ~
#mkdir prysmctl && cd prysmctl
#curl -OL https://github.com/prysmaticlabs/prysm/releases/download/v4.0.3/prysmctl-v4.0.3-linux-amd64
#mv prysmctl-v4.0.3-linux-amd64 prysmctl
#sudo chmod +x prysmctl
#sudo ./prysmctl validator exit --wallet-dir=/home/eth2/validator/wallet/prysm-wallet --wallet-password-file=/home/eth2/validator/wallet/password --accept-terms-of-use --public-keys=xxxxxxxxx,yyyyyyyyy
#WOL on ubuntu(원격시동)
#sudo apt-get update
#sudo apt-get install ethtool
#sudo ethtool –s eth0 wol g
#sudo reboot
