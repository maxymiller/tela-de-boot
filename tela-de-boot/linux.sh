#!/bin/bash

start() {
    while true; do
        echo "gui (1)"
        echo "tty (2)"
        read -rp "==> " in

        case "$in" in
            1)
                sudo systemctl isolate graphical.target
                exit 0
                ;;
            2)
            	sudo systemctl start getty@tty1.service
                exit 0
                ;;
            *)
                echo "Opção inválida."
                ;;
        esac
    done
}

trap start SIGINT
start
