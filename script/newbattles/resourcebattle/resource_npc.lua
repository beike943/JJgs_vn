--filename:resource_npc.lua
--create date:2006-06-16
--describe:Á¸²Ý½Å±¾
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local bExist = GetUnitCurStates(nNpcIndex,0);	--Ê¹ÓÃµÈ¼¶ÊôÐÔ×÷ÊÇ·ñ´æÔÚµÄ±ê¼Ç
	if bExist == 0 then
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("Kh«ng thÓ thu thËp l­¬ng th¶o nµy.");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--ÊÇ·ñÆïÂí
		Msg2Player("Trªn ngùa kh«ng thÓ nhÆt l­¬ng th¶o.");
		return 0;
	end;
	local _,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nNpcPosX,nNpcPosY) >= 15 then
		Msg2Player("B¹n ®· xa khu vùc l­¬ng th¶o!");
		return 0;
	end;
	if GetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) <= 0 then
		Msg2Player("Kh«ng cã cuèc kh«ng thÓ thu thËp l­¬ng th¶o.");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("ÊÖÀïÎÕ×ÅÎäÆ÷£¬²É¼¯Á¸²Ý±äµÃÒì³£À§ÄÑ¡£");
--		return 0;
--	end;
	if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
		Msg2Player("§ang thu thËp l­¬ng th¶o……......");
		CastState("state_fetter",1,5*18)
		ProgressSlot(5*18);	--5Ãë
		SetNpcLifeTime(nNpcIndex,0);
		AddUnitStates(nNpcIndex,0,-bExist);	--ÖÃ0
		SetNpcScript(nNpcIndex,"");
	else
		Msg2Player("Kh«ng thÓ lµm ®éng t¸c nµy ë tr¹ng th¸i ngåi")
	end;
end;


function OnProgressCallback()
	local nCamp = BT_GetCamp();
	if random(1,100) <= 50 then
		Msg2MSGroup(MISSION_ID,"Ng­êi ch¬i"..GetName().."t¹i Nh¹n M«n Quan-Th¶o cèc chiÕn ®µo bíi bõa b·i ¶nh h­ëng ®Õn m«i tr­êng nªn bÞ thæ d©n truy ®uæi, chê ng­êi ch¬i ®Õn gi¶i cøu",nCamp);
		local npcIndex = CreateNpc("Hoµn tr­êng Thæ d©n","Thæ d©n giËn d÷",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\angryvillager_death.lua");	
	else
		AddItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],3);
		Msg2Player("B¹n nhËn ®­îc 3 bao "..tBattleItem[3][1]);	
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;