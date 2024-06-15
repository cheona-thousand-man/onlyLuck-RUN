-- ServerScriptService에 넣는 모듈 스크립트: CheckpointManager

local CheckpointManager = {}

function CheckpointManager.onCheckpointTouch(checkpointName, player)
	-- Player 객체 아래의 checkpoints 폴더를 찾음
	local checkpointsFolder = player:FindFirstChild("checkpoints")
	if not checkpointsFolder then
		warn("checkpoints folder not found for player:", player.Name)
		return
	end

	-- 플레이어의 체크포인트 통과 기록을 가져옴
	local passedCheckpoints = {}
	for _, checkpoint in ipairs(checkpointsFolder:GetChildren()) do
		passedCheckpoints[checkpoint.Name] = true
	end

	-- 이미 통과한 체크포인트인지 확인
	if passedCheckpoints[checkpointName] then
		-- 이미 지나온 체크포인트는 추가하지 않음
		print(player.Name .. " has already passed checkpoint: " .. checkpointName)
	else
		-- 새로운 체크포인트 추가
		local newCheckpoint = Instance.new("StringValue")
		newCheckpoint.Name = checkpointName
		newCheckpoint.Value = "Passed"
		newCheckpoint.Parent = checkpointsFolder
		print(player.Name .. " passed checkpoint: " .. checkpointName)
	end
end

function CheckpointManager.clearCheckpoints(checkpointsFolder)
	-- checkpoints 폴더 내의 모든 자식을 제거합니다.
	for _, child in ipairs(checkpointsFolder:GetChildren()) do
		if child:IsA("StringValue") then
			child:Destroy()
		end
	end
end

return CheckpointManager