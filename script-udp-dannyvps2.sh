#!/bin/bash

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

  # Confirmar que se eliminó la contraseña correctamente
  if [ "$?" -eq 0 ]; then
    echo -e "\e[1m\e[32mContraseña eliminada correctamente.\e[0m"
  else
    echo -e "\e[1m\e[31mNo se pudo eliminar la contraseña.\e[0m"
  fi

  # Recargar el daemon de systemd y reiniciar el servicio
  sudo systemctl daemon-reload
  sudo systemctl restart udp-custom
}

# Recargar el daemon de systemd y reiniciar el servicio
sudo systemctl daemon-reload
sudo systemctl restart udp-custom

# Menu  principal
while true; do
echo -e "\e[1m\e[36m  \e[0m"
echo "𝘿𝘼𝙉𝙉𝙔𝙑𝙋𝙎-3219119613"
echo "🇲 🇪 🇳 🇺 "
echo " "
echo "1️⃣👉.𝙈𝙤𝙨𝙩𝙧𝙖𝙧 𝙘𝙤𝙣𝙩𝙧𝙖𝙨𝙚𝙣̃𝙖𝙨 𝙀𝙭𝙞𝙨𝙩𝙚𝗻𝘁𝗲𝘀"

echo "2️⃣👉.𝘼𝙜𝙧𝙚𝙜𝙖𝙧 𝙘𝙤𝙣𝙩𝙧𝙖𝙨𝙚𝙣̃𝙖"

echo "3️⃣👉.𝙀𝙡𝙞𝙢𝙞𝙣𝙖𝙧 𝙘𝙤𝙣𝙩𝙧𝙖𝙨𝙚𝙣̃𝙖"

echo "4️⃣👉.𝙎𝙖𝙡𝙞𝙧"
read option

case $option in
1) show_passwords;;
2) add_password;;
3) delete_password;;
4) break;;
*) echo -e "\e[1m\e[31mOpción inválida.\e[0m";;
esac

echo ""
done