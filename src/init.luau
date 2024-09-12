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
    OnStart = Lumin.OnStart,
	New = Lumin.New,
	Worker = Lumin.Worker,
    Load = Lumin.Load,
    version = "0.3.0", -- Uses plugin framework version

    -- Unloading
	Unloading = plugin.Unloading,

    -- Actions
	Data = Data,
	Action = Action,

    -- Interface
	Menu = Interface.Menu,
    Toolbar = Interface.Toolbar,
    Widget = Interface.Widget,

    -- Plugin
	Plugin = plugin,
}
