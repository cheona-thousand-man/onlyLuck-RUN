local eventPoint = script.Parent
local canOccur = true
local originalSpeed, originalJump
local events = {}

--�̺�Ʈ ���� �׽�Ʈ�� �ڵ�
for _, child in ipairs(game:GetService("Workspace").EventList:GetChildren()) do
	if child:IsA("ModuleScript") then
		table.insert(events, require(child))
	end
end

local function disappearPoint()
	eventPoint.CanTouch = false
	--eventPoint.Transparency = 1
end

local function appearPoint()
	eventPoint.CanTouch = true
	--eventPoint.Transparency = 0
end

local function getDefault(humanoid)
	originalSpeed = humanoid.WalkSpeed
	originalJump = humanoid.JumpPower
end

local function setDefault(humanoid)
	humanoid.WalkSpeed = originalSpeed
	humanoid.JumpPower = originalJump
end

local function onTouch(otherPart)	
	local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
	if not humanoid then return end
	
	local player = game.Players:GetPlayerFromCharacter(humanoid.Parent)
	if not player then return end

	local nowEventFolder = player:FindFirstChild("nowEvent") 
	if not nowEventFolder then
		warn("Player does not have a 'nowEvent' folder")
		return
	end		

	if #nowEventFolder:GetChildren() > 0 then
		warn("Player has another event running")
		return
	end
	
	if canOccur then
	canOccur = false
		
	-- �̺�Ʈ ���� �׽�Ʈ�� �ڵ�
	--table.insert(events, require(game:GetService("Workspace").EventList.StopNicanSee))
	--table.insert(events, require(game:GetService("Workspace").EventList.WheremyGlasses))
		
	local randomEvent = events[math.random(1, #events)]
	disappearPoint()
	getDefault(humanoid)
	
		-- �̺�Ʈ�� �Լ��� �� �ҷ��� ���� ��� ����
		if type(randomEvent) == "function" then
			local resultTable = randomEvent(humanoid)
			local buffGui, sound, name, sidePart
			
			-- [������ �۵�]���� �̹��� �� ���� ���� �� ���� �ð� ������ ����
			
			---- �Ϲ����� ���
			if #resultTable == 3 then
				buffGui, sound, name = table.unpack(resultTable)
				print(buffGui, sound, name)
			---- Ư���� ȿ�� ó���� ���� ��ü�� �߰��� ���
			elseif #resultTable == 4 then
				buffGui, sound, name, sidePart = table.unpack(resultTable)
				print(buffGui, sound, name, sidePart)
			end
			
			-- �̺�Ʈ�� ���� �� ��, �������� �̺�Ʈ �̸��� nowEvent ������ �߰�
			local whathappened = Instance.new("StringValue")
			whathappened.Name = name
			whathappened.Parent = nowEventFolder
			print(player.Name .. " ����� �̺�Ʈ: " .. whathappened.Name)
			
			wait(5)
			
			-- Ư�� �̺�Ʈ�� �߰����� ���� �۾� �ʿ�
			if whathappened.Name == "WheremyGlasses" then
				wait(3.5)
				sidePart:Destroy()
			end
				
			if buffGui then
				buffGui:Destroy()
			end
				
			if sound then
				sound:Stop()
				sound:Destroy()
			end
			
			-- �̺�Ʈ�� ����ǰ�, nowEvent ������ ����� �̺�Ʈ ���� ����
			whathappened:Destroy()
				
			setDefault(humanoid)
			wait(2)
			appearPoint()
		else
			warn("randomEvent is not a faunction!")
		end
		canOccur = true
	end
end


eventPoint.Touched:Connect(onTouch)