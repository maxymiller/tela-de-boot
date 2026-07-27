# tela-de-boot
tela de boot win 2000

```
sudo tar -xvf tela-de-boot.tar -C /root
```
```
sudo cp /root/tela-de-boot/maxymiller_chatgpt-boot-menu.service /etc/systemd/system
```
```
sudo systemctl enable maxymiller_chatgpt-boot-menu.service
```
# 2
boot --> tty
```
sudo systemctl set-default multi-user.target
```
# mais
info
```
systemctl get-default
```
boot --> gui
```
sudo systemctl set-default graphical.target
```
boot --> tty
```
sudo systemctl set-default multi-user.target
```
tty --> gui
```
sudo systemctl isolate graphical.target
```
