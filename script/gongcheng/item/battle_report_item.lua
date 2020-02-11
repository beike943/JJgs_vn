--create date:07-05-17
--author:yanjun
--describe:Ç°Ïß±¨µ¼ÎïÆ·½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","ChØ ë trong khu vùc C«ng thµnh chiÕn míi cã thÓ sö dông ChiÕn b¸o tiÒn tuyÕn");
		return 0;
	end;
	local selTab = {
				"*Xem t×nh h×nh phe ®Þch/view_enemy_info",
				"*Xem t×nh h×nh c¸c §¹i kú vµ thµnh m«n/see_flag_state",
				"*Xem t×nh h×nh th­¬ng vong/view_death",
				"*Ta muèn rêi khái chiÕn tr­êng/leave_battle",
				"*Tho¸t/nothing",
				}
	Say("C¸c h¹ muèm xem tin tøc nµo?",getn(selTab),selTab);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME+nEnemyCamp-1);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"OnUse","Bang héi ®èi ph­¬ng lµ: <color=yellow>"..szEnemyName.."<color><enter>Binh lùc cña ®èi ph­¬ng hiÖn t¹i: <color=yellow>"..nEnemyCount.."<color>");
end;

function see_flag_state()
	local szContent = "";
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local szStr = "";
	local szColorHeader = "";
	--ÎªÁË½çÃæµÄÃÀ¹Û£¬ÎþÉüÁË´úÂëµÄÃÀ¹Û
	--==============================================================================
	for i=1,getn(tReviviFlagPos) do
		if GetMissionV(MV_REVIVI_FLAG1_OWNER+i-1) == nPlayerCamp then
			szStr = "Phe ta chiÕm lÜnh ";
			szColorHeader = "<color=yellow>"
		else
			szStr = "®Þch chiÕm";
			szColorHeader = "<color=red>"
		end;
		szContent = szContent..gf_FormatStringLength(tReviviFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";
		if i == 1 or i == 6 then
			szContent = szContent..gf_FormatStringLength("",25); 
		end;
		if i == 2 or i == 5 then	
			szContent = szContent.."\n";
		end;
	end;
	--==============================================================================
	--´óÆì
	szContent = szContent.."\n\n";	--ÐÂµÄÄÚÈÝ£¬»»ÐÐ
	for i=getn(tNormalFlagPos),1,-1 do
		if GetMissionV(MV_DESTROY_FLAG1+i-1) == 1 then
			szStr = "bÞ ph¸";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = " ch­a bÞ hñy";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tNormalFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";	
	end;
	--==============================================================================	
	--³ÇÃÅ
	szContent = szContent.."\n\n";
	for i=getn(tDoorName),1,-1 do
		if GetMissionV(MV_DESTROY_EAST_DOOR+i-1) == 1 then
			szStr = " ®· bÞ c«ng";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = " ch­a bÞ c«ng";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tDoorName[i]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";		
	end;
	Talk(1,"OnUse","T×nh h×nh c¸c §¹i kú vµ thµnh m«n hiÖn t¹i: \n\n"..szContent);
end;

function view_death()
	Talk(1,"OnUse","Th­¬ng vong hai phe nh­ sau: \nPhe c«ng: <color=yellow>"..GetMissionV(MV_DEATH_GONG).."<color>\nPhe thñ: <color=yellow>"..GetMissionV(MV_DEATH_SHOU).."<color>");
end;

function leave_battle()
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;

function leave(szMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"Rêi khái ®Ó l¹i tin nh¾n:"..szMsg);
end;
