#!/bin/bash
cd $HOME
SCPdir="/etc/nuevoadm"
SCPinstal="$INICIO/instalar"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/usuario-ger"
SCPfrm="/etc/ger-frm"
SCPinst="/etc/ger-inst"
SCPresq="aHR0cHM6Ly9y9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0FBQUFBRVhRT1N5SXBOMkpaMGVoVVEvQURNLVVMVElNQVRFLU5FVy1GUkVFL21hc3Rlci9yZXF1ZXN0"
SUB_DOM='base64 -d'
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
rm $(contraseña)/$0 &> /dev/null

mensaje () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 caso $1 en
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";
  "-bar2"|"-barra")cor="${AZUL}${NEGRITO}————————————————————————————— ——————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}";
 esac
}

diversión_ip () {
MIP=$(dirección IP | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0 -9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} \.[0-9]{1,3}'|cabeza -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}

componentes_inst () {
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "pantalla"|cabeza -1) ]] || apt-get pantalla de instalación -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "descomprimir"|head -1) ]] || apt-get install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "netstat"|head -1) ]] || apt-get install netstat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get install herramientas de red -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "dos2unix"|head -1) ]] || apt-get install dos2unix -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nload"|head -1) ]] || apt-get install nload -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "htop"|head -1) ]] || apt-get install htop -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i "s;Escuchar 80;Escuchar 81;g" /etc/apache2/ports.conf
 servicio apache2 reiniciar > /dev/null 2>&1 &
 }
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python-pip"|head -1) ]] || apt-get install python-pip -y &>/dev/null
pip install speedtest-cli &>/dev/null
}

funcao_idioma () {
mensaje -bar2
declare -A idioma=( [1]="en inglés" [2]="fr Franch" [3]="de alemán" [4]="it italiano" [5]="pl polaco" [6]= "pt portugués" [7]="es español" [8]="tr turco" )
para ((i=1; i<=12; i++)); hacer
valor1="$(echo ${idioma[$i]}|cortar -d' ' -f2)"
[[ -z $valor1 ]] && romper
valor1="\033[1;32m[$i] > \033[1;33m$valor1"
    while [[ ${#valor1} -lt 37 ]]; hacer
       valor1=$valor1" "
    hecho
echo -ne "$valor1"
déjame ++
valor2="$(echo ${idioma[$i]}|cortar -d' ' -f2)"
[[ -z $valor2 ]] && {
   eco -e " "
   romper
   }
valor2="\033[1;32m[$i] > \033[1;33m$valor2"
     while [[ ${#valor2} -lt 37 ]]; hacer
        valor2=$valor2" "
     hecho
echo -ne "$valor2"
déjame ++
valor3="$(echo ${idioma[$i]}|cortar -d' ' -f2)"
[[ -z $valor3 ]] && {
   eco -e " "
   romper
   }
valor3="\033[1;32m[$i] > \033[1;33m$valor3"
     while [[ ${#valor3} -lt 37 ]]; hacer
        valor3=$valor3" "
     hecho
echo -e "$valor3"
hecho
mensaje -bar2
selección no establecida
while [[ ${selección} != @([1-8]) ]]; hacer
echo -ne "\033[1;37mSELECT: " && leer selección
tput cuu1 && tput dl1
hecho
pv="$(echo ${idioma[$selección]}|cortar -d' ' -f1)"
[[ ${#id} -gt 2 ]] && id="pt" || id="$pv"
byinst="verdadero"
}

instalar_fim () {
msg -ama "$(source trans -b pt:${id} "Instalación completa, utilice los comandos"|sed -e 's/[^az -]//ig')" && msg bar2
echo -e "menú/adm"
mensaje -bar2
}

de nosotros () {
desarmar txtofus
número = $ (longitud de expresión $ 1)
for((i=1; i<$número+1; i++)); hacer
txt[$i]=$(echo "$1" | corte -b $i)
caso ${txt[$i]} en
".")txt[$i]="+";;
"+")txt[$i]=".";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"3")txt[$i]="%";;
"%") txt[$i]="3";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
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
caso $1 en
"menú"|"mensaje.txt")ARQ="${SCPdir}/"; #Menú
"códigos de usuario")ARQ="${SCPusr}/"; #Usuario
"openssh.sh")ARQ="${SCPinst}/"; #Instalacao
"apache2.sh")ARQ="${SCPinst}/"; #Instalacao
"calamar.sh")ARQ="${SCPinst}/"; #Instalacao
"dropbear.sh")ARQ="${SCPinst}/"; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/"; #Instalacao
"ssl.sh")ARQ="${SCPinst}/"; #Instalacao
"sombracalcetines.sh")ARQ="${SCPinst}/"; #Instalacao
"budp.sh")ARQ="${SCPinst}/"; #Instalacao
"sslh.sh")ARQ="${SCPinst}/"; #Instalacao
"vnc.sh")ARQ="${SCPinst}/"; #Instalacao
"webmin.sh")ARQ="${SCPinst}/"; #Instalacao
"v2ray.sh")ARQ="${SCPinst}/"; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py"|"wsproxy.py")ARQ="${SCPinst}/ ";; #Instalacao
*)ARQ="${SCPfrm}/"; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

instalar_hosts () {
_arq_host="/etc/hosts"
_host[0]="d1n212ccp6ldpw.cloudfront.net"
_host[1]="dns.whatsapp.net"
_host[2]="portalrecarga.vivo.com.br/recarga"
_host[3]="navegue.vivo.com.br/controle/"
_host[4]="navegue.vivo.com.br/pre/"
_host[5]="www.whatsapp.net"
_host[6]="/ADM-ÚLTIMO?"
para host en ${_host[@]}; hacer
	if [[ "$(grep -w "$host" $_arq_host | wc -l)" = "0" ]]; entonces
		sed -i "3i\127.0.0.1 $host" $_arq_host
	fi
hecho
}

# Instala��o NUEVO-ÚLTIMO
fun_ip
wget -O /usr/bin/trans http://git.io/trans &> /dev/null
claro
mensaje -bar2
msg -ama "[NUEVO - ÚLTIMO - GUIÓN] \033[1;37m@AAAAAEXQOSyIpN2JZ0ehUQ"
[[ $1 = "" ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || identificación="$1"
 }
error_fun () {
msg -bar2 && msg -verm "$(source trans -b pt:${id} "Esta Chave Era de Outro Servidor Portanto Foi Excluida"|sed -e 's/[^az -]//ig') " && mensaje -bar2
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
salida 1
}
tecla inválida () {
msg -bar2 && msg -verm "¡Falló la tecla!" && msg -bar2
[[ -e $INICIO/lista-arq]] && rm $INICIO/lista-arq
salida 1
}
Clave="qra-atsilK?29@%6087%?88d5K8888:%05+08+@@?+91"
SOLICITUD=$(echo $SCPresq|$SUB_DOM)
echo "$IP" > /usr/bin/código_proveedor
[[ ! -d /usr/compartir/.adm ]] && mkdir /usr/compartir/.adm
echo "Jony: $(fecha)" > /usr/share/.adm/.adm
cd $HOME
msg -ne "Archivos: "
wget -O $HOME/lista-arq ${SOLICITUD}/lista-arq > /dev/null 2>&1 && echo -e "\033[1;32m Verificado" || {
   echo -e "\033[1;32m Verificado"
   tecla inválida
   salida
   }
dormir 1s
actualizadob
si [[ -e $HOME/lista-arq ]] && [[ ! $(cat $INICIO/lista-arq|grep "¡CLAVE NO VÁLIDA!") ]]; entonces
   mensaje -bar2
   msg -ama "$(source trans -b pt:${id} "BEM VINDO, OBRIGADO POR UTILIZAR"|sed -e 's/[^az -]//ig'): \033[1;31m[NUEVO -ÚLTIMO]"
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   pontos="."
   stop="$(source trans -b pt:${id} "Verificando Actualizaciones"|sed -e 's/[^az -]//ig')"
   para arqx en $(cat $HOME/lista-arq); hacer
   msg -verm "${deteniendo}${pontos}"
   wget -O ${SCPinstal}/${arqx} ${SOLICITUD}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun
   tput cuu1 && tput dl1
   pontos+="."
   hecho
   dormir 1s
   mensaje -bar2
   listaarqs="$(localice "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs   
   cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && exportar TMOUT' > /etc/bash.bashrc.2
   echo -e '[[ $UID != 0 ]] && TMOUT=15 && exportar TMOUT' >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   echo "${SCPdir}/menú" > /usr/bin/menú && chmod +x /usr/bin/menú
   echo "${SCPdir}/menú" > /usr/bin/adm && chmod +x /usr/bin/adm
   echo "${SCPdir}/menú" > /bin/h && chmod +x /bin/h
   msg -azu "AGUARDE..."
   rm -rf $INICIO/verificación del sistema* > /dev/null 2>&1; bash <(wget -qO- https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-ULTIMATE-NEW-FREE/master/Install/systemverify)
   componentes_inst
   instalar_hosts
   tput cuu1 && tput dl1
   echo "$Clave" > ${SCPdir}/clave.txt
   [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}   
   [[ ${#id} -gt 2 ]] && echo "pt" > ${SCPidioma} || echo "${id}" > ${SCPidioma}
   [[ ${byinst} = "verdadero" ]] && install_fim
demás
tecla inválida
fi