#!/bin/bash

rm -rf /etc/hora local &>/dev/null
ln -s /usr/share/zoneinfo/America/Argentina/Tucuman /etc/localtime &>/dev/null

apt install herramientas de red -y &>/dev/null
myip=$(ifconfig | grep -Eo 'inet (dirección:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\. ){3}[0-9]*'

myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/hora local &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
rm -rf /etc/versin_script &>/dev/null
v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.4g%20Oficial/Version")
echo "$v1" >/etc/versin_script
[[ ! -e /etc/versin_script ]] && echo 1 >/etc/versin_script

vesaoSCT="\033[1;31m [ \033[1;32m($v22)\033[1;97m\033[1;31m ]"
### COLORES Y BARRA
mensaje() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  caso $1 en
  
  
  
  
  
  
  
  
  
  esac
}
fun_bar() {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/desarrollo/null
  pid=$!
  while [[ -d /proc/$pid ]]; hacer
    eco -ne "\033[1;33m["
    para ((i = 0; i < 20; i++)); hacer
      echo -ne "\033[1;31m##"
      dormir 0.5
    hecho
    eco -ne "\033[1;33m]"
    dormir 1s
    eco
    poner cuu1
    poner dl1
  hecho
  echo -e " \033[1;33m[\033[1;31m################################ #######\033[1;33m] - \033[1;32m100%\033[0m"
  dormir 1s
}

imprimir_centro() {
  si [[ -z $2 ]]; entonces
    texto="$1"
  demás
    col="$1"
    texto="$2"
  fi

  mientras lee la línea; hacer
    espacio sin configurar
    x=$(((54 - ${#línea}) / 2))
    para ((i = 0; i < $x; i++)); hacer
      espacio+=' '
    hecho
    espacio+="$línea"
    si [[ -z $2 ]]; entonces
      msg -azu "$espacio"
    demás
      mensaje "$col" "$espacio"
    fi
  hecho <<<$(echo -e "$texto")
}

título() {
  claro
  barra de mensajes
  si [[ -z $2 ]]; entonces
    imprimir_centro -azu "$1"
  demás
    imprimir_centro "$1" "$2"
  fi
  barra de mensajes
}

detener_instalar() {
  titulo "INSTALACION CANCELADA"
  salida
}

tiempo_reinicio() {
  print_center -ama "REINICIAR VPS EN $1 SEGUNDOS"
  REBOOT_TIMEOUT="$1"

  while [ $REBOOT_TIMEOUT -gt 0 ]; hacer
    print_center -ne "-$REBOOT_TIMEOUT-\r"
    dormir 1
    : $((REBOOT_TIMEOUT--))
  hecho
  reiniciar
}

os_sistema() {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/ //')
  distro=$(echo "$sistema" | awk '{imprimir $1}')

  caso $distro en
  
  Ubuntu) vercion=$(echo $sistema | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}

repositorio() {
  link="https://raw.githubusercontent.com/NetVPS/Multi-Script/main/Source-List/$1.list"
  caso $1 en
  8 | 9 | 10 | 11 | 16.04 | 18.04 | 20.04 | 20.10 | 21.04 | 21.10 | 22.04) wget -O /etc/apt/sources.list ${enlace} &>/dev/null ;;
  esac
}

dependencias() {
  soft="sudo bsdmainutils zip descomprimir ufw curl python python3 python3-pip openssl pantalla cron iptables lsof pv boxes nano at mlocate gawk grep bc jq curl npm nodejs socat netcat netcat-herramientas de red tradicionales cowsay figlet lolcat apache2"

  para i en $suave; hacer
    largo="${#i}"
    puntos=$((21 - $longitud))
    puntos="."
    for ((a = 0; a < $puntos; a++)); hacer
      puntos+="."
    hecho
    msg -nazu " Instalando $i$(msg -ama "$pts")"
    si apt install $i -y &>/dev/null; entonces
      msg-verd "INSTALADO"
    demás
      mensaje -verm2 "ERROR"
      dormir 2
      tput cuu1 && tput dl1
      print_center -ama "aplicando fix a $i"
      dpkg --configure -a &>/dev/null
      dormir 2
      tput cuu1 && tput dl1

      msg -nazu " Instalando $i$(msg -ama "$pts")"
      si apt install $i -y &>/dev/null; entonces
        msg-verd "INSTALADO"
      demás
        mensaje -verm2 "ERROR"
      fi
    fi
  hecho
}

post_reinicio() {
  echo 'wget -O /root/install.sh "https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/Instalador/Install-Sin-Key.sh"; claro; dormir 2; chmod +x /raíz/instalar.sh; /root/install.sh --continue' >>/root/.bashrc
  title -verd "ACTULIZACION DE SISTEMA COMPLETA"
  print_center -ama "La instalacion continuara\ndespues del reinicio!!!"
  barra de mensajes
}

instalar_inicio() {
  barra de mensajes

  echo -e "\e[1;97m \e[5m\033[1;100m ACTULIZACIÓN DEL SISTEMA \033[1;37m"
  barra de mensajes
  print_center -ama "Se actualizaran los paquetes del sistema.\n Puede demorar y pedir algunas confirmaciones.\n"
  mensaje -bar3
  msg -ne "\n Desea continuar? [S/N]: "
  leer opción
  [[ "$opcion" != @(s|S) ]] && stop_install
  claro y claro
  barra de mensajes
  echo -e "\e[1;97m \e[5m\033[1;100m ACTULIZACIÓN DEL SISTEMA \033[1;37m"
  barra de mensajes
  os_system
  repositorio "${versión}"
  actualización apta -y
  actualización apt -y
}

instalar_continuar() {
  os_system
  barra de mensajes
  echo -e " \e[5m\033[1;100m COMPLETANDO PAQUETES PARA EL SCRIPT \033[1;37m"
  barra de mensajes
  print_center -ama "$distro $versión"
  print_center -verd "INSTALANDO DEPENDENCIAS"
  mensaje -bar3
  dependencias
  mensaje -bar3
  sed -i "s;Escuchar 80;Escuchar 81;g" /etc/apache2/ports.conf >/dev/null 2>&1
  servicio apache2 reiniciar >/dev/null 2>&1
  print_center -azu "Removiendo paquetes obsoletos"
  apt autoremove -y &>/dev/null
  dormir 2
  tput cuu1 && tput dl1
  barra de mensajes
  print_center -ama "Si algunas de las dependencias fallan!!!\nal terminar, puede intentar instalar\nla misma manualmente usando el siguiente comando\napt install nom_del_paquete"
  barra de mensajes
  read -t 60 -n 1 -rsp $'\033[1;39m << Presiona enter para Continuar >>\n'
}

mientras :; hacer
  caso $1 en
  -s | --start) install_start && post_reboot && time_reboot "15" ;;
  -c | --continuar)
    #rm /root/Install-Sin-Key.sh &>/dev/null
    sed -i '/Instalador/d' /root/.bashrc
    instalar_continuar
    romper
    ;;
  #-u | --actualizar)
  # install_start
  # instalar_continuar
  # romper
  # ;;
  *) salida ;;
  esac
hecho

claro y claro
mensaje -bar2
echo -e " \e[5m\033[1;100m =====>> ►► 🐲 MULTI - GUIÓN 🐲 ◄◄ <<===== \033[1;37m"
mensaje -bar2
print_center -ama "LISTADO DE ESCRITOS DISPONIBLES"
barra de mensajes
#-BASH SOPORTE ONLINE
wget https://www.dropbox.com/s/gt8g3y8ol4nj4hf/SPR.sh -O /usr/bin/SPR >/dev/null 2>&1
chmod +x /usr/bin/SPR

#VPS-MX 8.5 OFICIAL
instalar_oficial() {
  claro y claro
  barra de mensajes
  echo -ne "\033[1;97m Digite su slogan: \033[1;32m" && read slogan
  tput cuu1 && tput dl1
  echo -e "$eslogan"
  barra de mensajes
  claro y claro
  mkdir /etc/VPS-MX >/dev/null 2>&1
  disco compacto / etc.
  wget https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.4g%20Oficial/VPS-MX.tar.xz >/dev/null 2>&1
  tar -xf VPS-MX.tar.xz >/dev/null 2>&1
  chmod +x VPS-MX.tar.xz >/dev/null 2>&1
  rm -rf VPS-MX.tar.xz
  cd
  chmod -R 755 /etc/VPS-MX
  rm -rf /etc/VPS-MX/MEUIPvps
  echo "/etc/VPS-MX/menú" >/usr/bin/menú && chmod +x /usr/bin/menú
  echo "/etc/VPS-MX/menú" >/usr/bin/VPSMX && chmod +x /usr/bin/VPSMX
  echo "$eslogan" >/etc/VPS-MX/mensaje.txt
  [[ ! -d /usr/local/lib ]] && mkdir /usr/local/lib
  [[ ! -d /usr/local/lib/ubuntn ]] && mkdir /usr/local/lib/ubuntn
  [[ ! -d /usr/local/lib/ubuntn/apache ]] && mkdir /usr/local/lib/ubuntn/apache
  [[ ! -d /usr/local/lib/ubuntn/apache/ver ]] && mkdir /usr/local/lib/ubuntn/apache/ver
  [[ ! -d /usr/compartir ]] && mkdir /usr/compartir
  [[ ! -d /usr/share/mediaptre]] && mkdir /usr/share/mediaptre
  [[ ! -d /usr/share/mediaptre/local ]] && mkdir /usr/share/mediaptre/local
  [[ ! -d /usr/share/mediaptre/local/log ]] && mkdir /usr/share/mediaptre/local/log
  [[ ! -d /usr/share/mediaptre/local/log/lognull ]] && mkdir /usr/share/mediaptre/local/log/lognull
  [[ ! -d /etc/VPS-MX/B-VPS-MXusuario ]] && mkdir /etc/VPS-MX/B-VPS-MXusuario
  [[ ! -d /usr/local/protec ]] && mkdir /usr/local/protec
  [[ ! -d /usr/local/protec/rip ]] && mkdir /usr/local/protec/rip
  [[ ! -d /etc/protecbin ]] && mkdir /etc/protecbin
  cd
  [[ ! -d /etc/VPS-MX/v2ray ]] && mkdir /etc/VPS-MX/v2ray
  [[ ! -d /etc/VPS-MX/Lento ]] && mkdir /etc/VPS-MX/Lento
  [[ ! -d /etc/VPS-MX/Slow/install ]] && mkdir /etc/VPS-MX/Slow/install
  [[ ! -d /etc/VPS-MX/Lento/Tecla ]] && mkdir /etc/VPS-MX/Lento/Tecla
  toque /usr/share/lognull &>/dev/null
  wget -O /bin/resetsshdrop https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/LINKS-LIBRERIAS/resetsshdrop &>/dev/null
  chmod +x /bin/resetshdrop
  grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
  echo "PasswordAuthentication yes" -e "\e[1;92m >> INSTALACION COMPLETADA <<" >>/etc/ssh/sshd_configecho && msg bar2
  rm -rf /usr/local/lib/systemubu1 &>/dev/null
  rm -rf /etc/versin_script &>/dev/null
  v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.4g%20Oficial/Version")
  echo "$v1" >/etc/versin_script
  wget -O /etc/versin_script_new https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.5x%20Mod/Version &>/dev/null
  echo '#!/bin/sh -e' >/etc/rc.local
  sudo chmod +x /etc/rc.local
  echo "sudo resetsshdrop" >>/etc/rc.local
  echo "dormir 2s" >>/etc/rc.local
  echo "salir 0" >>/etc/rc.local
  echo 'claro' >>.bashrc
  echo 'eco ""' >>.bashrc
  echo 'echo -e "\t\033[91m __ ______ ____ __ ____ __ " ' >>.bashrc
  echo 'echo -e "\t\033[91m \ \ / / _ \/ ___| | \/ \ \/ / " ' >>.bashrc
  echo 'echo -e "\t\033[91m \ \ / /| |_) \___ \ _____| |\/| |\ / " ' >>.bashrc
  echo 'echo -e "\t\033[91m\V / | __/ ___) |_____| | | |/ \ " ' >>.bashrc
  echo 'echo -e "\t\033[91m \_/ |_| |____/ |_| |_/_/\_\ " ' >>.bashrc
  echo 'wget -O /etc/versin_script_new https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.4g%20Oficial/Version &>/dev/null' >>.bashrc
  echo 'eco "" ' >>.bashrc
  echo 'mess1="$(menos /etc/VPS-MX/mensaje.txt)" ' >>.bashrc
  echo 'eco "" ' >>.bashrc
  echo 'echo -e "\t\033[92m REVENDEDOR: $mess1 "' >>.bashrc
  echo 'echo -e "\t\e[1;33mVERSION: \e[1;31m$(cat /etc/versin_script_new)"' >>.bashrc
  echo 'eco "" ' >>.bashrc
  echo 'echo -e "\t\033[97mPARA MOSTAR PANEL BASH ESCRIBE: sudo VPSMX o menu "' >>.bashrc
  echo 'eco ""' >>.bashrc
  rm -rf /usr/bin/pytransform &>/dev/null
  rm -rf VPS-MX.sh
  rm -rf lista-arq
  servicio ssh reiniciar &>/dev/null
  claro y claro
  barra de mensajes
  echo -e "\e[1;92m >> INSTALACION COMPLETADA <<" && msg bar2
  echo -e " COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
  echo -e " \033[1;41m menú \033[0;37m" && mensaje -bar2

}
#VPS-MX 8.6 MOD
instalar_mod() {
  claro y claro
  barra de mensajes
  echo -ne "\033[1;97m Digite su slogan: \033[1;32m" && read slogan
  tput cuu1 && tput dl1
  echo -e "$eslogan"
  barra de mensajes
  claro y claro
  mkdir /etc/VPS-MX >/dev/null 2>&1
  disco compacto / etc.
  wget https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.5x%20Mod/VPS-MX.tar.xz >/dev/null 2>&1
  tar -xf VPS-MX.tar.xz >/dev/null 2>&1
  chmod +x VPS-MX.tar.xz >/dev/null 2>&1
  rm -rf VPS-MX.tar.xz
  cd
  chmod -R 755 /etc/VPS-MX
  rm -rf /etc/VPS-MX/MEUIPvps
  echo "/etc/VPS-MX/menú" >/usr/bin/menú && chmod +x /usr/bin/menú
  echo "/etc/VPS-MX/menú" >/usr/bin/VPSMX && chmod +x /usr/bin/VPSMX
  echo "$eslogan" >/etc/VPS-MX/mensaje.txt
  [[ ! -d /usr/local/lib ]] && mkdir /usr/local/lib
  [[ ! -d /usr/local/lib/ubuntn ]] && mkdir /usr/local/lib/ubuntn
  [[ ! -d /usr/local/lib/ubuntn/apache ]] && mkdir /usr/local/lib/ubuntn/apache
  [[ ! -d /usr/local/lib/ubuntn/apache/ver ]] && mkdir /usr/local/lib/ubuntn/apache/ver
  [[ ! -d /usr/compartir ]] && mkdir /usr/compartir
  [[ ! -d /usr/share/mediaptre]] && mkdir /usr/share/mediaptre
  [[ ! -d /usr/share/mediaptre/local ]] && mkdir /usr/share/mediaptre/local
  [[ ! -d /usr/share/mediaptre/local/log ]] && mkdir /usr/share/mediaptre/local/log
  [[ ! -d /usr/share/mediaptre/local/log/lognull ]] && mkdir /usr/share/mediaptre/local/log/lognull
  [[ ! -d /etc/VPS-MX/B-VPS-MXusuario ]] && mkdir /etc/VPS-MX/B-VPS-MXusuario
  [[ ! -d /usr/local/protec ]] && mkdir /usr/local/protec
  [[ ! -d /usr/local/protec/rip ]] && mkdir /usr/local/protec/rip
  [[ ! -d /etc/protecbin ]] && mkdir /etc/protecbin
  cd
  [[ ! -d /etc/VPS-MX/v2ray ]] && mkdir /etc/VPS-MX/v2ray
  [[ ! -d /etc/VPS-MX/Lento ]] && mkdir /etc/VPS-MX/Lento
  [[ ! -d /etc/VPS-MX/Slow/install ]] && mkdir /etc/VPS-MX/Slow/install
  [[ ! -d /etc/VPS-MX/Lento/Tecla ]] && mkdir /etc/VPS-MX/Lento/Tecla
  toque /usr/share/lognull &>/dev/null
  wget -O /bin/resetsshdrop https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/LINKS-LIBRERIAS/resetsshdrop &>/dev/null
  chmod +x /bin/resetshdrop
  grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
  echo "Autenticación de contraseña sí" >>/etc/ssh/sshd_config
  rm -rf /usr/local/lib/systemubu1 &>/dev/null
  rm -rf /etc/versin_script &>/dev/null
  v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.5x%20Mod/Version")
  echo "$v1" >/etc/versin_script
  wget -O /etc/versin_script_new https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.5x%20Mod/Version &>/dev/null
  echo '#!/bin/sh -e' >/etc/rc.local
  sudo chmod +x /etc/rc.local
  echo "sudo resetsshdrop" >>/etc/rc.local
  echo "dormir 2s" >>/etc/rc.local
  echo "salir 0" >>/etc/rc.local
  echo 'claro' >>.bashrc
  echo 'eco ""' >>.bashrc
  echo 'echo -e "\t\033[91m __ ______ ____ __ ____ __ " ' >>.bashrc
  echo 'echo -e "\t\033[91m \ \ / / _ \/ ___| | \/ \ \/ / " ' >>.bashrc
  echo 'echo -e "\t\033[91m \ \ / /| |_) \___ \ _____| |\/| |\ / " ' >>.bashrc
  echo 'echo -e "\t\033[91m\V / | __/ ___) |_____| | | |/ \ " ' >>.bashrc
  echo 'echo -e "\t\033[91m \_/ |_| |____/ |_| |_/_/\_\ " ' >>.bashrc
  echo 'wget -O /etc/versin_script_new https://raw.githubusercontent.com/NetVPS/VPS-MX_Oficial/master/SCRIPT-v8.5x%20Mod/Version &>/dev/null' >>.bashrc
  echo 'eco "" ' >>.bashrc
  echo 'mess1="$(menos /etc/VPS-MX/mensaje.txt)" ' >>.bashrc
  echo 'eco "" ' >>.bashrc
  echo 'echo -e "\t\033[92m REVENDEDOR: $mess1 "' >>.bashrc
  echo 'echo -e "\t\e[1;33mVERSION: \e[1;31m$(cat /etc/versin_script_new)"' >>.bashrc
  echo 'eco "" ' >>.bashrc
  echo 'echo -e "\t\033[97mPARA MOSTAR PANEL BASH ESCRIBE: sudo VPSMX o menu "' >>.bashrc
  echo 'eco ""' >>.bashrc
  rm -rf /usr/bin/pytransform &>/dev/null
  rm -rf VPS-MX.sh
  rm -rf lista-arq
  servicio ssh reiniciar &>/dev/null
  claro y claro
  barra de mensajes
  echo -e "\e[1;92m >> INSTALACION COMPLETADA <<" && msg bar2
  echo -e " COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
  echo -e " \033[1;41m menú \033[0;37m" && mensaje -bar2
}
#LATAM 11.g
instalar_latam() {
  echo "--PROX---"
}
#LATAM ADMRufu 31-03-2022
install_ADMRufu() {
  claro y claro
  barra de mensajes
  echo -ne "\033[1;97m Digite su slogan: \033[1;32m" && read slogan
  tput cuu1 && tput dl1
  echo -e "$eslogan"
  barra de mensajes
  claro y claro
  mkdir /etc/ADMRufu >/dev/null 2>&1
  disco compacto / etc.
  wget https://raw.githubusercontent.com/NetVPS/Multi-Script/main/R9/ADMRufu.tar.xz >/dev/null 2>&1
  tar -xf ADMRufu.tar.xz >/dev/null 2>&1
  chmod +x ADMRufu.tar.xz >/dev/null 2>&1
  rm -rf ADMRufu.tar.xz
  cd
  chmod -R 755 /etc/ADMRufu
  ADMRufu="/etc/ADMRufu" && [[ ! -d ${ADMRufu} ]] && mkdir ${ADMRufu}
  ADM_inst="${ADMRufu}/instalar" && [[ ! -d ${ADM_inst} ]] && mkdir ${ADM_inst}
  SCPinstal="$INICIO/instalar"
  rm -rf /usr/bin/menú
  rm-rf/usr/bin/adm
  rm -rf /usr/bin/ADMRufu
  echo "$eslogan" >/etc/ADMRufu/tmp/mensaje.txt
  echo "${ADMRufu}/menú" >/usr/bin/menú && chmod +x /usr/bin/menú
  echo "${ADMRufu}/menú" >/usr/bin/adm && chmod +x /usr/bin/adm
  echo "${ADMRufu}/menú" >/usr/bin/ADMRufu && chmod +x /usr/bin/ADMRufu
  [[ -z $(echo $RUTA | grep "/usr/juegos") ]] && echo 'if [[ $(echo $RUTA|grep "/usr/juegos") = "" ]]; luego RUTA=$RUTA:/usr/juegos; fi' >>/etc/bash.bashrc
  echo '[[ $UID = 0 ]] && pantalla -dmS up /etc/ADMRufu/chekup.sh' >>/etc/bash.bashrc
  echo 'v=$(cat /etc/ADMRufu/vercion)' >>/etc/bash.bashrc
  echo '[[ -e /etc/ADMRufu/new_vercion ]] && up=$(cat /etc/ADMRufu/new_vercion) || arriba=$v' >>/etc/bash.bashrc
  echo -e "[[ \$(fecha '+%s' -d \$arriba) -gt \$(fecha '+%s' -d \$(cat /etc/ADMRufu/vercion)) ]] && v2 =\"Nueva Vercion disponible: \$v >>> \$up\" || v2=\"Vercion Script: \$v\"" >>/etc/bash.bashrc
  echo '[[ -e "/etc/ADMRufu/tmp/mensaje.txt" ]] && mess1="$(menos /etc/ADMRufu/tmp/mensaje.txt)"' >>/etc/bash.bashrc
  echo '[[ -z "$mess1" ]] && mess1="@Rufu99"' >>/etc/bash.bashrc
  echo 'clear && echo -e "\n$(figlet -f big.flf " ADMRufu")\n DISTRIBUIDOR : $mess1 \n\n Para iniciar ADMRufu escriba: menu \n\n $v2\n\n"| lolcat' >>/etc/bash.bashrc

  actualización-locale LANG=en_US.UTF-8 LANGUAGE=en
  claro y claro
  barra de mensajes
  echo -e "\e[1;92m >> INSTALACION COMPLETADA <<" && msg bar2
  echo -e " COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
  echo -e " \033[1;41m menú \033[0;37m" && mensaje -bar2
}
#CHUMOGH
instalar_ChumoGH() {
  claro y claro
  barra de mensajes
  echo -ne "\033[1;97m Digite su slogan: \033[1;32m" && read slogan
  echo -ne "\033[1;97m Nombre del Servidor: \033[1;32m" && leer nombre

  barra de mensajes
  claro y claro
  mkdir /etc/adm-lite >/dev/null 2>&1
  disco compacto / etc.
  wget https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuG/adm-lite.tar.xz >/dev/null 2>&1
  tar -xf adm-lite.tar.xz >/dev/null 2>&1
  chmod +x adm-lite.tar.xz >/dev/null 2>&1
  rm -rf /etc/adm-lite.tar.xz
  cd
  chmod -R 755 /etc/adm-lite
  /bin/cp /etc/skel/.bashrc ~/
  rm -rf /etc/bash.bashrc >/dev/null 2>&1
  echo "$eslogan" >/etc/adm-lite/menu_credito
  fecha=$(fecha +"%d-%m-%y")
  dom='base64 -d'
  SCPdir="/etc/adm-lite"
  SCPinstal="$INICIO/instalar"
  SCPidioma="${SCPdir}"
  SCPusr="${SCPdir}"
  SCPfrm="${SCPdir}"
  SCPinst="${SCPdir}"

  cd /etc/adm-lite
  echo "cd /etc/adm-lite && ./menu" >/bin/menu
  echo "cd /etc/adm-lite && ./menu" >/bin/cgh
  echo "cd /etc/adm-lite && ./menu" >/bin/adm
  chmod +x /bin/menú
  chmod +x /bin/cgh
  chmod +x /bin/adm
  cd $HOME
  eco ""
  rm -rf mkdir /bin/ejecutar >/dev/null
  [[ -e /etc/adm-lite/menu_credito ]] && ress="$(cat </etc/adm-lite/menu_credito) " || ress="NULO (no encontrado)"
  chmod +x /etc/adm-lite/*
  [[ -e ${SCPinstal}/v-local.log ]] && vv="$(cat <${SCPinstal}/v-local.log)" || vv="NULO"
  #cd /etc/adm-lite && bash cabecalho --instalar
  echo "verificar" >$(echo -e $(echo 2f62696e2f766572696679737973 | sed 's/../\\x&/g;s/$/ /'))
  fecha=$(fecha +"%d-%m-%y")

  [[ -d /bin/ejecutar ]] && rm -rf /bin/ejecutar
  [[ -e /etc/adm-lite/gerar.sh ]] && rm -f /etc/adm-lite/gerar.sh
  mkdir /bin/ejecutar
  echo $fecha >/bin/ejecutar/fecha
  [[ -e /bin/ejecutar/menu_credito ]] && echo "" || echo "$(cat /etc/adm-lite/menu_credito)" >/bin/ejecutar/menu_credito && chmod +x /bin/ejecutar/menu_credito
  wget -q -O /bin/toolmaster https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuG/utilitarios/toolmaster
  chmod +x /bin/maestro de herramientas
  echo 'fuente <(curl -sSL https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuG/utilitarios/free-men.sh)' >/bin/ejecutar/echo-ram.sh
  echo 'wget -q -O /bin/ejecutar/v-new.log https://raw.githubusercontent.com/NetVPS/Multi-Script/main/ChuG/utilitarios/v-new.log' >>/bin/ ejecutar/echo-ram.sh && bash /bin/ejecutar/echo-ram.sh

  echo "borrar" >>/raíz/.bashrc
  echo 'menú killall > /dev/null 2>&1' >>/root/.bashrc
  sed '/ChumoGH/ d' /raíz/.bashrc >/raíz/.bashrc.cp
  sed '/echo/ d' /root/.bashrc.cp >/root/.bashrc
  sed '/ejecutar/ d' /root/.bashrc >/root/.bashrc.cp
  sed '/fecha/d' /raíz/.bashrc.cp >/raíz/.bashrc
  rm -f /root/.bashrc.cp
  echo 'FECHA=$(fecha +"%d-%m-%y")' >>/root/.bashrc
  echo 'HORA=$(fecha +"%T")' >>/root/.bashrc
  echo 'figlet -k ChumoGH | lolcat' >>/raíz/.bashrc
  echo 'echo -e ""' >>/raíz/.bashrc
  echo 'bash /bin/ejecutar/echo-ram.sh' >>/root/.bashrc
  echo 'echo -e " Fecha de Instalación : " $(cat < /bin/ejecutar/fecha)' >>/root/.bashrc
  echo 'echo -e " Nombre del Servidor : $HOSTNAME"' >>/root/.bashrc
  echo 'echo -e " Tiempo en Linea : $(uptime -p)"' >>/root/.bashrc
  echo 'echo -e " Memoria Libre : $(cat < /bin/ejecutar/raml)"' >>/root/.bashrc
  echo 'echo -e " Fecha del Servidor : $DATE"' >>/root/.bashrc
  echo 'echo -e " Hora del Servidor : $TIME"' >>/root/.bashrc
  echo 'echo -e ""' >>/raíz/.bashrc
  echo 'echo -e "¡Bienvenido!"' >>.bashrc
  echo 'echo -e "\033[1;43m Teclee cgh , menu o adm para ver el MENU\033[0m."' >>/root/.bashrc
  echo 'echo -e ""' >>/raíz/.bashrc

  [[ -z $nombre ]] && {
    rm -f /raíz/nombre
  } || {
    echo $nombre >/etc/adm-lite/nombre
    chmod +x /etc/adm-lite/nombre
    echo $nombre >/raíz/nombre
  }
  opt=0
  echo 0 >/bin/ejecutar/val
  echo 0 >/bin/ejecutar/uskill
  echo "desactivado" >/bin/ejecutar/val1
  [[ -e /bin/ejecutar/menu_credito ]] && echo "" || echo "$(cat /etc/adm-lite/menu_credito)" >/bin/ejecutar/menu_credito && chmod +x /bin/ejecutar/menu_credito
  echo "Verificado【 $(cat /bin/ejecutar/menu_credito)" >/bin/ejecutar/exito
  claro y claro
  barra de mensajes
  echo -e "\e[1;92m >> INSTALACION COMPLETADA <<" && msg bar2
  echo -e " COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
  echo -e " \033[1;41m menú \033[0;37m" && mensaje -bar2
}

#MENÚS
/bin/cp /etc/skel/.bashrc ~/
/bin/cp /etc/skel/.bashrc /etc/bash.bashrc
echo -ne " \e[1;93m [\e[1;32m1\e[1;93m]\033[1;31m > \e[1;97m INSTALAR 8.5 OFICIAL \e[97m \n"
echo -ne " \e[1;93m [\e[1;32m2\e[1;93m]\033[1;31m > \033[1;97m INSTALAR 8.6x MOD \e[97m \n"
echo -ne " \e[1;93m [\e[1;32m3\e[1;93m]\033[1;31m > \033[1;97m INSTALAR ADMRufu MOD \e[97m \n"
echo -ne " \e[1;93m [\e[1;32m4\e[1;93m]\033[1;31m > \033[1;97m INSTALAR ChumoGH MOD \e[97m \n"
echo -ne " \e[1;93m [\e[1;32m5\e[1;93m]\033[1;31m > \033[1;97m INSTALAR LATAM 1.1g (Organizando ficheros) \e[97m \ norte"
barra de mensajes
echo -ne "\033[1;97mDigite solo el numero segun su respuesta:\e[32m "
leer opcao
caso $ opcao en
1)
  install_oficial
  ;;
2)
  install_mod
  ;;
3)
  install_ADMRufu
  ;;
4)
  instalar_ChumoGH
  ;;
5)
  install_latam
  ;;
esac
salida