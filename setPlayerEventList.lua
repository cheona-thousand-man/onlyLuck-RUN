-- ServerScriptService�� �ִ� ��ũ��Ʈ
game.Players.PlayerAdded:Connect(function(player)
	local whathappen = Instance.new("Folder")
	whathappen.Name = "nowEvent"
	whathappen.Parent = player
end)