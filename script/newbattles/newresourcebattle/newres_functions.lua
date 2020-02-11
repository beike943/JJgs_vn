-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

Include("\\script\\newbattles\\newresourcebattle\\newres_head.lua");

function AddNewResource()
	local nMapID = 606
	for i=1290, 1305 do 
		AddMapTrap(nMapID, i * 32, 2900 * 32, "\\script\\newbattles\\newresourcebattle\\trap\\song_trap.lua")
	end
	for i=1435, 1450 do 
		AddMapTrap(nMapID, i * 32, 3048 * 32, "\\script\\newbattles\\newresourcebattle\\trap\\liao_trap.lua")
	end
	--for i=1430, 1445 do 
		--AddMapTrap(nMapID, i * 32, 2909 * 32, "\\script\\newbattles\\newresourcebattle\\trap\\all_trap.lua")
	--end
	
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("Méc QuÕ Anh","TriÖu Tè Quyªn",nMapID,1239,2850);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_song_npc.lua");	
	nNpcIdx = CreateNpc("D­¬ng T«n B¶o","Tiªu ViÔn TuÊn",nMapID,1498,3106);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_liao_npc.lua");
	nNpcIdx = CreateNpc("Qu¶n gia","Hoµng TrÝ th­¬ng nh©n",nMapID,1356,2988);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_saleman_npc.lua");	
	
	nNpcIdx = CreateNpc("B¶o r­¬ng Tµi nguyªn","Tø Linh B¶o R­¬ng",nMapID,1480,2864);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_superchest_npc.lua");	
	
	nNpcIdx = CreateNpc("§¹i Long","Long Tö",nMapID,1463,2848,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_dragon_npc.lua");		
	
	nNpcIdx = CreateNpc("§¹i Phông","Phông Tö",nMapID,1448,2864,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_phoenix_npc.lua");	
	
	nNpcIdx = CreateNpc("§¹i Hæ","Hæ Tö",nMapID,1481,2891,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_tiger_npc.lua");	
	
	nNpcIdx = CreateNpc("§¹i ¦ng","¦ng Tö",nMapID,1492,2871,6,1,1);	
	SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\npc\\newres_ying_npc.lua");	
	
	for i=1,getn(tResPos[1]) do
		nNpcIdx = CreateNpc("c©y §a MËt Hoa Qu¶ trung","Gç tµi nguyªn",nMapID,tResPos[1][i][1],tResPos[1][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\stump.lua");	
	end
	for i=1,getn(tResPos[2]) do
		nNpcIdx = CreateNpc("ThÇn phï","Thuéc da tµi nguyªn",nMapID,tResPos[2][i][1],tResPos[2][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\leather.lua");	
	end	
	for i=1,getn(tResPos[3]) do
		nNpcIdx = CreateNpc("D­îc Nh©n Th¶o","Th¶o d­îc  tµi nguyªn",nMapID,tResPos[3][i][1],tResPos[3][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\herbal.lua");	
	end	
	for i=1,getn(tResPos[4]) do
		nNpcIdx = CreateNpc("R­¬ng n¸t","R­¬ng ch©u b¸u",nMapID,tResPos[4][i][1],tResPos[4][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\chest.lua");	
	end	
	for i=1,getn(tResPos[5]) do
		nNpcIdx = CreateNpc("c©y §a MËt Hoa Qu¶ trung","Gç tµi nguyªn",nMapID,tResPos[5][i][1],tResPos[5][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\stump.lua");	
	end
	for i=1,getn(tResPos[6]) do
		nNpcIdx = CreateNpc("D­îc Nh©n Th¶o","Th¶o d­îc tµi nguyªn",nMapID,tResPos[6][i][1],tResPos[6][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\herbal.lua");	
	end
	for i=1,getn(tResPos[7]) do
		nNpcIdx = CreateNpc("R­¬ng n¸t","R­¬ng ch©u b¸u",nMapID,tResPos[7][i][1],tResPos[7][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\chest.lua");	
	end	
	for i=1,getn(tResPos[8]) do
		nNpcIdx = CreateNpc("c©y §a MËt Hoa Qu¶ trung","Gç tµi nguyªn",nMapID,tResPos[8][i][1],tResPos[8][i][2]);	
		SetNpcScript(nNpcIdx,"\\script\\newbattles\\newresourcebattle\\resnpc\\stump.lua");	
	end
end

function newres_sign_up()
	local nCamp = BT_GetCurCamp()
	local nMapID = GetWorldPos();	
	if mf_GetMissionV(MISSION_ID,MV_STATE,MAP_ID) == MS_STATE_BEGIN then
		Talk(1,"",szNpcName.."Giai ®o¹n nµy bÊt cø ai còng kh«ng ®­îc vµo!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."Gia nhËp m«n ph¸i míi cã thÓ tham gia chiÕn dÞch!")
		return
	end
	if GetLevel() < 77 then
		Talk(1,"",szNpcName.."§¼ng cÊp 77 trë lªn míi cã thÓ tham gia chiÕn dÞch!")
		return
	end	
	if abs(GetTask(701)) < 15000 then
		Talk(1,"",szNpcName.."§iÓm c«ng tr¹ng ph¶i ®¹t 15000 trë lªn míi cã thÓ tham gia chiÕn dÞch!")
		return
	end	
	local tSay = {}
	tinsert(tSay, "Gia nhËp phe ta/#newres_confirm_sign_up(1)")
	tinsert(tSay, "Gia nhËp phe ®èi ®Þch (phÝ tham gia b»ng Xu)/#newres_confirm_sign_up(2)")
	tinsert(tSay, "Gia nhËp phe ®èi ®Þch (phÝ tham gia b»ng Vµng)/#newres_confirm_sign_up(3)")
	tinsert(tSay, "Ta cã viÖc bËn/gf_DoNothing")	
	Say(szNpcName.."<color=red>Chó ý: Thó c­ng sÏ biÕn mÊt sau khi vµo chiÕn tr­êng.<color> B¹n muèn gia nhËp phe <color=yellow>"..tCamp[nCamp].."<color>?", 4, tSay)
end

function newres_confirm_sign_up(nSelected)
	local tCash = {
		[1] = {60000, 0, 1, 2},
		[2] = {0, 68, 2, 1},	
		[3] = {0, 0, 2, 1},	
	}
	local tCash_PhongHam = {
		[2] = {39, 156},
		[3] = {69, 276},
		[4] = {79, 316},
		[5] = {99, 396},	
	}
	if nSelected == 2 or nSelected == 3 then
		if GetTask(704) == 6 or GetTask(704) == -6 then
			Talk(1, "", "Nguyªn So¸i kh«ng thÓ vµo tham gia phe ®Þch ®­îc !!!!")
			return		
		end
	end
	local nCamp = BT_GetCurCamp()
	local nPhongHam = abs(GetTask(704))	
	if nSelected == 1 then
		if GetCash() < tCash[nSelected][1] then
			Talk(1, "", "B¹n kh«ng mang theo ®ñ Vµng!")
			return
		end
	else
		if nSelected == 2 then
			if GetItemCount(2, 1, 30230) < tCash_PhongHam[nPhongHam][1] then
				Talk(1, "", "B¹n kh«ng mang theo ®ñ Xu vËt phÈm!")
				return
			end
		else
			if GetCash() < tCash_PhongHam[nPhongHam][2] * 10000 then
				Talk(1, "", "B¹n kh«ng mang theo ®ñ Vµng!")
				return
			end	
		end
	end
	if GetPKValue() >= 4 then	
		Talk(1,"",szNpcName.."Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!");
		return 0;
	end;	
	if nCamp == 1 then
		nCamp = tCash[nSelected][3]
	else
		nCamp = tCash[nSelected][4]	
	end
	local nPlayerCount = BT_GetPlayerCount(nCamp)
	if nPlayerCount >= MAX_CAMP then
		Talk(1,"main",szNpcName.."Phe nµy ®· cã <color=yellow>"..nPlayerCount.."<color> ng­êi, khi kh¸c h·y quay l¹i!");
		return 0;
	end
	
	if nSelected <= 1 then
		Pay(tCash[nSelected][1])
		WriteLogEx("TL TNChien","Tham gia phe ta")
		WriteLogEx("TAI NGUYEN CHIEN NEW LOG","Tham gia phe ta")
	elseif nSelected == 2 then
		DelItem(2, 1, 30230, tCash_PhongHam[nPhongHam][1])
		WriteLogEx("LOG XU VAT PHAM","Tham gia phe ®Þch lo¹i "..tCash_PhongHam[nPhongHam][1].."  Xu")
	elseif nSelected == 3 then
		Pay(tCash_PhongHam[nPhongHam][2]*10000)
		WriteLogEx("LOG XU VAT PHAM","Tham gia phe ®Þch lo¹i "..tCash_PhongHam[nPhongHam][2].."  Vµng")
	end

	mf_JoinMission(MISSION_ID,nCamp,MAP_ID);	

end

function MS_JoinMission(nCamp)
	CleanInteractive();	
	local nRanPos = random(1, getn(ENTRANCE_POINT[nCamp]))
	if NewWorld(MAP_ID,ENTRANCE_POINT[nCamp][nRanPos][1],ENTRANCE_POINT[nCamp][nRanPos][2]) == 1 then
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,GetName().." ®· gia nhËp phe Tèng");
			WriteLogEx("TL TNChien","Phe Tèng")
		else
			Msg2MSAll(MISSION_ID,GetName().." ®· gia nhËp phe Liªu");
			WriteLogEx("TL TNChien","Phe Liªu")
		end;
		BT_SetPlayerState(nCamp);
		AddMSPlayer(MISSION_ID,nCamp);		
		return 1;
	else
		return 0;
	end;
end

function MS_LeaveMission()
	local nCamp = BT_GetCurCamp();	
	BT_RestorePlayerState();	
	if NewWorld(EXIT_POINT[nCamp][1],EXIT_POINT[nCamp][2],EXIT_POINT[nCamp][3]) == 1 then
		local nBattleState = mf_GetMissionV(MISSION_ID,MV_STATE,MAP_ID);
		if nBattleState == MS_STATE_FIGHT or nBattleState == MS_STATE_RESULT then
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"Tèng "..GetName().." ®· rêi khái chiÕn tr­êng");
			else	
				Msg2MSAll(MISSION_ID,"Liªu "..GetName().." ®· rêi khái chiÕn tr­êng");
			end;
		end;
		return 1;
	else
		return 0;
	end;
end;

function BT_GetPlayerCount(nCamp)
	return mf_GetPlayerCount(MISSION_ID,nCamp,MAP_ID);
end

function BT_GetCurCamp()
	if GetTask(701) >= 0 then
		return SONG_ID;
	else
		return LIAO_ID;
	end;
end;

function BT_SetPlayerState(nCamp)	
	LeaveTeam();	
	SetLogoutRV(1);	
	SetDeathPunish(0);	
	ForbitTrade(1);	
	InteractiveEnable(0);	
	StallEnable(0);	
	UseScrollEnable(0);	
	SetMomentum(0);
	SetMomentumBoundSwitch(1);
	SetPKFlag(1,nCamp);
	ForbidRead(1);
	ForbidChangePK(1);	
	SetFightState(1);
	KillFollower();	
	SetCampToPlayer(tCampNameP[nCamp]);	
	SetTempRevPos(EXIT_POINT[nCamp][1],EXIT_POINT[nCamp][2]*32,EXIT_POINT[nCamp][3]*32);	
	SetDeathScript(DEATH_SCRIPT);
	BT_ResetTask();
end;

function BT_RestorePlayerState()
	LeaveTeam();
	SetLogoutRV(0);	
	SetDeathPunish(1);			
	ForbitTrade(0);
	ForbidRead(0);
	InteractiveEnable(1);	
	StallEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);
	SetMomentumBoundSwitch(0);
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	
	BT_DeleteAllBattleItem();
	SetTask(TSK_GET_THUOC,GetTask(TSK_GET_THUOC)-1)
end

function BT_DeleteAllBattleItem()
	local nItemCount = 0;
	for i=1,getn(tBattleItem) do
		if tBattleItem[i][5] == 1 then
			nItemCount = BigGetItemCount(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4]);
			if nItemCount > 0 then
				BigDelItem(tBattleItem[i][2],tBattleItem[i][3],tBattleItem[i][4],nItemCount)	
			end;
		end;
	end;
	for i=1,getn(tBattleMed) do	
		nItemCount = BigGetItemCount(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4]);
		if nItemCount > 0 then
			BigDelItem(tBattleMed[i][2],tBattleMed[i][3],tBattleMed[i][4],nItemCount)	
		end;
	end;
end;

function BT_ResetTask()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_NEWRES_DATE) ~= nDate then		
		gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DONE,0)
		gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_DOUBLE_EXP,0)
		SetTask(TSK_NEWRES_DATE,nDate)
	end	
end

function BT_ShowTime(nTime)	
	local nHour = 0
	local nMin = 0
	local nSec = 0
	if nTime > 0 then
		nHour = floor(nTime/3600)
		nMin = floor((nTime - nHour*3600)/60)
		nSec = nTime - nHour*3600 - nMin*60
	end
	return nHour, nMin, nSec
end
