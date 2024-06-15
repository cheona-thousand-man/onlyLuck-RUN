-- 파트에 부딪혔을 때 CheckpointManager.clearCheckpoints 실행하는 스크립트

-- CheckpointManager 모듈 불러오기
local CheckpointManager = require(game.ServerScriptService.CheckpointManager)

-- A파트를 찾아서 터치 이벤트 연결
local startPoint = script.Parent

startPoint.Touched:Connect(function(hit)
	-- 부딪힌 대상이 플레이어인지 확인
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		-- 플레이어가 A파트에 부딪혔을 때 모듈의 clearCheckpoints 함수 실행
		local checkpointsFolder = player:FindFirstChild("checkpoints")
		if checkpointsFolder then
			CheckpointManager.clearCheckpoints(checkpointsFolder)
			print("플레이어가 A파트에 부딪혀 체크포인트를 비웠습니다.")
		else
			warn("플레이어의 체크포인트 폴더를 찾을 수 없습니다.")
		end
	end
end)