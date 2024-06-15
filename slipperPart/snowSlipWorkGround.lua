local slipperyTile = script.Parent -- 미끄러지는 타일 파트

local function onTouch(otherPart)
	local character = otherPart.Parent
	if character and character:IsA("Model") then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = Vector3.new(-50, 0, 0) -- 미끄러지는 속도와 방향을 설정합니다. 이 경우에는 x축 방향으로 미끄러집니다.
			bodyVelocity.MaxForce = Vector3.new(1000, 0, 1000) -- 최대 힘을 설정합니다. 이 값은 필요에 따라 조정 가능합니다.
			bodyVelocity.Parent = humanoid.Parent.HumanoidRootPart
		end
	end
end

local function onExit(otherPart)
	local character = otherPart.Parent
	if character and character:IsA("Model") then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			-- 플레이어가 미끄러지는 타일에서 벗어나면 BodyVelocity를 제거하여 미끄러지는 효과를 중지합니다.
			local bodyVelocity = humanoid.Parent.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
			if bodyVelocity then
				bodyVelocity:Destroy()
			end
		end
	end
end

-- 이벤트 핸들러 연결
slipperyTile.Touched:Connect(onTouch)
slipperyTile.TouchEnded:Connect(onExit)