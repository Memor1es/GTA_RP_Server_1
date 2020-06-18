description "ESX Gym"
version "0.0.1"

dependencies{"cron", "es_extended", "mysql-async"}

client_scripts{"config.lua", "client.lua"}
server_scripts{"@mysql-async/lib/MySQL.lua", "config.lua", "server.lua"}
