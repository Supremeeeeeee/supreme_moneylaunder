  fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'DuncanEll - (SUPREME)'
description 'supreme_moneylaunder'
version '1.0.0'

dependencies {
    "mythic_progbar"
}

game 'gta5'

server_scripts {
	'server/server.lua',
}

client_scripts {
	'client/client.lua',
}