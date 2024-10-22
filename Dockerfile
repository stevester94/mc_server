# The URL for getting the server files can be found by clicking on 'versions' for your client in FTB (in the direwolf modpack)
FROM ubuntu:24.04
ENV server_path /server

# Direwolf20
ENV mod_id 119

# This is just from the URL seen below
env mod_version 12172 

workdir /app
RUN apt update && apt install -y openjdk-8-jre-headless
RUN apt install -y  curl vim
RUN curl -JLO "https://api.modpacks.ch/public/modpack/119/12172/server/linux" && chmod +x serverinstall_119_12172
RUN ./serverinstall_119_12172 $mod_id $mod_version --path $server_path --auto
RUN echo eula=true > $server_path/eula.txt
cmd cd $server_path && ./start.sh

ADD ops.json /server/ops.json
