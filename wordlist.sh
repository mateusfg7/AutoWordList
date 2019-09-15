#!/bin/bash



#cores
azul='\033[00;34m'
vermelho='\033[00;31m'
amarelo='\033[00;33m'
branco='\033[00;37m'
zero='\033[00;00;00m'





dir='/usr/share/crunch'
ROT=$(id -u)
WHO=$(whoami)



progama(){
    echo "################################################################################"
    echo -e "$branco"
    figlet " WordListCrunch   "
    echo -e "$zero"
    echo -e "\033[00m################################################################################"
    echo
    sleep 0.5
    echo -e "$zero"
    echo
    sleep 0.2
    echo -e "$vermelho"


    wuser(){
            
        echo
        read -p  "Digite o minimo de caracteres: " min
        read -p  "Digite o máximo de caracteres: " max
        read -p  "Digite quais serão os caracteres: " car
        read -p  "Digite o nome de sua wordlist e sua extesão: " name
        echo
        echo -e "\033[00;35;47mCriando WordList..."
        sleep 1
        echo -e "\033[00m"
        crunch $min $max $car >> /home/$WHO/$name
        echo
        echo
        echo -e "\033[00mSua wordlist foi salva em /home/$WHO"
        sleep 0.5
        echo
        echo
        saves(){
        echo -e "\033[00;33m"
        read -p "Deseja ver quais senhas foram salvas?[s/n] " save
        echo
        sleep 0.2
        echo
        }
        saves
        case $save in
        "s")
            echo -e "\033[00;34;47m"
            cat /home/$WHO/$name
            echo -e "\033[00m"
            echo
            read -p "Precione enter para sair..."
            clear;;

        "n")
            sleep 0.1
            clear;;

        *)
        echo "Escolha s (Sim) OU n (Não)"
        saves;;
        esac
    }

    wroot(){
        read -p  "Digite o minimo de caracteres: " min
        read -p  "Digite o máximo de caracteres: " max
        read -p  "Digite quais serão os caracteres: " car
        read -p  "Digite o nome de sua wordlist e sua extesão: " name
        echo
        echo -e "\033[00;35;47mCriando WordList..."
        sleep 1
        echo -e "\033[00m"
        crunch $min $max $car >> /root/$name
        echo
        echo 
        echo -e "\033[00mSua wordlist foi salva em /root"
        sleep 0.5
        echo
        echo
        
        saves(){
        echo -e "\033[00;33m"
        read -p "Deseja ver quais senhas foram salvas?[s/n] " save
        echo
        sleep 0.2
        echo
        }
        saves
        case $save in
    
        "s")
            echo -e "\033[00;34;47m"
            cat /root/$name
            echo -e "\033[00m"
            echo
            read -p "Precione enter para sair..."
            clear;;

        "n")
            sleep 0.1
            clear;;

        *)
            echo "Escolha s (Sim) OU n (Não)"
            saves;;

        esac
    }


    wescolha(){
        if [ $ROT = 0 ];then
            wroot
        else
            wuser
        fi
    }

    wescolha
}



clear
if [ -e $dir ];then
    echo -e "[$amarelo+$zero] Crunch instalado."
    echo
    sleep 0.5
    progama
else
    clear
    echo -e " $zero[$amarelo+$zero]$amarelo Crunch não esta instalado."
    echo -e "$azul"
    read -p " Deseja instalar? (s/n)=> " esc

    if [ $esc = "s" ];then
        clear
        echo -e "$vermelho AVISO!"
        echo -e "$vermelho se a instalação automática falhar tente instalar manualmente o progama Crunch para a correta execução deste script."
        sleep 1
        echo
        read -p " Precione enter para continuar com a instalação..."
        echo
        echo -e "$zero"
        sudo apt install crunch
        echo
        
        if [ -e $dir ];then
            clear
            echo -e " $zero[$amarelo+$zero] Crunch instalado com sucesso!."
            echo
            sleep 0.5
            progama
        else
            echo
            echo -e "$vermelho A instalação falhou, tente outra maneira de instalar o crunch e depois exsecute esse script novamente."
            sleep 5
            exit
        fi
    else
        echo
        echo -e "$vermelho O script so funciona se o Crunch estiver instalado em sua maquina."
        echo
        echo
        sleep 1
        exit
    fi
fi
