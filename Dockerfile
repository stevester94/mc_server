FROM ubuntu:24.04
ENV server_path /server

# Direwolf20
ENV mod_id 119

env mod_version 12135

workdir /app
RUN apt update && apt install -y openjdk-8-jre-headless
RUN apt install -y  curl
RUN curl -JLO "https://api.modpacks.ch/public/modpack/119/12135/server/linux" && chmod +x serverinstall_119_12135
RUN ./serverinstall_119_12135 $mod_id $mod_version --path $server_path --auto
RUN echo eula=true > $server_path/eula.txt
cmd cd $server_path && ./start.sh
