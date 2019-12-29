FROM hackinglab/alpine-base:latest
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

ENV SIAB_USERCSS="Normal:+/etc/shellinabox/options-enabled/00_White-On-Black.css,Reverse:-/etc/shellinabox/options-enabled/00+Black-on-White.css;Colors:+/etc/shellinabox/options-enabled/01+Color-Terminal.css,Monochrome:-/etc/shellinabox/options-enabled/01_Monochrome.css" \
  SIAB_PORT=4200 \
  SIAB_ADDUSER=true \
  SIAB_USER=hacker \
  SIAB_USERID=1337 \
  SIAB_GROUP=hacker \
  SIAB_GROUPID=1337 \
  SIAB_PASSWORD=compass \
  SIAB_SHELL=/bin/bash \
  SIAB_HOME=/home/hacker \
  SIAB_SUDO=false \
  SIAB_SSL=true \
  SIAB_SERVICE=/:LOGIN \
  SIAB_PKGS=none \
  SIAB_SCRIPT=none

# ENV SIAB_USERCSS="Normal:+/etc/shellinabox/options-enabled/00+Black-on-White.css,Reverse:-/etc/shellinabox/options-enabled/00_White-On-Black.css;Colors:+/etc/shellinabox/options-enabled/01+Color-Terminal.css,Monochrome:-/etc/shellinabox/options-enabled/01_Monochrome.css"

# Add the files
ADD root /

RUN apk add --update bash openssl curl sudo && \
	rm -rf /var/cache/apk/* && \
	adduser -D -H -h /home/shellinabox shellinabox && \
	mkdir /var/lib/shellinabox && \
	chmod +s /bin/su

# Expose the ports for nginx
EXPOSE 80
