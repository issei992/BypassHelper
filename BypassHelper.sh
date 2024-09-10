#!/bin/bash

menu() {
  clear
  echo "====================================="
  echo "Bypass Helper                        "
  echo "====================================="
  echo " Criado por: Yoshida"
  echo " Versão: 1.0"
  echo "====================================="
  echo " 1. Bypass Fluxus"
  echo " 2. Bypass Delta"
  echo " 3. Sair"
  echo "====================================="
  echo -n "Escolha uma opção: "
  read opcao
}

Fluxus() {

    # Função para validar e extrair o HWID usando regex
    validar_e_extrair_hwid() {
      local link="$1"
    
      # Expressão regular para verificar o formato do link
      local regex="https://flux\.li/android/external/start\.php\?HWID=([a-f0-9]{96})"
    
      if [[ $link =~ $regex ]]; then
        # Retorna a parte do HWID (que está no grupo de captura 1)
        echo "${BASH_REMATCH[1]}"
      else
        echo ""
      fi
    }

    # Função que recebe o HWID extraído e faz outra ação com ele
    BypassFluxus() {
      local HWID="$1"

      if [[ -n "$HWID" ]]; then
        echo "HWID recebido: $HWID"
        echo "Fazendo Bypass do Fluxus aguarde ..."
        Response=$(curl -s "https://stickx.top/api-fluxus/?hwid=$HWID&api_key=E99l9NOctud3vmu6bPne")
        echo "HWID: $HWID" 
        echo "Resposta: $Response"
        echo "Tarefa concluída."
      else
        echo "HWID não extraído ou inválido."
      fi
    }

    # Loop para processar múltiplos links
    read -p "Insira os links separados por espaço: " -a links

    for link in "${links[@]}"; do
       HWID=$(validar_e_extrair_hwid "$link")
       BypassFluxus "$HWID"
    done
}

Delta() {

    # Função para validar e extrair o HWID usando regex
    validar_e_extrair_hwid() {
      local link="$1"
    
      # Expressão regular para verificar o formato do link
      local regex="https://gateway\.platoboost\.com/a/8\?id=([a-f0-9]{64})"

    
      if [[ $link =~ $regex ]]; then
        # Retorna a parte do HWID (que está no grupo de captura 1)
        echo "${BASH_REMATCH[1]}"
      else
        echo ""
      fi
    }

    # Função que recebe o HWID extraído e faz outra ação com ele
    BypassDelta() {
      local HWID="$1"

      if [[ -n "$HWID" ]]; then
        echo "HWID recebido: $HWID"
        echo "Fazendo Bypass do Delta aguarde ..."
        Response=$(curl -s "https://stickx.top/api-delta/?hwid=$HWID&api_key=tUnAZj3sS74DJo9BUb8tshpVhpLJLA")
        echo "HWID: $HWID" 
        echo "Resposta: $Response"
        echo "Tarefa concluída."
      else
        echo "HWID não extraído ou inválido."
      fi
    }

    # Loop para processar múltiplos links
    read -p "Insira os links separados por espaço: " -a links

    for link in "${links[@]}"; do
       HWID=$(validar_e_extrair_hwid "$link")
       BypassFluxus "$HWID"
    done
}

# Loop do menu
while true; do
  menu
  case $opcao in
    1)
      echo "Bypass Fluxus: "
      Fluxus
      ;;
    2)
      echo "Bypass Delta: "
      Fluxus
      ;;
    3)
      echo "Saindo..."
      exit 0
      ;;
    *)
      echo "Opção inválida, tente novamente."
      ;;
  esac
  echo "Pressione enter para continuar..."
  read
done
