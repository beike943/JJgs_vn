--File name:create_boss_ontime.lua 
--Describe:Èý½ÚÁ¬¹ý£¬´´½¨²ß»®BOSS½Å±¾
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		local nNpcIndex = 0;
		local nBossIndex = 0;
		local tbBoss = {};
		local nCurHour = tonumber(date("%H"));
		for i=1,getn(tBossPos) do
			if SubWorldID2Idx(tBossPos[i][2]) ~= -1 and tBossInfo[i][5] == nCurHour then
				tinsert(tbBoss,i);
			end;
		end;
		if getn(tbBoss) == 0 then
			return 0;
		end;
		for i=1,getn(tbBoss) do
			nBossIndex = tbBoss[i];
			nNpcIndex = CreateNpc(tBossInfo[nBossIndex][1],tBossInfo[nBossIndex][3],tBossPos[nBossIndex][2],tBossPos[nBossIndex][3],tBossPos[nBossIndex][4]);
			SetNpcDeathScript(nNpcIndex,"\\script\\online\\3festival\\boss_death.lua");
			Msg2Global("Giang hå ¸c nh©n"..tBossInfo[nBossIndex][3].."VËt h¾n yªu quý nhÊt ®· xuÊt hiÖn"..tBossPos[nBossIndex][1]..", mäi ng­êi mau ®Õn ®ã!");
		end;
	end;
end;