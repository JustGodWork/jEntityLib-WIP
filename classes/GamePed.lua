--[[
----
----Created Date: 11:55 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [GamePed]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class GamePed: GameEntity
GamePed = Class.extends('GamePed', 'GameEntity');

---@param handle number
function GamePed:Constructor(handle)
    self:super('GameEntity', handle);
end

---@return number | nil
function GamePed:GetVehicle()
    local vehicle = GetVehiclePedIsIn(self:GetHandle(), false);
    return vehicle ~= 0 and vehicle or nil;
end

---@return number | nil
function GamePed:GetSeat()
    local vehicle = self:GetVehicle();
    if (not vehicle) then return nil; end

    local seats = GetVehicleModelNumberOfSeats(GetEntityModel(vehicle));

    for i = -1, seats -2 do
        if (GetPedInVehicleSeat(vehicle, i) == self:GetHandle()) then
            return i;
        end
    end

    return nil;

end

---@return number
function GamePed:GetArmor()
    return GetPedArmour(self:GetHandle());
end

---@return number
function GamePed:GetMaxArmor()
    return GetPedArmour(self:GetHandle());
end