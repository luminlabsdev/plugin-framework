-- Variables

local plugin: Plugin = script:FindFirstAncestorWhichIsA("Plugin")
local Cache = {}

-- Functions

--[=[
	Gets the value of a key in the current session's cache or directly from the last save.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/data#set)
]=]
local function Get(key: string, useCache: boolean?): any
	if useCache == false then
		return plugin:GetSetting(key)
	end
	local Result = Cache[key]
	assert(Result, "No such key found in cache")
	return Result
end

--[=[
	Sets a key within the current session's cache to be saved on shutdown.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/data#set)
]=]
local function Set(key: string, value: any, ignoreCacheIndex: boolean?)
	assert(ignoreCacheIndex == false and Cache[key], "No such key found in cache")
	Cache[key] = value
end

--[=[
	Saves a key to the user's local data directly without interacting with cache.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/data#save)
]=]
local function Save(key: string, value: any)
	plugin:SetSetting(key, value)
end

--[=[
	Removes a key from the user's local data.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/data#remove)
]=]
local function Remove(key: string, useCache: boolean?)
	if useCache == false then
		Save(key, nil)
		return
	end
	Set(key, nil)
end

--[=[
	Updates the value of a key using the current session's cache, uses a callback function
    to calculate a new returned value.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/data#update)
]=]
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
