FROM debian
WORKDIR /xorriso/
#RUN curl -LO# https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.8.0-amd64-netinst.iso
#RUN apt -y install xorriso
#RUN xorriso -osirrox on -indev debian-10.1.0-amd64-netinst.iso  -extract / isofiles/




COPY . .
RUN pip install paramiko


CMD [echo "mypassword" | mkpasswd -s -H MD5]

