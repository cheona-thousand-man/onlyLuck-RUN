-- ServerScriptService에 넣는 스크립트
game.Players.PlayerAdded:Connect(function(player)
	local whathappen = Instance.new("Folder")
	whathappen.Name = "nowEvent"
	whathappen.Parent = player
end)