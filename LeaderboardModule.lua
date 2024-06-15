-- LeaderboardModule
local LeaderboardModule = {}

local leaderboard = {} -- �������� �����

function LeaderboardModule.updateLeaderboard(playerName, timeTaken)
	-- �������忡 �÷��̾� �߰� �Ǵ� �ð� ����
	leaderboard[playerName] = timeTaken

	-- �������� ���� �� ���
	local sortedLeaderboard = {}
	for name, time in pairs(leaderboard) do
		table.insert(sortedLeaderboard, {name = name, time = time})
	end
	-- �ð��� ���� > ū ������ ���� / a�ε����� time���� b�ε����� time������ ������ ������ ����
	table.sort(sortedLeaderboard, function(a, b) return a.time < b.time end)

	-- �������� ��� (��: �ܼ� ���)
	print("---- Leaderboard ----")
	for i, entry in ipairs(sortedLeaderboard) do
		print(i .. ". " .. entry.name .. " - " .. entry.time .. "s")
	end
end

return LeaderboardModule