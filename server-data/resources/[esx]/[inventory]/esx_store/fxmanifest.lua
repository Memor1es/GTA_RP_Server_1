fx_version 'adamant'

game 'gta5'

description 'esx_store'

version '1.0.0'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'locales/tc.lua',
  --'translation/en.lua',
  --'translation/pl.lua',
  'config.lua',
  'server/server.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/tc.lua',
  --'translation/sv.lua',
  --'translation/en.lua',
  --'translation/pl.lua',
  'config.lua',
  'client/client.lua'
}

