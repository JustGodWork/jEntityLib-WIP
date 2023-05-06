--[[
----
----Created Date: 12:59 Sunday May 7th 2023
----Author: JustGod
----Made with ❤
----
----File: [example]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local function Listen()

    jCLib.Player:OnEnteringVehicle(function(vehicle, seat)
        console.log("Player has entered vehicle: " .. vehicle.handle .. " at seat: " .. seat);
    end);

    jCLib.Player:OnLeftVehicle(function(vehicle, seat)
        console.log("Player has left vehicle: " .. vehicle.handle .. " at seat: " .. seat);
    end);

    jCLib.Player:OnSwitchVehicleSeat(function(vehicle, seat, lastSeat)
        console.log("Player has switched vehicle seat: " .. vehicle.handle .. " at seat: " .. seat .. " from seat: " .. lastSeat);
    end);

end

if (Value.IsInstanceOf(jCLib.Player, GamePlayer)) then
    Listen();
end

---@param player GamePlayer
jCLib.events:Register("playerCreated", Listen);