-- �� üũ����Ʈ�� ���Ǵ� ��Ʈ�� ���̴� ��ũ��Ʈ: CheckpointHandler

local CheckpointManager = require(game.ServerScriptService.CheckpointManager)

local checkpointName = script.Parent.Name

script.Parent.Touched:Connect(function(hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		CheckpointManager.onCheckpointTouch(checkpointName, player)
	end
end)