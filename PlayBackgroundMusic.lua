-- �κ�Ͻ� ���� ����
local Workspace = game:GetService("Workspace")

-- ���� ��ü ����
local sound = Instance.new("Sound")
sound.Name = "BackgroundMusic"
sound.SoundId = "rbxassetid://1836393138" -- ���⿡ ���� ID�� �Է��ϼ���.
sound.Looped = true -- ������ �ݺ� ����Ϸ��� true�� ����
sound.Volume = 0.15 -- �ʱ� ���� ���� (0���� 10 ������ ��)
sound.Parent = Workspace

-- ���� ���
sound:Play()