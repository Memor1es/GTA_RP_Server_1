fx_version 'adamant'

game 'gta5'

description 'ability'

version '1.0.0'

server_scripts {
  '@es_extended/locale.lua',
  --'translation/sv.lua',
  --'translation/en.lua',
  --'translation/pl.lua',
  'config.lua',
  'server/server.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  --'translation/sv.lua',
  --'translation/en.lua',
  --'translation/pl.lua',
  'config.lua',
  'client/client.lua'
}

exports {
  'GetAbility',
  'GetAbilityLevel',
  'parseability'
}