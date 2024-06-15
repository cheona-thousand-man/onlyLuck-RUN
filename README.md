# onlyLuck RUN : 운빨달리기

- 게임 최초 공개·배포 v1.0 _ 2024. 5.28.

- 플레이 링크 : https://www.roblox.com/games/17555680618/onlyLuck-RUN

- 로블록스에서 가장 인기 있는 장애물 피하기(Obby) 장르에서, 물리적 장애물 대신 랜덤인카운터로 플레이어의 속성을 변경하여 완주를 방해하는 요소 반영
  (StartCraft 혈압마라톤 오마주)

- 개발 시 중점사항
  - 개별 Event를 ModuleScript로 구현
  - 추가 개발되는 Event는 해당 폴더에 추가만 하면 게임에 반영

- 개발 시 파일 위치
  - Workspace
    - EventList
    - EventPoint(내부 lua 코드는 참고용)
    - slipperPart(내부 lua 코드는 참고용), checkPoint
  - ServerScriptService
     - CheckpointManager
     - getLeaderBoard
     - LeaderboardModule
     - PlayBackgroundMusic
     - setCheckPoint
     - setPlayerEventList
