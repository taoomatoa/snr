# Required
- DOMAIN (Wajib)
- DEBIAN 9/10
- Ubuntu 18/20 LTS
- CPU MIN 1 CORE
- RAM 1GB

</p> 
<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">  <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=Lts&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=Lts&color=red">
</p>
</div>


# UPDATE Debian
apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
# UPDATE Ubuntu
apt update && apt upgrade -y && update-grub && sleep 2 && reboot
# Installation
<pre><code>apt update && apt upgrade -y && update-grub && sleep 2 && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt upgrade && apt install -y bzip2 gzip coreutils screen curl unzip && wget -q https://raw.githubusercontent.com/taoomatoa/taoomatoa.github.io/main/setup.sh && chmod +x setup.sh && ./setup.sh</code></pre>

