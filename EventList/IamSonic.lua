local function displayBuffImage(humanoid, imageID, text)
	local character = humanoid.Parent
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	-- Create BillboardGui
	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Name = "BuffImage"
	billboardGui.Size = UDim2.new(3, 0, 4, 0)
	billboardGui.StudsOffset = Vector3.new(0, 4.5, 0) -- Adjust the StudsOffset to position the BillboardGui
	billboardGui.Adornee = rootPart
	billboardGui.Parent = rootPart

	-- Create ImageLabel
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Size = UDim2.new(1, 0, 0.8, 0) -- Adjust size as needed
	imageLabel.Position = UDim2.new(0, 0, 0.1, 0) -- Adjust position as needed
	imageLabel.BackgroundTransparency = 1
	imageLabel.Image = imageID
	imageLabel.Parent = billboardGui

	-- Create TextLabel
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0.2, 0) -- Adjust size as needed
	--textLabel.Position = UDim2.new(0, 0, 0.7, 0) -- Adjust position as needed
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	--textLabel.TextStrokeTransparency = 0.5
	textLabel.TextTransparency = 0.15
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.DenkOne
	textLabel.Parent = billboardGui

	return billboardGui
end

local function playSound(humanoid, soundID)
	local character = humanoid.Parent
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	-- Create Sound
	local sound = Instance.new("Sound")
	sound.SoundId = soundID
	sound.Parent = rootPart
	sound:Play()

	return sound
end

return function(humanoid)
	-- 이미지 및 텍스트 표시 및 GUI 반환
	local buffGui = displayBuffImage(humanoid, "rbxassetid://17583471177", "I am Sonic")

	-- 사운드 재생 및 sound 객체 반환
	local sound = playSound(humanoid, "rbxassetid://8208591201")

	-- 여기서 버프 효과 적용
	humanoid.WalkSpeed = humanoid.WalkSpeed * 7.5

	return {buffGui, sound, script.Name}
end