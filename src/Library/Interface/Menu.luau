-- Variables

local HttpService = game:GetService("HttpService")
local plugin: Plugin = script:FindFirstAncestorWhichIsA("Plugin")

local Types = require(script.Parent.Parent.Parent.Types)

local Index = {}
Index.__index = Index

-- Functions

local function PluginMenu(name: string, children: Types.MenuChildren, icon: string)
	local Menu = plugin:CreatePluginMenu(HttpService:GenerateGUID(false), name, icon)
	for index, metadata in children do
		if type(metadata) == "table" then
			if type((metadata :: any)[1]) == "table" then
				Menu:AddMenu(
					PluginMenu(
						(metadata :: any)[1][2],
						metadata :: any,
						(metadata :: any)[1][3]
					)
				)
				continue
			end
			if (metadata :: any)[1] == "_Menu" then
				continue
			end
			Menu:AddNewAction((metadata :: any)[1], (metadata :: any)[2], (metadata :: any)[3])
		else
			Menu:AddAction((metadata :: any)[1])
		end
	end
	return Menu
end

--[=[
	Creates a new plugin menu that is visually similar to a context menu.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/menu#new)
]=]
local function New(name: string, children: Types.MenuChildren, icon: string?)
	local self = setmetatable({
		Menu = PluginMenu(name, children, icon or ""),
	}, Index)
	return self
end

--[=[
	Appends a new menu to the parent menu.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/menu#append)
]=]
function Index.Append(self: any, children: Types.MenuChildren)
	self.Menu:AddMenu()
end

--[=[
	Clears the menu, removing any items left inside.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/menu#clear)
]=]
function Index.Clear(self: any)
    self.Menu:Clear()
end

--[=[
	Shows the menu, and runs the provided callback giving the chosen `PluginAction` as an
    argument. The callback will not run if the user does not choose an option.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/menu#show)
]=]
function Index.Show(self: any, callback: (id: PluginAction) -> ())
    local Identifier = self.Menu:ShowAsync()
    if Identifier then
        callback(Identifier)
    end
end

-- Module

return {
	New = New,
}
