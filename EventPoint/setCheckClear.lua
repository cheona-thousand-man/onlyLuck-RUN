-- ��Ʈ�� �ε����� �� CheckpointManager.clearCheckpoints �����ϴ� ��ũ��Ʈ

-- CheckpointManager ��� �ҷ�����
local CheckpointManager = require(game.ServerScriptService.CheckpointManager)

-- A��Ʈ�� ã�Ƽ� ��ġ �̺�Ʈ ����
local startPoint = script.Parent

startPoint.Touched:Connect(function(hit)
	-- �ε��� ����� �÷��̾����� Ȯ��
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		-- �÷��̾ A��Ʈ�� �ε����� �� ����� clearCheckpoints �Լ� ����
		local checkpointsFolder = player:FindFirstChild("checkpoints")
		if checkpointsFolder then
			CheckpointManager.clearCheckpoints(checkpointsFolder)
			print("�÷��̾ A��Ʈ�� �ε��� üũ����Ʈ�� ������ϴ�.")
		else
			warn("�÷��̾��� üũ����Ʈ ������ ã�� �� �����ϴ�.")
		end
	end
end)