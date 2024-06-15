local eventPoint = script.Parent
local canOccur = true
local originalSpeed, originalJump
local events = {}

--이벤트 전역 테스트용 코드
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
		
	-- 이벤트 단위 테스트용 코드
	--table.insert(events, require(game:GetService("Workspace").EventList.StopNicanSee))
	--table.insert(events, require(game:GetService("Workspace").EventList.WheremyGlasses))
		
	local randomEvent = events[math.random(1, #events)]
	disappearPoint()
	getDefault(humanoid)
	
		-- 이벤트가 함수로 잘 불러와 졌을 경우 실행
		if type(randomEvent) == "function" then
			local resultTable = randomEvent(humanoid)
			local buffGui, sound, name, sidePart
			
			-- [전반적 작동]버프 이미지 및 사운드 실행 후 일정 시간 지나면 제거
			
			---- 일반적인 경우
			if #resultTable == 3 then
				buffGui, sound, name = table.unpack(resultTable)
				print(buffGui, sound, name)
			---- 특수한 효과 처리를 위한 객체를 추가한 경우
			elseif #resultTable == 4 then
				buffGui, sound, name, sidePart = table.unpack(resultTable)
				print(buffGui, sound, name, sidePart)
			end
			
			-- 이벤트가 실행 될 때, 실행중인 이벤트 이름을 nowEvent 폴더에 추가
			local whathappened = Instance.new("StringValue")
			whathappened.Name = name
			whathappened.Parent = nowEventFolder
			print(player.Name .. " 적용된 이벤트: " .. whathappened.Name)
			
			wait(5)
			
			-- 특정 이벤트는 추가적인 삭제 작업 필요
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
			
			-- 이벤트가 종료되고, nowEvent 폴더에 저장된 이벤트 내역 삭제
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