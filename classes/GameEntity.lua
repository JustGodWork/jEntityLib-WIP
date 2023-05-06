--[[
----
----Created Date: 10:25 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [GameEntity]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class GameEntity: BaseObject
---@field public handle number
---@overload fun(handle: number): GameEntity
GameEntity = Class.new 'GameEntity';

---@param handle number
function GameEntity:Constructor(handle)
    self.handle = handle;
end

function GameEntity:GetHandle()
    return self.handle;
end

---@return boolean
function GameEntity:IsValid()
    return DoesEntityExist(self:GetHandle());
end

---@return Vector3
function GameEntity:GetPosition()
    return Vector3(table.unpack(GetEntityCoords(self:GetHandle())));
end

---@return number
function GameEntity:GetHeading()
    return GetEntityHeading(self:GetHandle());
end

---@return number
function GameEntity:GetHealth()
    return GetEntityHealth(self:GetHandle());
end

---@return number
function GameEntity:GetMaxHealth()
    return GetEntityMaxHealth(self:GetHandle());
end

---@return number
function GameEntity:GetSpeed()
    return GetEntitySpeed(self:GetHandle());
end

---@return number
function GameEntity:GetMaxSpeed()
    return GetEntityMaxSpeed(self:GetHandle());
end

---@return Vector3
function GameEntity:GetSpeedVector()
    return Vector3(table.unpack(GetEntitySpeedVector(self:GetHandle(), true)));
end

---@return Vector3
function GameEntity:GetVelocity()
    return Vector3(table.unpack(GetEntityVelocity(self:GetHandle())));
end

---@return number
function GameEntity:GetLodDistance()
    return GetEntityLodDist(self:GetHandle());
end

---@return number
function GameEntity:GetAlpha()
    return GetEntityAlpha(self:GetHandle());
end

---@return number
function GameEntity:GetModel()
    return GetEntityModel(self:GetHandle());
end

---@return number
function GameEntity:GetBoneIndexByName(boneName)
    return GetEntityBoneIndexByName(self:GetHandle(), boneName);
end

---@return Vector3
function GameEntity:GetBonePosition(boneIndex)
    return Vector3(table.unpack(GetWorldPositionOfEntityBone(self:GetHandle(), boneIndex)));
end

---@return Vector3
function GameEntity:GetBoneRotation(boneIndex)
    return Vector3(table.unpack(GetEntityBoneRotation(self:GetHandle(), boneIndex)));
end

---@return number
function GameEntity:GetBoneCount()
    return GetEntityBoneCount(self:GetHandle());
end

return GameEntity;