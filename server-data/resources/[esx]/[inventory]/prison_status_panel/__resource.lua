resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	'client.lua',
	'config.lua'
}

ui_page 'ui.html'

files {
	'ui.html',
	'img/*.png',
	'img/dead.gif',
	'img/live.gif',
	'app.js',
	'all.css'
}

dependencies {
	'es_extended',
	'esx_status'
}
