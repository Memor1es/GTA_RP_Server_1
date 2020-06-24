
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

-- UI
ui_page "ui/index.html"
files {
	"ui/index.html",
	"ui/script.js",
	"ui/style.css",
	"ui/debounce.min.js",
	"ui/bootstrap.min.css"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/server.lua"
}
client_scripts {
	"config.lua",
	"client/client.lua"
}
