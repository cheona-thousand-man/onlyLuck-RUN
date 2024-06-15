-- 종료 지점에서의 시간 산정
local LeaderboardModule = require(game.ServerScriptService.LeaderboardModule)

local endPoint = script.Parent

endPoint.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player and player:GetAttribute("StartTime") then
		local endTime = tick()
		local startTime = player:GetAttribute("StartTime")
		local timeTaken = endTime - startTime
		local checkpointsFolder = player:FindFirstChild("checkpoints")

		-- 기존 기록보다 빠르면 업데이트 & 최소 5개 이상의 체크 포인트를 지나야 인정
		if (player.leaderstats.minTime.Value == 0 or timeTaken < player.leaderstats.minTime.Value) and #(checkpointsFolder:GetChildren()) > 4 then
			player.leaderstats.minTime.Value = timeTaken
		end

		-- 리더보드 업데이트
		LeaderboardModule.updateLeaderboard(player.Name, timeTaken)
	end
end)