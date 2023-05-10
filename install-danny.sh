#!/bin/bash

caso $nuevolenguaje en
  en_US) a_enter='Presione enter para continuar'
          a_back='VOLVER'
          a_selection_fun='Seleccione una opción:';;
esac

# variables
exportar _hora=$(printf '%(%H:%M:%S)T')
exportar _fecha=$(printf '%(%D)T')

exportar numero='^[0-9]+$'
exportar texto='^[A-Za-z]+$'
exportar txt_num='^[A-Za-z0-9]+$'

# interfases de colores
mensaje(){
  COLOR[0]='\033[1;37m' #BRAN='\033[1;37m'
  COLOR[1]='\e[31m' #VERMELHO='\e[31m'
  COLOR[2]='\e[32m' #VERDE='\e[32m'
  COLOR[3]='\e[33m' #AMARELO='\e[33m'
  COLOR[4]='\e[34m' #AZUL='\e[34m'
  COLOR[5]='\e[91m' #MAGENTA='\e[35m'
  COLOR[6]='\033[1;97m' #MAG='\033[1;36m'
  COLOR[7]='\e[36m' #verde azulado='\e[36m'
  COLOR[8]='\e[30m' #negro='\e[30m'
  COLOR[9]='\033[34m' #azul='\033[1;34m'

  NEGRITO='\e[1m'
  SEMCOR='\e[0m'

  caso $1 en
    -ne) cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";
    -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";
    -nverd)cor="${COLOR[2]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";
    -nama) cor="${COLOR[3]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
    -ama) cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -verm) cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}";;
    -verm2)cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -verm3)cor="${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}";;
    -teal) cor="${COLOR[7]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -teal2)cor="${COLOR[7]}" && echo -e "${cor}${2}${SEMCOR}";;
    -blak) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -blak2)cor="${COLOR[8]}" && echo -e "${cor}${2}${SEMCOR}";;
    -azu) cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -blu) cor="${COLOR[9]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
    -blu1) cor="${COLOR[9]}" && echo -e "${cor}${2}${SEMCOR}";;
    -verd) cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -bra) cor="${COLOR[0]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";
    -bar) cor="${COLOR[1]}===================================== ================" && echo -e "${SEMCOR}${cor}${SEMCOR}";
    -bar2) cor="${COLOR[7]}===================================== ================" && echo -e "${SEMCOR}${cor}${SEMCOR}";
    -bar3) cor="${COLOR[1]}---------------------------------------------------- ----------------" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
    -bar4) cor="${COLOR[7]}----------------------------------------------------- ----------------" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
  esac
}

#centrado de texto
imprimir_centro(){
  si  -z $2 ; entonces
    texto="$1"
  demás
    col="$1"
    texto="$2"
  fi

  mientras lee la línea; hacer
    espacio sin configurar
    x=$(( ( 54 - ${#línea}) / 2))
    para (( i = 0; i < $x; i++ )); hacer
      espacio+=' '
    hecho
    espacio+="$línea"
    si  -z $2 ; entonces
      msg -azu "$espacio"
    demás
      mensaje "$col" "$espacio"
    fi
  hecho <<< $(echo -e "$texto")
}
#imprimir_centro2(){
# locales x
# local y
# #texto="$*"
# texto="$2"
# #x=$(( ($(columnas de entrada) - ${#texto}) / 2))
# x=$(( ( 54 - ${#texto}) / 2))
# echo -ne "\E[6n";leer -sdR y; y=$(echo -ne "${y#*[}" | corte -d';' -f1)
# #echo -e "\033[${y};${x}f$*"
# mensaje "$1" "\033[${y};${x}f$2"
#}

#titulos y encabesados
título(){
    claro
    barra de mensajes
    si  -z $2 ; entonces
      imprimir_centro -azu "$1"
    demás
      imprimir_centro "$1" "$2"
    fi
    barra de mensajes
 }

# finalización de tareas
 ingresar(){
  barra de mensajes
  text="►► ${a_enter:-Presione enter para continuar} ◄◄"
  si  -z $1 ; entonces
    print_center -ama "$texto"
  demás
    print_center "$1" "$texto"
  fi
  leer
 }

# opcion, volver volver/atras
atrás(){
    barra de mensajes
    echo -ne "$(mensaje -verd " [0]") $(mensaje -verm2 ">") " && mensaje -bra "\033[1;41m${a_back:-VOLVER}"
    barra de mensajes
 }

# creador de menús (opciones 1, 2, 3,.....)
función_menú(){
  opciones locales=${#@}
  matriz local
  for((num=1; num<=$opciones; num++)); hacer
    echo -ne "$(mensaje -verd " [$num]") $(mensaje -verm2 ">") "
    array=(${!num})
    caso ${matriz[0]} en
      "-vd")echo -e "\033[1;33m[!]\033[1;32m ${matriz[@]:1}";;
      "-vm")echo -e "\033[1;33m[!]\033[1;31m ${matriz[@]:1}";;
      "-fi")echo -e "${matriz[@]:2} ${matriz[1]}";;
      -bar|-bar2|-bar3|-bar4)echo -e "\033[1;37m${matriz[@]:1}\n$(msg ${matriz[0]})";;
      *)echo -e "\033[1;37m${matriz[@]}";;
    esac
  hecho
 }

# opcion de seleccion numerica
selección_diversión(){
  selección local = "nulo"
  rango local
  si  -z $2 ; entonces
    opción=$1
    col="-nazu"
  demás
    opción=$2
    col=$1
  fi
  for((i=0; i<=$opcion; i++)); rango[$i]="$i "; hecho
  mientras  ! $(echo ${rango[*]}|grep -w "$selección") ; hacer
    msg "$col" " ${a_selection_fun:-Seleccione una opción}: " >&2
    leer selección
    poner cuu1 >&2 && poner dl1 >&2
  hecho
  echo $selección
}

en_opcion(){
  desarmar opción
  si  -z $2 ; entonces
      mensaje -nazu " $1: " >&2
  demás
      mensaje $1 " $2: " >&2
  fi
  leer opción
  echo "$opción"
}

en_opcion_abajo(){
  dat=$1
  longitud=${#datos}
  cal=$(( 22 - $longitud / 2 ))
  linea=''
  for (( i = 0; i < $cal; i++ )); hacer
    línea+='╼'
  hecho
  echo -e " $(mensaje -verm3 "╭$línea╼[")$(mensaje -azu "$dat")$(mensaje -verm3 "]")"
  echo -ne " $(msg -verm3 "╰╼")\033[37;1m> " && opción de lectura
}

del(){
  para (( i = 0; i < $1; i++ )); hacer
    tput cuu1 && tput dl1
  hecho
}

exportar -f mensaje
exportar -f selección_diversión
exportar -f menu_func
exportar -f imprimir_centro
exportar -f título
exportar -f atrás
exportar -f entrar
exportar -f en_opcion
exportar -f en_opcion_abajo
exportar -f del