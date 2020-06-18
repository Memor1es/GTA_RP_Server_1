@echo off
taskkill /IM node.exe /F
start /MIN node "C:\GTA_RP_Server_1\server-data\resources\[phone]\image-server\app.js"

                C:/GTA_RP_Server_1/server/FXServer.exe +set serverProfile "default"

                pause