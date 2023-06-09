--[[
----
----Created Date: 10:45 Thursday May 4th 2023
----Author: JustGod
----Made with ❤
----
----File: [fxmanifest]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

fx_version 'cerulean';
game 'gta5';

author 'JustGod';
description 'jEntityLib - A simple library for FiveM to manage entities.';
version '1.0.0';

shared_script '@jClassLib/init.lua';

files {

    'classes/**/*.lua',
    'imports/**/*.lua',
    'init.lua'
    
};

dependency 'jClassLib';