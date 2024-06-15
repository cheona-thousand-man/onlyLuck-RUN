-- ServerScriptService�� �ִ� ��� ��ũ��Ʈ: CheckpointManager

local CheckpointManager = {}

function CheckpointManager.onCheckpointTouch(checkpointName, player)
	-- Player ��ü �Ʒ��� checkpoints ������ ã��
	local checkpointsFolder = player:FindFirstChild("checkpoints")
	if not checkpointsFolder then
		warn("checkpoints folder not found for player:", player.Name)
		return
	end

	-- �÷��̾��� üũ����Ʈ ��� ����� ������
	local passedCheckpoints = {}
	for _, checkpoint in ipairs(checkpointsFolder:GetChildren()) do
		passedCheckpoints[checkpoint.Name] = true
	end

	-- �̹� ����� üũ����Ʈ���� Ȯ��
	if passedCheckpoints[checkpointName] then
		-- �̹� ������ üũ����Ʈ�� �߰����� ����
		print(player.Name .. " has already passed checkpoint: " .. checkpointName)
	else
		-- ���ο� üũ����Ʈ �߰�
		local newCheckpoint = Instance.new("StringValue")
		newCheckpoint.Name = checkpointName
		newCheckpoint.Value = "Passed"
		newCheckpoint.Parent = checkpointsFolder
		print(player.Name .. " passed checkpoint: " .. checkpointName)
	end
end

function CheckpointManager.clearCheckpoints(checkpointsFolder)
	-- checkpoints ���� ���� ��� �ڽ��� �����մϴ�.
	for _, child in ipairs(checkpointsFolder:GetChildren()) do
		if child:IsA("StringValue") then
			child:Destroy()
		end
	end
end

return CheckpointManager