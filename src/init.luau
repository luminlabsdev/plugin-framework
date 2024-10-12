-- Variables

local Packages = script.Parent
local Lumin = require(Packages.framework)

local plugin: Plugin = script:FindFirstAncestorWhichIsA("Plugin")

local Library = script.Library

local Data = require(Library.Data)
local Action = require(Library.Action)
local Interface = require(Library.Interface)

-- Module

return {
    -- Framework
	Start = Lumin.Start,
	New = Lumin.New,
	Lifecycle = Lumin.Lifecycle,
    version = "0.6", -- Uses plugin framework version

    -- Unloading
	Unloading = plugin.Unloading,

    -- Actions
	Data = Data,
	Action = Action,

    -- Interface
	Menu = Interface.Menu,
    Toolbar = Interface.Toolbar,

    -- Plugin
	Plugin = plugin,
}
