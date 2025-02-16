mkdir -p ./config/openttd/
mkdir -p ./local/share/openttd/
cp -r /home/${USER}/.config/openttd/ ./config/
cp -r /home/${USER}/.local/share/openttd/ ./local/share/
rm -rf ./local/share/openttd/content_download/baseset/*
rm -rf ./local/share/openttd/save/*
rm -rf ./local/share/openttd/screenshots/*
