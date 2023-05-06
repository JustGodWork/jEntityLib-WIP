--[[
----
----Created Date: 12:15 Sunday May 7th 2023
----Author: JustGod
----Made with ❤
----
----File: [CEventNetworkPlayerEnteredVehicle]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local currentVehicle;
local lastSeat;

local function HandleVehicleExit()
    CreateThread(function()
        while (true) do

            if (Value.IsInstanceOf(currentVehicle, 'GameEntity')) then

                if (not jCLib.Player:GetVehicle()) then

                    jCLib.Player.events:Trigger("leftVehicle", currentVehicle, lastSeat);
                    jCLib.Player.vehicle = nil;
                    currentVehicle = nil;
                    lastSeat = nil;
                    break;

                end

            end

            Wait(500);

        end
    end);
end

AddEventHandler("gameEventTriggered", function(event, data)

    if (event == "CEventNetworkPlayerEnteredVehicle") then

        if (not jCLib.Player) then return; end
        if (data[1] ~= jCLib.Player:GetLocalId()) then return; end

        if (Value.IsInstanceOf(currentVehicle, 'GameEntity')) then

            local seat = jCLib.Player:GetSeat();

            if (seat ~= lastSeat) then
                jCLib.Player.events:Trigger("switchVehicleSeat", currentVehicle, seat, lastSeat);
                lastSeat = seat;
            end

        else

            jCLib.Player.vehicle = GameEntity(data[2]);
            currentVehicle = jCLib.Player.vehicle;
            lastSeat = jCLib.Player:GetSeat();
            jCLib.Player.events:Trigger("enteringVehicle", currentVehicle, lastSeat);
            HandleVehicleExit();
            
        end

    end

end);