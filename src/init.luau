-- Variables

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Lumin = require(Packages.framework)

local plugin: Plugin = script:FindFirstAncestor("Plugin")

local Library = script.Library

local Data = require(Library.Data)
local Action = require(Library.Action)
local Menu = require(Library.Menu)
local Prompt = require(Library.Prompt)

-- Functions

-- Module

return {
	Start = Lumin.Start,
	Controller = Lumin.Controller,
	Expect = Lumin.Expect,
	Worker = Lumin.Worker,
	Signal = Lumin.Signal,

	Unloading = plugin.Unloading,

	Data = Data,
	Action = Action,
	Menu = Menu,
	Prompt = Prompt,
}
