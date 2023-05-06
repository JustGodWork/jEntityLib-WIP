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

local state = GetResourceState(lib);

if (state == "missing") then
    return error(('\n^1Error: %s is missing^0'):format(lib), 0);
end

if (state ~= "started") then
    return error(('\n^1Error: %s must be started before ^5%s^0'):format(lib, ENV.name), 0);
end

if (not ENV.IS_SERVER) then

    ENV.require('classes/GameEntity.lua', lib);
    ENV.require('classes/GamePed.lua', lib);
    ENV.require('classes/GamePlayer.lua', lib);
    ENV.require('lib/events/CEventNetworkPlayerEnteredVehicle.lua', lib);

end

if (ENV.ESX and not ENV.IS_SERVER) then

    local playerData = ESX.GetPlayerData();

    RegisterNetEvent("esx:playerLoaded", function(xPlayer)

        local resource = GetInvokingResource();
        if (resource ~= nil) then return; end; -- PREVENT CHEATER CALLING THIS EVENT

        jCLib.Player = GamePlayer(xPlayer);

        if (ENV.DEBUG) then
            console.debug("^7(^3" .. lib .. "^7) event ^7(^1esx:playerLoaded^7) triggered in resource ^0: ^1" .. ENV.name .. "^0");
        end

    end);
    
    AddEventHandler('esx:setPlayerData', function(key, val)
        if (GetInvokingResource() == 'es_extended') then

            jCLib.Player[key] = val;

            if (ENV.DEBUG) then
                console.debug("^7(^3" .. lib .. "^7) event ^7(^1esx:setPlayerData^7) triggered in resource ^0: ^1" .. ENV.name .. "^0, key changed ^7(^1" .. key .. "^7)^0");
            end

        end
    end);

    if (type(playerData) == "table") then
        jCLib.Player = GamePlayer(playerData);
    end

elseif (not ENV.IS_SERVER) then
    jCLib.Player = GamePlayer();
end