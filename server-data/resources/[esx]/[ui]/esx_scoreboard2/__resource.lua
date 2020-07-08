description 'Scoreboard'

version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client.lua'
}

dependencies {
	'es_extended'
}

ui_page "ui.html"

files {
    "ui.html",
    "logo.png"
}