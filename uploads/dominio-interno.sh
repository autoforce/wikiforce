#!/bin/bash
seek_and_destroy() {
  echo -e "Alvo localizado, lançando torpedos"
  echo -e ".\c"
  sleep 1s
  echo -e ".\c"
  sleep 1s
  echo -e ". \c"
  if grep -q "#CUSTOM DOMAIN STARTS" $file
  then
    sudo sed '/#CUSTOM DOMAIN STARTS/,/#CUSTOM DOMAIN ENDS/d' $file -i'.bak'
  fi
  sudo printf "$BREAK_LINE#CUSTOM DOMAIN STARTS$BREAK_LINE"  >> $file
  sudo printf "$BREAK_LINE$TARGET_IP $selected_domain$BREAK_LINE" >> $file
  sudo printf "#CUSTOM DOMAIN ENDS$BREAK_LINE" >> $file
  echo "                                 ________________"
  echo "                          ____/ (  (    )   )  \\___"
  echo "                         /( (  (  )   _    ))  )   )\\ "
  echo "                       ((     (   )(    )  )   (   )  )"
  echo "                     ((/  ( _(   )   (   _) ) (  () )  )"
  echo "                    ( (  ( (_)   ((    (   )  .((_ ) .  )_"
  echo "                   ( (  )    (      (  )    )   ) . ) (   )"
  echo "                  (  (   (  (   ) (  _  ( _) )  .  ) . ) ) ( )"
  echo "                  ( (  (   ) (  )   (  ))     ) _)(   )  )  )"
  echo "                 ( (  ( \ ) (    (_  ( ) ( )  )   ) )  )) ( )"
  echo "                  (  (   (  (   (_ ( ) ( _    )  ) (  )  )   )"
  echo "                 ( (  ( (  (  )     (_  )  ) )  _)   ) _( ( )"
  echo "                  ((  (   )(    (     _    )   _) _(_ (  (_ )"
  echo "                   (_((__(_(__(( ( ( |  ) ) ) )_))__))_)___)"
  echo "                   ((__)        \\||lll|l||///          \_))"
  echo "                            (   /(/ (  )  ) )\   )"
  echo "                          (    ( ( ( | | ) ) )\   )"
  echo "                           (   /(| / ( )) ) ) )) )"
  echo "                         (     ( ((((_(|)_)))))     )"
  echo "                          (      ||\(|(|)|/||     )"
  echo "                        (        |(||(||)||||        )"
  echo "                          (     //|/l|||)|\\ \     )"
  echo "                        (/ / //  /|//||||\\  \ \  \ _)"
  echo "-------------------------------------------------- $selected_domain agora está disponível"
}

echo "--------------------------------------- AUTOFORCE ©2018 -------------------------------------------"
echo "------------------------------------ PERFORMANCE E RESULTADOS  ------------------------------------"
echo "--------------------------------------- Seja bem vindx --------------------------------------------"
echo
echo "Esse script foi feito para facilitar o uso de domínios customizados em desenvolvimento"
echo
echo -e "\aALERTA: Esse script alterar o comportamento de acesso à internet da sua máquina, escolha bem o domínio que ira usar para testes."
echo
echo "Esse domínio ficará estacionado no seu localhost, o que o deixará inacessível se utilizado de maneira leviana."
echo
echo ""
echo
sleep 1s
echo -e "------------------------------------------- UMA PERGUNTA\c"
echo -e ".\c"
sleep 1s
echo -e ".\c"
sleep 1s
echo -e ". \c"
sleep 1s
echo "-----------------------------------------"
echo "--------------------------- VOCÊ QUER APONTAR O DOMÍNIO PARA UM ENDEREÇO OU PARA SUA MÁQUINA? --------------------------"
echo
echo "[1] Um endereço externo. Ex.: aplicacaoteste.herokuapp.com"
echo "[2] Sua própria máquina. Ex.: localhost"
while true; do
  read -p "> " redirect_option
  if [ $redirect_option -eq "1" ] || [ $redirect_option -eq "2" ]; then
    break
  fi
done
if [ $redirect_option -eq "1" ]; then
  echo
  echo "Para onde o tráfego deve ser direcionado?"
  read -p "> " target
  TARGET_IP="$(dig +short $target | sed q)"
else
  target="LOCALHOST"
  TARGET_IP="127.0.0.1"
fi
echo
echo "--------------------------- QUAL DOMÍNIO VOCÊ GOSTARIA DE UTILIZAR PARA $target? --------------------------"
echo
read -p "Digite o nome de domínio: " selected_domain
if [ -e /mnt/c/Windows/System32/drivers/etc/hosts ]; then
  file='/mnt/c/Windows/System32/drivers/etc/hosts'
  BREAK_LINE="\n\r"
  seek_and_destroy
  ipconfig.exe -flushdns
else
  file='/etc/hosts'
  BREAK_LINE="\n"
  seek_and_destroy
  sudo killall -HUP mDNSResponder
fi
