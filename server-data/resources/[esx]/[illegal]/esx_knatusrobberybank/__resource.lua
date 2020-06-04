--dependency 'essentialmode'
dependency 'es_extended'
dependency 'esx_doorlock_mhacking'
dependency 'esx_knatusblowtorch'
dependency 'mhacking'
client_scripts {

	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'locales/tr.lua',
	'locales/fr.lua',
	'locales/tc.lua',
	'config.lua',
	'client/client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'locales/tr.lua',
	'locales/fr.lua',
	'locales/tc.lua',
	'config.lua',
	'server/server.lua'
}
