-- ServerScriptService에 넣는 스크립트
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local time = Instance.new("NumberValue")
	time.Name = "minTime"
	time.Value = 0
	time.Parent = leaderstats
end)