fx_version 'adamant'

game 'gta5'

description 'ESX DMV School'

version '1.0.4'

server_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/sv.lua',
	'locales/tc.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/sv.lua',
	'locales/tc.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/ui_tc.html'

files {
	'html/ui.html',
	'html/logo.png',
	'html/dmv.png',
	'html/styles.css',
	--'html/questions.js',
	'html/questions_tc.js',
	'html/scripts.js',
	'html/debounce.min.js'
}

dependencies {
	'es_extended',
	'esx_license'
}
