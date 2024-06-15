local slipperyTile = script.Parent -- �̲������� Ÿ�� ��Ʈ

local function onTouch(otherPart)
	local character = otherPart.Parent
	if character and character:IsA("Model") then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = Vector3.new(-50, 0, 0) -- �̲������� �ӵ��� ������ �����մϴ�. �� ��쿡�� x�� �������� �̲������ϴ�.
			bodyVelocity.MaxForce = Vector3.new(1000, 0, 1000) -- �ִ� ���� �����մϴ�. �� ���� �ʿ信 ���� ���� �����մϴ�.
			bodyVelocity.Parent = humanoid.Parent.HumanoidRootPart
		end
	end
end

local function onExit(otherPart)
	local character = otherPart.Parent
	if character and character:IsA("Model") then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			-- �÷��̾ �̲������� Ÿ�Ͽ��� ����� BodyVelocity�� �����Ͽ� �̲������� ȿ���� �����մϴ�.
			local bodyVelocity = humanoid.Parent.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
			if bodyVelocity then
				bodyVelocity:Destroy()
			end
		end
	end
end

-- �̺�Ʈ �ڵ鷯 ����
slipperyTile.Touched:Connect(onTouch)
slipperyTile.TouchEnded:Connect(onExit)