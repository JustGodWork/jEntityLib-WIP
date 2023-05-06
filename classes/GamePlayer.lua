--[[
----
----Created Date: 10:12 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [GamePlayer]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class GamePlayer: GamePed
---@field public accounts table
---@field public coords Vector3
---@field public identifier string
---@field public inventory table
---@field public job string
---@field public job2 string
---@field public loadout table
---@field public maxWeight number
---@field public money number
---@field public sex string
---@field public firstName string
---@field public lastName string
---@field public dateofbirth string
---@field public height number
---@field public dead boolean
---@field public metadata table
---@field public events EventEmitter
---@field public vehicle GameEntity
---@overload fun(data?: table): GamePlayer
GamePlayer = Class.extends('GamePlayer', 'GamePed');

function GamePlayer:Constructor(data)
    
    if (type(data) == "table") then

        self.accounts = data.accounts;
        self.coords = Vector3(data.coords.x, data.coords.y, data.coords.z);
        self.identifier = data.identifier;
        self.inventory = data.inventory;
        self.job = data.job;
        self.job2 = data.job2;
        self.loadout = data.loadout;
        self.maxWeight = data.maxWeight;
        self.money = data.money;
        self.sex = data.sex;
        self.firstName = data.firstName;
        self.lastName = data.lastName;
        self.dateofbirth = data.dateofbirth;
        self.height = data.height;
        self.dead = data.dead;
        self.metadata = data.metadata;

    end

    self.events = EventEmitter();
    self.vehicle = nil;
    jCLib.events:Trigger('playerCreated', self);
    console.debug("^7(^3jEntityLib^7) ^0=> Created ^7(^6GamePlayer^7)^0 instance");

end

function GamePlayer:GetHandle()
    return PlayerPedId();
end

---@return number
function GamePlayer:GetPed()
    return self:GetHandle();
end

---@return number
function GamePlayer:GetLocalId()
    return PlayerId();
end

---@return number
function GamePlayer:GetServerId()
    return GetPlayerServerId(PlayerId());
end

---@return GameEntity
function GamePlayer:GetVehicleObject()
    
    local vehicle = self:GetVehicle();
    return vehicle and self.vehicle or nil;

end

---@param callback fun(vehicle: GameEntity, seat: number)
function GamePlayer:OnEnteringVehicle(callback)
    self.events:Register('enteringVehicle', callback);
end

---@param callback fun(vehicle: GameEntity, lastSeat: number)
function GamePlayer:OnLeftVehicle(callback)
    self.events:Register('leftVehicle', callback);
end

---@param callback fun(vehicle: GameEntity, seat: number, lastSeat: number)
function GamePlayer:OnSwitchVehicleSeat(callback)
    self.events:Register('switchVehicleSeat', callback);
end

return GamePlayer;
