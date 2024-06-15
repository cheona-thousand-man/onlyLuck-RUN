-- ���� ���������� �ð� ����
local LeaderboardModule = require(game.ServerScriptService.LeaderboardModule)

local endPoint = script.Parent

endPoint.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player and player:GetAttribute("StartTime") then
		local endTime = tick()
		local startTime = player:GetAttribute("StartTime")
		local timeTaken = endTime - startTime
		local checkpointsFolder = player:FindFirstChild("checkpoints")

		-- ���� ��Ϻ��� ������ ������Ʈ & �ּ� 5�� �̻��� üũ ����Ʈ�� ������ ����
		if (player.leaderstats.minTime.Value == 0 or timeTaken < player.leaderstats.minTime.Value) and #(checkpointsFolder:GetChildren()) > 4 then
			player.leaderstats.minTime.Value = timeTaken
		end

		-- �������� ������Ʈ
		LeaderboardModule.updateLeaderboard(player.Name, timeTaken)
	end
end)