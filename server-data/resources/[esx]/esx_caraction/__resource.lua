resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'esx_caraction'

version '1.0.0'

server_scripts {
  '@es_extended/locale.lua',
  --'translation/sv.lua',
  --'translation/en.lua',
  --'translation/pl.lua',
  'locales/tc.lua',
  'config.lua',
  'server/server.lua',
}

client_scripts {
  '@es_extended/locale.lua',
  --'translation/sv.lua',
  --'translation/en.lua',
  --'translation/pl.lua',
  'locales/tc.lua',
  'config.lua',
  'client/client.lua',
}

