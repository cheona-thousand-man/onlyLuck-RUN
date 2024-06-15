-- 로블록스 서비스 참조
local Workspace = game:GetService("Workspace")

-- 사운드 객체 생성
local sound = Instance.new("Sound")
sound.Name = "BackgroundMusic"
sound.SoundId = "rbxassetid://1836393138" -- 여기에 사운드 ID를 입력하세요.
sound.Looped = true -- 음악을 반복 재생하려면 true로 설정
sound.Volume = 0.15 -- 초기 볼륨 설정 (0에서 10 사이의 값)
sound.Parent = Workspace

-- 사운드 재생
sound:Play()