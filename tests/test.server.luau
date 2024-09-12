local Framework = require(script.Parent.pluginframework)
local Bool = Instance.new("BoolValue")

local Menu = Framework.Menu.New("TestingMenu", {
	{ "ActionA", "A", "rbxasset://textures/loading/robloxTiltRed.png" },
	{ "ActionB", "B", "rbxasset://textures/loading/robloxTilt.png" },
	{
		{ "_Menu", "C", "rbxasset://textures/explosion.png" },
		{ "ActionD", "D", "rbxasset://textures/whiteCircle.png" },
		{ "ActionE", "E", "rbxasset://textures/icon_ROBUX.png" },
	},
})

Bool.Changed:Connect(function()
	if Bool.Value then
		Bool.Value = false
		Menu:Show(function(selected)
			print(selected.Text, selected.ActionId)
		end)
	end
end)

Bool.Name = "Toggle Menu"
Bool.Parent = game

Framework.Action.New("Shortcut", "A test shortcut", "rbxasset://textures/whiteCircle.png", function()
	print("You did it!")
end)
