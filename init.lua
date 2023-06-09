--[[
----
----Created Date: 10:50 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [imports]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

ENV.name = GetCurrentResourceName();
local lib = "jEntityLib";
local link = "https://github.com/JustGodWork/jEntityLib-WIP";

local state = GetResourceState(lib);

local Errors = {

    resource_missing = "^1Error: %s is missing !^0 Download it at : ^7(^3%s^7)^0",
    resource_not_started = "^1Error: %s must be started before ^5%s^0"

};

if (state == "missing") then
    return error((Errors.resource_missing):format(lib, link), 3);
end

if (state ~= "started") then
    return error((Errors.resource_not_started):format(lib, ENV.name), 3);
end

if (not ENV.IS_SERVER) then

    ENV.require('classes/GameEntity.lua', lib);
    ENV.require('classes/GamePed.lua', lib);
    ENV.require('classes/GamePlayer.lua', lib);
    ENV.require('imports/ESX.lua', lib);
    ENV.require('imports/events/CEventNetworkPlayerEnteredVehicle.lua', lib);

end