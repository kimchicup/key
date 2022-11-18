# ShortCut Key for Local Maintenance (22/10/23)
# #은 메모기능으로 사용 
# 본서버가 오류가 났을때 대처법
# curl -O https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases
# curl 는  파일을 다운받는다. 
#
# source ~/.bash_aliases
# source 는 단축키 파일을 불러들인다.
# 원본 파일 주소 https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases
# echo -  echo \”화면에표시\"
# read -p "표시하고싶은말"
#
# ★폴더에 권한주기만 잘 하면 됨. 다시 원래대로 돌릴 경우에도 다시 지정해줘야 함. eth2/shared/jwt파일 일치시키기★
# 0. 폴더 만들기 1. geth 폴더 통으로 복사하기 2. 권한주기 3. 서비스 파일 내 data 주소 변경(g.edit) 4. update(n.reload)
# ★sudo mkdir -p /media/USERname/SSDname/eth2/eth1 ★
# ★sudo chown -R USERname:USERname /media/USERname/SSDname/eth2/eth1         -->>(파일을 복사하기위해)/media/USERname/SSDname/eth2/eth1 폴더에 대한 권한을 `USERname`에 지정 ★
# ★sudo chown -R geth:geth /media/USERname/SSDname/eth2/eth1               -->>(geth를 실행하기위해)/media/USERname/SSDname/eth2/eth1 폴더에 대한 권한을 `geth`에 지정 ★
# ★sudo chown -R validator:validator /home/eth2/validator   validator 권한주기

# sudo -u geth chmod -R 700 /media/USERname/SSDname/eth2/eth1 -->>media를 geth에 권한 지정 (????)
# sudo chown -R beacon:beacon /home/eth2/beacon  - beacon에 권한 지정
# sudo chown -R beacon:beacon /home/eth2/shared  - beacon에 권한 지정

# sudo nano /etc/systemd/system/geth.service
# ExecStart=geth --http --datadir=/home/eth2/eth1 \   -->>>> ExecStart=geth --http --datadir=/media/USERname/SSDname/eth2/eth1 \
# n.reload

# 아이디어
# short key 자동으로 geth 하드디스크를 변경하는 방법
# geth 서비스파일 2개 원본을 만듬. -> 상황에따라 바꿔서 복사해서 덮어쓰기.  -> 서비스파일 reload. geth 재시작. 
# step by step으로 적용. 
# 1. g.stop
# 2. (서비스파일 변경 or 선택메뉴)파일 복사 
# 3. n.reload 
# 4. 권한주기 sudo chown -R geth:geth /media/eth2/eth1  -->>media/eth2/eth1 
# 5. g.start
# ShortCut Key for Local Maintenance (20/12/01)
alias key.down='curl -O https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases'
alias key.reload='source ~/.bash_aliases'
alias key.edit='sudo nano ~/.bash_aliases'
alias key.update='cd ~ && rm ~/.bash_aliases && curl -s -O https://raw.githubusercontent.com/kimchicup/key/main/.bash_aliases && source ~/.bash_aliases && echo \“*** Shortcut Keys Updated Successfully...\"'
alias key.list="alias"
# auto start & stop
alias all.start='echo \"All start!!! \" \
                 && echo \"geth, beacon, validator, mevboost를 순차적으로 실행합니다. \" \
                 && echo \"메인넷입니다. 다른컴퓨와 validator가 중복실행되지 않는지 반드시 확인하세요. \" \
                 && read -p "계속하려면 아무키나 누르세요.(원치 않을시 Ctrl + C로 종료하세요.)" \
                 && echo \"Geth start\" \
                 && sudo systemctl start geth \
                 && echo \"Wait 3\" \
                 && sleep 1s \
                 && echo \"Wait 2\" \
                 && sleep 1s \
                 && echo \"Wait 1\" \
                 && sleep 1s \
                 && echo \"Beacon start\" \
                 && sudo systemctl start beacon \
                 && echo \"Wait 3\" \
                 && sleep 1s \
                 && echo \"Wait 2\" \
                 && sleep 1s \
                 && echo \"Wait 1\" \
                 && sleep 1s \
                 && echo \"geth node와 beacon node를 실행했습니다. \" \
                 && echo \"메인넷입니다. 다른컴퓨터와 validator가 중복실행되지 않는지 한번 더 확인하세요.\" \
                 && read -p "계속하려면 아무키나 누르세요.(원치 않을시 Ctrl + C로 종료하세요.)" \
                 && echo \"validator start\" \
                 && sudo systemctl start validator \
                 && echo \"Wait 3\" \
                 && sleep 1s \
                 && echo \"Wait 2\" \
                 && sleep 1s \
                 && echo \"Wait 1\" \
                 && sleep 1s \
                 && echo \"MEV Boost start\" \
                 && sudo systemctl start mevboost \
                 && echo \"Done.\"'
alias all.stop='echo \"All Stop!!! \" \
                 && echo \"mevboost, validator, beacon, geth를 순차적으로 종료합니다. \" \
                 && read -p "계속하려면 아무키나 누르세요.(원치 않을시 Ctrl + C로 종료하세요.)" \
                 && echo \“MEV Boost stop\" \
                 && sudo systemctl stop mevboost \
                 && echo \"Wait 3\" \
                 && sleep 1s \
                 && echo \"Wait 2\" \
                 && sleep 1s \
                 && echo \"Wait 1\" \
                 && sleep 1s \
                 && echo \“validator stop\" \
                 && sudo systemctl stop validator \
                 && echo \"Wait 3\" \
                 && sleep 1s \
                 && echo \"Wait 2\" \
                 && sleep 1s \
                 && echo \"Wait 1\" \
                 && sleep 1s \
                 && echo \"Beacon stop\" \
                 && sudo systemctl stop beacon \
                 && echo \"Wait 3\" \
                 && sleep 1s \
                 && echo \"Wait 2\" \
                 && sleep 1s \
                 && echo \"Wait 1\" \
                 && sleep 1s \
                 && echo \"Geth stop\" \
                 && sudo systemctl stop geth \
                 && echo \"Done.\"'
alias gbvm.start='echo \“Wait for 40s .….\” \
                  && sudo systemctl start geth \
                  && sleep 10s \
                  && sudo systemctl start beacon \
                  && sleep 10s \
                  && sudo systemctl start validator \
                  && sleep 10s \
                  && sudo systemctl start mevboost \
                  && sleep 10s \
                  && echo \“Done.\"'
alias gbvm.stop='echo \”Wait for 25s …..\” \
                  && sudo systemctl stop mevboost && sleep 5s \
                  && sudo systemctl stop validator && sleep 5s \
                  && sudo systemctl stop beacon && sleep 5s \
                  && sudo systemctl stop geth \
                  && echo \”Done.\"'
alias bvm.start='echo \“Wait for 30s .….\” \
                  && sudo systemctl start beacon && sleep 10s \
                  && sudo systemctl start validator && sleep 10s \
                  && sudo systemctl start mevboost && sleep 10s \
                  && echo \“Done.\"'
alias bvm.stop='echo \”Wait for 15s …..\” \
                  && sudo systemctl stop mevboost && sleep 5s \
                  && sudo systemctl stop validator && sleep 5s \
                  && sudo systemctl stop beacon \
                  && echo \”Done.\"'
alias bv.start='echo \“Wait for 20s .….\” \
                  && sudo systemctl start beacon && sleep 10s \
                  && sudo systemctl start validator && sleep 10s \
                  && echo \“Done.\"'
alias bv.stop='echo \”Wait for 10s …..\” \
                  && sudo systemctl stop validator && sleep 5s \
                  && sudo systemctl stop beacon \
                  && echo \”Done.\"'
#
alias n.reload='sudo systemctl daemon-reload'
alias n.update='sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y'
alias n.disable='sudo systemctl disable geth && sudo systemctl disable beacon && sudo systemctl disable validator'
alias n.enable='sudo systemctl enable geth && sudo systemctl enable beacon && sudo systemctl enable validator'
alias n.size='sudo du -hs /home/eth2/eth1 && sudo du -hs /home/eth2/beacon && sudo du -hs /home/eth2/validator && df -h --total | grep total'
alias n2.size='sudo du -hs /home/eth2/eth1 && sudo du -hs /home2/eth2/eth1 && sudo du -hs /home/eth2/beacon && sudo du -hs /home/eth2/validator && df -h --total | grep total'
alias g.start='sudo systemctl start geth'
alias g.stop='sudo systemctl stop geth'
alias g.log='sudo journalctl -f -u geth.service'
alias g.init='sudo systemctl start geth && sudo journalctl -f -u geth.service'
alias g.edit='sudo nano /etc/systemd/system/geth.service'
alias g.status='sudo systemctl status geth'
alias b.start='sudo systemctl start beacon'
alias b.stop='sudo systemctl stop beacon'
alias b.log='sudo journalctl -f -u beacon.service'
alias b.init='sudo systemctl start beacon && sudo journalctl -f -u beacon.service'
alias b.edit='sudo nano /etc/systemd/system/beacon.service'
alias b.status='sudo systemctl status beacon'
alias v.start='sudo systemctl start validator'
alias v.stop='sudo systemctl stop validator'
alias v.log='sudo journalctl -f -u validator.service'
alias v.init='sudo systemctl start validator && sudo journalctl -f -u validator.service'
alias v.edit='sudo nano /etc/systemd/system/validator.service'
alias v.status='sudo systemctl status validator'
# ShortCut Key for Node Maintenance (20/12/01)
alias g.peer='curl -s http://localhost:6060/debug/metrics/prometheus | grep p2p_peers'
alias b.peer='curl -s "localhost:3500/eth/v1alpha1/node/peers" | jq ".peers[].address" | wc -l'
alias b.health='curl http://localhost:8080/healthz'
alias v.health='curl http://localhost:8081/healthz'
alias b.chain="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/beacon/chainhead\" -H \"accept: application/json\" | jq"
alias g.sync="curl -s -X POST 127.0.0.1:8545 -H \"Content-Type: application/json\" --data '{\"jsonrpc\":\"2.0\",\"method\":\"eth_syncing\",\"id\":1}' | jq"
alias b.sync="curl -s http://localhost:3500/eth/v1/node/syncing | jq"

alias p.ver="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/node/version\" -H \"accept: application/json\" | jq [.version]"
alias v.idist="sudo journalctl -u validator | grep -a -i averageInclusionDistance | tail -30"
alias b.prate="curl -s -X GET \"http://127.0.0.1:3500/eth/v1alpha1/validators/participation\" -H \"accept: application/json\" | jq"

# Update (20/12/30)
alias g.enable="sudo systemctl enable geth"
alias b.enable="sudo systemctl enable beacon"
alias v.enable="sudo systemctl enable validator"
alias g.disable="sudo systemctl disable geth"
alias b.disable="sudo systemctl disable beacon"
alias v.disable="sudo systemctl disable validator"
alias b.tpeer="curl -s http://localhost:8080/metrics | grep \"p2p_topic_peer_count\""
alias n.itemp="cat /sys/class/thermal/thermal_zone*/temp"
alias g.ver="geth version"
alias g.error="journalctl -u geth | grep -e warning -e error | tail -30"
alias b.error="journalctl -u beacon | grep -e warning -e error | tail -30"
alias v.error="journalctl -u validator | grep -e warning -e error | tail -30"
alias b.chealth="curl -X GET \"https://beaconcha.in/api/healthz\" -H \"accept: text/plain\" -w \"\n\""

# Update (22/08/31)
alias s.update='cd ~ && rm ~/.bash_aliases && curl -s -O https://raw.githubusercontent.com/theniz/staking-bash-aliases/main/.bash_aliases \
                && source ~/.bash_aliases && echo \“*** Shortcut Keys Updated Successfully...v221111\"'
alias s.ver='echo \“Version - 221111\"'
alias b.connect="curl -s http://localhost:3500/eth/v1alpha1/node/eth1/connections | jq"
alias s.list="alias"

# Update (22/09/15)
alias v.vote='journalctl --since -60min -u validator | grep "Previous epoch aggregated voting summary"'

# Update (22/09/19)
alias n.speed='cd ~ \
               && echo \“Writing...\" \
               && dd if=/dev/zero of=deleteme.dat bs=32M count=64 oflag=direct \
               && echo \“Reading...\" \
               && dd if=deleteme.dat of=/dev/null bs=32M count=64 iflag=direct \
               && echo \“*** Done ***\" \
               && rm deleteme.dat'

# Update (22/11/11)
alias m.disable='sudo systemctl disable mevboost'
alias m.edit='sudo nano /etc/systemd/system/mevboost.service'
alias m.enable='sudo systemctl enable mevboost'
alias m.error='journalctl -u mevboost | grep -e warning -e error | tail -30'
alias m.init='sudo systemctl start mevboost && sudo journalctl -f -u mevboost.service'
alias m.log='sudo journalctl -f -u mevboost.service'
alias m.start='sudo systemctl start mevboost'
alias m.status='sudo systemctl status mevboost'
alias m.stop='sudo systemctl stop mevboost'
alias m.ver='sudo /home/eth2/mevboost/bin/mev-boost -version'
