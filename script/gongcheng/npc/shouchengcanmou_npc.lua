--create date:07-04-12
--author:yanjun
--describe:ÊØ³Ç²ÎÄ±½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>Thñ thµnhTham m­u<color>: ";
g_NpcCamp = SHOU_ID;

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
				"* L·nh Thñ VÖ lÖnh/get_guard_token",
				"* Xem Thñ vÖ thµnh m«n/view_guard_info",
				"*Xem t×nh h×nh c¸c §¹i kú vµ thµnh m«n/see_flag_state",
				"* L·nh chiÕn b¸o tiÒn tuyÕn/get_battle_report",
				"Më r­¬ng	/open_box",
				"*Ta muèn rêi khái chiÕn tr­êng/leave_battle",
				"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
				}
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState >= MS_STATE_GONGCHENG then
		tremove(selTab,3);
	end;
	Say(g_InfoHeader.."Ta lµ Thñ thµnh Tham m­u",getn(selTab),selTab);
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
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"main",g_InfoHeader.."Bang héi ®èi ph­¬ng lµ: <color=yellow>"..szEnemyName.."<color><enter>Binh lùc cña ®èi ph­¬ng hiÖn t¹i: <color=yellow>"..nEnemyCount.."<color>");
end;

function get_guard_token()
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"main",g_InfoHeader.."B¹n kh«ng thÓ nhËn Thñ VÖ lÖnh.");
		return 0;
	end;
	if GetMissionV(MV_GET_SHOU_TOKEN) == 1 then
		Talk(1,"main",g_InfoHeader.."Thñ VÖ lÖnh chiÕn dÞch lÇn nµy ®· ®­îc ph¸t hÕt råi!");
		return 0;
	end;
	if gf_JudgeRoomWeight(3,30) == 0 then
		Talk(1,"main",g_InfoHeader.."R­¬ng b¹n kh«ng ®ñ kho¶ng trèng hoÆc Søc lùc kh«ng ®ñ. H·y quay l¹i sau nhÐ!");
		return 0;
	end;
	SetMissionV(MV_GET_SHOU_TOKEN,1);
	AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],3);
	SendTongMessage("L·nh ®­îc Thñ VÖ lÖnh");
	Talk(1,"",g_InfoHeader.."Mçi trËn C«ng thµnh chiÕn ®Òu cã thÓ l·nh <color=yellow>3<color> Thñ VÖ lÖnh, ph¸t cho 3 cao thñ ®Ó hä ®¶m nhËn träng tr¸ch Thñ vÖ thµnh m«n");
end;

function view_guard_info()
	--°ïÖ÷£¬³¤ÀÏ£¬¸±°ïÖ÷²Å¿ÉÒÔ²Ù×÷
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"",g_InfoHeader.."ChØ cã bang chñ, phã bang chñ vµ tr­ëng l·o míi cã thÓ thùc hiÖn thao t¸c nµy");
		return 0;
	end;
	local selTab = {
				"* Ta muèn hñy "..tDoorName[1].."Thñ vÖ/#fire_guard(1)",
				"* Ta muèn hñy "..tDoorName[2].."Thñ vÖ/#fire_guard(2)",
				"* Ta muèn hñy "..tDoorName[3].."Thñ vÖ/#fire_guard(3)",
				"* Kh«ng ®iÒu chØnh/nothing",
				}
	local szEGuardName,szSGuardName,szWGuardName = GCZ_GetGuardName(g_NpcCamp,0);
	Say(g_InfoHeader.."Thµnh m«n thñ vÖ bªn ta ph©n biÖt nh­ sau: \n"..tDoorName[1].."Thñ vÖ: <color=yellow>"..szEGuardName.."<color>\n"..tDoorName[2].."Thñ vÖ: <color=yellow>"..szSGuardName.."<color>\n"..tDoorName[3].."Thñ vÖ: <color=yellow>"..szWGuardName.."<color>",getn(selTab),selTab);
end;

function fire_guard(nDoorIdx)
	local selTab = {
				format("§ång ý/#fire_guard_confirm(%d)",nDoorIdx),
				"Ta suy nghÜ l¹i!/nothing",
				}
	Say(g_InfoHeader.."B¹n x¸c ®Þnh ph¶i hñy bá chøc vô cña thñ vÖ "..tDoorName[nDoorIdx].." chø?",getn(selTab),selTab);
end;

function fire_guard_confirm(nDoorIdx)
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"",g_InfoHeader.."ChØ cã bang chñ, phã bang chñ vµ tr­ëng l·o míi cã thÓ thùc hiÖn thao t¸c nµy");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"",g_InfoHeader.."ChØ cã thÓ hñy bá chøc vô cña thµnh m«n thñ vÖ t¹i giai ®o¹n chuÈn bÞ c«ng thµnh ");
		return 0;
	end;
	local nGuardIdx = GCZ_GetGuardPlayerIndex(g_NpcCamp,nDoorIdx);
	if nGuardIdx == 0 then
		Talk(1,"view_guard_info",g_InfoHeader.."Thµnh m«n nµy vÉn ch­a s¾p xÕp thñ vÖ ");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	PlayerIndex = nGuardIdx
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--Èç¹ûµ±Ç°ÊØÎÀÕýÔÚµ¥ÌôÖÐ
		Talk2SomeOne(nOldPlayerIdx,1,"view_guard_info",g_InfoHeader.."Thñ vÖ nµy ®ang khiªu chiÕn ®¬n ®Êu víi ®Þch, kh«ng thÓ hñy bá chøc vô nµy!");
		return 0;
	end;
	Talk2SomeOne(nOldPlayerIdx,1,"",g_InfoHeader.."B¹n ®· hñy bá thµnh c«ng chøc vô cña "..tDoorName[nDoorIdx]..".");
	Say(g_InfoHeader.."Chøc vô thµnh m«n thñ vÖ cña b¹n ®· bÞ hñy bá",0);
	Msg2Player("Chøc vô thµnh m«n thñ vÖ cña b¹n ®· bÞ hñy bá");
	SetTaskTemp(TEMP_GURAD_ID,0);
	SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
	local nPlayerCamp = GCZ_GetPlayerCamp();
	GCZ_Msg2Camp(GetName(nOldPlayerIdx).."®· hñy bá chøc vô cña"..tDoorName[nDoorIdx].."Thñ vÖ"..GetName()..".",nPlayerCamp);
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
