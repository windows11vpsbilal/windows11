wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing...
sudo apt update -y > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Downloading Windows Disk...
CURL -L -o windows.iso https://software.download.prss.microsoft.com/dbazure/Win11_Turkish_x64v1.iso?t=3db05016-a4ba-4d63-b4b8-912b414fa4f3&e=1658321352&h=fd235a460cece5b346b8d82b8b8c4744f1c7a7220dd816ef42ffe871f0c9e009
curl -L -o lite10.qcow2 https://app.vagrantup.com/thuonghai2711/boxes/WindowsQCOW2/versions/1.1.3/providers/qemu.box
echo "Windows 10 x64 Lite On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
echo Script by fb.com/thuong.hai.581
sudo qemu-system-x86_64 -vnc :0 -iso windows.iso -hda lite10.qcow2  -smp cores=8  -m 10000M -machine usb=on -device usb-tablet > /dev/null 2>&1

