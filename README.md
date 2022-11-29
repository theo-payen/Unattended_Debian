# Unattended_Debian

for test 
docker run --name debian_bash --rm -i -t debian bash




docker build -t  imgiso .

docker run -v $PWD/isofile:/iso/ imgiso

https://www.librebyte.net/en/systems-deployment/unattended-debian-installation/


docker run arg:v2 --build-arg WELCOME_USER=Savio