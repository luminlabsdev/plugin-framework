-- Variables

local HttpService = game:GetService("HttpService")
local plugin: Plugin = script:FindFirstAncestorWhichIsA("Plugin")

-- Functions

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
