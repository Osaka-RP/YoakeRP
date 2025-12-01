--[[
BY RX Scripts © rxscripts.xyz
--]]

fx_version 'cerulean'
games { 'gta5' }

author 'Rejox | rxscripts.xyz'
description 'Billing'
version '1.1.0'

shared_script {
  'config.lua',
  'init.lua',
  'locales/*.lua',
}

client_scripts {
  'client/utils.lua',
  'client/functions.lua',
  'client/main.lua',
}
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/utils.lua',
  'server/functions.lua',
  'server/opensource.lua',
  'server/invoice.lua',
  'server/main.lua',
}

ui_page 'web/dist/index.html'

files {
  'web/dist/index.html',
  'web/dist/assets/*.*',
}

lua54 'yes'

escrow_ignore {
  'locales/*.lua',
  'server/opensource.lua',
  'config.lua',
  'fxmanifest.lua'
}
dependency '/assetpacks'