--create date:07-04-12
--author:yanjun
--describe:¹¥³Ç²ÎÄ±½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>C«ng thµnh Tham M­u<color>: ";
g_NpcCamp = GONG_ID;

function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= g_NpcCamp then
		Talk(1,"",g_InfoHeader.."Ng­êi ®©u! Cã gian tÕ!");
		return 0;
	end;
	local selTab = {
		"*Xem t×nh h×nh phe ®Þch/view_enemy_info",
		"* L·nh C«ng thµnh Tiªn phong lÖnh/get_attack_token",
		"*Xem t×nh h×nh c¸c §¹i kú vµ thµnh m«n/see_flag_state",
		"* L·nh chiÕn b¸o tiÒn tuyÕn/get_battle_report",
		"Më r­¬ng	/open_box",
		"*Ta muèn rêi khái chiÕn tr­êng/leave_battle",
		"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
		};
	Say(g_InfoHeader.."Ta lµ C«ng thµnh Tham M­u",getn(selTab),selTab);
end;

function leave_battle()
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_SHOU_TONG_NAME);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"main",g_InfoHeader.."Bang héi ®èi ph­¬ng lµ: <color=yellow>"..szEnemyName.."<color><enter>Binh lùc cña ®èi ph­¬ng hiÖn t¹i: <color=yellow>"..nEnemyCount.."<color>");
end;

function get_attack_token()
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_GONG_TONG_NAME) then
		Talk(1,"main",g_InfoHeader.."B¹n kh«ng thÓ nhËn C«ng thµnh Tiªn phong lÖnh.");
		return 0;
	end;
	if GetMissionV(MV_GET_GONG_TOKEN) == 1 then
		Talk(1,"main",g_InfoHeader.."C«ng thµnh Tiªn phong lÖnh cña chiÕn dÞch lÇn nµy ®· ®­îc l·nh");
		return 0;
	end;
	if gf_JudgeRoomWeight(3,30) == 0 then
		Talk(1,"main",g_InfoHeader.."R­¬ng b¹n kh«ng ®ñ kho¶ng trèng hoÆc Søc lùc kh«ng ®ñ. H·y quay l¹i sau nhÐ!");
		return 0;
	end;
	SetMissionV(MV_GET_GONG_TOKEN,1);
	AddItem(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4],3);
	SendTongMessage("L·nh C«ng thµnh Tiªn phong lÖnh");
	Talk(1,"",g_InfoHeader.."Mçi trËn chiÕn ®Êu chóng ta ®Òu ph¸t ®i <color=yellow>3<color>C«ng thµnh Tiªn phong lÖnh. Sö dông lÖnh nµy cã thÓ ph¸t khiªu chiÕn ®¬n ®Êu ®Õn c¸c Thñ vÖ thµnh m«n. ChiÕn th¾ng trËn khiªu chiÕn ®¬n ®Êu sÏ trùc tiÕp më ®­îc thµnh m«n t­¬ng øng cña ®Þch. Tiªn phong lÖnh cã b¸n trong Ngù C¸c");
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
	Talk(1,"main",g_InfoHeader.."T×nh h×nh c¸c §¹i kú vµ thµnh m«n hiÖn t¹i: \n\n"..szContent);
end;

function get_battle_report()
	if GetItemCount(tItemInfo[4][2],tItemInfo[4][3],tItemInfo[4][4]) ~= 0 then
		Talk(1,"",g_InfoHeader.."Ch¶ ph¶i ng­¬i ®· cã 1 quyÓn ChiÕn b¸o tiÒn tuyÕn sao?");
		return 0;
	end;
	AddItem(tItemInfo[4][2],tItemInfo[4][3],tItemInfo[4][4],1);
	Msg2Player("B¹n nhËn ®­îc 1 ChiÕn b¸o tiÒn tuyÕn");
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_InfoHeader.."Ng­¬i vÉn ch­a thuéc vÒ r­¬ng cña m×nh.");
		return 0;
	end;
	OpenBox();
end;
