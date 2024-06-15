-- 각 체크포인트로 사용되는 파트에 붙이는 스크립트: CheckpointHandler

local CheckpointManager = require(game.ServerScriptService.CheckpointManager)

local checkpointName = script.Parent.Name

script.Parent.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		CheckpointManager.onCheckpointTouch(checkpointName, player)
	end
end)