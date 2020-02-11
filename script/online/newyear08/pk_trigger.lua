--2008春节活动泉北pk触发器
--by vivi
--2008/01/16

Include("\\script\\online\\newyear08\\newyear08_head.lua");

tQuanzhou = {{1418,3178},{1454,3182},{1503,3192},{1555,3180},{1585,3106},{1526,3112},{1492,3078},{1451,3099},
{1419,3097},{1448,2985},{1491,2970},{1555,3006},{1575,3049},{1586,2895},{1533,2884},{1486,2929},{1443,2899}}

function enter_game()
	if get_spring_festival_state() == 1 then
		SetPlayerRevivalPos(100,100); --设置重生点：泉州北
		LeaveTeam();	--离开队伍
		SetPKFlag(2,0); --屠杀状态
		SetFightState(1);	--战斗状态
		ForbidChangePK(1); --设置是否允许玩家改变PK状态，１为禁止，０为允许
		SetCreateTeam(1); --关闭组队功能，参数１：１为关，０为开
		CleanInteractive(); --解除交互		
		InteractiveEnable(0);	--禁止互动
		SetDeathPunish(0);	--无死亡惩罚
		local nRand = random(1,getn(tQuanzhou));
		NewWorld(108,tQuanzhou[nRand][1],tQuanzhou[nRand][2]);
	end
end

function leave_game()
	if get_spring_festival_state() == 1 then
		ForbidChangePK(0); --设置是否允许玩家改变PK状态，１为禁止，０为允许
		SetPKFlag(0,0);	--无PK状态
		SetCreateTeam(0); --关闭组队功能，参数１：１为关，０为开
		InteractiveEnable(1);	--互动
		SetDeathPunish(1);	--有死亡惩罚
	end
end