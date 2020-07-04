#!/bin/bash
java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx6124M -Xms4096M -jar  minecraft_server.1.7.10.jar
