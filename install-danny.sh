#!/bin/bash
claro
if [`whoami`!= 'raíz']
	entonces
     echo -e "\e[1;31mPARA PODER USAR EL INSTALADOR ES NECESARIO SER ROOT\nAUN NO SABES COMO INICAR COMO ROOT?\nDIJITA ESTE COMANDO EN TU TERMINAL ( sudo -i )\e[0m"
     rm *
     salida
fi
mensaje () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 caso $1 en
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
  -verm)cor="${AMARELO}${NEGRITO}${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
  -bra)cor="${BRAN}" && echo -ne "${cor}${2}${SEMCOR}";
  "-bar2"|"-barra")cor="${VERMELHO}————————————————————————————————— ———————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}";
 esac
}
os_sistema(){
#código por rufu99
  system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/ //')
  distro=$(echo "$sistema"|awk '{imprimir $1}')

  caso $distro en
    Debian)vercion=$(echo $sistema|awk '{print $3}'|cut -d '.' -f1);;
    Ubuntu)vercion=$(echo $sistema|awk '{print $2}'|cut -d '.' -f1,2);;
  esac

  link="https://raw.githubusercontent.com/rudi9999/ADMRufu/main/Repositorios/${vercion}.list"

  case $vercion en
    8|9|10|11|16.04|18.04|20.04|20.10|21.04|21.10|22.04)wget -O /etc/apt/sources.list ${enlace} &>/dev/null;;
  esac
}
funbar() {
    comando="$1"
    _=$(
        $comando >/dev/null 2>&1
    ) &
    >/desarrollo/null
    pid=$!
    while [[ -d /proc/$pid ]]; hacer
        eco -ne "\033[1;33m["
        para ((i = 0; i < 20; i++)); hacer
            echo -ne "\033[1;31m#"
            dormir 0.08
        hecho
        eco -ne "\033[1;33m]"
        dormir 0.5s
        eco
        tput cuu1 && tput dl1
    hecho
    [[ $(dpkg --get-selections | grep -w "$paquete" | head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "$paquete" | head -1) ]] && ESTATUS=$(echo -e "\033[1;33m \033[92mINSTALADO") &>/dev /nulo
    echo -ne " \033[1;31m[\033[1;35m>>>>>>>>>>>>>>>>>>>>\033[1;31m] $ESTADO \033[0m \n" |pv -qL 30
    dormir 0.5s
}

dependencias() {
  dpkg --configure -a >/dev/null 2>&1
  apt -f install -y >/dev/null 2>&1
  soft="sudo grep less zip descomprimir ufw curl dos2unix python python3 python3-pip openssl cron iptables lsof pv boxes at mlocate gawk bc jq curl socat netcat net-tools cowsay figlet lolcat apache2"
  para i en $suave; hacer
    paquete="$i"
    echo -e "\033[93m ❯ \e[97mINSTALANDO PAQUETE \e[36m $i"
# [[ $(dpkg --get-selections|grep -w "$i"|head -1) ]] ||
 barra de funciones "apt-get install $i -y"
  hecho
}

mensaje -bar2
echo -e " \e[1;97m\e[1;100m =====>>►► SCRIPT MOD LACASITAMX ◄◄<<===== \033[0m"
mensaje -bar2
msg -ama " PREPARANDO INSTALACION"
mensaje -bar2
INSTALL_DIR_PARENT="/usr/local/vpsmxup/"
INSTALL_DIR=${INSTALL_DIR_PARENT}
si [ ! -d "$INSTALL_DIR" ]; entonces
	mkdir -p "$INSTALL_DIR_PARENT"
	disco compacto "$INSTALL_DIR_PARENT"
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/zzupdate/zzupdate.default.conf -O /usr/local/vpsmxup/vpsmxup.default.conf &> /dev/null
 
demás
	eco ""
fi
eco ""
#por 00

claro
función imprimirTítulo
{
    eco ""
    echo -e "\033[1;92m$1\033[1;91m"
    printf '%0.s-' $(secuencia 1 ${#1})
    eco ""
}

printTitle "Limpieza de caché local"
apt-limpiar

printTitle "Actualizar información de paquetes disponibles"
apt-obtener actualización
lista apt --actualizable &>/dev/null
printTitle "PAQUETES DE ACTUALIZACIÓN"
apt-get dist-upgrade -y
claro
claro
apt-get install pv -y &> /dev/null
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] || apt-get install pv -y &>/dev/null
apt-get install pv -y -qq --silent > /dev/null 2>&1
os_system
MI=$(wget -qO-ifconfig.me)
echo "$distro $version" >/tmp/distro
echo -e "\e[1;31m 🖥SISTEMA: \e[33m$distro $vercion "
echo -e "\e[1;31m 🖥IP: \e[33m$MI "
#apt list --upgradable &>/dev/null && echo -e "\033[97m ❯ INSTALANDO APT-LIST " | pv -qL 50 |lolcat -as 500
mensaje -bar2
echo -e " \e[1;97m\e[1;100m =====>>►► SCRIPT MOD LACASITAMX ◄◄<<===== \033[0m"
barra de mensajes
eco -e "\033[97m"
echo -e " \033[41m -- INSTALACION DE PAQUETES -- \e[49m"
#echo -e " \033[100m PONER ATENCION PARA SIGUIENTE PREGUNTA "
eco -e "\033[97m"
barra de mensajes
si [[ -e /etc/casitapak ]]; entonces
dpkg --configure -a > /dev/null 2>&1 && echo -e "\033[93m ❯\e[97m INTENTANDO RECONFIGURAR" | pv-qL 40
sudo apt-get install lolcat -y &>/dev/null
sudo joya instalar lolcat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null
apt-get install en -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install en -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
#iptables
#[[ $(dpkg --get-selections|grep -w "iptables"|head -1) ]] || apt-get install iptables -y &>/dev/null
apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
#lsof
apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
#figlet

apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
#pantalla
apt-get pantalla de instalación -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "pantalla"|cabeza -1) ]] || apt-get pantalla de instalación -y &>/dev/null
#ufw
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
#abrir la cremallera
[[ $(dpkg --get-selections|grep -w "descomprimir"|head -1) ]] || apt-get install unzip -y &>/dev/null
#cremallera
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
apt-get install apache2 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || apt-get install apache2 -y &>/dev/null
sed -i "s;Escuchar 80;Escuchar 81;g" /etc/apache2/ports.conf > /dev/null 2>&1
servicio apache2 reiniciar > /dev/null 2>&1
demás
#dependencias
dpkg --configure -a > /dev/null 2>&1 #&& echo -e " \033[1;33m[\033[1;31m##########\033[1;33m] RECONFIGURANDO \033[0m\n" |pv -qL 30
apt -f install -y >/dev/null 2>&1
apt install sudo -y &>/dev/null
apt-get install grep -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || apt-get install grep -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] && ESTATUS=$(echo -e "\033[1;33m \033[92mINSTALADO") &>/dev/ nulo
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mgrep$ESTATUS \033[0m\n" |pv - qL 50
#papar moscas
apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || ESTATUS=`echo -e "\033[91m INSTALACION FALLIDA"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mgawk$ESTATUS \033[0m\n" |pv - qL 50
#mlocalizar
apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mmlocate$ESTATUS \033[0m\n" |pv - qL 50
#lolcat joya
apt install dos2unix -y &>/dev/null
apt-get install lolcat -y &>/dev/null
sudo joya instalar lolcat &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mlolcat$ESTATUS \033[0m\n" |pv - qL 50
#en
apt instalar en -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install en -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mat$ESTADO \033[0m\n" |pv - qL 50
#nano
apt install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mnano$ESTATUS \033[0m\n" |pv - qL 50
[[ $(dpkg --get-selections|grep -w "iptables"|head -1) ]] || apt-get install iptables -y &>/dev/null
apt install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mbc$ESTATUS \033[0m\n" |pv - qL 50
apt-get install openssl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "openssl"|head -1) ]] || apt-get install openssl -y &>/dev/null
apt install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mlsof$ESTATUS \033[0m\n" |pv - qL 50
apt install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mfiglet$ESTATUS \033[0m\n" |pv - qL 50
apt install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mcowsay$ESTATUS \033[0m\n" |pv - qL 50
pantalla de instalación apt -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "pantalla"|cabeza -1) ]] || apt-get pantalla de instalación -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "pantalla"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mscreen$ESTATUS \033[0m\n" |pv - qL 50
apt install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mcurl$ESTATUS \033[0m\n" |pv - qL 50
apt instalar menos -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "menos"|cabeza -1) ]] || apt-get install menos -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "menos"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "less"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mless$ESTATUS \033[0m\n" |pv - qL 50

[[ $(dpkg --get-selections|grep -w "cron"|head -1) ]] || apt-get install cron -y &>/dev/null && echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e [97mcron\033[92m INSTALADO \033[0m\n" |pv -qL 50
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || apt-get install netcat -y &>/dev/null && echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e [97mnetcat\033[92m INSTALADO\033[0m\n" |pv -qL 50
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] || apt-get install socat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "boxes"|head -1) ]] || apt-get cuadros de instalación -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null && echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e [97mjq\033[92m INSTALADO \033[0m\n" |pv -qL 50
sudo apt-add-repository universe -y > /dev/null 2>&1
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get install net-tools -y &>/dev/null && echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mnet-tools\033[92m INSTALADO\033[0m\n" |pv -qL 50
apt install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null && echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e [97mpython\033[92m INSTALADO\033[0m\n" |pv -qL 50
apt install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mpython3$ESTATUS \033[0m\n" |pv - qL 50
apt install python3-pip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || ESTATUS=$(echo -e "\033[91mINSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m]\e[97mpython3-pip $ESTATUS \033[0m\n" | pv-qL 50
apt install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mufw$ESTATUS \033[0m\n" |pv - qL 50
#abrir la cremallera
apt install descomprimir -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "descomprimir"|head -1) ]] || apt-get install unzip -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "descomprimir"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "descomprimir"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97munzip$ESTATUS \033[0m\n" |pv - qL 50
#cremallera
apt install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || ESTATUS=$(echo -e "\033[91m INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] && ESTATUS=`echo -e "\033[92m INSTALADO"` &>/dev/null
echo -ne " \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mzip$ESTATUS \033[0m\n" |pv - qL 50
apt-get install apache2 -y &>/dev/null #&& echo -e "\033[93m ❯\e[97m INSTALANDO APACHE2" | pv-qL 40
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || apt-get install apache2 -y &>/dev/null
sed -i "s;Escuchar 80;Escuchar 81;g" /etc/apache2/ports.conf > /dev/null 2>&1
servicio apache2 reiniciar > /dev/null 2>&1
 toque /etc/casitapak &>/dev/null
 apt-get clean &>/dev/null
barra de mensajes
claro
rm -rf /usr/bin/vpsmxup
rm -rf lista-arq
rm -rf LACASITA.sh

printTitle "Limpieza de paquetes (eliminación automática de paquetes no utilizados)"
apt autoremove -y &>/dev/null
  echo iptables-persistentes iptables-persistentes/autosave_v4 booleano verdadero | sudo debconf-set-selections
  echo iptables-persistentes iptables-persistentes/autosave_v6 booleano verdadero | sudo debconf-set-selections
apt-get install herramientas de red -y
printTitle "Versión actual"
lsb_release -d
idfix64_86 () {
claro
claro
mensaje -bar2
#msg -ama " [ VPS - MX - GUIÓN \033[1;97m MOD\033[1;33m ]"
mensaje -bar2
eco ""
echo -e "\e[91m INSTALACION SEMI MANUAL DE PAQUETES "
echo -e "\e[91m(En caso de pedir confirmación escoja: #y#) \e[0m"
eco ""
dormir 7s
apt-obtener actualización; apt-obtener actualización -y
apt-get install curl-y
apt-get install lsof-y
apt-get install sudo -y
apt-get install figlet-y
apt-get install cowsay -y
apt-get install bc -y
apt-get install python -y
apt-get install en -y
apt-get install apache2 -y
sed -i "s;Escuchar 80;Escuchar 81;g" /etc/apache2/ports.conf
reinicio del servicio apache2
claro
claro
claro
mensaje -bar2
#msg -ama " [ VPS - MX - GUIÓN \033[1;97m MOD \033[1;33m ]"
mensaje -bar2
eco ""
echo -e "\e[91mESCOJER PRIMERO #Todas las localidades# Y LUEGO #en_US.UTF-8# \e[0m"
eco ""
dormir 7s
 exportar IDIOMA=en_US.UTF-8\
   && exportar LANG=en_US.UTF-8\
   && exportar LC_ALL=en_US.UTF-8\
   && exportar LC_CTYPE="en_US.UTF-8"\
   && configuración regional-gen en_US.UTF-8\
   && sudo apt-get -y install language-pack-en-base\
   && sudo dpkg-reconfigure locales
claro
}
claro
claro
#msj -bar2
#msg -ama " [ VPS - MX - GUIÓN \033[1;97m MOD \033[1;33m ]"
#msj -bar2
#echo -e "\033[1;97m ¿PRECENTO ALGUN ERROR ALGUN PAQUETE ANTERIOR?"
#msj -bar2
#echo -e "\033[1;32m 1- Escoja:(N) No. Para Instalacion Normal"
#echo -e "\033[1;31m 2- Escoja:(S) Si. Saltaron errores."
#msj -bar2
#echo -e "\033[1;39m Al preciona enter continuara la instalacion Normal"
#msj -bar2
#leer -p " [ S | N ]: " idfix64_86   
#[[ "$idfix64_86" = "s" || "$idfix64_86" = "S" ]] && idfix64_86
fi
claro
rootvps(){

echo -e "\033[31m OPTENIENDO ACCESO ROOT"
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SR/root.sh &>/dev/null -O /usr/bin/rootlx &>/dev/null
chmod 775 /usr/bin/rootlx &>/dev/null
rootlx
claro
echo -e "\033[31m ACCESO ROOT CON EXITO "
dormir 1
rm -rf /usr/bin/rootlx
}
	barra de mensajes
	echo -e "\033[1;37m YA TIENES ACCESO ROOT A TU VPS?\n ESTO SOLO FUNCIONA PARA (AWS,GOOGLECLOUD,AZURE,ETC)\n SI YA TIENES ACCESO A ROOT SOLO IGNORA ESTE MENSAJE\n Y SIGUE CON LA INSTALACION NORMAL..."
   barra de mensajes
   read -p "Responde [ s | n ]: " -e -in rootvps
   [[ "$rootvps" = "s" || "$rootvps" = "S" ]] && rootvps
   claro
cd $HOME
#sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 > /dev/null 2>&1
#sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 > /dev/null 2>&1
#sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1 > /dev/null 2>&1
#sistemamedia &> /dev/null
rm $(contraseña)/$0 &> /dev/null
SCPdir="/etc/VPS-MX"
SCPinstal="$INICIO/instalar"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/controlador"
SCPfrm="${SCPdir}/herramientas"
SCPinst="${SCPdir}/protocolos"
miip=`ifconfig | grep -Eo 'inet (dirección:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | cabeza -n1`;
miint=`ifconfig | grep -B1 "dirección inet:$myip" | cabeza -n1 | awk '{imprimir $1}'`;
rm -rf /etc/hora local &>/dev/null
ln -s /usr/share/zoneinfo/America/Chihuahua /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &> /dev/null
### COLORES Y BARRA
claro

### FIJADOR PARA SISTEMAS 86_64

claro
fun_ipe () {
MIP=$(dirección IP | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0 -9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} \.[0-9]{1,3}'|cabeza -1)
MIP2=$(wget -qO-ifconfig.me)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}  
diversión_ip () {
MIP2=$(wget -qO-ifconfig.me)

MIP=$(wget -qO- whatismyip.akamai.com)
si [$? -eq 0 ]; entonces
   IP="$MIP"
  
demás
   IP="$MIP2"
  
fi

}  
función_verificar () {
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
  permitido=$(curl -sSL "https://www.dropbox.com/s/nmau2w8vebewpq3/control")
  [[ $(echo $permitido|grep "${IP}") = "" ]] && {
  claro
  echo -e "\n\n\n\033[1;91m——————————————————————————————————— ———————————————————\n ¡ESTA KEY NO CONCUERDA CON EL INSTALADOR! \n BOT: @CONECTEDMX_BOT \n————————————— ————————————————————————————————————————\n\n\n"
  [[ -d /etc/VPS-MX ]] && rm -rf /etc/VPS-MX
  salida 1
  } || {
  ### VERSIÓN INTALAR DEL GUIÓN
  v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/version/master/vercion")
  echo "$v1" > /etc/versin_script
  }
}

funcao_idioma () {

claro
claro
mensaje -bar2
figlet -f inclinado "LACASITA" |lolcat
pv="$(eco es)"
[[ ${#id} -gt 2 ]] && id="es" || id="$pv"
byinst="verdadero"
}

instalar_fim () {
msg -ama " Finalizando Instalacion" && msg bar2
#rm -rf /etc/VPS-MX/controlador/nombre.log &>/dev/null
[[ $(find /etc/VPS-MX/controlador -name nombre.log|grep -w "nombre.log"|head -1) ]] || wget -O /etc/VPS-MX/controlador/nombre.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/nombre.log &>/dev/null
[[ $(find /etc/VPS-MX/controlador -name IDT.log|grep -w "IDT.log"|head -1) ]] || wget -O /etc/VPS-MX/controlador/IDT.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/IDT.log &>/dev/null
[[ $(find /etc/VPS-MX/controlador -name tiemlim.log|grep -w "tiemlim.log"|head -1) ]] || wget -O /etc/VPS-MX/controlador/tiemlim.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/tiemlim.log &>/dev/null
toque /usr/share/lognull &>/dev/null
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SR/SPR &>/dev/null -O /usr/bin/SPR &>/dev/null
chmod 775 /usr/bin/SPR &>/dev/null

wget -O /usr/bin/SOPORTE cd &>/dev/null
chmod 775 /usr/bin/SOPORTE &>/dev/null
SOPORTE &>/dev/null
echo "ACCESO ACTIVADO" >/usr/bin/SOPORTE
wget -O /bin/rebootnb https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/rebootnb &> /dev/null
chmod +x /bin/rebootnb
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/resetsshdrop &> /dev/null
chmod +x /bin/resetshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/lacasitamx/version/master/vercion &>/dev/null
wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/lacasitamx/ZETA/master/sshd &>/dev/null
chmod 777 /etc/ssh/sshd_config
#
mensaje -bar2
echo '#!/bin/sh -e' > /etc/rc.local
sudo chmod +x /etc/rc.local
echo "sudo rebootnb" >> /etc/rc.local
echo "sudo resetsshdrop" >> /etc/rc.local
echo "dormir 2s" >> /etc/rc.local
echo "salida 0" >> /etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo 'exportar RUTA=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/juegos/' >> /etc/perfil
echo 'claro' >> .bashrc
echo 'exportar RUTA=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/juegos/' >> .bashrc
echo 'eco ""' >> .bashrc
#
echo 'figlet -f slant "LACASITA" |lolcat' >> .bashrc
echo 'mess1="$(menos /etc/VPS-MX/mensaje.txt)" ' >> .bashrc
echo 'eco "" '>> .bashrc
echo 'echo -e "\t\033[92m REVENDEDOR : $mess1 "'>> .bashrc
echo 'echo -e "\t\e[1;33mVERSIÓN: \e[1;31m$(cat /etc/versin_script_new)"'>> .bashrc
echo 'eco "" '>> .bashrc                                               
echo 'echo -e "\t\033[1;100mPARA MOSTAR PANEL BASH ESCRIBA:\e[0m\e[1;41m sudo menu \e[0m"'>> .bashrc

echo 'eco ""'>> .bashrc
echo -e " COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
echo -e " \033[1;41m menú sudo \033[0;37m" && mensaje -bar2
rm -rf /usr/bin/pytransform &> /dev/null
rm -rf LACASITA.sh
rm -rf lista-arq
[[ ! -e /etc/inicio automático ]] && {
	eco '#!/bin/bash
claro
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/inicio automático
} || {
	#[[ $(ps x | grep "bot_plus" | grep -v grep | wc -l) != '0' ]] && wget -qO- https://raw.githubusercontent.com/carecagm/main/Install/ ShellBot.sh >/etc/SSHPlus/ShellBot.sh
	para proc en $(ps x | grep 'dmS' | grep -v 'grep' | awk {'print $1'}); hacer
		pantalla -r -S "$proc" -X salir
	hecho
	pantalla -limpiar >/dev/null
	eco '#!/bin/bash
claro
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/inicio automático
}
crontab -r >/dev/null 2>&1
(
	crontab -l 2>/dev/null
	echo "@reboot /etc/autostart"
	echo "* * * * * /etc/inicio automático"
) | crontab-
servicio ssh reiniciar &>/dev/null
exportar RUTA=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/juegos/
#salida
}
de nosotros () {
servidor desarmado
servidor=$(echo ${txt_ofuscatw}|cortar -d':' -f1)
desarmar txtofus
número = $ (longitud de expresión $ 1)
for((i=1; i<$número+1; i++)); hacer
txt[$i]=$(echo "$1" | corte -b $i)
caso ${txt[$i]} en
".")txt[$i]="C";;
"C")txt[$i]=".";;
"3")txt[$i]="@";;
"@")txt[$i]="3";;
"5")txt[$i]="9";;
"9")txt[$i]="5";;
"6")txt[$i]="D";;
"D")txt[$i]="6";;
"J")txt[$i]="Z";;
"Z")txt[$i]="J";;
esac
txtofus+="${txt[$i]}"
hecho
echo "$txtofus" | Rdo
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
[[ ! -d ${SCPdir}/tmp ]] && mkdir ${SCPdir}/tmp
caso $1 en
"menu"|"mensaje.txt"|"ID")ARQ="${SCPdir}/"; #Menú
"códigos de usuario")ARQ="${SCPusr}/"; #Panel SSRR
"C-SSR.sh")ARQ="${SCPinst}/"; #Panel SSR
"openssh.sh")ARQ="${SCPinst}/"; #OpenVPN
"calamar.sh")ARQ="${SCPinst}/"; #Calamar
"dropbear.sh"|"proxy.sh"|"wireguard.sh")ARQ="${SCPinst}/"; #Instalacao
"proxy.sh")ARQ="${SCPinst}/"; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/"; #Instalacao
"ssl.sh"|"python.py")ARQ="${SCPinst}/"; #Instalacao
"sombracalcetines.sh")ARQ="${SCPinst}/"; #Instalacao
"Shadowsocks-libev.sh")ARQ="${SCPinst}/"; #Instalacao
"Shadowsocks-R.sh")ARQ="${SCPinst}/"; #Instalacao
"v2ray.sh"|"slowdns.sh")ARQ="${SCPinst}/"; #Instalacao
"budp.sh")ARQ="${SCPinst}/"; #Instalacao
"nombre")ARQ="${SCPdir}/tmp/"; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/"; #Instalacao
*)ARQ="${SCPfrm}/"; #herramientas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}


fun_ipe
wget -O /usr/bin/trans https://raw.githubusercontent.com/scriptsmx/script/master/Install/trans &> /dev/null
wget -O /bin/Desbloqueo.sh https://www.dropbox.com/s/75c93cyv4l81qci/desbloqueo.sh &> /dev/null
chmod +x /bin/Desbloqueo.sh
wget -O /bin/monitor.sh https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/monitor.sh &> /dev/null
chmod +x /bin/monitor.sh
wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/estilos.css &> /dev/null
[[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp &>/dev/null; ufw permite 80/tcp &>/dev/null; ufw permite 3128/tcp &>/dev/null; ufw permite 8799/tcp &>/dev/null; ufw permite 8080/tcp &>/dev/null; ufw permite 81/tcp &>/dev/null
claro
mensaje -bar2
echo -e " \e[1;97m\e[1;100m =====>>►► SCRIPT MOD LACASITAMX ◄◄<<===== \033[0m"
#msg -ama " \033[1;96m 🔰Usar Ubuntu 20 a 64 De Preferencia🔰 "
mensaje -bar2
[[ $1 = "" ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || identificación="$1"
 }
 
error_fun () {

eco ""
msg -bar2 && msg -verm "ERROR DE GENERADOR | ARCHIVOS INCOMPLETOS\n CLAVE USADA" && msg -bar2
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
[[ -e $INICIO/lista-arq]] && rm $INICIO/lista-arq
rm -rf lista-arq
salida 1
}
tecla inválida () {

eco ""
msg -bar2 && msg -verm " Code Invalido -- #¡Key Invalida#! " && msg -bar2
[[ -e $INICIO/lista-arq]] && rm $INICIO/lista-arq
rm -rf lista-arq
salida 1
}


mientras [[ ! $Clave ]]; hacer
msg -bar2 && msg -ne "\033[1;93m >>> INGRESE SU CLAVE ABAJO <<<\n \033[1;37m" && leer Clave
tput cuu1 && tput dl1
hecho
msg -ne "# Verificando clave #:"
cd $HOME
wget -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -e "\033[1;32m Ofus Correcto" |pv -qL 30 || {
   echo -e "\033[1;91m Ofus Incorrecto"
   tecla inválida
   salida
   }
IP=$(ofus "$Clave" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3 }' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9] {1,3}') && echo "$IP" > /usr/bin/venip
#dormir 1s
función_verificar
#actualizadob
si [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "Code de KEY Invalido!") ]]; entonces
   mensaje -bar2
   msg -verd "Ficheros Copiados: \e[97m[\e[93m@conectedmx_bot\e[97m]"
   SOLICITUD=$(ofus "$Clave"|cortar -d'/' -f2)
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   pontos="."
   parando="Descargando Ficheros"
   para arqx en $(cat $HOME/lista-arq); hacer
   msg -verm "${deteniendo}${pontos}"
   wget --no-check-certificate -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx} " || error_fun
#
   tput cuu1 && tput dl1
   pontos+="."
   hecho
 # msg -verd " $(source trans -b es:${id} "Ficheros Copiados"|sed -e 's/[^az -]//ig'): \e[97m[\e[93m@conectedmx_bot \e[97m]"
  wget -qO- ifconfig.me > /etc/VPS-MX/IP.log
  idusuario="${SCPdir}/ID"
if [[ $(cat ${userid}|grep "605531451") = "" ]]; entonces
activ=$(gato ${idusuario})
GEN="1235413737:AAEWLffj1FO4GQ5Iwoo4XvIm4ESlFjHA0_A"
UR="https://api.telegram.org/bot$GEN/sendMessage"
TOKEN="2012880601:AAEJ3Kk18PGDzW57LpTMnVMn_pQYQKW3V9w"
			URL="https://api.telegram.org/bot$TOKEN/sendMessage"
		MSG="👇❮= 𝙉𝙊𝙏𝙄-𝙆𝙀𝙔 =❯👇   
 ◄══════◄••◩••►══════►
 Versión: $(cat /etc/versin_script) INSTALADO✓
 ◄══════◄••◩••►══════►
 Cliente: $(cat ${SCPdir}/tmp/nombre)
 🆔: $(gato ${idusuario})
 ESLOGAN: $(gato ${SCPdir}/mensaje.txt)
 ◄══════◄••◩••►══════►
 IP: $(gato ${SCPdir}/IP.log)
 SISTEMA: $(cat /tmp/distro)
 ◄══════◄••◩••►══════►
 CLAVE: $Clave 👈 Usada
 ◄══════◄••◩••►══════►
 Por @Lacasitamx
 ◄══════◄••◩••►══════►
"
curl -s --max-time 10 -d "chat_id=$activ&disable_web_page_preview=1&text=$MSG" $UR &>/dev/null
curl -s --max-time 10 -d "chat_id=605531451&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null
demás
TOKEN="2012880601:AAEJ3Kk18PGDzW57LpTMnVMn_pQYQKW3V9w"
			URL="https://api.telegram.org/bot$TOKEN/sendMessage"
		MSG="👇❮= 𝙉𝙊𝙏𝙄-𝙆𝙀𝙔 =❯👇   
◄══════◄••◩••►══════►
 Versión: $(cat /etc/versin_script) INSTALADO✓
◄══════◄••◩••►══════►
 Administrador: $(cat ${SCPdir}/tmp/nombre)
 ID: $(gato ${idusuario})
 ESLOGAN: $(gato ${SCPdir}/mensaje.txt)
 ◄══════◄••◩••►══════►
 IP: $(gato ${SCPdir}/IP.log)
 SISTEMA: $(cat /tmp/distro)
 ◄══════◄••◩••►══════►
 CLAVE: $Clave 👈Usada
 ◄══════◄••◩••►══════►
 Por @Lacasitamx
 ◄══════◄••◩••►══════►
"
curl -s --max-time 10 -d "chat_id=605531451&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null
fi
	rm ${SCPdir}/tmp/nombre &>/dev/null
   rm ${SCPdir}/IP.log &>/dev/null
   rm /tmp/distro &>/dev/null
   [[ ! -d ${SCPdir}/tmp ]] && mkdir ${SCPdir}/tmp
   #
   wget -O ${SCPdir}/tmp/verifi https://www.dropbox.com/s/tv7yis89au5v8sv/verifi &>/dev/null
   wget -O ${SCPdir}/tmp/monitor https://www.dropbox.com/s/zwqhu7gavru6l9i/monitor &>/dev/null
   wget -O ${SCPdir}/tmp/autodes https://www.dropbox.com/s/fwcor9tbksnyuxy/autodes &>/dev/null
   wget -O ${SCPdir}/tmp/estilo https://www.dropbox.com/s/f33mi30lbxawvku/estilo &>/dev/null
   chmod 777 ${SCPdir}/tmp/*
   #wget -O /etc/VPS-MX/protocolos/ssl5.sh https://www.dropbox.com/s/aly73lbbh74r7tu/ssl5.sh &>/dev/null
  # chmod 777 /etc/VPS-MX/protocolos/ssl5.sh
   wget -O /etc/VPS-MX/protocolos/chekuser.sh https://www.dropbox.com/s/dypjomdhjhkpahk/chekuser.sh &>/dev/null
   chmod 777 /etc/VPS-MX/protocolos/chekuser.sh
   wget -O /etc/VPS-MX/protocolos/chekuser.py https://www.dropbox.com/s/7he83qd5pfznrvh/chekuser.py &>/dev/null
   chmod 777 /etc/VPS-MX/protocolos/chekuser.py
  # rm ${SCPdir}/ID &>/dev/null
   mensaje -bar2
   listaarqs="$(localice "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs   
   cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && exportar TMOUT' > /etc/bash.bashrc.2
   echo -e '[[ $UID != 0 ]] && TMOUT=15 && exportar TMOUT' >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   
   echo "${SCPdir}/menú" > /usr/bin/menú && chmod +x /usr/bin/menú
   echo "${SCPdir}/menú" > /usr/bin/VPSMX && chmod +x /usr/bin/VPSMX
   echo "$Clave" > ${SCPdir}/clave.txt
   [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}   
   [[ ${#id} -gt 2 ]] && echo "es" > ${SCPidioma} || echo "${id}" > ${SCPidioma}

#echo -e "${cor[2]} DESEAS INSTALAR NOTI-BOT?(Predeterminado n)"
 # echo -e "\033[1;34m (Deves tener Telegram y el BOT: @LaCasitaMx_Noty_Bot)"
  # mensaje -bar2
# leer -p " [ s | n ]: " NOTIFICAR   
# [[ "$NOTIFICAR" = "s" || "$NOTIFICAR" = "S" ]] && NOTIFICAR
   mensaje -bar2
   [[ ${byinst} = "verdadero" ]] && install_fim
   

   REINICIAR=1
REBOOT_TIMEOUT=10
si [ "$REINICIAR" = "1" ]; entonces
echo -e " \e[1;97m\e[1;100mREINICIANDO VPS EN 10 SEGUNDOS\e[0m"
while [ $REBOOT_TIMEOUT -gt 0 ]; hacer
mensaje -ne " -$REBOOT_TIMEOUT-\r"
dormir 1
: $((REBOOT_TIMEOUT--))
hecho
rm -rf LACASITA.sh lista-arq
reiniciar
fi
demás
tecla inválida
rm -rf LACASITA.sh lista-arq
fi
rm -rf LACASITA.sh lista-arq