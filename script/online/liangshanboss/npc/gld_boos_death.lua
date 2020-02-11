--黄金boss死亡脚本
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function OnDeath(Index,f,x)
	local nMapId,nX,nY;
	if f == 0 then
	--给团队奖励
		local msg = "";
		local sCaptainName = GetCaptainName();
--		print("GetTeamSize",GetTeamSize());
		if GetTeamSize() ~= 0 and GetTeamSize() ~= 1 then
			--给roll奖励
			LSB_Get_Award_C(3,0,Index);
			--给固定奖励
			local OldPlayerIndex = PlayerIndex;
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				msg = msg..GetName()..",";
				nMapId,nX,nY = GetWorldPos();
				if LSB_IsAllowMap({507,504,501},nMapId) == 1 and GetLevel() >= Min_Level and GetPlayerFaction() ~= 0 then
					LSB_Get_Award_Fix_C();
				end
			end
			PlayerIndex = OldPlayerIndex;
			--通告
			local strTemp = format("%s чi trng %s th鑞g l躰h gi誸 ch誸 Boss%s Чi Ho祅g Kim",msg,sCaptainName,GetNpcName(Index));
			AddGlobalNews(strTemp);
			Msg2Global(strTemp);
		else
			nMapId,nX,nY = GetWorldPos();
			if LSB_IsAllowMap({507,504,501},nMapId) == 1 and GetLevel() >= Min_Level and GetPlayerFaction() ~= 0 then
					LSB_Get_Award_Fix_C();
					LSB_Get_Award_C(3,1,Index);
			end
			local strTemp = format("%s Х nh b筰 Boss%s Чi Ho祅g Kim",GetName(),GetNpcName(Index));
			AddGlobalNews(strTemp);
			Msg2Global(strTemp);
		end
	end
	--给大宝箱
	local nIndex = GetGlbValue(GS_GLOBAL_VALUE3);
	if nIndex ~= 0 then
		for i = 1, GlodBoss_Death_Num do
			local nNpcIdx = CreateNpc("B秓 rng T礽 nguy猲", "Чi B秓 Rng", LSB_GOLD_BOSS_LOCATION[nIndex][1], LSB_GOLD_BOSS_LOCATION[nIndex][2], LSB_GOLD_BOSS_LOCATION[nIndex][3],6,1,1,200);
			SetNpcLifeTime(nNpcIdx,3 * 60);
			SetNpcScript(nNpcIdx,Box_B_Script);
		end
	end
	--清理
	--SetGlbValue(GS_GLOBAL_VALUE3,0);
	--ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
	SetNpcLifeTime(Index,0);
end