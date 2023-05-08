--[[
----
----Created Date: 5:08 Sunday May 7th 2023
----Author: JustGod
----Made with ❤
----
----File: [ESX]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local lib = "jEntityLib";

if (ENV.ESX and not ENV.IS_SERVER) then

    local playerData = ESX.GetPlayerData();

    if ( table.sizeOf(playerData) > 0 ) then
        jCLib.Player = GamePlayer(playerData);
    end

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

            if (Value.IsInstanceOf(jCLib.Player, 'GamePlayer')) then
                jCLib.Player[key] = val;
            end

            if (ENV.DEBUG) then
                console.debug("^7(^3" .. lib .. "^7) event ^7(^1esx:setPlayerData^7) triggered in resource ^0: ^1" .. ENV.name .. "^0, key changed ^7(^1" .. key .. "^7)^0");
            end

        end

    end);

elseif (not ENV.IS_SERVER) then
    jCLib.Player = GamePlayer();
end