-- ��� ���������� �ð� ���
local startPoint = script.Parent

startPoint.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		player:SetAttribute("StartTime", tick())
	end
end)