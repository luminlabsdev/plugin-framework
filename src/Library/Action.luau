-- Variables

local HttpService = game:GetService("HttpService")
local plugin: Plugin = script:FindFirstAncestorWhichIsA("Plugin")

-- Functions

--[=[
	Creates a new plugin action that can be bound to a keycode or placed in studio's topbar.

	[Learn More](https://luminlabsdev.github.io/plugin-framework/api/action#new)
]=]
local function New(
	name: string,
	description: string,
	icon: string,
	callback: () -> (),
	allowBinding: boolean?
): PluginAction
	local Action = plugin:CreatePluginAction(HttpService:GenerateGUID(false), name, description, icon, allowBinding)
	Action.Triggered:Connect(callback)
	return Action
end

-- Module

return {
    New = New,
}
