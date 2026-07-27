# tela-de-boot

Tela de boot inspirada no Windows 2000 para Linux (TTY).

![Demonstração](img/demo.gif)

## Instalação

Extraia os arquivos:

```bash
sudo tar -xvf tela-de-boot.tar -C /root
```

Copie o serviço do systemd:

```bash
sudo cp /root/tela-de-boot/maxymiller_chatgpt-boot-menu.service /etc/systemd/system/
```

Recarregue o systemd:

```bash
sudo systemctl daemon-reload
```

Habilite o serviço:

```bash
sudo systemctl enable maxymiller_chatgpt-boot-menu.service
```

## Inicializar em modo texto (TTY)

```bash
sudo systemctl set-default multi-user.target
```

## Inicializar em modo gráfico (GUI)

```bash
sudo systemctl set-default graphical.target
```

## Iniciar a interface gráfica sem reiniciar

```bash
sudo systemctl isolate graphical.target
```

## Verificar o modo de inicialização

```bash
systemctl get-default
```

Resultado esperado:

- `graphical.target` → inicia a interface gráfica.
- `multi-user.target` → inicia no modo texto (TTY).

## Estrutura

```text
boot.sh
 ├── start.sh      # Animação de boot
 └── linux.sh      # Menu (GUI ou TTY)
```

## Requisitos

- Linux com systemd
- Permissões de administrador (`sudo`)
- TTY1 disponível
- Disco rígido (HDD) recomendado
