-- Variables

local plugin = script:FindFirstAncestorWhichIsA("Plugin")

local Index = {}
Index.__index = Index

-- Functions

local function New(name: string)
	local self = setmetatable({
		Toolbar = plugin:CreateToolbar(name),
        Buttons = {}
	}, Index)
	return self
end

function Index.Button(self: any, name: string, tooltip: string, image: string, onClick: () -> ())
	local Button = self.Toolbar:CreateButton(name, tooltip, image)
    Button.Click:Connect(onClick)
    table.insert(self.Buttons, Button)
end

-- Module

return {
	New = New,
}
