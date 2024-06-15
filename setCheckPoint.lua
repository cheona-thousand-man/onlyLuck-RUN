-- ServerScriptService에 넣는 스크립트
game.Players.PlayerAdded:Connect(function(player)
	local checkpoints = Instance.new("Folder")
	checkpoints.Name = "checkpoints"
	checkpoints.Parent = player
end)