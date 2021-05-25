-----------------------------------------------------------------------------
-- Better-ID- A Simple FiveM Script, Made By Rocket Development w/ NAT2K15 --
-----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! THERE IS NOTHING TO EDIT --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------


fx_version "bodacious"
game "gta5"

-- Define the resource metadata
name "Better-ID"
description "This is the exact same thing as RedRums except you can actually show it to people and it's free. Made w/ @NAT2K15"
author "Rocket Development & NAT2K15"
version "v1.0.0"



ui_page 'ui/index.html'
files {
  'ui/index.html',
  'ui/img/bg-img.png',
  'ui/img/bg-img2.png',
  'ui/style.css',
  'ui/script.js'
}

client_scripts {
    "client.lua"
} 

server_script {
    "server.lua",
    "version_check.lua"
}

