--ÌìÃÅÕó¿ªÆônpc
--by vivi
--2009-07-16

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua")
Include("\\script\\lib\\message.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online_activites\\award.lua")
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--½±ÀøÕæÆøµÄ½Ó¿Ú
Include("\\script\\online\\olympic\\oly_head.lua")
--×·»Ø×ÖÌû´ó×÷Õ½
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

g_szThisFile = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
g_RealmNpcName = "<color=green>T­íng Gi¸o Qu¸ch Qu©n Di <color>: ";

function main()
	--==========ÌìÃÅÕóºóĞøÈÎÎñ===================
		if GetTask(1401) == 136 then
			Talk(1,"",g_NpcName.."Nh­ lêi Méc t­íng qu©n ®· nãi, thËt sù ta ®· lËp nªn trËn ph¸p. ThiÕu hiÖp cã thÓ tham gia thö nghiÖm mét trËn, chiÕn th¾ng råi h·y ®Õn t×m ta");
			SetTask(1401,137);
			GivePlayerExp(SkeyTianmenzhen,"guojunpen")
			TaskTip("ChiÕn th¾ng 1 lÇn Thiªn M«n TrËn.");
			return 0;
		elseif GetTask(1401) == 137 and GetTask(TASKID_TMZ_PLAY_POINT) >= OVER_GAME_POINT then
			Talk(1,"",g_NpcName.."Xem ra c¸c h¹ ®· râ c¸ch bµy bè Thiªn M«n TrËn råi, h·y mau vÒ bÈm b¸o víi Méc t­íng qu©n ®i.");
			SetTask(1401,138);
			GivePlayerExp(SkeyTianmenzhen,"yanwushengli")
			TaskTip("VÒ bÈm b¸o víi Méc QuÕ Anh");
			return 0;
		end
	--============================================
	if GetMapTemplate(SubWorld) == 350 then		--ÏåÑô¹¦ÄÜNPCÈ¡Ïû
		Talk(1,"",g_RealmNpcName.."Thiªn M«n TrËn hiÖn ®· ®­îc chuyÓn ®Õn <color=red>Thµnh §« (231/229) vµ §¹i Lı (179/179)<color>!")
	else
		local strtab = {
			"§¨ng kı tham gia Thiªn M«n TrËn c¸ nh©n/tmz_single_join",
			"§¨ng kı tham gia Thiªn M«n TrËn tæ ®éi/tmz_team_join",
			"NhËn phÇn th­ëng Thiªn M«n TrËn/tmz_get_award",
			"Xem thuéc tİnh trang bŞ míi/#Sale(147,100,1)",
			"Giíi thiÖu Thiªn M«n TrËn/tmz_about_detail",
			"Kh«ng cã g×!/gf_DoNothing"
			};
		if GLB_TMZ_BiWuCheck() == 1 then
			tinsert(strtab,4,"Tû vâ Thiªn M«n TrËn bang héi xuyªn server/tmz_about_tong");
		end
		Say(g_NpcName.."Giang s¬n ®¹i Tèng ta ®ang t×nh c¶nh v©y nguy tõ ngo¹i téc, nam nhi ®¹i tr­îng phu sao cã thÓ khoanh tay ®øng nh×n! ThiÕu hiÖp ®Õn t×m ta cã viÖc chi?",
			getn(strtab),
			strtab)	
	end
end

function tmz_tong_callback_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzTong = SDB(szkey,0,0,3);
	local strTongName = GetTongName();
	local nHufu =  tbTmzTong[strTongName][8] or MAX_HUFU;
	strtab = {
		"B¸o danh tham gia/#tmz_tong_join(1)",
		"Sö dông 20 Tiªu Dao Ngäc b¸o danh tham gia/#tmz_tong_join(2)",
		"Giíi thiÖu ®èi trËn/tmz_tong_detail",
		"§­a ta trë vÒ/tmz_tong_back",
		"Kh«ng cã g×!/gf_DoNothing",	
	};
	local strMsg = "Quı bang cßn d­ Thiªn M«n Hæ Phï Ên lµ <color=yellow>"..nHufu.."<color>, mçi lÇn b¸o danh cÇu tiªu hao 1."
	Say(g_RealmNpcName.."C¸c vŞ thiÕu hiÖp, khi ®· vµo ®Õn ®©y th× ph¶i nghe lÖnh ta! KÎ lµm tr¸i lÖnh, xö theo qu©n ph¸p!"..strMsg,
		getn(strtab),
		strtab);	
end

function tmz_single_join()
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
	end
	--Ê±¼äÏŞÖÆ
	local nTime = tonumber(date("%H%M"));
	if (not ((1100 <= nTime and nTime < 1300) or (1700 <= nTime and nTime < 1900) or (2200 <= nTime and nTime <= 2359))) then
		Talk(1,"",g_NpcName.."DiÔn vâ ch­a më, tõ 11:00-13:00, 17:00-19:00 hoÆc 22:00-23:00 h·y quay l¹i b¸o danh tham gia");
		return 0;
	end
	
	--¼ÓÈëµÈ¼¶ÏŞÖÆ
	local nLv = GetLevel();
	if nLv < PLAY_NEED_LV then
		Talk(1,"",g_NpcName.."LÇn diÔn vâ nµy kh«ng ph¶i tÇm th­êng, thiÕu hiÖp trÎ ng­êi non da khã tr¸nh khái th­¬ng vong. C¸c h¹ ®¹t ®Õn cÊp <color=yellow>70<color> h·y ®Õn tham gia.");
		return 0
	end
	--ÈëÁ÷ÅÉ²Å¸ø½ø
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a gia nhËp m«n ph¸i, kh«ng thÓ tham gia.");
		return 0;
	end
	--¼ÓÈëÊÇ·ñÁìÈ¡ÁËÉÏÒ»³¡Õ½³¡µÄ½±Àø
	if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
		Talk(1,"",g_NpcName.."ThiÕu hiÖp vÉn ch­a nhËn phÇn th­ëng lÇn tham gia tr­íc, h·y nhËn th­ëng tr­íc ®i.");
		return 0;
	end 
	if GetTeamSize() > 1 then
		Talk(1,"",g_NpcName.."H·y t×m chñ tæ ®éi ®Õn b¸o danh víi ta.");
		return 0;
	end
	
	if GetPKValue() >= 10 then
		Talk(1,"",g_NpcName.."C¸c h¹ s¸t khİ qu¸ nÆng (PK>10), nÕu tham gia vµo Thiªn M«n TrËn sÏ m¹ng häa s¸t th©n, ®Ò nghŞ tŞnh t©m l¹i h·y ®Õn t×m ta b¸o danh tham gia");
		return 0;
	end
	
	-- Ã¿Ìì½øÈëÏŞÖÆ
	if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
		Talk(1,"",g_NpcName..format("Mçi ngµy mçi ng­êi chØ ®­îc tham gia <color=green>%d<color> trËn DiÔn Vâ, c¸c h¹ h·y quay l¹i vµo ngµy mai.",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	
	if GetCash() < 30000 then
		Talk(1,"","§¹i hiÖp kh«ng cã 3 vµng")
		return
	end
	
	local nWaiting = 0;
	if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
		nWaiting = 1; --Õû×°×´Ì¬
	end
	local nCurMapId = TMZ_GetSuitMap(1,nWaiting);
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId) then
			mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
		else
			mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
		end
	else --Ã»ÓĞºÏÊÊµÄ£¬ĞÂ¿ªÒ»¸ö
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."TÊt c¶ c¸c b¶n ®å ®· ®Çy, h·y quay l¹i sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("Tû lÖ chiÕm trËn: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			
			_stat_on_misson_open()
		end
	end
	Pay(30000)
	_stat_when_join(1)
	
	--cdkey»î¶¯
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

function tmz_team_join()
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta ");
			return 0;	
		end
	end
	--Ê±¼äÏŞÖÆ
	local nTime = tonumber(date("%H%M"));
	if (not ((1100 <= nTime and nTime < 1300) or (1700 <= nTime and nTime < 1900) or (2100 <= nTime and nTime < 2300))) then
		Talk(1,"",g_NpcName.."DiÔn vâ vÉn ch­a chuÈn bŞ xong, thiÕu hiÖp h·y quay l¹i vµo 11: 00 ~ 13: 00 hoÆc 17: 00~19: 00 hoÆc 21: 00~23: 00 tham gia chiÕn tr­êng.");
		return 0;
	end
	
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	if nTeamNumber < 1 or nTeamNumber > 3 then
		Talk(1,"",g_NpcName.."B¸o danh Thiªn M«n TrËn cã thÓ theo tæ ®éi 3 ng­êi hoÆc c¸ nh©n tham gia");
		return 0;
	end
	if GetName() ~= sCapTainName then
		Talk(1,"",g_NpcName.."Tæ ®éi cÇn ®éi tr­ëng ®Õn b¸o danh.");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ®éi ngò cã thµnh viªn v¾ng mÆt ");
		return 0;
	end
	if tmz_LvCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ®éi ngò cã thµnh viªn ch­a ®¹t cÊp 70.");
		return 0;
	end
	if tmz_AwardCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ®éi ngò cã thµnh viªn ch­a nhËn phÇn th­ëng lÇn tham gia tr­íc");
		return 0;
	end
	if tmz_TeamRouteCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ®éi ngò cã thµnh viªn ch­a gia nhËp m«n ph¸i");
		return 0;
	end
	if tmz_TeamCashCheck() == 0 then
		tmz_TeamTalk(g_NpcName)
		return 0
	end
	
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong ®éi ngò cã thµnh viªn s¸t khİ qu¸ nÆng (PK>10), kh«ng thÓ vµo");
		return 0;		
	end
	-- Ã¿Ìì½øÈëÏŞÖÆ
	if tmz_CheckJoinLimitCount() == 0 then
		Talk(1,"",g_NpcName..format("Trong ®éi ngò cã ng­êi ®· tham gia <color=green>%d<color> trËn diÔn vâ råi.",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	local nWaiting = 0;
	if tmz_ZhengZhuangCheck() == 0 then
		nWaiting = 1;
	end
	local nCurMapId = TMZ_GetSuitMap(nTeamNumber,nWaiting);
	local nOldIndex = PlayerIndex; 
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId)then
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i); 
				mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		else
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);						
				mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		end
	else --Ã»ÓĞºÏÊÊµÄ£¬ĞÂ¿ªÒ»¸ö
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."TÊt c¶ c¸c b¶n ®å ®· ®Çy, h·y quay l¹i sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("Tû lÖ chiÕm trËn: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);							
				mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
			
			_stat_on_misson_open()
		end
	end	
	tmz_TeamPay()
	_stat_when_join(GetTeamSize() or 2)
	
	--cdkey»î¶¯
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

-- ÔÚ½øÈëÇ°ÅĞ¶ÏËùÓĞ¶ÓÔ±ÊÇ·ñÔÚÍ¬Ò»¸ö³ÇÀï
function tmz_AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--Ëæ±ãÈ¡Ò»¸ö¶ÓÔ±µÄworldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function tmz_LvCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nLv = GetLevel();
		if nLv < PLAY_NEED_LV then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_AwardCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_ZhengZhuangCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_TeamRouteCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCheckRoute = gf_CheckPlayerRoute();
		if nCheckRoute == 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function  tmz_TeamCashCheck()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCash = GetCash()
		if nCash < 30000 then
			return 0
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

 function tmz_TeamTalk(g_NpcName)
 	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Talk(1,"",g_NpcName.."Trong ®éi ngò cã thµnh viªn ch­a cã 3 vµng");
	end
	PlayerIndex = nOldIndex;
 end

function  tmz_TeamPay()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Pay(30000)
	end
	PlayerIndex = nOldIndex;
end


function tmz_PkValueCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nPk = GetPKValue();
		if nPk >= 10 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;			
end

function tmz_TongMemberCheck()
	local nOldIndex = PlayerIndex;
	local strTongName = "";
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if i == 1 then
			strTongName = GetTongName();
		else
			if strTongName ~= GetTongName() then
				PlayerIndex = nOldIndex;
				return 0;
			end
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	 
end

function tmz_CheckJoinLimitCount()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

--½±ÀøµÄÈ«¶î¾­Ñé
function tmz_Award_Base_Exp()
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{nLv^3/3,(100+(nLv-75)*20)*10000/3,(280+(nLv-80)*24)*10000/3,(400+(nLv-85)*28)*10000/3,5120000/3}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp
end

--¾­ÑéË¥¼õÏµÊı1
function tmz_Award_Exp_Arg()
	local nExpArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	if nNum <= 8 then
		nExpArg = 1-(1/512)*(nNum-4)^2;
	else
		nExpArg = 0.5;
	end
	return nExpArg;
end

--»ı·ÖË¥¼õÏµÊı1
function tmz_Award_Mark_Arg()
	local tNumArg = {{9,8,7,6,5,4,3,2,1},{0,0.2,0.3,0.6,0.6,0.8,1,0.8,0.7}};
	local nMarkArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	for i = 1,getn(tNumArg[1]) do
		if nNum >= tNumArg[1][i] then
			nMarkArg = tNumArg[2][i];
			break;
		end
	end
	return nMarkArg;
end

function tmz_get_award()
	
	--ÏÈÅĞ¶ÏÊÇ·ñ²Î¼ÓÁËÉÏÒ»³¡¶ÔÕó£¬ÔÙÅĞ¶ÏÊÇ·ñÎªÓĞĞ§²ÎÓë
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a tham gia thö nghiÖm Thiªn M«n TrËn tr­íc");
		return 0;
	end

	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local sTalk = format("ThiÕu hiÖp trªn DiÔn Vâ Tr­êng biÓu hiÖn %s, nªn lÇn diÔn vâ nµy ngoµi phÇn th­ëng tham dù ra cßn cã thÓ nhËn ®­îc %s phÇn th­ëng tİch cùc.", tbAcvtiveDesc[nActiveLevel][2], "HÖ Qu©n C«ng Ch­¬ng", tbAcvtiveDesc[nActiveLevel][1]);
	Say(g_NpcName..sTalk,
		6,
		format("%s/#tmz_confirm_award(0)","NhËn th­ëng trùc tiÕp"),
		format("%s/#tmz_ask_award(1)",format("Dïng %s nhËn th­ëng",tAwardItem[1][1])),
		format("%s/#tmz_ask_award(2)",format("Dïng %s nhËn th­ëng",tAwardItem[2][1])),
		format("%s/#tmz_ask_award(3)",format("Dïng %s nhËn th­ëng",tAwardItem[3][1])),
		format("%s/#tmz_ask_award(4)",format("Dïng %s nhËn th­ëng",tAwardItem[4][1])),
		"T¹m thêi kh«ng nhËn/gf_DoNothing")
end

function tmz_ask_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a tham gia thö nghiÖm Thiªn M«n TrËn tr­íc");
		return 0;
	end

	nType = nType or 0;
	
	local tbNormal = tbNormalAward[nType];
	local szAward = format("C¸c h¹ x¸c nhËn dïng <color=yellow>%s<color> nhËn th­ëng?", tAwardItem[nType][1] or "" );
--	szAward = szAward .. "Äú½«»ñµÃ";
--	
--	for i=1,getn(tbNormal.tbAward) do
--		local szUnit = "";
--		local szName = "";
--		local nCount = 0;
--		if (tbNormal.tbAward[i][1] == 1) then
--			szUnit = "¸ö";
--			szName = tbNormal.tbAward[i][2];
--			nCount = tbNormal.tbAward[i][3][4];
--		elseif (tbNormal.tbAward[i][1] == 2) then
--			szUnit = "µã";
--			szName = "¾­Ñé";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 3) then
--			szUnit = "";
--			szName = "½ğÇ®";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 4) then
--			szUnit = "µã";
--			szName = "ÉùÍû";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 5) then
--			szUnit = "µã";
--			szName = "Ê¦ÃÅ¹±Ï×";
--			nCount = tbNormal.tbAward[i][2];
--		end
--		szAward = szAward .. format("<color=green>%d<color>%s<color=yellow>%s<color>, ",nCount, szUnit, szName);
--	end
	Say(g_NpcName .. szAward,
		3,
		"\n §óng, ta muèn nhËn th­ëng/#tmz_confirm_award("..nType..")",
		"\n ta chän sai råi/tmz_get_award",
		"\n t¹m thêi ch­a muèn/gf_DoNothing");
end

function tmz_confirm_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a tham gia thö nghiÖm Thiªn M«n TrËn tr­íc");
		return 0;
	end

	nType = nType or 0;
	local tbNeedItem = tAwardItem[nType]	
--	if nType == 4 then
--		if GetItemCount(2,1,9999) < 1 or GetItemCount(2,1,9998) < 1 or GetItemCount(2,1,9977) < 1 then
--			Talk(1,"",g_NpcName.."C¸c h¹ chän nhËn th­ëng d¹ng VIP mµ kh«ng mang ®ñ c¸c lo¹i qu©n c«ng");
--			return 0;
--		end
--	else
		if type(tbNeedItem[1]) == "string" then
			if GetItemCount(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4]) < tbNeedItem[5] then
				Talk(1,"",g_NpcName.."C¸c h¹ mang kh«ng ®ñ"..tbNeedItem[1]..".");
				return 0;
			end
		end
--	end
	local nNeedRoom = 0;
	local nNeedWeight = 0;
	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local tbActive = tbAcvtiveLossAward[nActiveLevel];
	local tbNormal = tbNormalAward[nType];
	
	local bIsWin = 0--»ñÊ¤±ê¼Ç
	if (GetTask(TASKID_TMZ_PLAY_RESULT) == 2) then
		tbActive = tbAcvtiveWinAward[nActiveLevel];
		bIsWin = 1--»ñÊ¤±ê¼Ç
	end
	
	if (tbActive == nil or tbNormal == nil) then
		return 0;
	end
	
	nNeedRoom = tbNormal.nBagLimit;
	nNeedRoom = nNeedRoom + tbActive.nBagLimit;
	nNeedWeight = tbNormal.nWeightLimit;
	nNeedWeight = nNeedWeight + tbActive.nWeightLimit;
	if gf_Judge_Room_Weight(nNeedRoom+4,nNeedWeight,g_NpcName) ~= 1 then --+4Ô¤Áô¸ø»î¶¯½±ÀøµÄ¿Õ¼ä
		return 0;
	end
--	if nType == 4 then
--		if DelItem(2,1,9999,1) ~= 1 or DelItem(2,1,9998,1) ~= 1 or DelItem(2,1,9977,1) ~= 1 then
--			return 0
--		end
--	else
		if type(tbNeedItem[1]) == "string" then
			if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
				return 0;
			end
		end
--	end
	
	local tAddRate = {
		nExpAddRate = (1 + TMZ_EXP_EXT_RATE)*(1 + GetVipCardParam()),
		nJunGongAddRate = (1 + TMZ_JUNGONG_EXT_RATE),
	}
	if bIsWin == 0 then--¸º·½²»¸ø¾ü¹¦¼Ó³É
		tAddRate.nJunGongAddRate = 1
	end
	gf_EventGiveAllAward(tbNormal.tbAward,"Thiªn M«n trËn",format("NhËn th­ëng type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
--	if bIsWin == 0 then--¸º·½»îÔ¾¶È¾­Ñé½±Àø/3
--		tAddRate.nExpAddRate = tAddRate.nExpAddRate/3
--	end
	gf_EventGiveAllAward(tbActive.tbAward,"Thiªn M«n trËn",format("NhËn th­ëng type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
	if(nActiveLevel == 6) then
		Msg2Global(format("%s trong Thiªn M«n DiÔn Vâ Tr­êng lùc ¸p quÇn hïng, chãi s¸ng mét ph­¬ng, qu¶ thËt nh©n trung hµo kiÖt.",GetName()));
	end
	-- ChuyÓn Sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) < 80 then
				gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) +1)
				if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) == 80 then
					TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh hoµn thµnh 80 lÇn Thiªn m«n trËn")
				end
	end
	-----------------------Chuçi nhiÖm vô ChuyÓn Sinh 6
	local nCS6_TMT =  floor(GetTask(TSK_CS6_COUNTC)/100)
	local nCS6_TMT_Num = mod(GetTask(TSK_CS6_COUNTC),100)
	if mod(nCS6_TMT,100) < 20 and GetTask(TSK_CS6_TULINH) == 3 then
		nCS6_TMT = (nCS6_TMT + 1) * 100 + nCS6_TMT_Num
		SetTask(TSK_CS6_COUNTC, nCS6_TMT)
	end
	------------------------	
	local nCheckTMT = GetTask(368)
	nType = tonumber(nType)
	WriteLogEx(THIENMON_LOG_TITLE, "®æi ®iÓm Thiªn M«n TrËn: "..nCheckTMT)
	
	--²»ÔÙ½±ÀøÕæÆø
	--AwardZhenQi_TianMenZhen(nActiveLevel, bIsWin)--ÌìÃÅÕó»ñÊ¤½±ÀøÕæÆø
	
	if bIsWin == 1 then
		_MissionAward_RandAward(g_tWinExtraAward, "PhÇn th­ëng phe th¾ng Thiªn M«n TrËn")--Ê¤·½×¨Êô½±Àø
		gf_EventGiveAllAward(g_tWinExtraAward2[nType].tbAward,"Thiªn M«n trËn",format("NhËn %s phÇn th­ëng tham gia","Phe th¾ng"),tAddRate);
		--NhËn qu©n c«ng cho server Háa Phông
		-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
			-- gf_Modify("JunGong",tbQuanCong_HP[nType][1])
		-- end
	else
		gf_EventGiveAllAward(g_tLoseExtraAward2[nType].tbAward,"Thiªn M«n trËn",format("NhËn %s phÇn th­ëng tham gia","Phe thua"),tAddRate);
		--NhËn qu©n c«ng cho server Háa Phông
		-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
			-- gf_Modify("JunGong",tbQuanCong_HP[nType][2])
		-- end
	end
--	local nQCPoint =  tbQuanCongTMT[nType+1][1]
	local nCampBase = 1
	local nExp_TMT = 5000000
	
	if nCheckTMT < 2 then
--		nQCPoint = tbQuanCongTMT[nType+1][2]
		nExp_TMT = 1900000
	end 
	ModifyExp(nExp_TMT)	
--	if  GetTask(701) < 0 then
--		nCampBase = -1
--	end
	
--	SetTask(701,GetTask(701) + nQCPoint * nCampBase)
--	Msg2Player("B¹n nhËn ®­îc "..nQCPoint.." ®iÓm qu©n c«ng")
	WriteLogEx(THIENMON_LOG_TITLE, "Qu©n c«ng Thiªn M«n TrËn")	
	
	AwardZhenQi_TianMenZhen(nActiveLevel, bIsWin)--ÌìÃÅÕó»ñÊ¤½±ÀøÕæÆø
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(TASKID_TMZ_PLAY_RESULT,0);
	
	tmz_clear_task_id();
	--Observer:onEvent(OE_TMZ_Get_Award,{nWin,nType}); --ÊäÓ®£¬½ğ»¢Òø»¢±ê¼Ç
	--==============¶îÍâ½±Àø½Ó¿Úaward.lua==============
--	if nType ~= 4 then
		extra_tianmenzhen_award(nType)
--	end
	--»î¶¯²ú³ö
	if bIsWin == 1 then
		--°ÂÔË»î¶¯
		oly_AddShengHuo(6,1);
		--×·»Ø×ÖÌû´ó×÷Õ½
		dzt_tmz_succ();
		--ĞÂ×ÊÁÏÆ¬¿¨ÅÆ»î¶¯
		cc_tmz_award_succ();
	else
		oly_AddShengHuo(2,1);
		dzt_tmz_fail();
		--ĞÂ×ÊÁÏÆ¬¿¨ÅÆ»î¶¯
		cc_tmz_award_fail();
	end
	-----------------------Chuçi nhiÖm vô §ång Hµnh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 9 or DongHanh_GetMission() == 10) then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	--------------------------------
	ThienMonTran_NhanThuong(nType)
	--ÆäËû¹¦ÄÜ»ò»î¶¯²ú³ö»ã×Ü
	aw_tmz_award(nType);
	
	_stat_when_award(nType, nActiveLevel)
	
	--ÎäÁÖ¹¦Ñ«
	merit_TianMenZhen(bIsWin, nType);
end

function tmz_change_mark()
	local tSel = {
--		"ÎÒÒª²é¿´Ïà¹ØÌ××°/#Sale(147,100,1)",
--		"ÎÒÒªÓÃ»ı·Ö¶Ò»»±¾Á÷ÅÉµÄ[ÌìÃÅÏµÁĞ]ÎäÆ÷£¨¿É½»Ò×£©/tmz_change_weapon",
--		"ÎÒÒªÓÃ»ı·Ö½«[ÌìÃÅÏµÁĞ]×°±¸Éı¼¶Îª[ĞÇ¿ÌÏµÁĞ]×°±¸£¨²»¿É½»Ò×£©/#tmz_change_s2(1)",
--		"ÎÒÒªÓÃ»ı·Ö½«[ĞÇ¿ÌÏµÁĞ]×°±¸Éı¼¶Îª[ÌìÒÇÏµÁĞ]×°±¸£¨²»¿É½»Ò×£©/#tmz_change_s2(2)",
		"10 ®iÓm tİch lòy ®æi ®­îc 1 Kim Tinh/#tmz_change_stone(1)",
		"10 ®iÓm tİch lòy ®æi ®­îc 1 Méc Tinh/#tmz_change_stone(2)",
		"10 ®iÓm tİch lòy ®æi ®­îc 1 Thñy Tinh/#tmz_change_stone(3)",
		"10 ®iÓm tİch lòy ®æi ®­îc 1 Háa Tinh/#tmz_change_stone(4)",
		"10 ®iÓm tİch lòy ®æi ®­îc 1 Thæ Tinh/#tmz_change_stone(5)",
		"Kh«ng cã g×!/gf_DoNothing",
	}
	Say(g_NpcName.."§iÓm tİch lòy Thiªn M«n TrËn cña c¸c h¹ lµ: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>. §¹i hiÖp muèn ®æi tr¹ng bŞ g×?", getn(tSel), tSel)
end

function tmz_change_stone(nType)
	if nType < 1 or nType > 5 then return end
	local nNeed = 10;
	if GetTask(TASKID_TMZ_AWARD_MARK) < nNeed then
		Talk(1,"",g_NpcName.."§iÓm tİch lòy cña c¸c h¹ kh«ng ®ñ.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,g_NpcName) ~= 1 then
		return 0;
	end
	gf_ModifyTask(TASKID_TMZ_AWARD_MARK, -nNeed);
	AddItem(2,201,nType*2,1);
end

function tmz_change_weapon()
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a gia nhËp m«n ph¸i, kh«ng thÓ tham gia.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	Say(g_NpcName.."Vò khİ [HÖ Thiªn M«n] cÇn ®¹t <color=yellow>cÊp 75<color> míi cã thÓ trang bŞ, ®æi <color=yellow>["..tAwardWeapon[nRoute][1][1].."]<color>cÇn <color=yellow>"..tAwardWeapon[nRoute][1][5].."<color> ®iÓm tİch lòy Thiªn M«n TrËn, hiÖn t¹i c¸c h¹ ®· cã: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color> ®iÓm, cã muèn ®æi?",
		2,
		"\n§óng/tmz_change_weapon_confirm",
		"\nKh«ng cÇn/gf_DoNothing")
end

function tmz_change_weapon_confirm()
	local nRoute = GetPlayerRoute();
	if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardWeapon[nRoute][1][5] then
		Talk(1,"",g_NpcName.."§iÓm tİch lòy cña c¸c h¹ kh«ng ®ñ.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardWeapon[nRoute][1][5]);
	local nAdd_flag,nIdx = AddItem(tAwardWeapon[nRoute][1][2],tAwardWeapon[nRoute][1][3],tAwardWeapon[nRoute][1][4],1,1,-1,-1,-1,-1,-1,-1);
	if nAdd_flag == 1 then
		Msg2Player("B¹n nhËn ®­îc ["..tAwardWeapon[nRoute][1][1].."]x1");
	end
	WriteLogEx(THIENMON_LOG_TITLE, "®æi ®iÓm tİch lòy sö dông: "..tAwardWeapon[nRoute][1][1])
	WriteLog("[§æi ®iÓm tİch lòy Thiªn M«n TrËn]: tµi kho¶n: "..tostring(GetAccount()).."Nh©n vËt: "..tostring(GetName()).."Thêi gian: "..tonumber(date("%Y%m%d")).."[§æi 1 mãn: "..tAwardWeapon[nRoute][1][1].."]. Kı hiÖu: "..nAdd_flag);
end

function tmz_change_s2(nTbIDX)
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a gia nhËp m«n ph¸i, kh«ng thÓ tham gia.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local strtab = {
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,1,1)",tAwardCloth[nTbIDX][1][1][1][1],tAwardCloth[nTbIDX+1][1][1][1][1],tAwardCloth[nTbIDX+1][1][1][1][5],nTbIDX),
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,1,2)",tAwardCloth[nTbIDX][1][2][1][1],tAwardCloth[nTbIDX+1][1][2][1][1],tAwardCloth[nTbIDX+1][1][2][1][5],nTbIDX),
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,2,1)",tAwardCloth[nTbIDX][2][1][1][1],tAwardCloth[nTbIDX+1][2][1][1][1],tAwardCloth[nTbIDX+1][2][1][1][5],nTbIDX),
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,2,2)",tAwardCloth[nTbIDX][2][2][1][1],tAwardCloth[nTbIDX+1][2][2][1][1],tAwardCloth[nTbIDX+1][2][2][1][5],nTbIDX),
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,3,1)",tAwardCloth[nTbIDX][3][1][1][1],tAwardCloth[nTbIDX+1][3][1][1][1],tAwardCloth[nTbIDX+1][3][1][1][5],nTbIDX),
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,3,2)",tAwardCloth[nTbIDX][3][2][1][1],tAwardCloth[nTbIDX+1][3][2][1][1],tAwardCloth[nTbIDX+1][3][2][1][5],nTbIDX),
	format("[%s] n©ng cÊp thµnh [%s] (cÇn ®iÓm tİch lòy Thiªn M«n TrËn %d)/#tmz_change_s2_ask(%d,4,1)",tAwardWeapon[nRoute][nTbIDX][1],tAwardWeapon[nRoute][nTbIDX+1][1],tAwardWeapon[nRoute][nTbIDX+1][5],nTbIDX),
	"Kh«ng cã g×!/gf_DoNothing",
	};
	local sTalk = "";
	if nTbIDX == 1 then
		sTalk = "Trang bŞ [HÖ Tinh Kh¾c] cÇn ®¹t cÊp <color=yellow>80<color> míi cã thÓ trang bŞ, ";
	elseif nTbIDX == 2 then
		sTalk = "Trang bŞ [HÖ Thiªn NghÜa] cÇn ®¹t cÊp <color=yellow>85 <color> míi cã thÓ trang bŞ, ";
	end
	Say(g_NpcName..sTalk.."§iÓm tİch lòy Thiªn M«n TrËn hiÖn t¹i cña ®¹i hiÖp: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>. Khi n©ng cÊp cÇn mÆc trang bŞ trªn ng­êi, ®¹i hiÖp cÇn n©ng cÊp mãn trang bŞ nµo? <color=red>Chó ı: trang bŞ cÇn ph¶i gi¶i khãa tr­íc khi n©ng cÊp, sau khi n©ng cÊp sÏ b¶o l­u cÊp ®é c­êng hãa vµ ®Şnh hån vèn cã cña trang bŞ <color>",
		getn(strtab),
		strtab)
end

function tmz_change_s2_ask(nTbIDX,nWz,nType)
	local nRoute = GetPlayerRoute();
	local strTalk = "";
	if nWz ~= 4 then
		strTalk = format("§¹i hiÖp x¸c ®Şnh mang <color=yellow>[%s]<color> n©ng cÊp thµnh <color=yellow>[%s]<color>? CÇn cã <color=yellow>%d<color> ®iÓm tİch lòy Thiªn M«n TrËn <color=yellow>khi n©ng cÊp cÇn mÆc trang bŞ trªn ng­êi <color>",tAwardCloth[nTbIDX][nWz][nType][1][1],tAwardCloth[nTbIDX+1][nWz][nType][1][1],tAwardCloth[nTbIDX+1][nWz][nType][1][5]);
	else
		strTalk	= format("§¹i hiÖp x¸c ®Şnh mang <color=yellow>[%s]<color> n©ng cÊp thµnh <color=yellow>[%s]<color>? CÇn cã <color=yellow>%d<color> ®iÓm tİch lòy Thiªn M«n TrËn <color=yellow>khi n©ng cÊp cÇn mÆc trang bŞ trªn ng­êi <color>",tAwardWeapon[nRoute][nTbIDX][1],tAwardWeapon[nRoute][nTbIDX+1][1],tAwardWeapon[nRoute][nTbIDX+1][5]);
	end
	Say(g_NpcName..strTalk,
		3,
		"\n x¸c ®Şnh, ta muèn n©ng cÊp/#tmz_change_s2_confirm("..nTbIDX..","..nWz..","..nType..")",
		"\n kh«ng, ta chän sai råi/#tmz_change_s2("..nTbIDX..")",
		"\n Tho¸t /gf_DoNothing")
end

function tmz_change_s2_confirm(nTbIDX,nWz,nType)
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if nWz ~= 4 then
		if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardCloth[nTbIDX+1][nWz][nType][nBody][5] then
			Talk(1,"",g_NpcName.."§iÓm tİch lòy Thiªn M«n TrËn cña ®¹i hiÖp ch­a ®ñ, kh«ng thÓ n©ng cÊp trang bŞ");
			return 0;
		end
		local tWz = {0,1,3};
		local nIdx = GetPlayerEquipIndex(tWz[nWz]); --´©ÔÚÉíÉÏµÄË÷Òı
		if nIdx == 0 then  --Ã»ÓĞ´©¶«Î÷
			Talk(1,"",g_NpcName.."Mãn trang bŞ c¸c h¹ ®ang mÆc kh«ng ph¶i"..tAwardCloth[nTbIDX][nWz][nType][nBody][1]..", h·y mÆc ®óng trang bŞ trªn ng­êi!");
			return 0;
		end		
		if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
			Talk(1,"",g_NpcName.."Trang bŞ nµy ®· bŞ khãa, gi¶i khãa sau h·y n©ng cÊp!");
			return
		end
		local nId1,nId2,nId3 = GetPlayerEquipInfo(tWz[nWz]);
		if nId1 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][2] or nId2 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][3] or nId3 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][4] then
			Talk(1,"",g_NpcName.."Mãn trang bŞ c¸c h¹ ®ang mÆc kh«ng ph¶i"..tAwardCloth[nTbIDX][nWz][nType][nBody][1]..", h·y mÆc ®óng trang bŞ trªn ng­êi!");
			return 0;
		end
		local nQianghua = GetEquipAttr(nIdx,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
		local nDing5 = GetItemSpecialAttr(nIdx,"DING5"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
		local nDing10 = GetItemSpecialAttr(nIdx,"DING10"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
		if DelItemByIndex(nIdx,-1) == 1 then
			SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardCloth[nTbIDX+1][nWz][nType][nBody][5]);
			local nAdd_flag,nNewIdx = AddItem(tAwardCloth[nTbIDX+1][nWz][nType][nBody][2],tAwardCloth[nTbIDX+1][nWz][nType][nBody][3],tAwardCloth[nTbIDX+1][nWz][nType][nBody][4],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
			if nAdd_flag == 1 then
				if nDing5 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING5",1); --¶¨»ê
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING10",1); --¶¨»ê
				end
				Msg2Player("C¸c h¹ nhËn ®­îc ["..tAwardCloth[nTbIDX+1][nWz][nType][nBody][1].."]x1");
			end
			WriteLogEx(THIENMON_LOG_TITLE, "§æi trang bŞ "..". ID tr­íc khi n©ng cÊp: "..nId1..nId2..nId3.."ID sau khi n©ng cÊp: "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][2]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][3]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][4])
			WriteLog("[n©ng cÊp trang bŞ Thiªn M«n TrËn]: Tµi kho¶n: "..tostring(GetAccount()).."Nh©n vËt: "..tostring(GetName()).."Thêi gian: "..tonumber(date("%Y%m%d")).."[dïng"..tAwardCloth[nTbIDX][nWz][nType][nBody][1].."T¨ng cÊp thµnh "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][1]..". ID tr­íc khi n©ng cÊp: "..nId1..nId2..nId3.."ID sau khi n©ng cÊp: "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][2]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][3]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][4].."]. Kı hiÖu: "..nAdd_flag);
		end
	else
		if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardWeapon[nRoute][nTbIDX+1][5] then
			Talk(1,"",g_NpcName.."§iÓm tİch lòy Thiªn M«n TrËn cña ®¹i hiÖp ch­a ®ñ, kh«ng thÓ n©ng cÊp trang bŞ");
			return 0;
		end
		local nIdx = GetPlayerEquipIndex(2); --´©ÔÚÉíÉÏµÄË÷Òı
		if nIdx == 0 then  --Ã»ÓĞ´©¶«Î÷
			Talk(1,"",g_NpcName.."Mãn trang bŞ c¸c h¹ ®ang mÆc kh«ng ph¶i"..tAwardWeapon[nRoute][nTbIDX][1]..", h·y mÆc ®óng trang bŞ trªn ng­êi!");
			return 0;
		end
		if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --Ëø¶¨ÅĞ¶Ï
			Talk(1,"",g_NpcName.."Trang bŞ nµy ®· bŞ khãa, gi¶i khãa sau h·y n©ng cÊp!");
			return
		end
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 ~= tAwardWeapon[nRoute][nTbIDX][2] or nId2 ~= tAwardWeapon[nRoute][nTbIDX][3] or nId3 ~= tAwardWeapon[nRoute][nTbIDX][4] then
			Talk(1,"",g_NpcName.."Mãn trang bŞ c¸c h¹ ®ang mÆc kh«ng ph¶i"..tAwardWeapon[nRoute][nTbIDX][1]..", h·y mÆc ®óng trang bŞ trªn ng­êi!");
			return 0;
		end
		local nQianghua = GetEquipAttr(nIdx,2);--»ñÈ¡ÎïÆ·Ç¿»¯µÈ¼¶
		local nDing5 = GetItemSpecialAttr(nIdx,"DING5"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
		local nDing10 = GetItemSpecialAttr(nIdx,"DING10"); --»ñÈ¡×°±¸ÊÇ·ñ¶¨»ê
		if DelItemByIndex(nIdx,-1) == 1 then
			SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardWeapon[nRoute][nTbIDX+1][5]);
			local nAdd_flag,nNewIdx = AddItem(tAwardWeapon[nRoute][nTbIDX+1][2],tAwardWeapon[nRoute][nTbIDX+1][3],tAwardWeapon[nRoute][nTbIDX+1][4],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
			if nAdd_flag == 1 then
				if nDing5 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING5",1); --¶¨»ê
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING10",1); --¶¨»ê
				end
				Msg2Player("C¸c h¹ nhËn ®­îc ["..tAwardWeapon[nRoute][nTbIDX+1][1].."]x1");
			end
			WriteLogEx(THIENMON_LOG_TITLE, "§æi trang bŞ "..". ID tr­íc khi n©ng cÊp: "..nId1..nId2..nId3.."ID sau khi n©ng cÊp: "..tAwardWeapon[nRoute][nTbIDX+1][2]..tAwardWeapon[nRoute][nTbIDX+1][3]..tAwardWeapon[nRoute][nTbIDX+1][4])
			WriteLog("[n©ng cÊp trang bŞ Thiªn M«n TrËn]: Tµi kho¶n: "..tostring(GetAccount()).."Nh©n vËt: "..tostring(GetName()).."Thêi gian: "..tonumber(date("%Y%m%d")).."[dïng"..tAwardWeapon[nRoute][nTbIDX][1].."T¨ng cÊp thµnh "..tAwardWeapon[nRoute][nTbIDX+1][1]..". ID tr­íc khi n©ng cÊp: "..nId1..nId2..nId3.."ID sau khi n©ng cÊp: "..tAwardWeapon[nRoute][nTbIDX+1][2]..tAwardWeapon[nRoute][nTbIDX+1][3]..tAwardWeapon[nRoute][nTbIDX+1][4].."]. Kı hiÖu: "..nAdd_flag);
		end
	end
end

function tmz_about_detail()
	local strtab = {
		". Tham gia diÔn vâ/tmz_about_detail_1",
		". Quy t¾c diÔn vâ/tmz_about_detail_2",
		". PhÇn th­ëng diÔn vâ/tmz_about_detail_3",
		--"¡ô¶îÍâ½±Àø/tmz_about_detail_4",
		". Trë l¹i/main"
	};
	Say(g_NpcName.."DiÔn vâ tr­êng nµy chİnh lµ mét b¶n sao cña Thiªn M«n TrËn mµ Liªu qu©n ®· bè trİ, ta ®· lÖnh cho t­íng sÜ trong qu©n luyÖn tËp ngµy ®ªm, nay cuèi cïng ®· t×m ra huyÒn c¬ trong ®ã.",
		getn(strtab),
		strtab);
end

function tmz_about_detail_1()
	Talk(1,"tmz_about_detail",g_NpcName.."ThiÕu hiÖp cã thÓ tæ ®éi d­íi 3 ng­êi hoÆc c¸ nh©n b¸o danh tham gia. Nªn nhí thµnh viªn trong ®éi nhÊt ®Şnh ph¶i nhËn th­ëng İt nhÊt 1 lÇn tr­íc khi tham gia trËn tiÕp theo");
end

function tmz_about_detail_2()
	Talk(1,"tmz_about_detail",g_NpcName.."1, thiÕu hiÖp hoÆc thµnh viªn trong ®éi sÏ ®­îc <color=yellow>chuyÓn ngÉu nhiªn<color> ®Õn 1 n¬i trong diÔn vâ tr­êng. Khi sè ng­êi tham gian 2 bªn lín h¬n hoÆc b»ng<color=yellow>"..PLAYER_NEED_NUM.."<color>ng­êi th× chiÕn trËn sÏ b¾t ®Çu. \n  2, Khi chiÕm ®­îc TrËn Nh·n, mçi c¸ch 15 gi©y t¨ng 1 lÇn thêi gian chiÕm trËn cho phe m×nh. Thêi gian chiÕm trËn ®¹t ®Õn"..APPEAR_FLAG_POINT.."phót <color>, lËp tøc cã thÓ tÊn c«ng <color=yellow>TrËn Kú<color> (phe doanh chñ), tiªu diÖt trËn kú cã thÓ trùc tiÕp nhËn ®­îc l­îng lín thêi gian chiÕm trËn. \n  3, Thêi gian chiÕm trËn cña bÊt kú phe nµo ®¹t ®Õn <color=yellow>"..OVER_GAME_POINT.."<color>phót lËp tøc kÕt thóc trËn chiÕn. ThiÕu hiÖp sÏ nhËn ®­îc phÇn th­ëng dùa trªn biÓu hiÖn cña b¶n th©n.\n  4, Ng­êi ch¬i cã biÓu hiÖn tiªu cùc trong ®èi trËn sÏ bŞ mêi khái diÔn vâ tr­êng.");
end

function tmz_about_detail_3()
	Talk(1,"tmz_about_detail_3_2",g_NpcName..format("\n    1.	CÊu thµnh phÇn th­ëng diÔn vâ \n    PhÇn th­ëng diÔn vâ lµ phÇn th­ëng tæng hîp khi tham gia vµ ®é tİch cùc céng l¹i, khi nhËn th­ëng sÏ nhËn ®­îc c¶ 2. Mçi ngµy mçi ng­êi ch¬i chØ cã thÓ tham gia <color=green>%d<color> lÇn DiÔn Vâ.",TMZ_DAILY_AWARD_LIMIT))
end

function tmz_about_detail_3_2()
	Talk(1,"tmz_about_detail_3_3",g_NpcName..format("\n    2.	PhÇn th­ëng khi tham gia \n    ChØ cÇn tham gia vµ ®¸nh ®Õn hÕt trËn lµ cã thÓ nhËn th­ëng, phÇn th­ëng nµy cã thÓ dïng nh÷ng ®¹o cô <color=yellow>%s<color> ®Ó nh©n ®«i nhiÒu lÇn, v« cïng hÊp dÉn.","Qu©n C«ng Ch­¬ng"));
end

function tmz_about_detail_3_3()
	Talk(1,"tmz_about_detail",g_NpcName..format("\n    3.	 PhÇn th­ëng tİch cùc——§é tİch cùc\n    ®é tİch cùc lµ c¨n cødïng ®Ó ®o l­êng ng­êi ch¬i cã thÓ nhËn ®­îc phÈm chÊt vËt phÈm th­ëng, ®é tİch cùc dùa trªn <color=yellow>sè ng­êi ®¸nh b¹i ®­îc<color>, <color=yellow>tæng s¸t th­¬ng xuÊt chiªu<color>, <color=yellow>sè lÇn chiÕm lÜnh trËn nh·n<color>, <color=yellow>sè l­îng qu¸i tiªu diÖt ®­îc<color>, <color=yellow>chiÕm lÜnh trËn kú<color>… cña c¸c h¹ biÓu hiÖn trªn diÔn vâ tr­êng, ®é tİch cùc cµng cao, phÇn th­ëng cµng hÊp dÉn, ®ång thêi kh«ng thÓ dïng <color=yellow>%s<color> ®Ó nh©n ®«i phÇn th­ëng.","Qu©n C«ng Ch­¬ng"))
end

function tmz_about_detail_4()
	Talk(1,"tmz_about_detail",g_NpcName.."Vµo 12: 00 -14: 00 vµ 18: 00 - 20: 00 mçi ngµy, ng­êi ch¬i ®¨ng kı tham gia ®Êu trËn vµ nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm sÏ ®­îc nh©n ®«i. HiÖu qu¶ nµy kh«ng t¸c dông víi"..tAwardItem[1][1].." vµ"..tAwardItem[2][1].."Céng dån.")
end

function tmz_about_tong()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --Ã»Èë°ï
		Talk(1,"",g_NpcName.."Yªu cÇu gia nhËp bang héi míi cã thÓ tham gia bang héi Thiªn M«n TrËn.");
		return 0;
	end		
	local strtab = {
		"§æi Xu Tiªu Dao/tmz_Change_Xoyo_Gold",
		"§æi Ngäc Tiªu Dao (1 Hßa ThŞ Bİch ®æi ®­îc 100 Ngäc Tiªu Dao)/tmz_Change_Xoyo_Yu",
		"Tham gia bang héi Thiªn M«n TrËn xuyªn server (cÇn 200 Xu Tiªu Dao)/tmz_goto_realm",
		"NhËn th­ëng Thiªn M«n TrËn xuyªn server/tmz_tong_award",
		"Server ®èi trËn/tmz_Special_Service",
		"Giíi thiÖu ®èi trËn/tmz_tong_detail",
		"KÕt thóc ®èi tho¹i/gf_DoNothing",
	};
	Say(g_NpcName.."T×m ta cã viÖc g× kh«ng?",
		getn(strtab),
		strtab)
end

function tmz_Change_Xoyo_Gold()
	local strtab = {
		"Dïng vµng ®æi Xu Tiªu Dao (1 vµng ®æi 100 Xu Tiªu Dao)/tmz_Use_JXB",
		"trë l¹i/tmz_about_tong",
		"KÕt thóc ®èi tho¹i/gf_DoNothing",
	};
	Say(g_NpcName.."Sau khi v­ît server ngoµi <color=yellow>Xu Tiªu Dao<color> ra nh÷ng tiÒn tÖ kh¸c ®Òu kh«ng thÓ sö dông, ta cã thÓ gióp chuyÓn <color=yellow>vµng<color> thµnh Xu Tiªu Dao. ThiÕu hiÖp hiÖn ®ang së h÷u "..GetXYB().." Xu Tiªu Dao, vÒ sau cã thÓ kiÓm trang th«ng qua giao diÖn F2 (cã thÓ lµ sè ©m)",
		getn(strtab),
		strtab)
end

function tmz_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("tmz_Use_JXB_Confirm",1,nJxb*100,"§«i bao nhiªu Xu Tiªu Dao?");
end

function tmz_Use_JXB_Confirm(nCount)
	local nJxb = floor(GetCash()/10000);
	if nJxb < nCount/100 then
		Talk(1,"",g_NpcName.."TiÒn vµng c¸c h¹ mang theo kh«ng ®ñ"..nCount.."Xu Tiªu Dao.");
		return 0;
	end
	if Pay(nCount/100*10000) == 1 then
		EarnXYB(nCount);
--		Msg2Player("Äã»ñµÃ"..nCount.."åĞÒ£±Ò¡£");
	end
end

function tmz_Change_Xoyo_Yu()
	Say(g_NpcName.."X¸c ®Şnh dïng 1 [Hßa ThŞ Bİch] ®æi 100 Ngäc Tiªu Dao?",
		2,
		"\nX¸c nhËn/tmz_Change_Yu_Confirm",
		"\n Ph¶n håi/tmz_about_tong")
end

function tmz_Change_Yu_Confirm()
	if GetItemCount(2,1,1001) < 1 then
		Talk(1,"",g_NpcName.."C¸c h¹ kh«ng mang theo Hßa ThŞ Bİch.");
		return 0;
	end
	if DelItem(2,1,1001,1) == 1 then
		EarnXYY(100);
	end
end

function tmz_goto_realm()
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if ( nDay ~= 6 and nDay ~= 0 ) or ( nHour >= 18 or nHour < 14 ) then
		Talk(1,"","Thiªn M«n TrËn bang héi sÏ diÔn ra vµo 2h ~ 6h thø 7 vµ chñ nhËt h»ng tuÇn.");
		return 0;
	end
	if GetLevel() < 80 then
		Talk(1,"",g_NpcName.."Tham gia Thiªn M«n TrËn bang héi yªu cÇu ph¶i ®¹t cÊp ®é trªn 80, quay vÒ luyÖn thªm ®i.");
		return 0;
	end
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --Ã»Èë°ï
		Talk(1,"",g_NpcName.."C¸c h¹ cÇn gia nhËp bang héi míi cã thÓ tham gia Bang Héi Thiªn M«n TrËn.");
		return 0;
	end	
	--¼ÓÈë°ï»áÁ½Ìì²ÅÄÜ¿ç·ş
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 172800 then
		Say(g_NpcName.."C¸c h¹ gia nhËp bang ph¸i ch­a ®ñ 2 ngµy, kh«ng thÓ tham gia Bang Héi Thiªn M«n TrËn.", 0)
		return 0;
	end
	if GetXYB() < 200 then
		Talk(1,"",g_NpcName.."Tham gia Bang Héi Thiªn M«n TrËn cÇn <color=yellow>200 Xu Tiªu Dao<color>, c¸c h¹ mang theo kh«ng ®ñ.");
		return 0;
	end
	local nWeek = tf_GetWeekSequence(1,0); --ÖÜÒ»Áè³¿
	if GetTask(TASK_TMZ_TONG_AWARD_WEEK) ~= 0 and GetTask(TASK_TMZ_TONG_AWARD_WEEK) < nWeek then
		if GetTask(TASk_TMZ_TONG_TOTAL_NUM) ~= 0 then
			Talk(1,"",g_NpcName.."C¸c h¹ vÉn ch­a nhËn phÇn th­ëng tuÇn tr­íc, h·y nhËn råi tham gia tiÕp th«i.");
			return 0;
		end	
	end	
	if gf_JudgeRoomWeight(15,100,g_NpcName) == 0 then
		return 0;
	end;		
	if PayXYB(200) == 1 then
		SetTask(TASKID_TMZ_TONG_IS_REALM,1);
		ChangeGroupWorld(5064,1621,3181,1);
	end
end


--=================================
function tmz_tong_AddCamp(nCurMapId,nCamp)
	local nOldIndex = PlayerIndex;
	local nTeamNumber = GetTeamSize();
	local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
	if nTeamNumber > 1 then
		for i=1, nTeamNumber do
			PlayerIndex = GetTeamMember(i); 
			mf_JoinMission(MISSION_ID,nCamp,nCurMapId);
			if GetName() == GetCaptainName() then
				WriteLogEx(THIENMON_LOG_TITLE, "tæ ®éi tham gia L­¬ng S¬n B¹c")
			end
			WriteLogEx(THIENMON_LOG_TITLE, "tham gia")
			TMZ_Write_TableData(nCurN,nCamp,0,0,0);
		end
		PlayerIndex = nOldIndex;
	else
		mf_JoinMission(MISSION_ID,nCamp,nCurMapId);
		TMZ_Write_TableData(nCurN,nCamp,0,0,0);
	end	
end

function tmz_tong_join(nType)
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if ( nDay ~= 6 and nDay ~= 0 ) or ( nHour >= 18 or nHour < 14 ) then
		Talk(1,"",g_RealmNpcName.."Thiªn M«n TrËn bang héi sÏ diÔn ra vµo 2h ~ 6h thø 7 vµ chñ nhËt h»ng tuÇn.");
		return 0;
	end
	if nTeamNumber > 1 and GetName() ~= sCapTainName then
		Talk(1,"",g_RealmNpcName.."Tæ ®éi cÇn ®éi tr­ëng ®Õn b¸o danh.");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong ®éi ngò cã thµnh viªn v¾ng mÆt ");
		return 0;
	end
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong ®éi ngò cã thµnh viªn s¸t khİ qu¸ nÆng (PK>10), kh«ng thÓ vµo");
		return 0;		
	end
	if tmz_TongMemberCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong tæ ®éi cã ng­êi kh«ng thuéc cïng mét bang héi, kh«ng thÓ vµo Thiªn M«n TrËn.");
		return 0;		
	end
	if nTeamNumber == 0 then --Ã»ÓĞ×é¶Ó
		nTeamNumber = 1;
	end
	local nCurMapId,nCamp = GLB_TMZ_GetSuitMap(nTeamNumber);
	local nOldIndex = PlayerIndex; 
	if nCurMapId == nil then --°ï»áÒÑ¿ªÆôµ«²»Âú×ãÌõ¼ş
		return 0;
	end
	if nCurMapId ~= 0 then --°ï»áÒÑ¿ªÆôÇÒÂú×ãÌõ¼ş
		tmz_tong_AddCamp(nCurMapId,nCamp);
	else --°ï»á»¹Ã»¿ªÆô
		if tmz_tong_Check(nType) == 0 then
			local tMsg = {"Thiªn M«n Hæ Phï Ên İt nhÊt lµ 1 c¸i","Ngäc Tiªu Dao İt nhÊt 20 c¸i"};
			Talk(1,"",g_RealmNpcName.."Tham gia Thiªn M«n TrËn yªu cÇu cÇn <color=yellow>bang chñ, phã bang chñ, hoÆc tr­ëng l·o<color> dÉn ®éi <color=yellow>8 thµnh viªn<color> bang héi, ®ång thêi"..tMsg[nType]..".")
			return 0;
		end
		SetTaskTemp(211,nType);
		GLB_TMZ_GetOtherMap();
	end		
end

--¼ì²âÊÇ·ñ·ûºÏ¿ªÆôÌõ¼ş
function tmz_tong_Check(nType)
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		return 0;
	end
	if GetTeamSize() < 8 then
		return 0;
	end
	if nType == 2 and GetXYY() < 20 then
		return 0;
	end
	local strTongName = GetTongName()
	local nOldIndex = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetTongName() ~= strTongName then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end 
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_tong_detail()
	local strtab = {
		"Quy tr×nh ®èi trËn/#tmz_tong_detail_1(1)",
		"§iÓm bang héi ®èi trËn/#tmz_tong_detail_1(2)",
		"CÊp ®é bang héi ®èi trËn/#tmz_tong_detail_1(3)",
		"§é tİch cùc bang héi/#tmz_tong_detail_1(4)",
		"PhÇn th­ëng /#tmz_tong_detail_1(5)",
		"trë l¹i/main",
	}
	Say("C¸c h¹ muèn t×m hiÓu vÒ ph­¬ng diÖn nµo?",
		getn(strtab),
		strtab)
end

function tmz_tong_detail_1(nType)
	local strMsg = {
		[[    ±¨ÃûÍæ¼ÒµÈ¼¶Ğè´ïµ½<color=yellow>80¼¶<color>£¬²¢ÒÑ¼ÓÈë°ïÅÉ2Ìì¡£
    Íæ¼Ò¿ÉÒÔÔÚÃ¿<color=yellow>ÖÜÁù¡¢ÈÕµÄ14µã-18µã<color>£¬Í¨¹ıæôÆï½«¾ü¹ù¾ıÅô´«ËÍµ½±¨Ãû³¡µØ¡£ÔÙÍ¨¹ı½«Ğ£¹ù¾ıâù±¨Ãû²Î¼Ó¿ç·şÌìÃÅÕóÑİÎä¡£±¨ÃûÊ±£¬ĞèÒªÓÉ°ï»áµÄ°ïÖ÷¡¢¸±°ïÖ÷»òÕß³¤ÀÏ×÷Îª¶Ó³¤£¬×éÂú8ÈË¶ÓÎé£¬²¢ÏûºÄÒ»¸öÌìÃÅ»¢·ûÓ¡¡££¨½øÈëÈËÊıÉÏÏŞ¼û¶ÔÕóµÈ¼¶ËµÃ÷£©
    ÔÙ´Î½øÈë¸Ã°ïÅÉÒÑ¿ªÆôµÄ³¡µØÎŞĞèÏûºÄÌìÃÅ»¢·ûÓ¡£¬Ã¿¸ö°ï»áÍ¬Ò»Ê±¼ä×î¶à¿ªÆôÒ»³¡ÌìÃÅ¶ÔÕó¡£
    <color=yellow>Ã¿¸ö°ï»áÃ¿ÖÜ¿É»ñµÃ8¸öÌìÃÅ»¢·ûÓ¡<color>£¬µ±ÖÜ²»ÓÃ×÷·Ï¡£Èç¹û¶ÔÕóÎ´¿ªÆô£¬½«²¹³¥Íæ¼ÒÌìÃÅ»¢·ûÓ¡¡£]],
		[[   °ï»á¶ÔÕó»ı·ÖÊÇ°ï»á²Î¼Ó¿ç·şÌìÃÅÕóÑİÎäºóµÄÊıÖµ£¬ËüÔÚÃ¿³¡¾ö³öÊ¤¸ººó·¢Éú±ä»¯¡£°ï»á¶ÔÕó»ı·Ö¿ÉÔÚ°ï»áÃæ°å²éÑ¯¡£
    °ï»á¶ÔÕó»ı·ÖÇ°¶şÊ®Ãû£¬¿ÉÒÔÔÚPVPÌìÃÅÕóÃæ°å²éÑ¯(Ã¿ÖÜÈÕÁè³¿Ë¢ĞÂ£¬³¬¹ı300·ÖÔò¶à³ö²¿·Ö¶Ô°ëË¥¼õ£©¡£]],
		[[    °ï»á¶ÔÕóµÈ¼¶ÊÇÓÃÀ´ºâÁ¿°ï»áÔÚ¿ç·şÌìÃÅÕóÖĞµÄÊµÁ¦£¬ËüÓÉ°ï»á¶ÔÕó»ı·Ö¾ö¶¨¡£ÆäÖĞ£¬<color=yellow>2¼¶ĞèÒª150·Ö£¬3¼¶ĞèÒª190·Ö<color>¡£
    ²»Í¬µÄ°ï»á¶ÔÕóµÈ¼¶£¬ÔÊĞí½øÈëµÄ×î´óÈËÊı²»Í¬¡£ÆäÖĞÒ»¼¶¶ÔÓ¦8ÈË£¬¶ş¼¶¶ÔÓ¦12ÈË£¬Èı¼¶¶ÔÓ¦16ÈË¡£Ö»ÓĞÏàÍ¬¶ÔÕóµÈ¼¶µÄ°ï»á£¬²Å±»ÔÊĞíÔÚÒ»ÆğÑİÎä¡£]],
		[[    °ï»áÔÚ²Î¼ÓÃ¿³¡ÌìÃÅÕóÑİÎäµÄÊ±ºò£¬¾ù»áÓĞ°ï»á»îÔ¾¶ÈµÄÅĞ¶¨¡£°ï»á»îÔ¾¶ÈÓë¸öÈË»îÔ¾¶ÈÏà¹Ø¡£
    µ±Ò»´Î¶ÔÕóÖĞ£¬ÓĞ³¬¹ı×¼ÈëÈËÊı°ëÊıµÄ°ïÖÚÍê³É¸öÈË»îÔ¾¶ÈÅĞ¶¨£¬Ôò´Ë´Î¶ÔÕó·½±»ÈÏ¶¨ÎªÓĞĞ§³¡´Î£¬<color=yellow>ÇÒ²Î¼Ó¸Ã³¡¶ÔÕóµÄ¸Ã°ïÅÉÍæ¼Ò¶¼ÈÏ¶¨Îª¸öÈË»îÔ¾¶ÈÓĞĞ§<color>¡£Ã¿¸ö°ï»áĞèÂú×ãÖÁÉÙ3³¡ÓĞĞ§³¡´Î£¬²Å¿ÉÔÚÏÂÖÜ¿ª·Å°ï»á½±Àø¡£]],
		[[    Ã¿³¡¶ÔÕó½áÊøºó£¬Íæ¼Ò¸ù¾İÊ¤¸ºÇé¿ö¿ÉÒÔÔÚ¹ù¾ıÅô´¦ÁìÈ¡¶ÔÓ¦ÊıÁ¿µÄ¾üĞè°ü£¬ÆäÖĞ¾üĞè°ü¹²·Ö4¸öµÈ¼¶£¬²»Í¬µÈ¼¶µÄ¾üĞè°ü¿É»ñµÃ²»Í¬ÎïÆ·µÄ½±Àø¡£Ã¿ÖÜ½±Àø£º±¾ÖÜ²Î¼ÓÖÁÉÙ3³¡ÓĞĞ§°ï»á¶ÔÕóµÄÍæ¼Ò£¬ÔÚÏÂÖÜ²Å¿ÉÁìÈ¡ÏàÓ¦¶ÔÕóµÈ¼¶µÄ°ï»á½±Àø¡£ÁìÈ¡ÒÀ¾İ°´ÕÕ±¾ÖÜ24µã½ØÖ¹Ê±»ı·ÖÇé¿ö£¬½±Àø°üÀ¨´óÁ¿¾­Ñé¡¢ÌìÃÅÕó»ı·ÖºÍåĞÒ£±ÒµÈ¡£
\p    ¶ÔÕó»ı·Ö´ïµ½400·Ö°ï»áµÄ°ïÖÚ£¨Ğè²Î¼Ó¹ı±¾ÖÜ3³¡ÓĞĞ§¶ÔÕó£©£¬ÏÂÖÜÁìÈ¡½±ÀøÊ±¿É¶îÍâ»ñµÃ<color=yellow>ÌØĞ§³ÆºÅ¡°ÌìÃÅÈºĞÛ¡±<color>£¬°ïÖ÷¿É»ñµÃ<color=yellow>ÌØĞ§³ÆºÅ¡°ÌìÃÅÓ¢½Ü¡±<color>¡£
    ¶ÔÕó»ı·Ö´ïµ½300ÇÒ»ı·Ö×î¸ß°ï»áµÄ°ïÖÚ£¨Ğè²Î¼Ó¹ı±¾ÖÜ3³¡ÓĞĞ§¶ÔÕó£©£¬ÏÂÖÜÁìÈ¡½±ÀøÊ±¿É¶îÍâ»ñµÃ<color=yellow>ÌØĞ§³ÆºÅ¡°ÌìÃÅÈºÓ¢¡±<color>£¬°ïÖ÷¿É»ñµÃ<color=yellow>ÌØĞ§³ÆºÅ¡°ÌìÃÅÓ¢ºÀ¡±<color>]],
	};
	suTalk("tmz_tong_detail",strMsg[nType]);
end

function tmz_tong_back()
	Say(g_RealmNpcName.."C¸c h¹ x¸c ®Şnh muèn trë vÒ?",
		2,
		"\nX¸c nhËn/tmz_tong_confirm_back",
		"\nKÕt thóc ®èi tho¹i/gf_DoNothing")
end

function tmz_tong_confirm_back()
	ChangeGroupWorld(350,1428,2818,0);
end

tUpLvXoYoYu = {200,600};

function tmz_Special_Service()
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		Talk(1,"",g_NpcName.."Server ®èi trËn cã thÓ n©ng cao cÊp ®é ®èi trËn cña bang héi, yªu cÇu bang chñ, phã bang chñ hoÆc tr­ëng l·o tiÕn hµnh thao t¸c nµy.");
		return 0;
	end
	DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_sv_1");
end

function tmz_tong_callback_sv_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0);
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nBattleLv = tbTongData[2] or 1;
	local strtab = {
		"Sö dông "..tUpLvXoYoYu[1].." Ngäc tiªu dao gióp cÊp ®é bang héi n©ng thµnh cÊp 2/#tmz_Special_Service_1(1,"..nBattleLv..","..nTongScore..")",
		"Sö dông "..tUpLvXoYoYu[2].." Ngäc tiªu dao gióp cÊp ®é bang héi n©ng thµnh cÊp 3/#tmz_Special_Service_1(2,"..nBattleLv..","..nTongScore..")",
		"trë l¹i/tmz_about_tong",
		"KÕt thóc ®èi tho¹i/gf_DoNothing"
	};
	Say(g_NpcName.."CÊp ®é chiÕn ®Êu cña quı bang ph¸i lµ: <color=yellow>"..nBattleLv.."<color>",
		getn(strtab),
		strtab)	
end

function tmz_Special_Service_1(nType,nBattleLv,nTongScore)
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		Talk(1,"",g_NpcName.."Bang chñ bang héi, phã bang chñ hoÆc tr­ëng l·o cã thÓ tiÕn hµnh thao t¸c nµy.");
		return 0;
	end
	if nBattleLv > nType then
		Talk(1,"",g_NpcName.."CÊp ®é cña quı bang ph¸i ®· ®¹t ®Õn <color=yellow>"..nBattleLv.."<color>");
		return 0;
	end
	local nTongType = 0;
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nTongType = i;
			break;
		end
	end
	if nTongType > nType then
		Talk(1,"",g_NpcName.."§iÓm tİch lòy quı bang ph¸i ®· ®¹t ®Õn <color=yellow>"..nTongScore.."<color>,  cÊp ®é ®· ®¹t ®Õn <color=yellow>"..nTongType.."<color>");
		return 0;		
	end
	local nXoYoYu = GetXYY();
	if nXoYoYu < tUpLvXoYoYu[nType] then
		Talk(1,"",g_NpcName.."N©ng cÊp cÇn"..tUpLvXoYoYu[nType].."Ngäc Tiªu Dao, c¸c h¹ mang theo kh«ng ®ñ.");
		return 0;
	end
	Say(g_NpcName.."X¸c ®Şnh dïng<color>"..tUpLvXoYoYu[nType].."Ngäc Tiªu Dao gióp bang héi n©ng cÊp thµnh "..(nType+1).."Kh«ng?",
		2,
		"\nX¸c nhËn/#tmz_Special_Service_2("..nType..")",
		"\n Ph¶n håi/tmz_Special_Service")
end

function tmz_Special_Service_2(nType)
	SetTaskTemp(212,nType);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_sv_2");	
end

function tmz_tong_callback_sv_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0);
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nOldScore = nTongScore;
	local nBattleLv = tbTongData[2] or 1;
	local nWeekWin = tbTongData[3] or 0;
	local nWeekLose = tbTongData[4] or 0;
	local nTotalWin = tbTongData[5] or 0;
	local nTotalLose = tbTongData[6] or 0;
	local nLastWin = tbTongData[7] or 0;
	local nHufu = tbTongData[8] or MAX_HUFU;	
	local nType = GetTaskTemp(212);
	if nType == 0 then
		return 0;
	end
	nTongScore = tTongScoreLv[nType][1];
	nBattleLv = tTongScoreLv[nType][2]+1;
	if PayXYY(tUpLvXoYoYu[nType]) == 1 then		
		tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
		Talk(1,"","CÊp ®é bang héi Thiªn M«n TrËn cña c¸c h¹ lµ"..nBattleLv.."CÊp!")
		WriteLogEx(THIENMON_LOG_TITLE, format("[N©ng cÊp bang héi Thiªn M«n TrËn][Bang héi: %s n©ng cÊp thµnh %d. §iÓm tİch lòy tr­íc khi n©ng cÊp: %d, ®iÓm tİch lòy sau khi n©ng cÊp: %d.]",strTongName,nBattleLv,nOldScore,nTongScore))
		WriteLog(format("[N©ng cÊp bang héi Thiªn M«n TrËn][Bang héi: %s n©ng cÊp thµnh %d. §iÓm tİch lòy tr­íc khi n©ng cÊp: %d, ®iÓm tİch lòy sau khi n©ng cÊp: %d.]",strTongName,nBattleLv,nOldScore,nTongScore));
	end
end

function tmz_tong_award()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --Ã»Èë°ï
		Talk(1,"",g_NpcName.."C¸c h¹ cÇn gia nhËp bang héi míi cã thÓ nhËn th­ëng.");
		return 0;
	end	
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);	
	local strtab = {
		"NhËn phÇn th­ëng trËn tham gia tuÇn tr­íc/tmz_tong_award_1",
		"NhËn phÇn th­ëng bang héi tham gian tuÇn tr­íc/tmz_tong_award_2",
		"KÕt thóc ®èi tho¹i/gf_DoNothing",
	};
	Say(g_NpcName.."Dùa trªn biÓu hiÖn tuÇn tr­íc cña c¸c h¹, cã thÓ nhËn ®­îc <color=yellow>"..nWeekWin.."<color>trËn th¾ng trËn hßa <color=yellow>"..nWeekLose.."<color>phÇn th­ëng trËn thua.",
		getn(strtab),
		strtab)
end

function tmz_tong_award_1()
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nWeekWin+nWeekLose <= 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ kh«ng tham gia Bang Héi Thiªn M«n TrËn tuÇn tr­íc hoÆc ®· nhËn phÇn th­ëng.");
		return 0
	end	
	local nLv = GetLevel();
	local nExp1 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3*1.35),floor((400+(nLv-85)*28)*10000/3*1.35),floor(5120000/3*1.35));
	local nExp2 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3),floor((400+(nLv-85)*28)*10000/3),floor(5120000/3));
	Say(g_NpcName.."Dùa trªn kÕt qu¶ biÓu hiÖn trong trËn Thiªn M«n TrËn tuÇn tr­íc, c¸c h¹ cã thÓ nhËn ®­îc <color=yellow>"..floor(nExp1*nWeekWin+nExp2*nWeekLose).."<color> ®iÓm kinh nghiÖm vµ <color=yellow>"..(nWeekWin*3+nWeekLose*1).."<color> DiÔn Vâ Bao, cã nhËn ngay kh«ng?",
		4,
		"Ta muèn nhËn (gÊp 2 lÇn kinh nghiÖm s½n cã)/#tmz_tong_award_1_1(0)",
		"§ång ı"..(nWeekWin+nWeekLose).."C¸i ["..tAwardItem[1][1].."] nhËn (kinh nghiÖm b»ng "..tAwardItem[1][5].."LÇn)/#tmz_tong_award_1_1(1)",
		"§ång ı"..(nWeekWin+nWeekLose).."C¸i ["..tAwardItem[2][1].."] nhËn (kinh nghiÖm b»ng "..tAwardItem[2][5].."LÇn)/#tmz_tong_award_1_1(2)",
		"T¹m thêi kh«ng nhËn/gf_DoNothing")	
end

function tmz_tong_award_1_1(nType)
	local strMsg = "Kh«ng sö dông bÊt cø hæ phï";
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nType ~= 0 then
		strMsg = "sö dông <color=yellow>"..(nWeekWin+nWeekLose).."c¸i"..tAwardItem[nType][1].."<color>";
	end
	Say(g_NpcName.."X¸c ®Şnh"..strMsg.."NhËn th­ëng kh«ng?",
		3,
		"\n §óng, ta muèn nhËn th­ëng/#tmz_tong_award_1_2("..nType..")",
		"\n ta chän sai råi/tmz_tong_award_1",
		"\n t¹m thêi ch­a muèn/gf_DoNothing");
end

function tmz_tong_award_1_2(nType)
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nWeekWin+nWeekLose <= 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ kh«ng tham gia Bang Héi Thiªn M«n TrËn tuÇn tr­íc hoÆc ®· nhËn phÇn th­ëng.");
		return 0
	end	
	local nLv = GetLevel();
	local nExp1 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3*1.35),floor((400+(nLv-85)*28)*10000/3*1.35),floor(5120000/3*1.35));
	local nExp2 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3),floor((400+(nLv-85)*28)*10000/3),floor(5120000/3));
	local nTotalExp = floor(nExp1*nWeekWin+nExp2*nWeekLose);
	local nBagCount = (nWeekWin*3+nWeekLose*1);
	local nBagCount2 = nWeekWin+nWeekLose;
	local nItemArg = 2;
	if nType ~= 0 then
		nItemArg = tAwardItem[nType][5];
		if GetItemCount(tAwardItem[nType][2],tAwardItem[nType][3],tAwardItem[nType][4]) < nBagCount2 then
			Talk(1,"",g_NpcName.."Mang theo trªn ng­êi"..tAwardItem[nType][1].."Kh«ng ®ñ"..nBagCount2..".");
			return 0;
		end
	end
	if gf_Judge_Room_Weight(5,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nLastExp = nTotalExp*nItemArg;
	if nType ~= 0 then
		if DelItem(tAwardItem[nType][2],tAwardItem[nType][3],tAwardItem[nType][4],nBagCount2) ~= 1 then
			return 0;
		end
	end
	SetTask(TASk_TMZ_TONG_WEEK_WIN,0);
	SetTask(TASk_TMZ_TONG_WEEK_LOSE,0);
	ModifyExp(nLastExp);
	Msg2Player("B¹n nhËn ®­îc "..nLastExp.." ®iÓm kinh nghiÖm");
	gf_SetLogCaption("Bang héi Thiªn M«n TrËn");
	for i=1,nBagCount do
		local nRand = random(1,100);
		if nRand <= 2 then
			gf_AddItemEx({2,95,692,1},"DiÔn Vâ Nguyªn So¸i Bao");
		elseif nRand <= 4 then
			gf_AddItemEx({2,95,693,1},"DiÔn Vâ T­íng Qu©n Bao");
		elseif nRand <= 14 then
			gf_AddItemEx({2,95,694,1},"DiÔn Vâ Tiªn Phong Bao");
		else
			gf_AddItemEx({2,95,695,1},"DiÔn Vâ SÜ Binh Bao");
		end
	end
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20100722 and nDate <= 20100815 then
		gf_AddItemEx({2,95,697,nBagCount2},"Thiªn M«n L¹c Bao")
	end
	gf_SetLogCaption("");
end

tTongAward = {
	{400,12,30,3000},
	{300,12,30,3000},
	{260,12,30,3000},
	{220,12,30,3000},
	{200,11,30,2000},
	{180,10,30,2000},
	{160,9,30,2000},
	{140,8,30,1500},
	{120,7,30,1500},
	{100,6,30,1500},
};

function tmz_tong_award_2()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --Ã»Èë°ï
		Talk(1,"",g_NpcName.."C¸c h¹ cÇn gia nhËp bang héi míi cã thÓ nhËn th­ëng.");
		return 0;
	end	
	local nWeek = tf_GetWeekSequence(1,0); --ÖÜÒ»Áè³¿
	if GetTask(TASK_TMZ_TONG_AWARD_WEEK) == 0 or GetTask(TASK_TMZ_TONG_AWARD_WEEK) >= nWeek then
		Talk(1,"",g_NpcName.."H·y quay l¹i nhËn th­ëng vµo tuÇn sau.");
		return 0;
	end	
	local nWeekTotal = GetTask(TASk_TMZ_TONG_TOTAL_NUM);
	if nWeekTotal <= 0 then
		Talk(1,"",g_NpcName.."C¸c h¹ kh«ng tham gia Bang Héi Thiªn M«n TrËn tuÇn tr­íc hoÆc ®· nhËn phÇn th­ëng.");
		return 0
	end	
	if nWeekTotal < 3 then
		SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
		Talk(1,"",g_NpcName.."Dùa trªn biÓu hiÖn cña tuÇn tr­íc, kh«ng thÓ nhËn phÇn th­ëng cña bang héi (tham gia İt nhÊt 3 trËn ®èi chiÕn).");
		return 0;
	end
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_award_callback_1");		
end

function tmz_tong_award_callback_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzTong = SDB(szkey,0,0);	
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 0;
	local nTongType = 0; 
	for i = 1,getn(tTongAward) do
		if nTongScore >= tTongAward[i][1] then
			nTongType = i;
			break;
		end
	end
	if nTongType == 0 then
		SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
		Talk(1,"",g_NpcName.."§iÓm tİch lòy cña quı bang héi ch­a ®¹t yªu cÇu (100 ®iÓm)");
		return 0;
	end
	if gf_Judge_Room_Weight(2,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nExp = floor(tTongAward[nTongType][2]*GetLevel()*GetLevel()*240);
	SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
	gf_Modify("Exp",nExp);
	local nTmzMark = tTongAward[nTongType][3];
	SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)+nTmzMark);
	Msg2Player("B¹n nhËn ®­îc "..nTmzMark.."§iÓm tİch lòy Thiªn M«n TrËn");
	WriteLogEx(THIENMON_LOG_TITLE, "nhËn "..nTmzMark.." ®iÓm tİch lòy Thiªn M«n TrËn")
	WriteLog("[ChiÕn tr­êng Thiªn M«n TrËn]: tµi kho¶n: "..tostring(GetAccount())..", tªn: "..tostring(GetName())..", thêi gian: "..tonumber(date("%Y%m%d"))..", [®· nhËn "..nTmzMark.."§iÓm tİch lòy Thiªn M«n TrËn]");
	if GetTask(TASKID_TMZ_AWARD_MARK) > MAX_MARK then
		SetTask(TASKID_TMZ_AWARD_MARK,MAX_MARK);
		Msg2Player("Giíi h¹n ®iÓm tİch lòy Thiªn M«n TrËn lµ: "..MAX_MARK..", ®iÓm tİch lòy cña c¸c h¹ ®· ®¹t giíi h¹n.");
	end	
	local nXoyoB = tTongAward[nTongType][4];
	if nXoyoB ~= 0 then
		EarnXYB(nXoyoB);
	end
	local tStone = {
		{
			{"Kim Tinh",2,201,2},
			{"Méc Tinh",2,201,4},
			{"Thñy Tinh",2,201,6},
			{"Háa Tinh",2,201,8},
			{"Thæ Tinh",2,201,10}
		},
		{
			{"HuyÒn Th¹ch Kim Tinh",2,201,3,170,0},
			{"PhØ Thóy Méc Tinh",2,201,5,170,0},
			{"NguyÖt Hoa Thñy Tinh",2,201,7,170,0},
			{"Cöu HuyÒn Háa Tinh",2,201,9,170,0},
			{"Ng­ng Ngäc Thæ Tinh",2,201,11,170,0},
		}};
--	if nTongType == 3 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[1][nRand][2],tStone[1][nRand][3],tStone[1][nRand][4],1},tStone[1][nRand][1]);
--	elseif nTongType == 4 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[1][nRand][2],tStone[1][nRand][3],tStone[1][nRand][4],1},tStone[1][nRand][1]);	
--		gf_AddItemEx({2,201,12,2,4},"ïÖ½ğ");
--	elseif nTongType == 5 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[2][nRand][2],tStone[2][nRand][3],tStone[2][nRand][4],1},tStone[2][nRand][1]);		
--	end
	--¸ø³ÆºÅ
	if nTongScore >= 400 then
		if IsTongMember() == 1 then
			RemoveTitle(2,12);
			RemoveTitle(2,13);
			AddTitle(2,13);
			SetTitleTime(2, 13, GetTime() + 7*24*3600);
			SetCurTitle(2, 13);
			Msg2Player("NhËn ®­îc danh hiÖu [Thiªn M«n Anh KiÖt]!");
		else
			RemoveTitle(2,12);
			RemoveTitle(2,13);
			AddTitle(2,12);
			SetTitleTime(2, 12, GetTime() + 7*24*3600);
			SetCurTitle(2, 12);	
			Msg2Player("NhËn ®­îc danh hiÖu [Thiªn M«n QuÇn Hïng]!");		
		end
	end
	if nTongScore >= 300 then
		DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_2,0,0);
		local tbTmzRank = SDB(TMZ_TONG_RELAY_KEY_2,0,0,2);
		tbTmzRank:apply(g_szThisFile,"tmz_tong_award_callback_2");	
	end
end

function tmz_tong_award_callback_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzRank = SDB(TMZ_TONG_RELAY_KEY_2,0,0,2);
	local strTongName,nTongScore = tbTmzRank[0][1],tbTmzRank[0][2];
	local strGruop = "";
	strGruop,strTongName = GLB_TMZ_GetRealmName(strTongName);
	local nCurTongName = GetTongName();
	if nCurTongName == strTongName then
		if IsTongMember() == 1 then
			RemoveTitle(2,14);
			RemoveTitle(2,15);
			AddTitle(2,15);
			SetTitleTime(2, 15, GetTime() + 7*24*3600);
			SetCurTitle(2, 15);
			Msg2Player("NhËn ®­îc danh hiÖu [Thiªn M«n Hµo KiÖt]");
		else
			RemoveTitle(2,14);
			RemoveTitle(2,15);
			AddTitle(2,14);
			SetTitleTime(2, 14, GetTime() + 7*24*3600);
			SetCurTitle(2, 14);	
			Msg2Player("NhËn ®­îc danh hiÖu [Thiªn M«n QuÇn Anh]!");		
		end		
	end
end

--ÕÒÊÇ·ñÓĞ¶ÔÊÖ¿ÕÎ»
function GLB_TMZ_GetOtherMap()
	DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_1");
end

function tmz_tong_callback_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0,3);
	local nType = GetTaskTemp(211);
	local strTongName = GetTongName();
	local strCurName = GLB_TMZ_GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nBattleLv = tbTongData[2] or 0;
	local nWeekWin = tbTongData[3] or 0;
	local nWeekLose = tbTongData[4] or 0;
	local nTotalWin = tbTongData[5] or 0;
	local nTotalLose = tbTongData[6] or 0;
	local nLastWin = tbTongData[7] or 0;
	local nHufu = tbTongData[8] or MAX_HUFU;	
	local nMaxNum = 0;
	local nSuitMapId = 0;
	if nType == 1 and nHufu < 1 then
		Talk(1,"",g_RealmNpcName.."Quı bang héi kh«ng cßn [Thiªn M«n Hæ Phï Ên] n÷a, h·y sö dông [Ngäc Tiªu Dao] b¸o danh.");
		return 0;
	elseif nType == 2 and GetXYY() < 20 then
		Talk(1,"",g_RealmNpcName.."§¹i hiÖp ch­a cã 20 [Ngäc Tiªu Dao].");
		return 0;
	end
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nBattleLv = tTongScoreLv[i][2];
			nMaxNum = tTongScoreLv[i][3];
			break;
		end
	end
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	if getn(tbMapID) > 1 then	
		for i=1,getn(tbMapID) do
			if mf_GetPlayerCount(MISSION_ID,CampTwo_ID,tbMapID[i]) == 0 and mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_PEACE then
				if mf_GetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,tbMapID[i]) == nMaxNum then
					nSuitMapId = tbMapID[i];
					break;
				end
			end
		end	
	end
	if nSuitMapId == 0 then --Ã»ÓĞĞÂ¿ªÒ»¸ö
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_RealmNpcName.."TÊt c¶ b¶n ®å ®Òu ®· ®Çy, h·y quay l¹i sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("Tû lÖ chiÕm trËn: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			if nType == 1 and nHufu >= 1 then
				nHufu = nHufu-1;
				tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
			elseif nType == 2 and GetXYY() >= 20 then
				PayXYY(20);
				GLB_TMZ_SetTask(0,3);--Í¬²½åĞÒ£Óñ
			else
				return 0;
			end
			tmz_tong_AddCamp(nRoomID,CampOne_ID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_SCORE,nTongScore,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,nMaxNum,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_LV,nBattleLv,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_WEEK_WIN,nWeekWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_WEEK_LOSE,nWeekLose,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_TOTAL_WIN,nTotalWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_TOTAL_LOSE,nTotalLose,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_LAST_WIN,nLastWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_HUFU,nHufu,nRoomID);
			mf_SetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPONE_NAME,strCurName,nRoomID);								
		end			
	else --¼ÓÈëÕóÓª2
		if nType == 1 and nHufu >= 1 then
			nHufu = nHufu-1;
			tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
		elseif nType == 2 and GetXYY() >= 20 then
			PayXYY(20);
			GLB_TMZ_SetTask(0,3);--Í¬²½åĞÒ£Óñ
		else
			return 0;
		end	
		tmz_tong_AddCamp(nSuitMapId,CampTwo_ID);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_SCORE,nTongScore,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_MAX,nMaxNum,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_LV,nBattleLv,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_WEEK_WIN,nWeekWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_WEEK_LOSE,nWeekLose,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_TOTAL_WIN,nTotalWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE,nTotalLose,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_LAST_WIN,nLastWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_HUFU,nHufu,nSuitMapId);		
		mf_SetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPTWO_NAME,strCurName,nSuitMapId);
	end	
end


function tmz_get_GlbExp(...)
	if arg.n ~= 5 then
		return 0;
	end
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{arg[1],arg[2],arg[3],arg[4],arg[5]}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp;	
end
