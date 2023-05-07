#!/bin/bash

# Pedir una contraseña para instalar el script
echo -n "Ingrese la contraseña para abrir el scrip: "
read password

# Verificar si la contraseña es correcta
if [ "$password" != "DANNY" ]; then
  echo -e "\e[1m\e[31mLa contraseña es incorrecta. La instalación se cancelará.\e[0m"
  exit 1
fi

# Definir la ruta del archivo JSON
config_file="/root/udp/config.json"

# Función para mostrar las contraseñas existentes
function show_passwords() {
  # Leer las contraseñas desde el archivo JSON
  passwords=$(jq -r '.auth.pass | join(", ")' "$config_file")

  # Mostrar las contraseñas al usuario
  echo -e "\e[1m\e[32mContraseñas existentes:\e[0m"
  echo "$passwords"
}

# Función para agregar una contraseña
function add_password() {
  # Leer las nuevas contraseñas desde el usuario
  echo -e "\e[1m\e[32mIngrese las nuevas contraseñas separadas por comas: \e[0m"
  read new_passwords

  # Convertir las contraseñas a un array
  IFS=',' read -ra passwords_arr <<< "$new_passwords"

  # Leer las contraseñas existentes desde el archivo JSON
  existing_passwords=$(jq -r '.auth.pass | join(",")' "$config_file")

  # Concatenar las contraseñas existentes con las nuevas
  updated_passwords="$existing_passwords,${passwords_arr[@]}"

  # Actualizar el archivo JSON con las nuevas contraseñas
  jq ".auth.pass = [\"$(echo $updated_passwords | sed 's/,/", "/g')\"]" "$config_file" > tmp.json && mv tmp.json "$config_file"

  # Confirmar que se actualizaron las contraseñas correctamente
  if [ "$?" -eq 0 ]; then
    echo -e "\e[1m\e[32mContraseñas actualizadas correctamente.\e[0m"
  else
    echo -e "\e[1m\e[31mNo se pudo actualizar las contraseñas.\e[0m"
  fi

  # Recargar el daemon de systemd y reiniciar el servicio
  sudo systemctl daemon-reload
  sudo systemctl restart udp-custom
}

# Función para eliminar una contraseña
function delete_password() {
  # Leer las contraseñas existentes desde el archivo JSON
  existing_passwords=$(jq -r '.auth.pass | join(",")' "$config_file")

  # Leer la contraseña que se quiere eliminar desde el usuario
  echo -e "\e[1m\e[32mIngrese la contraseña que desea eliminar: \e[0m"
  read password_to_delete

  # Eliminar la contraseña del array de contraseñas
  updated_passwords=$(echo "$existing_passwords" | sed "s/$password_to_delete//g;s/,,/,/g;s/^,//;s/,$//")

  # Actualizar el archivo JSON con las nuevas contraseñas
  jq ".auth.pass = [\"$(echo $updated_passwords | sed 's/,/", "/g')\"]" "$config_file" > tmp.json && mv tmp.json "$config_file"
}

# Función para agregar un nuevo usuario
function add_user() {
  # Leer el nuevo usuario desde el usuario
  echo -e "\e[1m\e[32mIngrese el nombre del nuevo usuario: \e[0m"
  read new_user

  # Leer los usuarios existentes desde el archivo JSON
  existing_users=$(jq -r '.users | join(",")' "$config_file")

  # Verificar si el usuario ya existe
  if echo "$existing_users" | grep -q "\<$new_user\>"; then
    echo -e "\e[1m\e[31mEl usuario ya existe. No se puede agregar.\e[0m"
    return
  fi

  # Agregar el nuevo usuario al array de usuarios
  updated_users="$existing_users,$new_user"

  # Actualizar el archivo JSON con los nuevos usuarios
  jq ".users = [\"$(echo $updated_users | sed 's/,/", "/g')\"]" "$config_file" > tmp.json && mv tmp.json "$config_file"

  # Confirmar que se agregó el usuario correctamente
  if [ "$?" -eq 0 ]; then
    echo -e "\e[1m\e[32mUsuario agregado correctamente.\e[0m"
  else
    echo -e "\e[1m\e[31mNo se pudo agregar el usuario.\e[0m"
  fi
}
  # Recargar el daemon de systemd y reiniciar el servicio
  sudo systemctl daemon-reload
  sudo systemctl restart udp-custom

  # Mostrar el menú de opciones al usuario
  while true; do
    echo -e "\n\e[1m\e[31mMenú de opciones:\e[0m"
    echo -e "\e[1m\e[31m1. Mostrar contraseñas existentes\e[0m"
    echo -e "\e[1m\e[31m2. Agregar una contraseña\e[0m"
    echo -e "\e[1m\e[31m3. Eliminar una contraseña\e[0m"
    echo -e "\e[1m\e[31m4. Agregar un nuevo usuario\e[0m"
    echo -e "\e[1m\e[31m5. Salir\e[0m"

    # Leer la opción del usuario
    read -p "Ingrese una opción: " option

    case $option in
      1) show_passwords;;
      2) add_password;;
      3) delete_password;;
      4) add_user;;
      5) exit;;
      *) echo -e "\e[1m\e[31mOpción inválida.\e[0m";;
    esac
  done