-- LeaderboardModule
local LeaderboardModule = {}

local leaderboard = {} -- 리더보드 저장소

function LeaderboardModule.updateLeaderboard(playerName, timeTaken)
	-- 리더보드에 플레이어 추가 또는 시간 갱신
	leaderboard[playerName] = timeTaken

	-- 리더보드 정렬 및 출력
	local sortedLeaderboard = {}
	for name, time in pairs(leaderboard) do
		table.insert(sortedLeaderboard, {name = name, time = time})
	end
	-- 시간이 낮은 > 큰 순서로 정렬 / a인덱스의 time값이 b인덱스의 time값보다 작으면 앞으로 정렬
	table.sort(sortedLeaderboard, function(a, b) return a.time < b.time end)

	-- 리더보드 출력 (예: 콘솔 출력)
	print("---- Leaderboard ----")
	for i, entry in ipairs(sortedLeaderboard) do
		print(i .. ". " .. entry.name .. " - " .. entry.time .. "s")
	end
end

return LeaderboardModule