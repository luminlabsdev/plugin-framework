-- Variables

local plugin = script:FindFirstAncestorWhichIsA("Plugin")

local Index = {}
Index.__index = Index

-- Functions

--[=[
	Creates a new plugin toolbar with a specified name.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/toolbar#new)
]=]
local function New(name: string)
	local self = setmetatable({
		Toolbar = plugin:CreateToolbar(name),
        Buttons = {}
	}, Index)
	return self
end

--[=[
	Creates a new toolbar button using the toolbar it was created on.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/toolbar#append)
]=]
function Index.Append(self: any, name: string, tooltip: string, image: string, onClick: () -> ())
	local Button = self.Toolbar:CreateButton(name, tooltip, image)
    Button.Click:Connect(onClick)
    table.insert(self.Buttons, Button)
end

-- Module

return {
	New = New,
}
