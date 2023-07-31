dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
BURIQ () {
curl -sS https://raw.githubusercontent.com/taoomatoa/izinvps/ipuk/ip > /root/tmp
data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
for user in "${data[@]}"
do
exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
d1=(`date -d "$exp" +%s`)
d2=(`date -d "$biji" +%s`)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
echo $user > /etc/.$user.ini
else
rm -f /etc/.$user.ini > /dev/null 2>&1
fi
done
rm -f /root/tmp
}
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/taoomatoa/izinvps/ipuk/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)
Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
if [ "$CekOne" = "$CekTwo" ]; then
res="Expired"
fi
else
res="Permission Accepted..."
fi
}
PERMISSION () {
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIN=$(curl -sS https://raw.githubusercontent.com/taoomatoa/izinvps/ipuk/ip | awk '{print $4}' | grep $MYIP)
if [ "$MYIP" = "$IZIN" ]; then
Bloman
else
res="Permission Denied!"
fi
BURIQ
}
PERMISSION
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/taoomatoa/izinvps/ipuk/ip | grep $MYIP | awk '{print $3}')
fi
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"
if [ "${EUID}" -ne 0 ]; then
echo -e "${EROR} Please Run This Script As Root User !"
exit 1
fi
export IP=$( curl -s https://ipinfo.io/ip/ )
ssh_ws=$( systemctl status ws-epro | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
status_ws="${GREEN}ON${NC}"
else
status_ws="${RED}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
status_nginx="${GREEN}ON${NC}"
else
status_nginx="${RED}OFF${NC}"
fi
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
status_xray="${GREEN}ON${NC}"
else
status_xray="${RED}OFF${NC}"
########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
fi
clear
clear
clear
clear
echo -e " ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮$NC"
echo -e " │$NC\033[41m                  ⇱ TUNNELING TAOOMATOA ⇲                   $NC│$NC"
echo -e " ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${NC}"
echo -e " ╭═════════════════════════════════════════════════════════════╮$NC"
echo -e " │${YELLOW} ✘ ${NC}Sever Uptime  = $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e " │${YELLOW} ✘ ${NC}Date | Time   = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e " │${YELLOW} ✘ ${NC}OS            = $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e " │${YELLOW} ✘ ${NC}Domain        = $( cat /etc/xray/domain )"
echo -e " │${YELLOW} ✘ ${NC}IP VPS        = ${IP}"
echo -e " │${YELLOW} ✘ ${NC}VPS Reboot    = Jam 12 Malam ${NC}"
echo -e " ╰═════════════════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "                         ${KIRI} ${red} STATUS SERVER${NC} ${KANAN}"
echo -e " ╭════════════════════╮╭═══════════════════╮╭══════════════════╮$NC"
echo -e "   ${YELLOW}CRON${NC}      :    ${GREEN}ON$NC     ${YELLOW}DROPBEAR ${NC} :   ${GREEN}ON      ${YELLOW}XRAY${NC}      :  ${status_xray}"
echo -e "   ${YELLOW}SSH${NC}       :    ${status_ws}$NS    ${YELLOW}WEBSOCKET${NC} :   ${GREEN}ON      ${YELLOW}NGINX${NC}     :  ${status_nginx}"
echo -e " ╰════════════════════╯╰═══════════════════╯╰══════════════════╯${NC}"
echo -e ""
echo -e "                          ⇱ MENU SERVER ⇲"
echo -e " ╭═════════════════════════════════════════════════════════════╮$NC"
echo -e " │     [${YELLOW}01${NC}]${NC} SSH MENU$NC             │$NC     [${YELLOW}08${NC}]${NC} INFO DEVICE$NC"
echo -e " │     [${YELLOW}02${NC}]${NC} V2RAY MENU$NC           │$NC     [${YELLOW}09${NC}]${NC} SPEEDTEST$NC"
echo -e " │     [${YELLOW}03${NC}]${NC} TROJAN MENU$NC          │$NC     [${YELLOW}10${NC}]${NC} ADD DOMAIN$NC"
echo -e " │     [${YELLOW}04${NC}]${NC} ADD SHADOWSHOCK$NC      │$NC     [${YELLOW}11${NC}]${NC} CHANGE BANNER$NC"                                                                                                   
echo -e " │     [${YELLOW}06${NC}]${NC} RUN SERVICE$NC          │$NC     [${YELLOW}13${NC}]${NC} CHANGE PASSWD VPS$NC"                                                                                                      
echo -e " │     [${YELLOW}07${NC}]${NC} CERTIFICATE SS$NC       │$NC     [${YELLOW}14${NC}]${NC} REBOOT VPS$NC"
echo -e " │"
echo -e " │     [${YELLOW}0${NC}]${NC} EXIT MENU$NC"
echo -e " ╰═════════════════════════════════════════════════════════════╯$NC"
echo -e "   ${CYAN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "   │ $NC Version${NC}        : $NC V1.0"
echo -e "   │ $NC Developer${NC}      : $NC TaooMatoa"
echo -e "   │ $NC User${NC}           : ${YELLOW} $Name"
echo -e "   │ $NC Expired Script${NC} : ${YELLOW} $Exp"
echo -e "   ${CYAN}╰═════════════════════════════════════════════════════════╯\033[0m${NC}"
echo -e "" 
echo -e ""
read -p "Select From Options [ 1 - 14 ] : " menu
case $menu in
1)
clear
ssh-menu
;;
2)
clear
v2ray-menu
;;
3)
clear
trojan-menu
;;
4)
clear
add-ssws
;;
5)
clear
trial-menu
;;
6)
clear
running
;;
7)
clear
crtv2ray
;;
8)
clear
about
;;
9)
clear
speedtest
;;
10)
clear
add-host
;;
11)
clear
banner
;;
12)
clear
info-menu
;;
13)
clear
passwd
;;
14)
reboot
exit
;;
0)
exit
;;
*)
clear
menu
;;
esac
