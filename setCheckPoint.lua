-- ServerScriptService�� �ִ� ��ũ��Ʈ
game.Players.PlayerAdded:Connect(function(player)
	local checkpoints = Instance.new("Folder")
	checkpoints.Name = "checkpoints"
	checkpoints.Parent = player
end)