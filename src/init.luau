-- Variables

local Packages = script.Parent
local Lumin = require(Packages.framework)

local plugin: Plugin = script:FindFirstAncestorWhichIsA("Plugin")

local Library = script.Library

local Data = require(Library.Data)
local Action = require(Library.Action)
local Menu = require(Library.Menu)

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

	Plugin = plugin,
}
