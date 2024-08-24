-- Variables

local plugin: Plugin = script:FindFirstAncestor("Plugin")
local Cache = {}

-- Functions

local function Get(key: string, useCache: boolean?): any
	if useCache == false then
		return plugin:GetSetting(key)
	end
	local Result = Cache[key]
	assert(Result, "No such key found in cache")
	return Result
end

local function Set(key: string, value: any, ignoreCacheIndex: boolean?)
	assert(ignoreCacheIndex == false and Cache[key], "No such key found in cache")
	Cache[key] = value
end

local function Save(key: string, value: any)
	plugin:SetSetting(key, value)
end

local function Remove(key: string, useCache: boolean?)
	if useCache == false then
		Save(key, nil)
		return
	end
	Set(key, nil)
end

local function Update(key: string, callback: (value: any) -> any, useCache: boolean?)
	local Result = callback(Get(key))
	assert(Result, "Must resolve a value in the update callback")
	if useCache == false then
		Save(key, Result)
		return
	end
	Set(key, Result)
end

-- Listeners

plugin.Unloading:Once(function()
	for key, value in Cache do
		Save(key, value)
	end
end)

-- Module

return {
	Get = Get,
	Set = Set,
	Save = Save,
	Remove = Remove,
	Update = Update,
	Cache = Cache,
}
