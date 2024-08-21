-- Variables

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Lumin = require(Packages.framework)

local plugin: Plugin = script:FindFirstAncestor("Plugin")

-- Functions

local function goCrazyGoStupid()
    print("ahhahahahahah")
end

-- Module

return {
    Start = Lumin.Start,
    Controller = Lumin.Controller,
    Expect = Lumin.Expect,
    Worker = Lumin.Worker,
    Signal = Lumin.Signal,
    Unloading = plugin.Unloading,
}