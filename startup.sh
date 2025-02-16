docker run -it -d -e loadgame=last-autosave \
  --mount type=bind,source=$(pwd)/runtime-volumes/config,target=/home/openttd/.config/openttd,uid=1000,gid=1000 \
  --mount type=bind,source=$(pwd)/runtime-volumes/local,target=/home/openttd/.local/share/openttd,uid=1000,gid=1000 \
  -p 3979:3979/tcp -p 3979:3979/udp \
  --entrypoint /openttd.sh openttd-custom-new:latest