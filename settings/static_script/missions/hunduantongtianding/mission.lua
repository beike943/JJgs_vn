Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\online_activites\\task_values.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

---------------------------------------------------------
function main()
	local nNpcIDX = GetTargetNpc();
	local tCurPhase = this.msPhases[1]:getPhase();
	if GetMissionV(this.mv23) ~= 0 then
		local nStep = GetMissionV(MV_STAGE);
		if nStep == 7 or nStep == 8 then
			Say("Më B¶o R­¬ng Th«ng Thiªn míi cã thÓ rêi ¶i",1,"\nTa biÕt råi/ttd_nothing");
			return 0;
		else
			Say("Më B¶o R­¬ng Th«ng Thiªn míi cã thÓ vµo ¶i tiÕp theo",1,"\nTa biÕt råi/ttd_nothing");--,"\nÀë¿ª¹Ø¿¨/ttd_askClose");
			return 0;
		end
	end
	if tCurPhase and tCurPhase.onTalk then
		--print("main")
		tCurPhase:onTalk(nNpcIDX);
	end
end

function onPlayerDeath(nkiller)
	local tCurPhase = this.msPhases[1]:getPhase();
--	print("tCurPhase ,",tCurPhase)
--	print("tCurPhase.onPlayerDeath ,",tCurPhase.onPlayerDeath)
	if tCurPhase and tCurPhase.onPlayerDeath then
--		print("tCurPhase:onPlayerDeath")
		tCurPhase:onPlayerDeath(nkiller);
	end
end

function onNpcDeath(npcIdx, f, x)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onNpcDeath then
		tCurPhase:onNpcDeath(npcIdx);
	end
end

function OnDeath(id, f, x)
--	print("OnDeath",PlayerIndex, id, f, x);
--	print("PlayerIndex =",PlayerIndex);
--	print("f = ",f);
--	print("x = ",x)
	if f == nil then
		--print(format("onPlayerDeath(%d)",id));
		onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
		--print(format("onNpcDeath(%d)",id));
		--print("id =",GetNpcName(id));
		--print("x =",GetNpcName(x));
		onNpcDeath(id, f, x);
	end
end

function onTrap(id)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onTrap then
		tCurPhase:onTrap(id);
	end
end
----------------------------------------------------------------------
--cycPhase.DEBUG = 1;

function cycPhase:onPlayerDeath(nkiller)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1474*32,2961*32); --ÁÙÊ±ÖØÉúµã
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "Tr­íc khi v­ît ¶i",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight00:createSomeNpc()
	local nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
	ttd_ChangeNpc2Talk(nNpcIDX);
	nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tPos.lf);
	ttd_ChangeNpc2Talk(nNpcIDX);
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight00.init()
	self = stageFight00;
	--³õÊ¼Çå³ý»º´æ-----------------------------------
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		tNpcInfo[m] = {};
	end
	--------------------------------------------------

	SetMissionV(this.mv21,0);
	SetMissionV(this.mv23,0);
	self:createSomeNpc();
	local tTraps = {
		{m, {1468,2944},{1468,2964}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
		{m, {1468,2944},{1490,2944}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
		{m, {1490,2944},{1490,2964}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
		{m, {1490,2964},{1468,2964}, "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap8.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight00.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight00.checkPos()
	self = stageFight00;
	local nLFidx = ttd_findNpc("H­íng VÊn Thiªn");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	local nDialog = GetMissionV(this.mv21);
--	if nDialog ~= 0 then
		if nDialog >= 10 then --·Ï»°ËµÍê¿ª¸ã
			self:onFinish();
		else
			SetMissionV(this.mv21,nDialog+1);
			local tDialogs = {
				{nQRSidx,"N¬i nµy lµ Th«ng Thiªn HuyÔn C¶nh, h·y b¶o träng, l¸t n÷a khã tr¸nh khái mét trËn ®¹i chiÕn. "},
				{nLFidx,"ThÇn Gi¸o Tinh Anh ®· tô tËp ®Çy ®ñ, cã thÓ tÊn c«ng bÊt cø lóc nµo."},
				{nQRSidx,"TÊn c«ng!"},
				{nLFidx,"PhÝa tr­íc lµ S¬n M«n kh«ng biÕt ai ®ang trÊn thñ."},
				--{nLFidx,"´Ë´¦ÊÇÉ½ÃÅÒªµÀ£¬Í¨ÌìÀÏ×æÊì¶ÁÖÐÔ­±øÊé£¬±ØÓÐÇ¿ÈËÔÚ´ËÕòÊØ£¬ÇïÊ¦ÃÃÍòÍò²»¿ÉÇáµÐ¡£"},
			};
			if mod(nDialog+1,2) == 0 then
				local tTemp = tDialogs[(nDialog+1)/2];
				if tTemp then
					NpcChat(tTemp[1],tTemp[2]);
				end
			end
		end
--	end
end

----------------------------------------------------------------------
stageFight00 = inherit(cycPhase, stageFight00);

stageFight00.actions = {
	[1] = stageFight00.init,
};
stageFight00.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight00.checkPos,
	},
};
----------------------------------------------------------------------

stageFight0 = {
	name = "B÷a tèi cuèi cïng",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight0:createSomeNpc()
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	if nNpcIDX == 0 then
		nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
		ttd_ChangeNpc2Talk(nNpcIDX);
	end
	local nNpcIDX = ttd_findNpc("H­íng VÊn Thiªn");
	if nNpcIDX == 0 then
		nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tPos.lf);
		ttd_ChangeNpc2Talk(nNpcIDX);
	end
	ttd_createWRD(); --ÎâÈÊµÀ
	this:Msg2MSAll("§éi tr­ëng h·y ®èi tho¹i víi NhËm Doanh Doanh më ¶i!");
	this.msCamp:turnPlayer(0,HeadMsg2Player,"§éi tr­ëng h·y ®èi tho¹i víi NhËm Doanh Doanh më ¶i!");
end

function stageFight0:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n Më ¶i thø 1: HuyÕt ChiÕn S¬n M«n/#stageFight0.gotoOne(1)",
			"\n Më ¶i thø 1: HuyÕt ChiÕn S¬n M«n (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight0.gotoOne(2)",
			"\n rêi ¶i/ttd_askClose",
			"\nKÕt thóc ®èi tho¹i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: T¹i h¹ nhÊt ®Þnh ph¶i t×m ®­îc cha.",
			getn(strtab),
			strtab)
	end
end

function ttd_tiaoguan()
	local strtab = {
		"¶i thø 2/#ttd_tg_choose(2)",
		"¶i thø 3/#ttd_tg_choose(3)",
		"¶i thø 4/#ttd_tg_choose(4)",
		"¶i thø 5/#ttd_tg_choose(5)",
		"¶i thø 6/#ttd_tg_choose(6)",
		"¶i thø 7/#ttd_tg_choose(7)",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	Say("§ång ®¹o ®i ®©u?",
		getn(strtab),
		strtab)
end

function ttd_tg_choose(nType)
	local nCurState = nType-1
	local tcurPhaseLv = {2,4,6,8,10,12,14,14};
	if nCurState == 7 then
		nCurState = nCurState - 1;
	end
	SetMissionV(MV_STAGE,nCurState);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tbResetPos[nCurState][1],tbResetPos[nCurState][2]);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	local nCurLv = tcurPhaseLv[nType];
	SetMissionV(firePhases.curPhaseLv,nCurLv);
	local tCurPhase = firePhases:getPhase();
	tCurPhase:onInit(firePhases);
end

function stageFight0.gotoOne(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv1,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[1]);
	SetNpcActivator(nNpcIDX);
	nNpcIDX = ttd_findNpc("H­íng VÊn Thiªn");
	ttd_ChangeNpc2Fight(nNpcIDX);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[1]);
--	ds_HDTTD:AddStatValue(1,3+nType,1);
end

function stageFight0.init()
--	print("GetMissionV(MV_MAP_ID)",GetMissionV(MV_MAP_ID))
	self = stageFight0;
--	SetMissionV(firePhases.curPhaseLv,1);
	self:createSomeNpc();
end

--function stageFight0.onFinish()
--	self = stageFight0;
--	firePhases:onFinish();
--end

function stageFight0.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight0.checkPos()
	self = stageFight0;
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[1]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[1][nMax][1])^2+(nPosY-tQrsMovePos[1][nMax][2])^2));
	if nDistance <= 3 then --3²½ÄÚ
		self:onFinish();
	end
end

----------------------------------------------------------------------
stageFight0 = inherit(cycPhase, stageFight0);

stageFight0.actions = {
	[1] = stageFight0.init,
};
stageFight0.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight0.checkPos,
	},
};

---------------------------------------------------------
stageFight1 = {
	name = "Cöa ¶i thø nhÊt: HuyÕt ChiÕn S¬n M«n",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "HuyÕt ChiÕn S¬n M«n",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

function stageFight1:createSomeNpc()
	ttd_createSomeNpc(tNpcs.tyss,tPos.tyss);
	ttd_createSomeNpc(tNpcs.wlrs1,tPos.wlrs1);
	ttd_createSomeNpc(tNpcs.wlrs2,tPos.wlrs2);
	ttd_createSomeNpc(tNpcs.wlrs3,tPos.wlrs3);
	ttd_createSomeNpc(tNpcs.wlrs4,tPos.wlrs4);
	ttd_createSomeNpc(tNpcs.wlrs5,tPos.wlrs5);
	local nBossIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1_init);
	ttd_ChangeNpc2Talk(nBossIDX);
end

function stageFight1:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "HuyÕt HÇu Tiªu D­¬ng" then
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"§­îc, lËp ®¹i c«ng bÈm b¸o ngay.");
		local nXwtIDX = ttd_findNpc("H­íng VÊn Thiªn");
		NpcChat(nXwtIDX,"HuyÕt HÇu Tiªu D­¬ng nãi r»ng L·o Tæ ®ang luyÖn Phô ThÓ §¹i Ph¸p, t¹i h¹ ®i ®iÒu tra xem cã thÓ ph¸ hñy ©m m­u cña L·o Tæ hay kh«ng");
		NpcChat(nQRSidx,"Th«i ®­îc,  H­íng Hé Ph¸p h·y cÈn thËn.");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(1,strNpcName);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
	elseif strNpcName == "ThÇn Gi¸o Tinh Anh" then
		self:bossRestore();
		SetCurrentNpcSFX(nNpcIDX,954,2,0,18*3);
	end
end

function stageFight1:onPlayerDeath(nKiller)
	if self.DEBUG == 1 then
		print("stageFight1:onPlayerDeath")
	end
	self:bossRestore();
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1474*32,2961*32); --ÁÙÊ±ÖØÉúµã
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end

function stageFight1:bossRestore()
	local nNpcIDX = ttd_findNpc("HuyÕt HÇu Tiªu D­¬ng");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	--print("NpcChat nNpcIDx =",nNpcIDX);
	--print("NpcChat nQrSidx =",nQRSidx);
	if nNpcIDX ~= 0 then
		NpcChat(nNpcIDX,"TrËn chiÕn sinh tö lµ ph¶i m¹ng ®æi m¹ng, m¸u ®æ ®Çu r¬i, quyÕt chiÕn tíi cïng.");
		NpcChat(nQRSidx,"H·y cÈn thËn bän tµ ma ngo¹i ®¹o nµy giÕt ng­êi hót m¸u ®Ó håi phôc ch©n khÝ, v« cïng d· man!");
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIDX,1);
		local nAddLife = min(floor(nMaxLife*0.1),nMaxLife-nCurLife);
		ModifyNpcData(nNpcIDX,0,nAddLife,1);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"HuyÕt HÇu Tiªu D­¬ng håi sinh");
	end
end

function stageFight1:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[1][1], tbTraps[1][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap1.lua"},
		{m, tbTraps[1][3], tbTraps[1][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap1.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight1:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight1.init()
	self = stageFight1;
--	SetMissionV(firePhases.curPhaseLv,2);
	SetMissionV(MV_STAGE,1);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv1); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
end

function stageFight1.npcFunnyChat()
	local nNpcIDX = ttd_findNpc("Th«ng Thiªn Tö VÖ");
	--print("nNpcIdx = ",nNpcIDX);
	NpcChat(nNpcIDX,"KÎ nµo to gan d¸m x«ng vµo Th«ng Thiªn HuyÒn C¶nh !");
	local nRyyIDX = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nRyyIDX,"NhËm Doanh Doanh ¸i n÷ NhËm Ng· Hµnh");
	local nXwtIDX = ttd_findNpc("H­íng VÊn Thiªn");
	NpcChat(nXwtIDX,"H­íng VÊn Thiªn Hé Ph¸p NhËt NguyÖt ThÇn Gi¸o");
	NpcChat(nNpcIDX,"KÎ nµo x«ng vµo Th«ng Thiªn HuyÔn C¶nh ph¶i chÕt.");
end

function stageFight1:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nNpcIDX = ttd_findNpc("HuyÕt HÇu Tiªu D­¬ng");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nNpcIDX,"Muèn ®¸nh b¹i L·o phu ­, c¸c ng­¬i cßn ch­a ®ñ t­ c¸ch!");
	NpcChat(nQRSidx,"Nguy råi, ph¶i rót lui th«i.");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv1,0);
end

function stageFight1.callBoss()
	self = stageFight1;
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nNpcIDX,"C¸c vÞ ®ång ®¹o vâ l©m, nh©n lóc Thiªn ¢m Gi¸o kh«ng phßng thñ h·y tÊn c«ng cho chóng kh«ng kÞp trë tay.");
	local nBossIDX = ttd_findNpc("HuyÕt HÇu Tiªu D­¬ng");
	if nBossIDX == nil or nBossIDX == 0 then
		nBossIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
	else
		NpcChat(nBossIDX,"ChËm ch¹p qu¸ ®i, ®Ó ®ã cho ta.");
		SetNpcActivator(nBossIDX);
		ttd_ChangeNpc2Fight(nBossIDX);
		g_NpcAI:setAI(nBossIDX, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(nBossIDX, {tPos.boss1_init[1],tPos.boss1[1]});
	end
	if nBossIDX ~= 0 then
		NpcChat(nBossIDX,"Phô ThÓ §¹i Ph¸p cña L·o Tæ ®ang luyÖn ®Õn c¶nh giíi cuèi cïng, kÎ nµo d¸m quÊy nhiÔu. Tö VÖ nghe lÖnh: h·y giÕt chÕt nh÷ng kÎ x©m nhËp.");
		NpcChat(nNpcIDX,"µ, binh lÝnh nµy vâ c«ng kú qu¸i, c¸c ®ång ®¹o h·y cÈn thËn chí cã khinh ®Þch.");
	end
	local tTyss = ttd_findAllNpc("Th«ng Thiªn Tö VÖ");
	local nNum = getn(tTyss);
	if nNum ~= 0 then
		for i = 1,nNum do
			local nIDX = tTyss[i];
			if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
				local m,x,y = GetNpcWorldPos(nIDX);
				SetCurrentNpcSFX(nIDX,901,0,0,18*2);
				ttd_removeNpc(nIDX);
				local nNewIDX = ttd_createNpc("Th«ng Thiªn Ma VÖ","Th«ng Thiªn Ma VÖ",m,x,y);
				SetCampToNpc(nNewIDX,CampEnemy);
				NpcChat(nNewIDX,"Cè g¾ng lªn, h·y træ hÕt tµi nghÖ xem nµo.");
				--SetNpcDeathScript(nNewIDX,thisFile);
			end
		end
	end
	this.msCamp:turnPlayer(0,HeadMsg2Player,"§¸nh b¹i<color=red>HuyÕt HÇu Tiªu D­¬ng<color>")
end

function stageFight1.doSkill()
	local nNpcIDX = ttd_findNpc("HuyÕt HÇu Tiªu D­¬ng");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	local m,x,y = GetNpcWorldPos(nNpcIDX);
	local nOldPlayerIDX = PlayerIndex;
	if nNpcIDX ~= 0 and IsNpcDeath(nNpcIDX) ~= 1 then
		local nPlayerIDX = ttd_findRandomPlayer(x,y);
		if nPlayerIDX ~= 0 then
			PlayerIndex = nPlayerIDX;
			local m1,x1,y1 = GetWorldPos();
			local strName = GetName();
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=green>%s<color>bÞ Tiªu D­¬ng ®iÓm danh råi",strName));
			SetCurrentNpcSFX(NpcIdx2PIdx(),928,2,0,18*3);
			NpcChat(nNpcIDX,strName.."H·y xem lîi h¹i ®©y, HuyÕt HÇu S¸t Lang §ao! ");
			NpcChat(nQRSidx,"Thanh ®ao uy lùc v« song, kh«ng thÓ xem th­êng.");
			NpcCommand(nNpcIDX, NPCCOMMAND.do_skill,x1*32,y1*32,65536*4+1566);
			PlayerIndex = nOldPlayerIDX;
		end
	end
end
----------------------------------------------------------------------
stageFight1 = inherit(cycPhase, stageFight1);

stageFight1.actions = {
	[1] = stageFight1.init,
--	[50] = stageFight.warn,
	[10] = stageFight1.npcFunnyChat,
	[60] = stageFight1.callBoss,
}
stageFight1.cycActions = {
	[15] = { --15Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight1.doSkill,
		start = 75,
	},
}

----------------------------------------------------------------------
stageFight1_2 = {
	name = "B÷a tèi tr­íc lóc v­ît ¶i thø 2",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight1_2:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n Më ¶i thø 2: HiÖp Lé T­¬ng Phïng/#stageFight1_2.gotoTwo(1)",
			"\n Më ¶i thø 2: HiÖp Lé T­¬ng Phïng (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight1_2.gotoTwo(2)",
			"\n rêi ¶i/ttd_askClose",
			"\nKÕt thóc ®èi tho¹i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: PhÝa tr­íc S¬n M«n ®· ®­îc dän s¹ch, H­íng Hé Ph¸p ®i dß ®­êng tr­íc, c¸c vÞ ®ång ®¹o nhanh ch©n ®i th«i.",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv2,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	end
	local nXWTIdx = ttd_findNpc("H­íng VÊn Thiªn");
	ttd_ChangeNpc2Fight(nXWTIdx);
	NpcChat(nXWTIdx,"VËy t¹i h¹ ®i tr­íc ®©y");
	g_NpcAI:setAI(nXWTIdx, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nXWTIdx, tQrsMovePos[2]);
	
	--ds_HDTTD:AddStatValue(1,5+nType,1);
end

function stageFight1_2.init()
	self = stageFight1_2;
--	SetMissionV(firePhases.curPhaseLv,3);
	ttd_createQRS(1); --ÈÎÓ¯Ó¯
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight1_2.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight1_2.checkPos()
	self = stageFight1_2;
	local nNpcIDX2 = ttd_findNpc("NhËm Doanh Doanh");
	local nNpcIDX = ttd_findNpc("H­íng VÊn Thiªn");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMapID2,nPosX2,nPosY2 = GetNpcWorldPos(nNpcIDX2);
	local nMax = getn(tQrsMovePos[2]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[2][nMax][1])^2+(nPosY-tQrsMovePos[2][nMax][2])^2));
	local nDistance2 = floor(sqrt((nPosX2-tQrsMovePos[2][nMax][1])^2+(nPosY2-tQrsMovePos[2][nMax][2])^2));
	if nDistance <= 60 and nDistance >= 0 then
		SetCurrentNpcSFX(nNpcIDX, 962,2,0,18*3); --ÏòÎÊÌìÌØÐ§
		ttd_removeNpc(nNpcIDX);
	
		ttd_ChangeNpc2Fight(nNpcIDX2);
		NpcChat(nNpcIDX2,"H­íng Hé Ph¸p ®· ®ét nhËp vµo doanh tr¹i ®Þch, c¸c vÞ ®ång ®¹o ph¶i nhanh chãng héi ngé.");
		g_NpcAI:setAI(nNpcIDX2, AT_SM_ATTACK);
		g_NpcAI:setWayPoint(nNpcIDX2, tQrsMovePos[2]);
		SetNpcActivator(nNpcIDX2);
	end	
	if nDistance2 <= 3 and nDistance >= 0 then
		NpcChat(nNpcIDX,"§­êng ®i hiÓm trî, mét bªn lµ thung lòng, mét bªn lµ s­ên nói, e r»ng cã mai phôc!");
		self:onFinish();
	end
end

----------------------------------------------------------------------
stageFight1_2 = inherit(cycPhase, stageFight1_2);

stageFight1_2.actions = {
	[1] = stageFight1_2.init,
};
stageFight1_2.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight1_2.checkPos,
	},
};

---------------------------------------------------------------------
stageFight2 = {
	name = "¶i thø 2: HiÖp Lé T­¬ng Phïng",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "HiÖp Lé T­¬ng Phïng",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};
---------------------------------------------------------------------
function stageFight2:createSomeNpc()
	local nBossIDX2 = ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
	NpcChat(nBossIDX2,"TiÓu a ®Çu nµy qu¶ nhiªn th«ng minh!");
	local nBossIDX3 = ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);
	NpcChat(nBossIDX3,"T¹i h¹ chê c¸c vÞ ®ång ®¹o ®¹i gi¸ quang l©m ®· l©u råi!");
	local nBossIDX4 = ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);
	NpcChat(nBossIDX4,"GiÕt! GiÕt….!");
end

function stageFight2:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "S¸t Ph¸ Lang" then
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"§©y rèt cuéc lµ n¬i nµo, sao ®¸ng sî qu¸.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(2,strNpcName);
	end
end

function stageFight2:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[2][1], tbTraps[2][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap2.lua"},
		{m, tbTraps[2][3], tbTraps[2][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap2.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight2:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight2.init()
	self = stageFight2;
--	SetMissionV(firePhases.curPhaseLv,4);
	SetMissionV(MV_STAGE,2);
	SetMissionV(this.mv8,0);
	SetMissionV(this.mv9,0);
	SetMissionV(this.mv10,0);
	SetMissionV(this.mv22,0);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv2); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
end

function stageFight2:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nQRSidx,"T¹i h¹…®· cè hÕt søc!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv2,0);
end

function stageFight2.callBoss()
	if GetMissionV(this.mv9) ~= 0 then
		return 0;
	end
	local nNpcIDX1 = ttd_findNpc("ThÊt S¸t");
	local nNpcIDX2 = ttd_findNpc("Ph¸ Qu©n");
	local nNpcIDX3 = ttd_findNpc("Tham Lang");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	local nMaxLife1,nCurLife1 = GetUnitCurStates(nNpcIDX1,1);
	local nMaxLife2,nCurLife2 = GetUnitCurStates(nNpcIDX2,1);
	local nMaxLife3,nCurLife3 = GetUnitCurStates(nNpcIDX3,1);
	local nPercent1 = floor(nCurLife1/nMaxLife1*100);
	local nPercent2 = floor(nCurLife2/nMaxLife2*100);
	local nPercent3 = floor(nCurLife3/nMaxLife3*100);
	if (nPercent1 <= 50 or nPercent2 <= 50 or nPercent3 <= 50) and GetMissionV(this.mv22) == 0 then
		NpcChat(nQRSidx,"Th«ng Thiªn L·o Tæ ph¸i 3 ng­êi vâ c«ng tÇm th­êng phôc kÝch t¹i ®©y, ¾t h¼n cã quû kÕ, h·y cÈn thËn.");
		SetMissionV(this.mv22,1)
	end
	if nPercent1 <= 20 or nPercent2 <= 20 or nPercent3 <= 20 then
		if GetMissionV(this.mv22) == 1 then
			SetMissionV(this.mv22,2);
			--this.msCamp:turnPlayer(0,Talk,1,"","Í¨ÌìÀÏ×æ£ºÈý¸ö²»¸øÁ¦µÄÖÐÔ­¼Ò»ï£¬¿´À´»¹ÊÇÎÒÀ´°ïÄãÃÇÒ»°Ñ°É£¡");
			NpcChat(nNpcIDX1,"§· ®Õn lóc råi, hîp thÓ, biÕn!");
			NpcChat(nNpcIDX2,"§· ®Õn lóc råi, hîp thÓ, biÕn!");
			NpcChat(nNpcIDX3,"GiÕt…!giÕt…");
		else
			SetMissionV(this.mv22,3);
			local nSPLidx = ttd_createSomeNpc({"S¸t Ph¸ Lang", "S¸t Ph¸ Lang", thisFile, nil, CampEnemy, 0},{{1619,3015}});
			if nSPLidx ~= 0 then
				SetCurrentNpcSFX(nSPLidx,960,2,0,18*3)
				SetMissionV(this.mv9,1);
				ttd_removeNpc(nNpcIDX1);
				ttd_removeNpc(nNpcIDX2);
				ttd_removeNpc(nNpcIDX3);
				local nMaxLife,nCurLife = GetUnitCurStates(nSPLidx,1);
				local nPercent = floor((nPercent1+nPercent2+nPercent3)/3);
				if nPercent < 10 then nPercent = 10; end
				if nPercent > 100 then nPercent = 100; end
				ModifyNpcData(nSPLidx,0,floor(nMaxLife*nPercent/100),0);
				NpcChat(nSPLidx,"......");
				NpcChat(nQRSidx,"Qu¶ thËt qu¸ ®éc ¸c, ng­¬i kh«ng nªn sèng trªn ®êi nµy!");
				this.msCamp:turnPlayer(0,HeadMsg2Player,"§¸nh b¹i<color=red>S¸t Ph¸ Lang<color>");
			end
		end
	end
end

function stageFight2.doSkill()
	local nPJidx = ttd_findNpc("Ph¸ Qu©n");
	if nPJidx ~= 0 and IsNpcDeath(nPJidx) ~= 1 then
		local m,x1,y1 = GetNpcWorldPos(nPJidx);
		local nMaxLife,nCurLife = GetUnitCurStates(nPJidx,1);
		local nLastLife = GetMissionV(this.mv8);
		if nLastLife == 0 then
			nLastLife = nMaxLife;
		end
		if (nLastLife - nCurLife) >= floor(nMaxLife*0.1) then
			SetMissionV(this.mv8,nCurLife);
			NpcCommand(nPJidx, NPCCOMMAND.do_skill,x1*32,y1*32,65536*2+673);
		end
	end
	local nTLidx = ttd_findNpc("Tham Lang");
	if nTLidx ~= 0 and IsNpcDeath(nTLidx) ~= 1 then
		local m,x1,y1 = GetNpcWorldPos(nTLidx);
		local nMaxLife,nCurLife = GetUnitCurStates(nTLidx,1);
		if nCurLife <= floor(nMaxLife*0.5) then
			NpcCommand(nTLidx, NPCCOMMAND.do_skill,x1*32,y1*32,65536*20+614);
		end
	end
end

function stageFight2.doSkill2()
	if GetMissionV(this.mv9) == 0 then --É±ÆÆÀÇ»¹Ã»³öÏÖ
		return 0;
	end
	local nSkillLv = GetMissionV(this.mv10);
	local nSPLidx = ttd_findNpc("S¸t Ph¸ Lang");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	if nSPLidx ~= 0 and IsNpcDeath(nSPLidx) ~= 1 then
		SetMissionV(this.mv10,nSkillLv+1);
		local m,x1,y1 = GetNpcWorldPos(nSPLidx);
		if nSkillLv > 19 then
			nSkillLv = 19;
		end
		NpcChat(nSPLidx,"¸…");
		NpcChat(nQRSidx,"TiÕng kªu la cña qu¸i vËt s¸t th­¬ng rÊt lín, ph¹m vi s¸t th­¬ng sÏ t¨ng theo thêi gian, h·y mau giÕt chÕt chóng ®i.");
		if self.DEBUG == 1 then
			print("stageFight2.nSkillLv",nSkillLv);
		end
		NpcCommand(nSPLidx, NPCCOMMAND.do_skill,x1*32,y1*32,65536*(nSkillLv+1)+1571);
	end
end

function stageFight2.doSkill3()
	local nQSidx = ttd_findNpc("ThÊt S¸t");
	if nQSidx ~= 0 and IsNpcDeath(nQSidx) ~= 1 then
		local tQSPos = {{1611,3015},{1626,3016},{1646,3059},{1626,3052}};
		local nRand = random(1,getn(tQSPos));
		SetCurrentNpcSFX(nQSidx,962,2,1,18*3);
		SetNpcPos(nQSidx,tQSPos[nRand][1],tQSPos[nRand][2]);
		NpcChat(nQSidx,"Tû tû ë ®©y, ®Õn b¾t ®i!");
	end
end
----------------------------------------------------------------------
stageFight2 = inherit(cycPhase, stageFight2);

stageFight2.actions = {
	[1] = stageFight2.init,
--	[50] = stageFight.warn,
}
stageFight2.cycActions = {
	[1] = {
		[0] = {stageFight2.callBoss,stageFight2.doSkill},
		start = 0,
	},
	[10] = { --10Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight2.doSkill2,
		start = 10,
	},
	[30] = { --30Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight2.doSkill3,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight2_3 = {
	name = "Bãng ®ªm tr­íc ¶i thø 3",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight2_3:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n Më ¶i thø 3: Nh­ Méng Nh­îc Tiªn/#stageFight2_3.gotoThree(1)",
			"\n Më ¶i thø 3: Nh­ Méng Nh­îc Tiªn (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight2_3.gotoThree(2)",
			"\n rêi ¶i/ttd_askClose",
			"\nKÕt thóc ®èi tho¹i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: ®­êng lªn nói kh«ng cã mai phôc, phÝa tr­íc lµ Thiªn ¢m TÕ §µn, mau ®i th«i, ®Ó Kh©u Trang Chñ vµ L¹c S­ Huynh ®¸nh l¹c h­íng ®Þch.",
			getn(strtab),
			strtab)
	end
end

function stageFight2_3.gotoThree(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv3,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[3]);
	SetNpcActivator(nNpcIDX);
	--ds_HDTTD:AddStatValue(1,7+nType,1);
end

function stageFight2_3.init()
--	SetMissionV(firePhases.curPhaseLv,5);
	SetMissionV(this.mv11,0);
	SetMissionV(this.mv12,0);
	ttd_createQRS(2); --ÈÎÓ¯Ó¯
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight2_3.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight2_3.checkPos()
	self = stageFight2_3;
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	local nFMidx = ttd_findNpc("Phôc Méng");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[3]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[3][nMax][1])^2+(nPosY-tQrsMovePos[3][nMax][2])^2));
	local nCallBoss = GetMissionV(this.mv11);
	local nDialog = GetMissionV(this.mv12);
	if nCallBoss ~= 0 or nDialog ~= 0 or nDistance <= 3 then --3²½ÄÚ
		if nCallBoss == 0 then --ÕÐ³ö·üÃÎ
			nFMidx = ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);
			if nFMidx ~= 0 then
				SetMissionV(this.mv11,1);
				ttd_ChangeNpc2Talk(nFMidx);
				ttd_ChangeNpc2Talk(nNpcIDX);
				SetNpcScript(nNpcIDX,"");
				SetNpcActivator(nFMidx);
			end
		else
			if nDialog >= 14 then --·Ï»°ËµÍê¿ª¸ã
				NpcChat(nFMidx,"Ng­êi xÊu ®Òu ®¸ng chÕt.");
				self:onFinish();
			else
				SetMissionV(this.mv12,nDialog+1);
				local tDialogs = {
					{nNpcIDX,"µ, cã mét c« n­¬ng!"},
					{nFMidx,"C« n­¬ng lµ ai? sao c« n­¬ng cã Méng Ma ®Ñp nh­ thÕ!"},
					{nNpcIDX,"T¹i h¹ lµ ¸i n÷ cña NhËm Ng· Hµnh, NhËm Doanh Doanh, c« n­¬ng ng­êi ph­¬ng nµo?"},
					{nFMidx,"T¹i h¹ lµ ai? T¹i h¹ lµ ai?... t¹i h¹ h×nh nh­ lµ Th«ng Thiªn Th¸nh N÷, t¹i h¹ tªn…, a… nhøc ®Çu qu¸!"},
					{nNpcIDX,"C« N­¬ng lµm sao thÕ?"},
					{nFMidx,"Ng­¬i lµ ng­êi xÊu, ng­¬i nhÊt ®Þnh lµ Méng Ma míi, muèn g¹t t¹i h¹ ­!"},
					{nNpcIDX,"Méng Ma g× chø, c« n­¬ng cã sao kh«ng."},
				};
				if mod(nDialog+1,2) == 0 then
					local tTemp = tDialogs[(nDialog+1)/2];
					if tTemp then
						NpcChat(tTemp[1],tTemp[2]);
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight2_3 = inherit(cycPhase, stageFight2_3);

stageFight2_3.actions = {
	[1] = stageFight2_3.init,
};
stageFight2_3.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight2_3.checkPos,
	},
};

---------------------------------------------------------------------
stageFight3 = {
	name = "¶i thø 3: Nh­ Méng Nh­îc Tiªn",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "Nh­ Méng Nh­îc Tiªn",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};
---------------------------------------------------------------------
function stageFight3:createSomeNpc()
	local nFMidx = ttd_findNpc("Phôc Méng");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
	--AddUnitStates(nQRSidx, 8, -1000);
	--g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
	--g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[3]);
	SetNpcActivator(nQRSidx);
	if nFMidx ~= 0 then
		ttd_ChangeNpc2Fight(nFMidx);
	else
		ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);
	end
end

function stageFight3:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Phôc Méng" then
		NpcChat(nNpcIDX,"C¸m ¬n, cuèi cïng còng tho¸t ra råi.")
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(3,strNpcName);
	end
end

function stageFight3:onTalk(nNpcIDX)
	if GetNpcName(nNpcIDX) == "Ng¹c Méng Chi Hoa" then
		SetCurrentNpcSFX(nNpcIDX, 930,0,1);
	end
	SetTaskTemp(this.TempTask1,nNpcIDX);
	DoWait(101,102,2);
end

function stageFight3:callBack()
	local nNpcIDX = GetTaskTemp(this.TempTask1);
	local strName = GetNpcName(nNpcIDX);
	if strName == "Ng¹c Méng Chi Hoa" then
		SetCurrentNpcSFX(nNpcIDX, 922,2,1);
		ttd_removeNpc(nNpcIDX);
	end
end

function stageFight3:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[3][1], tbTraps[3][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap3.lua"},
		{m, tbTraps[3][3], tbTraps[3][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap3.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight3:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight3.init()
	self = stageFight3;
--	SetMissionV(firePhases.curPhaseLv,6);
	SetMissionV(MV_STAGE,3);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv3); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
	this.msCamp:turnPlayer(0,HeadMsg2Player,"§¸nh b¹i<color=red>Phôc Méng<color>");
end

function stageFight3:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nFMidx = ttd_findNpc("Phôc Méng");
	NpcChat(nFMidx,"T¹i sao, t¹i h¹ ®¸nh b¹i Méng Ma råi, nh­ng Méng vÉn ch­a tØnh.");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv3,0);
end

function stageFight3.callFish()
	local nFMidx = ttd_findNpc("Phôc Méng");
	if nFMidx ~= 0 and IsNpcDeath(nFMidx) ~= 1 then
		local m,x,y = GetNpcWorldPos(nFMidx);
		local tFish1 = ttd_findAllNpc("Tham Lam Chi Méng");
		local tFish2 = ttd_findAllNpc("PhÉn Né Chi Méng");
		local tFish3 = ttd_findAllNpc("Si Mª Chi Méng");
		local nNum1,nNum2,nNum3 = getn(tFish1),getn(tFish2),getn(tFish3);
		if nNum1 ~= 0 then
			for i = 1,nNum1 do
				local nIDX = tFish1[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					SetNpcPos(nIDX,x,y);
				end
			end
		end
		if nNum2 ~= 0 then
			for i = 1,nNum2 do
				local nIDX = tFish2[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					SetNpcPos(nIDX,x,y);
				end
			end
		end
		if nNum3 ~= 0 then
			for i = 1,nNum3 do
				local nIDX = tFish3[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					SetNpcPos(nIDX,x,y);
				end
			end
		end
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nFMidx,"Nh×n xem Ng¹c Méng Chi Hoa ®Ñp qu¸, chóng s¾p kÕt tr¸i råi!");
		NpcChat(nQRSidx,"C« n­¬ng cã thÓ thùc thÓ hãa Méng C¶nh, ph¸ hñy nh÷ng ®ãa hoa kh«ng cho chóng kÕt tr¸i!");
		ttd_createSomeNpc(tNpcs.fish,tPos.fish);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Ng¹c Méng Chi Hoa<color>xuÊt hiÖn råi");
	end
end

function stageFight3.changeFish()
	local nFMidx = ttd_findNpc("Phôc Méng");
	if nFMidx ~= 0 and IsNpcDeath(nFMidx) ~= 1 then
		local tFish = ttd_findAllNpc("Ng¹c Méng Chi Hoa");
		local nNum = getn(tFish);
		if nNum ~= 0 then
			local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
			NpcChat(nFMidx,"Gian ¸c, c¨m giËn, s¾c dôc ®Òu xuÊt hiÖn trong Méng C¶nh!");
			NpcChat(nQRSidx,"§©y lµ h×nh d¹ng sau khi thùc thÓ hãa Ng¹c Méng, h·y giÕt chóng ®i, nÕu kh«ng lÝ trÝ sÏ bÞ mª muéi.");
			for i = 1,nNum do
				local nIDX = tFish[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					local m,x,y = GetNpcWorldPos(nIDX);
					ttd_removeNpc(nIDX);
					local nRand = random(1,3);
					local tNpcFish = {"Tham Lam Chi Méng","PhÉn Né Chi Méng","Si Mª Chi Méng"};
					local nNewIDX = ttd_createNpc(tNpcFish[nRand],tNpcFish[nRand],m,x,y);
					SetCampToNpc(nNewIDX,CampEnemy);
				end
			end
			this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Ng¹c Méng Chi Hoa<color>kÕt tr¸i råi");
		end
	end
end

----------------------------------------------------------------------
stageFight3 = inherit(cycPhase, stageFight3);

stageFight3.actions = {
	[1] = stageFight3.init,
--	[50] = stageFight.warn,
}
stageFight3.cycActions = {
	[10] = { --10Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight3.changeFish,
		start = 30,
	},
	[30] = {
		[1] = stageFight3.callFish,
		start = 30,
	},
}

----------------------------------------------------------------------
stageFight3_4 = {
	name = "B×nh minh tr­íc ¶i thø 4",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight3_4:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n Më ¶i thø 4:  Bï Nh×n M¸u/#stageFight3_4.gotoFour(1)",
			"\n Më ¶i thø 4: HuyÕt Nhôc Khæi Læi (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight3_4.gotoFour(2)",
			"\n rêi ¶i/ttd_askClose",
			"\nKÕt thóc ®èi tho¹i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: Nguy råi, H­íng Hé Ph¸p bÞ Th«ng Thiªn L·o Tæ ph¸t hiÖn råi. Mau ®i cøu th«i.",
			getn(strtab),
			strtab)
	end
end

function stageFight3_4.gotoFour(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv4,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	NpcChat(nNpcIDX,"C©y cÇu phÝa sau TÕ §µn chÝnh lµ lèi vµo ®Ønh cña Th«ng Thiªn §Ønh!");
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[4]);
	SetNpcActivator(nNpcIDX);
--	ds_HDTTD:AddStatValue(1,9+nType,1);
	self:onFinish();
end

function stageFight3_4.init()
--	SetMissionV(firePhases.curPhaseLv,7);
	ttd_createQRS(3); --ÈÎÓ¯Ó¯
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight3_4.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end


----------------------------------------------------------------------
stageFight3_4 = inherit(cycPhase, stageFight3_4);

stageFight3_4.actions = {
	[1] = stageFight3_4.init,
};
stageFight3_4.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight3_4.checkPos,
	},
};

---------------------------------------------------------------------
stageFight4 = {
	name = "¶i thø 4: HuyÕt Nhôc Khæi Lçi",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "HuyÕt Nhôc Khæi Lçi",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

---------------------------------------------------------------------
function stageFight4:createSomeNpc()
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	local nBossIDX6 = ttd_createSomeNpc(tNpcs.boss6,tPos.boss6);
	NpcChat(nBossIDX6,"ChØ tiÕc c¸c ng­¬i trèn kh«ng tho¸t ®­îc!");
	NpcChat(nQRSidx,"CÈn thËn, ë ®©y cã qu©n mai phôc.");
	this.msCamp:turnPlayer(0,HeadMsg2Player,"§¸nh b¹i<color=red>TÊt YÓn<color>");
end

function stageFight4:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "TÊt YÓn" then
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"X«ng th¼ng lªn.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(4,strNpcName);
	end
end

function stageFight4:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[4][1], tbTraps[4][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap4.lua"},
		{m, tbTraps[4][3], tbTraps[4][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap4.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight4:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight4.init()
	self = stageFight4;
--	SetMissionV(firePhases.curPhaseLv,8);
	SetMissionV(MV_STAGE,4);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv4); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
end

function stageFight4:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nBYidx = ttd_findNpc("TÊt YÓn");
	NpcChat(nBYidx,"M¸u t­¬i thÞt ngon qu¶ rÊt kho¸i khÈu!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv4,0);
end

function stageFight4.callFish()
	local nBYidx = ttd_findNpc("TÊt YÓn");
	if nBYidx ~= 0 and IsNpcDeath(nBYidx) ~= 1 then
		NpcChat(nBYidx,"B¶o bèi h·y mau ch¹y ®Õn bªn c¹nh cha ®i!");
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"H·y ng¨n c¶n Khæi Lçi HuyÕt Nhôc tiÕp cËn ®Ønh TÕ §µn!");
		ttd_createSomeNpc({"Th«ng Thiªn HuyÕt Nhôc Khæi Lçi","HuyÕt Nhôc Khæi Lçi", thisFile, nil, CampEnemy, 0},{{1535,2972}},{{1551,2991},{1577,2947}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th«ng Thiªn HuyÕt Nhôc Khæi Lçi","HuyÕt Nhôc Khæi Lçi", thisFile, nil, CampEnemy, 0},{{1579,3016}},{{1559,2999},{1585,2953}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th«ng Thiªn HuyÕt Nhôc Khæi Lçi","HuyÕt Nhôc Khæi Lçi", thisFile, nil, CampEnemy, 0},{{1611,2989}},{{1587,2950}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th«ng Thiªn HuyÕt Nhôc Khæi Lçi","HuyÕt Nhôc Khæi Lçi", thisFile, nil, CampEnemy, 0},{{1593,2915}},{{1612,2931},{1594,2943}},AT_SM_MOVE);
		ttd_createSomeNpc({"Th«ng Thiªn HuyÕt Nhôc Khæi Lçi","HuyÕt Nhôc Khæi Lçi", thisFile, nil, CampEnemy, 0},{{1637,2957}},{{1612,2930},{1590,2944}},AT_SM_MOVE);
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>HuyÕt Nhôc Khæi Lçi <color>xuÊt hiÖn råi ");
	end
end

function stageFight4.changeFish()
	local nBYidx = ttd_findNpc("TÊt YÓn");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	if nBYidx ~= 0 and IsNpcDeath(nBYidx) ~= 1 then
		local tfish = ttd_findAllNpc("HuyÕt Nhôc Khæi Lçi");
		local nNum = getn(tfish);
		if nNum ~= 0 then
			for i = 1,nNum do
				local nIDX = tfish[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					local m,x,y = GetNpcWorldPos(nIDX);
					local nDistance = floor(sqrt((1588-x)^2+(2949-y)^2)); --¼ì²âÓë±ÏÑß¾àÀë
					if nDistance <= 15 then --10²½ÄÚ
						NpcChat(nBYidx,"Tèt qu¸, h·y tØnh dËy ®i, con.");
						NpcChat(nQRSidx,"Th¹ch Nh©n ®· bÞ c­êng hãa, rÊt hung d÷, h·y cÈn thËn!");
						SetCurrentNpcSFX(nIDX,901,0,0,18*3);
						ttd_removeNpc(nIDX);
						local nNewIDX = ttd_createNpc("Th«ng Thiªn HuyÕt Ma Khæi Lçi","HuyÕt Ma Khæi Lçi",m,x,y);
						SetCampToNpc(nNewIDX,CampEnemy);
					end
				end
			end
		end
	end
end

function stageFight4.doSkill()
	local nBYidx = ttd_findNpc("TÊt YÓn");
	if nBYidx ~= 0 and IsNpcDeath(nBYidx) ~= 1 then
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nBYidx,"§Ó c¸c ng­¬i thÊy ®­îc lîi h¹i cña t¹i h¹!");
		NpcChat(nQRSidx,"CÈn thËn, Vu TÕ phãng thÝch mét Vu §éc v« cïng nguy hiÓm, h·y tr¸nh xa.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>Vu TÕ b¾t ®Çu phãng thÝch Vu §éc<color>");
		SetNpcPos(nBYidx,1588,2949);
		NpcCommand(nBYidx, NPCCOMMAND.do_skill,1586*32,2947*32,65536*1+1635);
	end
end
----------------------------------------------------------------------
stageFight4 = inherit(cycPhase, stageFight4);

stageFight4.actions = {
	[1] = stageFight4.init,
--	[50] = stageFight.warn,
}
stageFight4.cycActions = {
	[2] = {
		[0] = stageFight4.changeFish,
		start = 35,
	},
	[30] = { --30Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight4.doSkill,
		start = 45,
	},
	[35] = { --35Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight4.callFish,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight4_5 = {
	name = "B÷a s¸ng tr­íc ¶i thø 5",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight4_5:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n Më ¶i thø 5:  LuyÖn Ma ThÇn L­/#stageFight4_5.gotoFive(1)",
			"\n Më ¶i thø 5: ThÇn L­ LuyÖn Ma (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight4_5.gotoFive(2)",
			"\n rêi ¶i/ttd_askClose",
			"\nKÕt thóc ®èi tho¹i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: TiÕn vÒ phÝa tr­íc Th«ng Thiªn Gi¸o Chñ kh«ng cßn bao xa n÷a.",
			getn(strtab),
			strtab)
	end
end

function stageFight4_5.gotoFive(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv5,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[5]);
	SetNpcActivator(nNpcIDX);
	NpcChat(nNpcIDX,"Qua khái cÇu chÝnh lµ ®Ønh cña Th«ng Thiªn §Ønh.");
--	ds_HDTTD:AddStatValue(1,11+nType,1);
end

function stageFight4_5.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	SetMissionV(this.mv13,0);
	SetMissionV(this.mv14,0);
	ttd_createQRS(4); --ÈÎÓ¯Ó¯
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight4_5.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight4_5.checkPos()
	self = stageFight4_5;
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[5]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[5][nMax][1])^2+(nPosY-tQrsMovePos[5][nMax][2])^2));
	local nCallBoss = GetMissionV(this.mv13);
	local nDialog = GetMissionV(this.mv14);
	if nCallBoss ~= 0 or nDialog ~= 0 or nDistance <= 3 then --3²½ÄÚ
		if nCallBoss == 0 then --ÕÐ³ö½£Ä§½­±ðº×
			local nJWidx = ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);
			if nJWidx ~= 0 then
				SetMissionV(this.mv13,1);
				ttd_ChangeNpc2Talk(nNpcIDX);
				SetNpcScript(nNpcIDX,"");
				ttd_ChangeNpc2Talk(nJWidx);
				SetNpcActivator(nJWidx);
			else
				return 0;
			end
			--¾Å½£---------------------------------------------
			local nJxidx = ttd_createSomeNpc(tNpcs.J1,tPos.J1);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J2,tPos.J2);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J3,tPos.J3);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J4,tPos.J4);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J5,tPos.J5);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J6,tPos.J6);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J7,tPos.J7);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J8,tPos.J8);
			ttd_ChangeNpc2Talk(nJxidx);
			nJxidx = ttd_createSomeNpc(tNpcs.J9,tPos.J9);
			ttd_ChangeNpc2Talk(nJxidx);
			---------------------------------------------------
		else
			if nDialog >= 14 then --·Ï»°ËµÍê¿ª¸ã
				self:onFinish();
			else
				--print("nDialog =",nDialog)
				if nDialog == 8 then
					--print("²Ø½£Á¶½£Â¯NPC CREATE")
					local nLjnNpc = ttd_createSomeNpc(tNpcs.njn1,tPos.njn1);
					SetCurrentNpcSFX(nLjnNpc,928,2,1);
				end
				SetMissionV(this.mv14,nDialog+1);
				local tDialogs = {
					{nJWidx,"§Õn råi µ, chØ tiÕc lµ gÆp ph¶i t¹i h¹. C¸c ng­¬i nép m¹ng ®i."},
					{nNpcIDX,"KiÕm Ma. Ng­¬i lµm g× cha ta råi!"},
					{nJWidx,"Cha ng­¬i, ha…ha…ch¼ng qua chØ trªu ®ïa chót th«i, nh­ng mµ c« n­¬ng sÏ nhanh chãng gÆp l¹i cha th«i."},
					{nNpcIDX,"Hçn l¸o. KiÕm Ma, xem ®©y."},
					{nJWidx,"Lµm sao ng­¬i cã Lß luyÖn kiÕm !"},
					{nJWidx,"VÎ ngoµi rÊt gièng ch¼ng qua chØ lµ ®å gi¶ m¹o."},
					{nNpcIDX,"Lß luyÖn Tµng KiÕm cã thÓ luyÖn thµnh Thiªn H¹ KiÕm Hån, h·y luyÖn …!"},
				};
				if mod(nDialog+1,2) == 0 then
					local tTemp = tDialogs[(nDialog+1)/2];
					if tTemp then
						NpcChat(tTemp[1],tTemp[2]);
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight4_5 = inherit(cycPhase, stageFight4_5);

stageFight4_5.actions = {
	[1] = stageFight4_5.init,
};
stageFight4_5.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight4_5.checkPos,
	},
};

----------------------------------------------------------------------
stageFight5 = {
	name = "¶i thø 5: ThÇn L­ LuyÖn Ma",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "ThÇn L­ LuyÖn Ma",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
	fishname = {"Bµn Xµ","Tö §iÖn","§o¹n thñy","TriÒu D­¬ng kiÕm","Th¹ch DuyÖn kiÕm","§é Hån kiÕm","Hiªn Viªn kiÕm","Truy T×nh kiÕm","Tµng S¸t"},
};

---------------------------------------------------------------------
function stageFight5:createSomeNpc()
	local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Fight(nJWidx);
		SetNpcActivator(nJWidx);
		SetCurrentNpcSFX(nJWidx,927,2,1,18*3)
	else
		ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);
	end
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
	g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[5]);
	CastState2Npc(nQRSidx,"state_vertigo",1,300*18,0,19999);
	CastState2Npc(nQRSidx,"state_lost_life_per18",610000,300*18,0,19998);
end

function stageFight5:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" then
		this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
		local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
		NpcChat(nJWidx,"ThÇn L­ LuyÖn Ma");
		local nCurStage = GetMissionV(MV_STAGE);
		local m = this.msPosition:getMapID();
		ttd_clearMapNpc(m);
		ttd_reviveAll();
		ttd_cleanAllGodState();
		this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
		this.msCamp:turnPlayer(0,StopTimeGuage,-2);
		self:onFailed();
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--		SetMissionV(this.mv5,0);
	end
	for i = 1,getn(self.fishname) do
		if strNpcName == self.fishname[i] then
			SetMissionV(this.mv15,GetMissionV(this.mv15)+1);
			ttd_removeNpc(nNpcIDX);
		end
	end
	--stageFight5:checkMissionV
end

function stageFight5:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[5][1], tbTraps[5][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap5.lua"},
		{m, tbTraps[5][3], tbTraps[5][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap5.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight5:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight5.init()
	self = stageFight5;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,5);
	SetMissionV(this.mv15,0); --¾Å½£ËÀÍöÊýÇå0
	local tSeq = floyd_rm4n(9,9);
	local strSeq = "";
	for i = 1,getn(tSeq) do
		strSeq = strSeq..tostring(tSeq[i]);
	end
	SetMissionS(this.ms1,strSeq); --¾Å½£¼¤»îË³Ðò
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv5); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
	this.msCamp:turnPlayer(0,HeadMsg2Player,"NhËm Doanh Doanh tr­íc lóc chÕt ®¸nh b¹i toµn bé<color=red>Ma KiÕm<color>");
end

function stageFight5:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
	NpcChat(nJWidx,"ThÇn L­ LuyÖn Ma");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv5,0);
end

function stageFight5.changeFish(nStart,nEnd)
	self = stageFight5;
	local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
	if nJWidx ~= 0 and IsNpcDeath(nJWidx) ~= 1 and GetMissionV(this.mv15) < 9 then
		local strSeq = GetMissionS(this.ms1);
		if strSeq == "" then
			print("[error] [stageFight5:changeFish] [strSeq='']");
			return 0;
		end
		local strFishName = "";
		for i = nStart,nEnd do
			local nSetFight = tonumber(strsub(strSeq,i,i));
			if nSetFight and self.fishname[nSetFight] then
				local nFishIDX = ttd_findNpc(self.fishname[nSetFight]);
				if nFishIDX ~= 0 and IsNpcDeath(nFishIDX) ~= 1 then
					strFishName = strFishName..self.fishname[nSetFight]..",";
					ttd_ChangeNpc2Fight(nFishIDX);
--					g_NpcAI:setAI(nFishIDX, AT_SM_ATTACK);
					SetNpcActivator(nFishIDX);
					SetCurrentNpcSFX(nFishIDX,921,0,1,18*60)
				end
			end
		end
		if nEnd <= 1 then
			NpcChat(nJWidx,strFishName.."Gi¶i quyÕt chóng ®i.");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>tØnh råi",strFishName));
		elseif nEnd <= 3 then
			NpcChat(nJWidx,"Xem ra còng cã chót b¶n lÜnh,"..strFishName.."H·y tiªu diÖt chóng ®i!");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>tØnh råi",strFishName));
		elseif nEnd <= 6 then
			NpcChat(nJWidx,"§õng quÊy nhiÔu  …"..strFishName.."§Õn lóc th­ëng thøc m¸u cña chóng råi!");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>tØnh råi",strFishName));
		elseif nEnd <= 9 then
			NpcChat(nJWidx,strFishName.."H·y tØnh dËy tõ trong giÊc ngñ s©u th¼m!");
			this.msCamp:turnPlayer(0,HeadMsg2Player,format("<color=red>%s<color>tØnh råi",strFishName));
		end
	end
end

function stageFight5.doSkill()
	self = stageFight5;
	local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
	local nDeadNum = GetMissionV(this.mv15);
	if nJWidx ~= 0 and IsNpcDeath(nJWidx) ~= 1 and nDeadNum < 9 then
		local nSkillLv = 9 --9 - nDeadNum;
		if self.DEBUG == 1 then
			print("stageFight5.nSkillLv",nSkillLv);
		end
		NpcChat(nJWidx,"Kh«ng biÕt Nh©n ngù KiÕm, hay lµ KiÕm ngù Nh©n. Ma KiÕm nãi. ");
		this.msCamp:turnPlayer(0,self.damage,nJWidx,nSkillLv);
	end
end

function stageFight5.damage(nJWidx,nSkillLv)
	if self.DEBUG == 1 then
		print("stageFight5.nSkillLv2",nSkillLv);
	end
	local m,x,y = GetWorldPos();
	local d = floor(sqrt((1532-x)^2+(2821-y)^2));
	if d < 50 and IsPlayerDeath() == 0 then
		NpcCommand(nJWidx, NPCCOMMAND.do_skill,x*32,y*32,65536*nSkillLv+1585);
	end
end

function stageFight5.setView5()
	local npcIndex = ttd_findNpc("NhËm Doanh Doanh");
--	print("stageFight5.setView5()",npcIndex)
	if npcIndex then
		AddUnitStates(npcIndex, 8, 1000);
	end
end

function stageFight5.checkMissionV()
	local nLjnNpc = ttd_findNpc("Lß luyÖn Tµng KiÕm");
	if GetMissionV(this.mv15) == 9 then
		this.msCamp:turnPlayer(0,ttd_setPos,1531,2830);
		local nJWidx = ttd_findNpc("KiÕm Ma Giang BiÖt H¹c");
		NpcChat(nJWidx,"¸… kh«ng…c¸c h¹ sao cã thÓ lµm ®­îc…");
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"Ha…ha…hãa ra ®å gi¶, tuy cã chót uy lùc, chØ tiÕc tèc ®é chËm qu¸….");
		SetCurrentNpcSFX(nJWidx,913,0,1,18*3)
		--É¾³ý²Ø½£Á·½£Â¯
		ttd_removeNpc(nLjnNpc);
	end
	if (nLjnNpc == nil or nLjnNpc == 0) and GetMissionV(this.mv15) == 9 then
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		ttd_passStage(5,"KiÕm Ma Giang BiÖt H¹c");
	end
end
----------------------------------------------------------------------
stageFight5 = inherit(cycPhase, stageFight5);

stageFight5.actions = {
	[1] = stageFight5.init,
	[2] = callout(stageFight5.changeFish,1,1),
	[30] = stageFight5.setView5,
	[45] = callout(stageFight5.changeFish,2,3),
	[90] = callout(stageFight5.changeFish,4,6),
	[150] = callout(stageFight5.changeFish,7,9),
}
stageFight5.cycActions = {
	[10] = {
		[0] = stageFight5.checkMissionV,
		start = 10,
	},
	[15] = {
		[5] = stageFight5.doSkill,
		start = 10,
	},
}
----------------------------------------------------------------------
stageFight5_6 = {
	name = "B÷a tr­a tr­íc ¶i thø 6",
	maxsecond = 15*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight5_6:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
			"\n Më ¶i thø 6: Sèng ChÕt Cïng Nhau/#stageFight5_6.gotoSix(1)",
			"\n Më ¶i thø 6: Sinh Tö T­¬ng Y (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight5_6.gotoSix(2)",
			"\n rêi ¶i/ttd_askClose",
			"\nKÕt thóc ®èi tho¹i/nothing"
		};
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: H·y nhanh lªn, t¹i h¹ linh c¶m cã ®iÒu bÊt an.",
			getn(strtab),
			strtab)
	end
end

function stageFight5_6.gotoSix(nType)
	if nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv6,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	end
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[6]);
	SetNpcActivator(nNpcIDX);
	NpcChat(nNpcIDX,"Ph¶i mau lªn Th«ng Thiªn §Ønh.");
--	ds_HDTTD:AddStatValue(1,13+nType,1);
end

function stageFight5_6.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	ttd_createQRS(5); --ÈÎÓ¯Ó¯
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight5_6.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight5_6.checkPos()
	self = stageFight5_6;
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[6]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[6][nMax][1])^2+(nPosY-tQrsMovePos[6][nMax][2])^2));
	if nDistance <= 3 then --3²½ÄÚ
		self:onFinish();
	end
end

----------------------------------------------------------------------
stageFight5_6 = inherit(cycPhase, stageFight5_6);

stageFight5_6.actions = {
	[1] = stageFight5_6.init,
};
stageFight5_6.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight5_6.checkPos,
	},
};

----------------------------------------------------------------------
stageFight6 = {
	name = "¶i thø 6: Sinh Tö T­¬ng Y",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "Sinh Tö T­¬ng Y",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
	bossname = {"H¾c Tr­ëng L·o Tiªu NguyÖt","B¹ch Tr­ëng L·o TÊt Thiªn"},
};

---------------------------------------------------------------------
function stageFight6:createSomeNpc()
	local nBossIDX8 = ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
	NpcChat(nBossIDX8,"ChØ dùa vµo c¸c ng­¬i muèn ph¸ háng chuyÖn cña L·o Tæ, kh«ng ph¶i tù t×m c¸i chÕt sao!  ");
	local nBossIDX9 = ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);
	NpcChat(nBossIDX9,"Chóng ®ang ®Çu thai, kh«ng nªn ng¨n chÆn ®óng kh«ng!");
	--ttd_createSomeNpc(tNpcs.wlrs6,tPos.wlrs6);
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nQRSidx,"CÈn thËn, chóng cã së tr­êng hîp kÝch, t¸ch ra sÏ dÔ ®¸nh b¹i h¬n.");
end

function stageFight6:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	for i = 1,getn(self.bossname) do
		if strNpcName == self.bossname[i] then
			SetMissionV(this.mv16,GetMissionV(this.mv16)+1);
			if GetMissionV(this.mv16) == 2 then
				local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
				NpcChat(nQRSidx,"T¹i h¹ ph¶i t×m ®­îc H­íng VÊn Thiªn, b»ng kh«ng sÏ kh«ng rêi khái ®©y!");
				local m,x,y = GetNpcWorldPos(nNpcIDX);
				ttd_passStage(6,"H¾c B¹ch Tr­ëng L·o");
				return 1;
			end
			this:Msg2MSAll(self.bossname[i].."H·y giÕt mét ng­êi kh¸c trong vßng 20 gi©y!");
			local nBossIDX = ttd_findNpc(self.bossname[3-i]);
			if i == 1 then
				NpcChat(nBossIDX,"H¾c Bµ Tö ®õng ng· xuèng, l·o ®Õn cøu ®©y!");
				this.msCamp:turnPlayer(0,HeadMsg2Player,"Tèc ®é giÕt<color=red>B¹ch Tr­ëng L·o<color>");
			elseif i == 2 then
				NpcChat(nBossIDX,"B¹ch L·o Quû ®õng r¬i xuèng, l·o ®Õn cøu ®©y!");
				this.msCamp:turnPlayer(0,HeadMsg2Player,"Tèc ®é giÕt<color=red>H¾c Tr­ëng L·o<color>");
			end
			local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
			NpcChat(nQRSidx,"Mau ®¸nh b¹i tr­ëng l·o cßn l¹i, bän tµ ma nµy cã thÓ håi sinh ng­êi bÞ ng·.");
			break;
		end
	end
	if GetMissionV(this.mv16) == 2 then
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"TrËn chiÕn nµy qu¶ thËt hiÓm ¸c!");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(6,"H¾c B¹ch Tr­ëng L·o");
	end
end

function stageFight6:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[6][1], tbTraps[6][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap6.lua"},
--		{m, tbTraps[6][3], tbTraps[6][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap6.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight6:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight6.init()
	self = stageFight6;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,6);
	SetMissionV(this.mv16,0); --³¤ÀÏËÀÍöÊýÇå0
	SetMissionV(this.mv17,0); --µ¹¼ÆÊ±Çå0
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv6); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
end

function stageFight6:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nQRSidx,"ThiÕu… chót n÷a.");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv6,0);
end

function stageFight6.callFish()
	self = stageFight6;
	local nXRYidx = ttd_findNpc("H¾c Tr­ëng L·o Tiªu NguyÖt");
	local nBTidx = ttd_findNpc("B¹ch Tr­ëng L·o TÊt Thiªn");
	if nXRYidx ~= 0 and IsNpcDeath(nXRYidx) ~= 1 and nBTidx ~= 0 and IsNpcDeath(nBTidx) ~= 1 then
		local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
		NpcChat(nQRSidx,"CÈn thËn, h·y tr¸nh xa Cæ Trïng.");
		local m,x,y = GetNpcWorldPos(nXRYidx);
		local m1,x1,y1 = GetNpcWorldPos(nBTidx);
		ttd_createSomeNpc({"Thiªn SÝ Cæ","Thiªn SÝ Cæ", thisFile, nil, CampEnemy, 0},{{x,y}},{{x1,y1}},AT_SM_MOVE);
		ttd_createSomeNpc({"Minh Hµn Cæ","Minh Hµn Cæ", thisFile, nil, CampEnemy, 0},{{x1,y1}},{{x,y}},AT_SM_MOVE);
	end
end

function stageFight6.checkBoss()
	local nXRYidx = ttd_findNpc("H¾c Tr­ëng L·o Tiªu NguyÖt");
	local nBTidx = ttd_findNpc("B¹ch Tr­ëng L·o TÊt Thiªn");
	local nDeadNum = GetMissionV(this.mv16);
	if GetMissionV(this.mv16) == 2 or GetMissionV(this.mv16) == 0 then
		return 0;
	end
	if nXRYidx ~= 0 and IsNpcDeath(nXRYidx) == 1 then
		local nCurSec = GetMissionV(this.mv17);
		if nCurSec >= 20 then
			SetMissionV(this.mv16,GetMissionV(this.mv16)-1); --³¤ÀÏËÀÍöÊý
			SetMissionV(this.mv17,0); --µ¹¼ÆÊ±Çå0
			ttd_removeNpc(nXRYidx);
			ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
			this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>H¾c Tr­ëng L·o<color>håi sinh");
		else
			SetMissionV(this.mv17,nCurSec+1);
		end
	elseif nBTidx ~= 0 and IsNpcDeath(nBTidx) == 1 then
		local nCurSec = GetMissionV(this.mv17);
		if nCurSec >= 20 then
			SetMissionV(this.mv16,GetMissionV(this.mv16)-1); --³¤ÀÏËÀÍöÊý
			SetMissionV(this.mv17,0); --µ¹¼ÆÊ±Çå0
			ttd_removeNpc(nBTidx);
			ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);
			this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>B¹ch Tr­ëng L·o<color>håi sinh");
		else
			SetMissionV(this.mv17,nCurSec+1);
		end
	end
end

----------------------------------------------------------------------
stageFight6 = inherit(cycPhase, stageFight6);

stageFight6.actions = {
	[1] = stageFight6.init,
}
stageFight6.cycActions = {
	[1] = {
		[0] = stageFight6.checkBoss,
		start = 0,
	},
	[15] = {
		[0] = stageFight6.callFish,
		start = 10,
	},
}
----------------------------------------------------------------------
stageFight6_7 = {
	name = "Tr­íc ¶i thø 7",
	maxsecond = 25*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight6_7:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {};
		if ttd_checkConsume() == 0 then
			strtab = {
				"\n Më ¶i thø 7: Th«ng Thiªn L·o Tæ /#stageFight6_7.gotoSeven(1)",
				"\n Më ¶i thø 7: Th«ng Thiªn L·o Tæ (dïng h×nh thøc gian lËn ph¶i tiªu hao Th«ng Thiªn LÖnh x2)/#stageFight6_7.gotoSeven(2)",
				"\n rêi ¶i/ttd_askClose",
				"\nKÕt thóc ®èi tho¹i/nothing"
			};
		else
			strtab = {
				"\n Më ¶i thø 7: Th«ng Thiªn L·o Tæ /#stageFight6_7.gotoSeven(3)",
				"\n rêi ¶i/ttd_askClose",
				"\nKÕt thóc ®èi tho¹i/nothing"
			};
		end
		if g_nDebugVersion == 1 then
			tinsert(strtab,"T¹i h¹ muèn v­ît ¶i/ttd_tiaoguan");
		end
		Say("NhËm Doanh Doanh: T¹i h¹ linh c¶m cha ë Tßa Th¸p phÝa tr­íc…nh­ng t¹i h¹ linh c¶m cã ®iÒu g× bÊt an.",
			getn(strtab),
			strtab)
	end
end

function stageFight6_7.gotoSeven(nType)
	if nType == 1 then
		SetMissionV(this.mv7,0);
		SetMissionV(this.mv18,1);
	elseif nType == 2 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if GetItemCount(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3]) < tRealGod.nNeedNum then
			Talk(1,"","<color=green>NhËm Doanh Doanh<color>: Th«ng Thiªn LÖnh Bµi cña c¸c h¹ kh«ng ®ñ!");
			return 0;
		end
		if DelItem(tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum) == 1 then
			SetMissionV(this.mv7,1);
			SetMissionV(this.mv18,1);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", tRealGod.nNeedNum, 0)
			local item_para = format("%d,%d,%d,%d", tRealGod.tItem[1],tRealGod.tItem[2],tRealGod.tItem[3],tRealGod.nNeedNum)
			gf_WriteLogEx("tongtian mission", "cheat mode IB cost", "", "Th«ng Thiªn LÖnh", item_para);
		end
	elseif nType == 3 then
		SetMissionV(this.mv7,1);
		SetMissionV(this.mv18,2);
	end
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nNpcIDX);
	AddUnitStates(nNpcIDX, 8, -1000);
	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
	g_NpcAI:setWayPoint(nNpcIDX, tQrsMovePos[7]);
	SetNpcActivator(nNpcIDX);
	NpcChat(nNpcIDX,"Cuèi cïng ®· ®Õn Th«ng Thiªn HuyÔn C¶nh.");
--	ds_HDTTD:AddStatValue(1,15+nType,1);
end

function stageFight6_7.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	SetMissionV(this.mv18,0);
	SetMissionV(this.mv19,0);
	SetMissionV(this.mv20,0);
	ttd_createQRS(6); --ÈÎÓ¯Ó¯
	ttd_createWRD(); --ÎâÈÊµÀ
end

function stageFight6_7.onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight6_7.checkPos()
	self = stageFight6_7;
	local nNpcIDX = ttd_findNpc("NhËm Doanh Doanh");
	local nJZidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	local nLFidx = ttd_findNpc("Tµ NhËm Ng· Hµnh");
	local nLFidx2 = ttd_findNpc("NhËm Ng· Hµnh");
	local nJWidx = ttd_findNpc("H­íng VÊn Thiªn");
	local nMapID,nPosX,nPosY = GetNpcWorldPos(nNpcIDX);
	local nMax = getn(tQrsMovePos[7]);
	local nDistance = floor(sqrt((nPosX-tQrsMovePos[7][nMax][1])^2+(nPosY-tQrsMovePos[7][nMax][2])^2));
	local nCallBoss = GetMissionV(this.mv19);
	local nDialog = GetMissionV(this.mv20);
	if nCallBoss ~= 0 or nDialog ~= 0 or nDistance <= 3 then --3²½ÄÚ
		if GetMissionV(this.mv18) == 1 then --±¯¾ç
			if nCallBoss == 0 then --ÕÐ³öÍ¨ÌìÀÏ×æ
				nJZidx = ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);
				nLFidx = ttd_createSomeNpc(tNpcs.boss11,tPos.boss11);
				nJWidx = ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
				if nJZidx ~= 0 then
					SetMissionV(this.mv19,1);
					ttd_ChangeNpc2Talk(nNpcIDX);
					SetNpcScript(nNpcIDX,"");
					ttd_ChangeNpc2Talk(nJZidx);
					ttd_ChangeNpc2Talk(nLFidx);
					ttd_ChangeNpc2Talk(nJWidx);
					SetNpcActivator(nJZidx);
				else
					return 0;
				end
			else
				if nDialog >= 20 then --·Ï»°ËµÍê¿ª¸ã
					self:onFinish();
				else
					SetMissionV(this.mv20,nDialog+1);
					local tDialogs = {
						{nJZidx,"§Õn ®­îc chç nµy! NÕu kh«ng bÞ TiÓu tö nµy ®¸nh lÐn, giê ®· ®¹i c«ng c¸o thµnh råi!"},
						{nLFidx,"Doanh Doanh! µ!..."},
						{nLFidx,"TiÓu a ®Çu, d¸m ph¸ háng ®¹i sù cña L·o phu, h«m nay ng­¬i ph¶i chÕt."},
						{nJWidx,"ThiÕu chñ, Th«ng Thiªn L·o Tæ muèn phô thÓ vµo ng­êi gi¸o chñ, bÞ t¹i h¹ ph¸t hiÖn ph¸ tan ©m m­u ®ã."},
						{nJWidx,"NÕu b©y giê ®¸nh b¹i Th«ng Thiªn L·o Tæ, cßn cã thÓ cøu ®­îc gi¸o chñ."},
						{nNpcIDX,"Th«ng Thiªn L·o TÆc h·y nép m¹ng ®i!"},
						{nJZidx,"Dùa vµo b¶n lÜnh c¸c ng­¬i."},
						{nLFidx,"Dùa vµo b¶n lÜnh c¸c ng­¬i."},
						{nNpcIDX,"Nguyªn Hån cña Th«ng Thiªn L·o Tæ ®Ó t¹i h¹ ®èi phã, h·y ®i cøu cha ®i."},
						{nNpcIDX,"NhËt NguyÖt ThÇn Ên, Hé Th©n."},
						{nJZidx,"µ…ng­¬i d¸m ra tay víi ta, h·y chÕt ®i!"},
						{nLFidx,"µ…ng­¬i d¸m ra tay víi ta, h·y chÕt ®i!"},
					};
					if mod(nDialog+1,2) == 0 then
						local tTemp = tDialogs[(nDialog+1)/2];
						if tTemp then
							NpcChat(tTemp[1],tTemp[2]);
						end
					end
				end
			end
		else   -----Ï²¾ç
			if nCallBoss == 0 then --ÕÐ³öÍ¨ÌìÀÏ×æ
				nJZidx = ttd_createSomeNpc(tNpcs.boss12,tPos.boss12);
				nJWidx = ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
				nLFidx = ttd_createSomeNpc(tNpcs.boss14,tPos.boss14);
				if nJZidx ~= 0 then
					SetMissionV(this.mv19,1);
					ttd_ChangeNpc2Talk(nNpcIDX);
					SetNpcActivator(nNpcIDX);
					SetNpcScript(nNpcIDX,"");
					ttd_ChangeNpc2Talk(nJZidx);
					ttd_ChangeNpc2Talk(nJWidx);
					ttd_ChangeNpc2Talk(nLFidx);
					SetNpcActivator(nJZidx);
				else
					return 0;
				end
			else
				if nDialog >= 14 then --·Ï»°ËµÍê¿ª¸ã
					SetMissionV(firePhases.curPhaseLv,GetMissionV(firePhases.curPhaseLv)+1); --ÌøÒ»¹Ø
					self:onFinish();
				else
					SetMissionV(this.mv20,nDialog+1);
					local tDialogs = {
						{nJZidx,"§Õn ®­îc chç nµy! NÕu kh«ng bÞ TiÓu tö nµy ®¸nh lÐn, giê ®· ®¹i c«ng c¸o thµnh råi!"},
						{nJWidx,"ThiÕu chñ, Th«ng Thiªn L·o Tæ ®ang luyÖn Phô Th©n c¶nh giíi cuèi cïng, t¹i h¹ ®ét kÝch kh«ng thµnh c«ng."},
						{nJWidx,"Mau sö dông NhËt NguyÖt ThÇn Ên, cøu t¹i h¹ vµ gi¸o chñ."},
						{nNpcIDX,"NhËt NguyÖt ThÇn Ên, NhÊt KhÝ Ph¸ V¹n Ph¸p."},
						{nLFidx2,"Ha..ha…L·o phu tù do n÷a råi. Muèn lÊy m¹ng L·o phu, Th«ng Thiªn L·o Tæ, ng­¬i tù t×m ®­êng chÕt ®i."},
						{nJZidx,"Xem ra L·o phu xem th­êng c¸c ng­¬i råi, kh«ng sao, h·y chê L·o phu b¾t tõng ng­êi mét ®·."},
						{nNpcIDX,"NhËt NguyÖt ThÇn Ên, Hé Ph¸p!"}
					};
					if mod(nDialog+1,2) == 0 then
						local tTemp = tDialogs[(nDialog+1)/2];
						if tTemp then
							NpcChat(tTemp[1],tTemp[2]);
						end
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight6_7 = inherit(cycPhase, stageFight6_7);

stageFight6_7.actions = {
	[1] = stageFight6_7.init,
};
stageFight6_7.cycActions = {
	[1] = { --Ã¿Ãë¼ì²âÒ»ÏÂ
		[0] = stageFight6_7.checkPos,
	},
};

----------------------------------------------------------------------
stageFight7 = {
	name = "¶i thø 7: Th«ng Thiªn L·o Tæ",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "Th«ng Thiªn L·o Tæ",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

---------------------------------------------------------------------
function stageFight7:createSomeNpc()
	local nJZidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	local nLFidx = ttd_findNpc("Tµ NhËm Ng· Hµnh");
	local nJWidx = ttd_findNpc("H­íng VÊn Thiªn");
	if nJZidx ~= 0 then
		ttd_ChangeNpc2Fight(nJZidx);
		SetNpcActivator(nJZidx);
	else
		ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);
	end
	if nLFidx ~= 0 then
		ttd_ChangeNpc2Fight(nLFidx);
		SetNpcPos(nLFidx,1614,2698);
		SetNpcActivator(nLFidx);
		SetCurrentNpcSFX(nLFidx,929,2,1,18*3)
	else
		nLFidx = ttd_createSomeNpc(tNpcs.boss11,tPos.boss11);
		SetNpcPos(nLFidx,1614,2698);
		SetCurrentNpcSFX(nLFidx,929,2,1,18*3)
	end
	if nJWidx ~= 0 then
		--ttd_ChangeNpc2Fight(nJWidx);
		SetNpcActivator(nJWidx);
	else
		nJWidx = ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
		--ttd_ChangeNpc2Fight(nJWidx);
		SetCurrentNpcSFX(nJWidx,930,2,1,18*3)
	end
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
	SetNpcScript(nQRSidx,thisFile);
--	g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
--	g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[7]);
	--CastState2Npc(nQRSidx,"state_fetter",1,300*18,0,19999);
	--CastState2Npc(nQRSidx,"state_lock",1,300*18,0,19998);
	CastState2Npc(nQRSidx,"state_lost_life_per18",2000000,300*18,0,19997);
	CastState2Npc(nQRSidx,"state_knockback_immune",100,300*18,0,20000);
	CastState2Npc(nQRSidx,"state_knockdown_immune",100,300*18,0,20001);
	CastState2Npc(nQRSidx,"state_fetter_immune",100,300*18,0,20002);

	
	AddUnitStates(nQRSidx, 8, -1000);
end

function stageFight7:onNpcDeath(nNpcIDX)
	--print("stageFight7:onNpcDeath");
	local strNpcName = GetNpcName(nNpcIDX);
	--print("stageFight7:onNpcDeath ,",strNpcName);
	if strNpcName == "Tµ NhËm Ng· Hµnh" then
		--this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>¹Ø¿¨Ê¤Àû<color>");
		ttd_passStage(7,strNpcName);
		this.msCamp:turnPlayer(0,ttd_DailyWeeklyTask,1);
	elseif strNpcName == "NhËm Doanh Doanh" then
		this:Msg2MSAll("NhËm Doanh Doanh ®· chÕt!");
		this.msCamp:turnPlayer(0,StopTimeGuage,-2);
		self:onTimeout();
	end
end

function stageFight7:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[7][1], tbTraps[7][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
--		{m, tbTraps[7][3], tbTraps[7][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight7:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight7.init()
	self = stageFight7;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,7);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv7); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
	this.msCamp:turnPlayer(0,HeadMsg2Player,"T¹i<color=green>NhËm Doanh Doanh<color>tr­íc lóc chÕt ®¸nh b¹i<color=red>Tµ NhËm Ng· Hµnh<color>");
end

function stageFight7:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nLFidx = ttd_findNpc("Tµ NhËm Ng· Hµnh");
	local nTtidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	NpcChat(nTtidx,"Hõ, con KiÕn khèn khiÕp!");
	NpcChat(nLFidx,"Hõ, con KiÕn khèn khiÕp!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
--	SetMissionV(this.mv7,0);
end

function stageFight7.callFish()
	self = stageFight7;
	local nLFidx = ttd_findNpc("Tµ NhËm Ng· Hµnh");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	if nLFidx ~= 0 and IsNpcDeath(nLFidx) ~= 1 and nQRSidx ~= 0 and IsNpcDeath(nQRSidx) ~= 1 then
		local m,x,y = GetNpcWorldPos(nLFidx);
		local m1,x1,y1 = GetNpcWorldPos(nQRSidx);
		local tFishName = {"¸c §éc Chi HuyÕt T­êng Vi","¸i Hé Chi PhÊn Mai Kh«i"};
		local tFishModel = {"TËt §è Chi HuyÕt T­êng Vi","T­ LuyÕn Chi PhÊn Mai Kh«i "};
		NpcChat(nLFidx,"Yªu nh­ hoa, hËn còng nh­ hoa…..NhËm Ng· Hµnh ph¶i bÊt lùc vËy sao?");
		NpcChat(nLFidx,"Chó ý mµu s¾c hoa, mµu ®á sÏ s¸t th­¬ng Doanh Doanh, mµu hång phÊn ch÷a trÞ cho c« Êy.");
		for i = 1,5 do
			local tFishPos = {{{1603,2709}},{{1596,2709}},{{1592,2720}},{{1600,2732}},{{1606,2720}}};
			local nRand = random(1,getn(tFishName));
			ttd_createSomeNpc({tFishModel[nRand],tFishName[nRand], thisFile, nil, CampEnemy, 0},tFishPos[i],{{1647,2656}},AT_SM_MOVE);
		end
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>T­êng Vi, Hoa Kh«i<color>xuÊt hiÖn råi");
	end
end

function stageFight7.checkFish()
	local nLFidx = ttd_findNpc("Tµ NhËm Ng· Hµnh");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	if nLFidx ~= 0 and IsNpcDeath(nLFidx) ~= 1 and nQRSidx ~= 0 and IsNpcDeath(nQRSidx) ~= 1 then
		local tfish1 = ttd_findAllNpc("¸c §éc Chi HuyÕt T­êng Vi");
		local tfish2 = ttd_findAllNpc("¸i Hé Chi PhÊn Mai Kh«i");
		local nNum = getn(tfish1);
		if nNum ~= 0 then
			for i = 1,nNum do
				local nIDX = tfish1[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					local m,x,y = GetNpcWorldPos(nIDX);
					local m1,x1,y1 = GetNpcWorldPos(nQRSidx);
					local x2,y2 = 1647,2656;
					local nDistance = floor(sqrt((x1-x)^2+(y1-y)^2)); --¼ì²âÓëÈÎÓ¯Ó¯¾àÀë
					local nDistance2 = floor(sqrt((x2-x)^2+(y2-y)^2));
					if nDistance <= 3 or nDistance2 <= 2 then --3²½ÄÚ
						ttd_removeNpc(nIDX);
						CastState2Npc(nQRSidx,"imme_damage_life",10000000,1*18,0,19996);
					end
				end
			end
		end
		nNum = getn(tfish2);
		if nNum ~= 0 then
			for i = 1,nNum do
				local nIDX = tfish2[i];
				if IsNpcDeath(nIDX) ~= 1 then --»¹Ã»ËÀ
					local m,x,y = GetNpcWorldPos(nIDX);
					local m1,x1,y1 = GetNpcWorldPos(nQRSidx);
					local x2,y2 = 1647,2656;
					local nDistance = floor(sqrt((x1-x)^2+(y1-y)^2)); --¼ì²âÓëÈÎÓ¯Ó¯¾àÀë
					local nDistance2 = floor(sqrt((x2-x)^2+(y2-y)^2));
					if nDistance <= 3 or nDistance2 <= 2 then --3²½ÄÚ
						ttd_removeNpc(nIDX);
						CastState2Npc(nQRSidx,"imme_life_point_add",10000000,1*18,0,19995);
					end
				end
			end
		end
	end
end

----------------------------------------------------------------------
stageFight7 = inherit(cycPhase, stageFight7);

stageFight7.actions = {
	[1] = stageFight7.init,
}
stageFight7.cycActions = {
	[1] = {
		[0] = stageFight7.checkFish,
		start = 10,
	},
	[20] = {
		[0] = stageFight7.callFish,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight8 = {
	name = "¶i thø 7: Th«ng Thiªn L·o Tæ",
	maxsecond = 5*60, --5·ÖÖÓ
	actionsType = "second",
	guage = {
		msg = "Th«ng Thiªn L·o Tæ",
		time = 5*60,
		cyc = 0,
		id = 2,
	},
};

---------------------------------------------------------------------
function stageFight8:createSomeNpc()
	local nJZidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	local nJWidx = ttd_findNpc("H­íng VÊn Thiªn");
	local nLFidx = ttd_findNpc("NhËm Ng· Hµnh");
	if nJZidx ~= 0 then
		ttd_ChangeNpc2Fight(nJZidx);
		SetNpcActivator(nJWidx);
	else
		ttd_createSomeNpc(tNpcs.boss12,tPos.boss12);
	end
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Fight(nJWidx);
		SetNpcActivator(nJWidx);
	else
		ttd_createSomeNpc(tNpcs.boss13,tPos.boss13);
	end
	if nLFidx ~= 0 then
		ttd_ChangeNpc2Fight(nLFidx);
		SetNpcActivator(nLFidx);
	else
		ttd_createSomeNpc(tNpcs.boss14,tPos.boss14);
	end

	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	ttd_ChangeNpc2Fight(nQRSidx);
--	g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
--	g_NpcAI:setWayPoint(nQRSidx, tQrsMovePos[7]);
end

function stageFight8:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "Th«ng Thiªn L·o Tæ" then
		NpcChat(nNpcIDX,"Phô th©n thÊt b¹i tèn biÕt bao c«ng phu, t¹i h¹ thËt kh«ng cam lßng!");
		--this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>¹Ø¿¨Ê¤Àû<color>");
		local m,x,y = GetNpcWorldPos(nNpcIDX);
		ttd_passStage(8,strNpcName);
		this.msCamp:turnPlayer(0,ttd_DailyWeeklyTask,1);
	end
end

function stageFight8:createTrap()
	local m = this.msPosition:getMapID();
	local tTraps = {
		{m, tbTraps[7][1], tbTraps[7][2], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
--		{m, tbTraps[7][3], tbTraps[7][4], "\\settings\\static_script\\missions\\hunduantongtianding\\trap\\trap7.lua"},
	};
	gf_CreateTraps(tTraps);
end

function stageFight8:onTrap(id)
	local nCurStage = GetMissionV(MV_STAGE);
	SetPos(tbResetPos[nCurStage][1],tbResetPos[nCurStage][2]);
end

function stageFight8.init()
	self = stageFight8;
--	SetMissionV(firePhases.curPhaseLv,10);
	SetMissionV(MV_STAGE,8);
	self:createTrap();
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tStartPos[nCurStage][1],tStartPos[nCurStage][2],this.mv7); --´«ËÍÍæ¼Òµ½ÈÎÓ¯Ó¯¸½½ü
	this.msCamp:turnPlayer(0,HeadMsg2Player,"GiÕt<color=red>Th«ng Thiªn L·o Tæ<color>");
end

function stageFight8:onTimeout()
	this:Msg2MSAll("V­ît ¶i thÊt b¹i!");
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	NpcChat(nQRSidx,"Kh«ng ngê liªn thñ, còng kh«ng ph¶i ®èi thñ cña Ma §Çu!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	SetMissionV(firePhases.curPhaseLv,GetMissionV(firePhases.curPhaseLv)-1); --ÍËÒ»¹Ø
	self:onFailed();
	this.msCamp:turnPlayer(0,StopTimeGuage,-2);
	this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=red>v­ît ¶i thÊt b¹i#<color>");
end

function stageFight8.checkBoss()
	local nJZidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	if nJZidx ~= 0 and IsNpcDeath(nJZidx) ~= 1 then
		local nMaxLife,nCurLife = GetUnitCurStates(nJZidx,1);
		local nPercent = floor(nCurLife/nMaxLife*100);
		if nPercent <= 10 then
			local nJWidx = ttd_findNpc("H­íng VÊn Thiªn");
			local nLFidx = ttd_findNpc("NhËm Ng· Hµnh");
			local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
			NpcChat(nJZidx,"Giang s¬n x· t¾c cã nh©n tµi phß trî råi, xem ra t¹i h¹ giµ råi, kh«ng thÓ s¸nh víi tuæi trÎ, th«i, L·o phu ®i ®©y....");
			NpcChat(nLFidx,"Tù g©y nghiÖp ch­íng kh«ng thÓ sèng.");
			NpcChat(nQRSidx,"§Þch kh«ng cßn ®­êng tho¸t th©n, c¸c vÞ ®ång ®¹o còng søc cïng lùc kiÖt may lµ kh«ng sao.");
			NpcChat(nJWidx,"Gi¸o chñ, Doanh Doanh chóng ta l¹i gÆp n÷a råi.");
			local m,x,y = GetNpcWorldPos(nJZidx);
			ttd_passStage(8,GetNpcName(nJZidx));
			ttd_removeNpc(nJZidx);
			this.msCamp:turnPlayer(0,ttd_DailyWeeklyTask,1);
		end
	end
end

----------------------------------------------------------------------
stageFight8 = inherit(cycPhase, stageFight8);

stageFight8.actions = {
	[1] = stageFight8.init,
}
stageFight8.cycActions = {
	[1] = {
		[0] = stageFight8.checkBoss,
		start = 0,
	},
}
----------------------------------------------------------------------
stageFight9 = {
	name = "KÕt côc cña bi kÞch",
	maxsecond = 10*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight9:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
				"\n rêi ¶i/_all_pass_leave",
				"\nKÕt thóc ®èi tho¹i/nothing"
			};
		Say("NhËm Doanh Doanh: ViÖc nµy ®· kÕt thóc, hy väng Cha sau nµy cã thÓ sèng yªn æn råi ……",
			getn(strtab),
			strtab)
	end
end

--ÍË³ö
function _all_pass_leave()
	_op_on_team(_stat_on_player_when_all_pass)
	_stat_when_all_pass()
	ttd_confirmClose()
end

function stageFight9.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	local nQRSidx = ttd_createSomeNpc(tNpcs.qrs,{{1647,2656}});
	local nJWidx = ttd_createSomeNpc(tNpcs.boss13,{{1645,2647}});
	local nRWXidx = ttd_createSomeNpc(tNpcs.boss14,{{1657,2655}});
	local nTTLZidx = ttd_createSomeNpc(tNpcs.boss10,{{1656,2646}});
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Talk(nJWidx);
		SetNpcScript(nJWidx,"");
		SetNpcActivator(nJWidx);
	end
	if nQRSidx ~= 0 then
		ttd_ChangeNpc2Talk(nQRSidx);
		SetNpcScript(nQRSidx,"");
		SetNpcActivator(nQRSidx);
	end
	if nRWXidx ~= 0 then
		ttd_ChangeNpc2Talk(nRWXidx);
		SetNpcActivator(nRWXidx);
	end
	if nTTLZidx ~= 0 then
		ttd_ChangeNpc2Talk(nTTLZidx);
		SetNpcActivator(nTTLZidx);
	end
	this.msCamp:turnPlayer(0,ttd_setPos,1651, 2659); --´«ËÍÍæ¼Ò
	SetCurrentNpcSFX(nTTLZidx,913,0,1,18*60*2);
	NpcChat(nTTLZidx,"Kh«ng... t¹i h¹ ®· thÊt b¹i råi.");
end

function stageFight9.checkBoss()
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	local nRWXidx = ttd_findNpc("NhËm Ng· Hµnh");
	local nJWidx = ttd_findNpc("H­íng VÊn Thiªn");
	local nTTLZidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	if nTTLZidx ~= 0 then
		NpcChat(nRWXidx,"T¹i h¹ rèt cuéc còng ®· tØnh råi.");
		NpcChat(nQRSidx,"Cha…cha…");
		NpcChat(nJWidx,"Qu¸ tèt råi, gi¸o chñ b×nh yªn v« sù råi.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		ttd_removeNpc(nTTLZidx);
		---------------------
		--¸ø¾­Ñé
		this.msCamp:turnPlayer(0,ttd_ModifyExp,7); --¾­Ñé
		--¸øÏä×Ó
		local m,x,y = GetWorldPos();
		local nNpcIndex = CreateNpc("B¶o r­¬ng Tµi nguyªn",format("%s B¶o R­¬ng","Th«ng Thiªn L·o Tæ"),m,tTtdBoxAward[7][1],tTtdBoxAward[7][2]);
		SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\hunduantongtianding\\head.lua");
		--ÉèÖÃ½øÈëÏÂÒ»¹Ø¿ª¹Ø
		SetMissionV(tbHDTTD.mv23,nNpcIndex);
		---------------------
		SetNpcScript(nQRSidx,thisFile);
	end
end

function stageFight9.onTimeout()
	this:Msg2MSAll("Thêi gian kÕt thóc, h·y rêi khái Thiªn Th«ng §Ønh!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight9 = inherit(cycPhase, stageFight9);

stageFight9.actions = {
	[1] = stageFight9.init,
};
stageFight9.cycActions = {
	[1] = {
		[0] = stageFight9.checkBoss,
		start = 8,
	},
};

----------------------------------------------------------------------
stageFight10 = {
	name = "KÕt côc cña hµi kÞch",
	maxsecond = 10*60, --5·ÖÖÓ
	actionsType = "second",
};

function stageFight10:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == "NhËm Doanh Doanh" and ttd_isCaption() == 1 then
		local strtab = {
				"\n rêi ¶i/ttd_confirmClose",
				"\nKÕt thóc ®èi tho¹i/nothing"
			};
		Say("NhËm Doanh Doanh: ViÖc nµy ®· kÕt thóc, hy väng Cha sau nµy cã thÓ sèng yªn æn råi ……",
			getn(strtab),
			strtab)
	end
end

function stageFight10.init()
--	SetMissionV(firePhases.curPhaseLv,9);
	local nQRSidx = ttd_createSomeNpc(tNpcs.qrs,{{1647,2656}});
	local nJWidx = ttd_createSomeNpc(tNpcs.boss13,{{1645,2647}});
	local nRWXidx = ttd_createSomeNpc(tNpcs.boss14,{{1657,2655}});
	local nTTLZidx = ttd_createSomeNpc(tNpcs.boss10,{{1656,2646}});
	if nQRSidx ~= 0 then
		ttd_ChangeNpc2Talk(nQRSidx);
		SetNpcScript(nQRSidx,"");
		SetNpcActivator(nQRSidx);
	end
	if nJWidx ~= 0 then
		ttd_ChangeNpc2Talk(nJWidx);
		SetNpcScript(nJWidx,"");
		SetNpcActivator(nJWidx);
	end
	if nRWXidx ~= 0 then
		ttd_ChangeNpc2Talk(nRWXidx);
		SetNpcActivator(nRWXidx);
	end
	if nTTLZidx ~= 0 then
		ttd_ChangeNpc2Talk(nTTLZidx);
		SetNpcActivator(nTTLZidx);
	end
	this.msCamp:turnPlayer(0,ttd_setPos,1651, 2659); --´«ËÍÍæ¼Ò
	SetCurrentNpcSFX(nTTLZidx,913,0,1,18*60*2);
	NpcChat(nTTLZidx,"Kh«ng... t¹i h¹ ®· thÊt b¹i råi.");
end

function stageFight10.checkBoss()
	local nQRSidx = ttd_findNpc("NhËm Doanh Doanh");
	local nRWXidx = ttd_findNpc("NhËm Ng· Hµnh");
	local nJWidx = ttd_findNpc("H­íng VÊn Thiªn");
	local nTTLZidx = ttd_findNpc("Th«ng Thiªn L·o Tæ");
	if nTTLZidx ~= 0 then
		NpcChat(nRWXidx,"T¹i h¹ rèt cuéc còng ®· tØnh råi.");
		NpcChat(nQRSidx,"Cha…cha…");
		NpcChat(nJWidx,"Qu¸ tèt råi, gi¸o chñ b×nh yªn v« sù råi.");
		this.msCamp:turnPlayer(0,HeadMsg2Player,"<color=green>v­ît ¶i thµnh c«ng<color>");
		ttd_removeNpc(nTTLZidx);
		---------------------
		--¸ø¾­Ñé
		this.msCamp:turnPlayer(0,ttd_ModifyExp,8); --¾­Ñé
		--¸øÏä×Ó
		local m,x,y = GetWorldPos();
		local nNpcIndex = CreateNpc("B¶o r­¬ng Tµi nguyªn",format("%s B¶o R­¬ng","Th«ng Thiªn L·o Tæ"),m,tTtdBoxAward[8][1],tTtdBoxAward[8][2]);
		SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\hunduantongtianding\\head.lua");
		--ÉèÖÃ½øÈëÏÂÒ»¹Ø¿ª¹Ø
		SetMissionV(tbHDTTD.mv23,nNpcIndex);
		---------------------
		SetNpcScript(nQRSidx,thisFile);
	end
end

function stageFight10.onTimeout()
	this:Msg2MSAll("Thêi gian kÕt thóc, h·y rêi khái Thiªn Th«ng §Ønh!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight10 = inherit(cycPhase, stageFight10);

stageFight10.actions = {
	[1] = stageFight10.init,
};
stageFight10.cycActions = {
	[1] = {
		[0] = stageFight10.checkBoss,
		start = 8,
	},
};

----------------------------------------------------------------------
firePhases.phases = {stageFight00,stageFight0,stageFight1,stageFight1_2,stageFight2,stageFight2_3,stageFight3,stageFight3_4,stageFight4,stageFight4_5,stageFight5,stageFight5_6,stageFight6,stageFight6_7,stageFight7,stageFight8,stageFight9,stageFight10};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "Trong 150 phót nÕu kh«ng v­ît qua Th«ng Thiªn §Ønh, cöa ¶i sÏ ®ãng l¹i!");
	ttd_confirmClose();
end

function firePhases:getPhase()
	local n = GetMissionV(self.curPhaseLv);
	local s = self.phases[n];
	if not s then
		print(format("[error] [firePhases:getPhase] [n=%s, s=%s]", tostring(n), tostring(s)));
		return nil;
	end
	return s;
end

function firePhases:onFailed()
	local nCurLv = GetMissionV(self.curPhaseLv)-1;
	SetMissionV(self.curPhaseLv,nCurLv);
	if self.phases[nCurLv] then
		self.phases[nCurLv]:onInit(self);
	else
		self:onTimeout();
	end
end

----------------------------------------------------------------------
tbHDTTD = gf_CopyInherit(missionBase, tbHDTTD);

tbHDTTD.msOption.bSetPkFlag = 0; --Á·¹¦Ä£Ê½
tbHDTTD.msOption.bSetPkCamp = 0;
tbHDTTD.msOption.szInitDeahScript = thisFile;

tbHDTTD.msPhases[1] = firePhases;

tbHDTTD.msPosition.entryPos = {
	{1592,3201},
};
tbHDTTD.msPosition.exitPos = {500, 1736, 3043};

--function tbHDTTD:onInit()
----	print("tbHDTTD:onInit")
--	missionBase.onInit(self);
--	firePhases:onInit();
--end

tbHDTTD.msOption.OnPlayerJoin = function(self, nCamp)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1474*32,2961*32); --ÁÙÊ±ÖØÉúµã

	--³õÊ¼»¯½±Àø
	MissionAward_Initialize();
	
	--gf_WriteLogEx("tongtian mission", "enter mission");

--	if GetCaptainName() == GetName() then --¶Ó³¤
--		SetTeamForbitType(GetTeamID(),-1,0);
--	end
end

tbHDTTD.msOption.OnPlayerLeave = function(self, nCamp)
	ttd_cleanGodState();
	MissionAward_UnInitialize()--·´³õÊ¼»¯¹Ø¿¨½±Àø
--	if GetCaptainName() == GetName() then --¶Ó³¤
--		SetTeamForbitType(GetTeamID(),0,0);
--	end
	--local nCurStage = GetMissionV(MV_STAGE) or 0;
	--gf_WriteLogEx("tongtian mission", format("leave mission at stage %d", nCurStage));
end

this = tbHDTTD;
