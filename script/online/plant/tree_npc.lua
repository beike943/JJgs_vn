Include("\\script\\online\\plant\\tree_head.lua");
--Ô½ÄÏ09Äê7ÔÂ»î¶¯¿ª¹ØÍ·ÎÄ¼þ
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
--Ô½ÄÏ09Äê12ÔÂ»î¶¯Í·ÎÄ¼þ
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
--ËùÓÐ»î¶¯¸øÖÖÊ÷½±ÀøµÄÍ³Ò»Í·ÎÄ¼þ
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

--******************************************************
--	CAY BAT NHA TO
--******************************************************
function main()
	local npcIdx,npcModel,npcName = GetTriggeringUnit();
	if npcIdx == 0 then
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Khi t­íi n­íc, GetTriggeringUnit thø 1, trÞ quay l¹i lµ 0");
		return 0;
	end;
	local nNameLen = strlen(GetName());
	local bJudgeByName = 0;
	if GetName() == strsub(npcName,1,nNameLen) then
		bJudgeByName = 1;
	end;
	local bIsTree = 0;
	for i=1,getn(TREETYPE) do
		if npcModel == TREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:NPC:"..npcName.."Lçi files gèc");
		return 0;
	end;
	Create_Map_Trigger();
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Khi t­íi n­íc, GetTargetNpc trÞ quay l¹i lµ 0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME or GetTask(TASK_PLANTTIME) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX) then
			Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	if nTreeGrow < 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].." sinh tr­ëng rÊt tèt, t¹m thêi kh«ng cÇn t­íi n­íc nh­ng kh«ng nªn ®i qu¸ xa, nÕu sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh«ng t­íi, c©y sÏ thiÕu n­íc mµ chÕt. Thêi gian t­íi n­íc lÇn sau cßn <color=yellow>"..Get_Time_String(TREETYPE[nTreeGrow][3]-nTimePassed).."<color>.");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 6 then
		if nTimePassed < TREETYPE[nTreeGrow][3] then
			Talk(1,"",TREETYPE[nTreeGrow][2].."C©y ph¸t triÓn, kh«ng nªn h¸i sím, sau <color=yellow>"..(TREETYPE[nTreeGrow][3]-nTimePassed).." gi©y<color> h·y h¸i.");
			return 0;
		end;
		tinsert(selTab,"H·y mau h¸i ®Ó tr¸nh bÞ c­íp/getfruit");
		tinsert(selTab,"Sau nµy h·y h¸i!/nothing");
		sSaySth = "Qu¶ Th¸i H­ B¸t Nh· ®· chÝn, kÕt ra 1 tr¸i Tiªn Qu¶ võa to võa t­¬i, b¹n muèn h¸i chø? NÕu sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh«ng h¸i th× qu¶ sÏ chÕt!";
	else
		tinsert(selTab,"T­íi n­íc (cÇn "..TREETYPE[nTreeGrow+1][4].." phÇn Lé Thñy)/givewater");
		tinsert(selTab,"Sau nµy h·y t­íi./nothing");
		sSaySth = TREETYPE[nTreeGrow][2].." ®ang cÇn t­íi Lé Thñy, cã muèn t­íi kh«ng? NÕu sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME)).."<color> sau kh«ng t­íi qu¶ sÏ thiÕu n­íc mµ chÕt.";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW);
	local npcTreeIndex = GetTask(TASK_TREEINDEX);
	if npcTreeIndex == 0 then
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc t­íi n­íc, TASK_TREEINDEX biÕn l­îng nhiÖm vô lµ 0");
		return 0;
	end;	
	if DelItem(2,0,351,TREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","Kh«ng ®ñ Lé Thñy!");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(TREETYPE[nTreeGrow+1][1],GetName().." trång "..TREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc t­íi c©y, trÞ quay l¹i hµm sè CreateNpc lµ 0. Tham sè nhËp CreateNpc:"..TREETYPE[nTreeGrow+1][1]..","..GetName().." trång "..TREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua")
	SetTask(TASK_TREEINDEX,npcTreeIndex);
	SetTask(TASK_TREEGROW,nTreeGrow+1);
	SetTask(TASK_PLANTTIME,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME);
	local nTreeGrow = GetTask(TASK_TREEGROW);
	if nTreeGrow ==6 then
		StartTimeGuage("Thu ho¹ch",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("T­íi c©y",TREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	local tFruitAwardJune2010 = {
		[1] = {9880, 	30, 		30, 		30,		30, 		{2,1,30164,1}, "Nh·n"},
		[2] = {30, 		9880, 	30, 		30,	 	30,		{2,1,30165,1}, "Ch«m Ch«m"},
		[3] = {30, 		30, 		9880, 	30, 		30,		{2,1,30166,1}, "Cam"},
		[4] = {30, 		30, 		30, 		9880, 	30,		{2,1,30167,1}, "Dõa"},
		[5] = {30, 		30, 		30, 		30, 		9880,		{2,1,30168,1}, "M¨ng Côt"},
		[6] = {9880, 		30, 		30, 		30, 		30,	{2,1,30169,1}, "B­ëi"},
		[7] = {30, 	9880, 		30, 		30,		30, 		{2,1,30170,1}, "D©u"},
		[8] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30171,1}, "Chuèi"},
		[9] = {30, 		30, 		30, 	9880, 		30,		{2,1,30172,1}, "Xoµi"},
		[10] = {30, 		30, 		30, 		30, 	9880,			{2,1,30173,1}, "§µo"},
		[11] = {9880, 		30, 		30, 		30, 		30,	{2,1,30174,1}, "MËn"},
		[12] = {30, 	9880, 		30, 		30,		30, 		{2,1,30175,1}, "V¶i"},
		[13] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30176,1}, "T¸o"},
		[14] = {30, 		30, 		30, 	9880, 		30,		{2,1,30177,1}, "B¬"},
		[15] = {30, 		30, 		30, 		30, 	9880,			{2,1,30178,1}, "§u §ñ"},
		[16] = {9880, 		30, 		30, 		30, 		30,	{2,1,30179,1}, "M·ng CÇu"},
		[17] = {30, 	9880, 		30, 		30,		30, 		{2,1,30180,1}, "Khãm"},
		[18] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30181,1}, "Lª"},
		[19] = {30, 		30, 		30, 	9880, 		30,		{2,1,30182,1}, "Bßn bon"},
		[20] = {30, 		30, 		30, 		9880, 	30,		{2,1,30183,1}, "KhÕ"},
	}
	if GetTask(TASK_TREEGROW) == 6 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc h¸i qu¶, GetTargetNpc trÞ quay l¹i lµ 0");
			 return 0;
		end;
		
		local nGroup = fruitcheckserver()
		if nGroup ==  0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 2}, tFruitAwardJune2010[nGroup][7], "Bat Nha Lon", "nhËn")

		
		--VBonus
		local nDate =  tonumber(date("%y%m%d%H"))
		Give_Fruit_Award(npcTreeIndex);
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX,0);
		SetTask(TASK_TREEGROW,0);
		SetTask(TASK_PLANTTIME,0);
		SetDeathScript("");
		WriteLogEx("Trong cay Bat Nha", "Hai qua");
   		--nhiÖm vô lµm giµu
   		if CFG_NhiemVuLamGiau == 1 then
		     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 8) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 8, 1, 0)
		     		TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Trång thµnh c«ng 01 B¸t Nh· Lín.")
		     end
		end
		-----------------------Chuçi nhiÖm vô §ång Hµnh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 19 then
				DongHanh_SetStatus()
			end
		end
		----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u sè thø 4 vµ 5 ®Çu bªn ph¶i
		local nCSD_BNL = floor(GetTask(TSK_CSD_COUNT_C) / 1000)
		local nNumBK = mod(GetTask(TSK_CSD_COUNT_C),1000)
		if mod(nCSD_BNL, 100) < 99 and GetTask(TSK_CSD) == 1 then
			nCSD_BNL = (nCSD_BNL + 1) * 1000 + nNumBK
			SetTask(TSK_CSD_COUNT_C, nCSD_BNL)
		end
		---------------------------------
		local nRandomNum = 0;
		nRandomNum = random(1,100);
		if nRandomNum <= 100 then
			ModifyExp(200000);	--¶þÊ®Íò¾­Ñé
			Msg2Player("B¹n nhËn ®­îc 20 v¹n kinh nghiÖm");
			WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 20 v¹n kinh nghiÖm");
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			if AddItem(1,0,32,2) == 1 then
				Msg2Player("B¹n nhËn ®­îc 2 Cöu ChuyÓn Hoµn Hån §¬n");
				WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 2 Cöu ChuyÓn Hoµn Hån §¬n");
			end;		
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 20 then
			if AddItem(2,2,8,3) == 1 then
				Msg2Player("B¹n nhËn ®­îc 3 Thiªn Th¹ch");
				WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 3 m¶nh Thiªn Th¹ch");
			end;		
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 5 then
			if AddItem(2,1,473,1) == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 Th¸i H­ B¸t Qu¸i Bµi");
				WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 1 Th¸i H­ B¸t Qu¸i Bµi-Li");
			end;		
		end;
		nRandomNum = random(1,200);
		if nRandomNum == 1 then
			if AddItem(2,1,474,1) == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 Th¸i H­ B¸t Qu¸i Bµi");
				WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."nhËn ®­îc 1 Th¸i H­ B¸t Qu¸i Bµi-ChÊn");
			end;		
		end;
		nRandomNum = random(1,10000);
		if nRandomNum <= 5 then
			if AddItem(0,107,155,1) == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 quyÓn ".."Ngò Hµnh MËt tÞch");
				WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Thu ®­îc 1 ".."Ngò Hµnh MËt tÞch");
			end;		
		end;
		
		-- NhiÖm vô ChuyÓn Sinh 3
		 if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) < 64 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) == 64 then
				TaskTip("Hoµn thµnh yªu cÇu cña §¶o Chñ §µo Hoa §¶o 64 lÇn trång thµnh c«ng B¸t Nh· Lín")
			end
		end
		
		-- NhiÖm vô ChuyÓn Sinh 4
		 if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) < 16 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK4) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4) == 10 then
				gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK4, 0)
				gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK4, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) +1)
			end
			if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK4) == 16 then
				TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh 160 lÇn trång thµnh c«ng B¸t Nh· Lín")
			end
		end
		
		gf_EventGiveCustomAward(2,160000,0,"Bat Nha Lon","nhËn")

		--Give_YuanXiao_Award(2);
		
		--¸ø09Äê6ÔÂ7ÔÂ»î¶¯³Â¾ÉÃÜ±¾½±Àø
		give_viet20090607_miben();
		--¸ø09Äê8ÔÂ»î¶¯Ë®¹û´ü½±Àø
		give_viet200908_shuiguodai();
		--09Äê8ÔÂµ÷Õû£¬µÃ°ãÈôÖ¤Êé
		give_viet200908_banruozhengshu();
		--¸ø09Äê9ÔÂÖÐÇï»î¶¯°×Ãæ°ü½±Àø
		give_viet200909_baimianbao();
		give_viet200911_hoacuc();
          give_viet200912_shengdantangguo()
                --ËùÓÐ¸ø½±ÀøµÄÍ³Ò»´¦Àí
          Give_DaBanRuoShu_Award();          
          ThuHoachBatNhaLon()
	end;
end;

function nothing()

end;

function Give_Fruit_Award(npcTreeIndex)
	local szNpcName = GetNpcName(npcTreeIndex)	
	local nMapID, nWx, nWy = GetNpcWorldPos(npcTreeIndex)
	local nAddX,nAddY = 0,0	
	local nTargetNpc = 0		
	for i = 1, 8 do
		nAddX = random(-5, 5)
		nAddY = random(-5, 5)
		nTargetNpc = CreateNpc("Tói cao thñ", "Tói tr¸i c©y", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 5*60)
		SetNpcScript(nTargetNpc, "\\script\\online\\plant\\fruit_baoguo.lua")
	end
end

--¸ø09Äê6ÔÂ7ÔÂ³Â¾ÉÃÜ±¾½±Àø
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		gf_SetLogCaption("Truy t×m tr­êng sinh phæ");
		gf_AddItemEx({2, 1, 30088, 100}, "BÝ Phæ Cò N¸t");
		WriteLogEx("Hoat dong thang 6","B¸t Nh·",100,"BÝ Phæ Cò N¸t");
		gf_SetLogCaption("");
	end
end

--¸ø09Äê8ÔÂ»î¶¯Ë®¹û´ü½±Àø
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		gf_SetLogCaption("[Hoat dong thang 8]");
		nRet = gf_AddItemEx({2, 1, 30097, 100}, "Tói Tr¸i C©y");
		if nRet == 1 then
			WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",100,"Trong cay bat nha");
		end
		gf_SetLogCaption("");
	end
end
--09Äê8ÔÂµ÷Õû£¬µÃ°ãÈôÖ¤Êé
function give_viet200908_banruozhengshu()
	local nRand = random(1, 100);
	local nCount = 0;
	if nRand <= 10 then
		nCount = 2;
	elseif nRand <= 95 then
		nCount = 1;
	else
		nCount = 3;
	end
	for i = 1, nCount do
		local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B¸t Nh· Chøng Th­");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 15 * 24 * 3600);
		end
	end
	WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha", nCount, "Bat Nha Chung Thu");
end

--¸ø09Äê9ÔÂÖÐÇï»î¶¯°×Ãæ°ü½±Àø
function give_viet200909_baimianbao()
	if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 091026 then
		gf_SetLogCaption("[Hoat dong trung thu 2009]");
		gf_AddItemEx({2, 1, 30106, 100}, "Bét M×");
		WriteLogEx("Hoat dong trung thu","B¸t Nh· Lín",100,"Bét M×");
		gf_SetLogCaption("");
	end
end

function give_viet200911_hoacuc()
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
		gf_AddItemEx({2, 1, 30118, 40}, "Hoa Cóc");
		WriteLogEx("Hoat dong thang 11","B¸t Nh· Lín",40,"Hoa Cóc");		
	end
end

--¸ø09Äê12ÔÂÊ¥µ®ÌÇ¹û½±Àø
function give_viet200912_shengdantangguo()
	if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 100117 then
	    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE
	    gf_AddItemEx2({2, 1, 30138, 80}, "C©y KÑo Gi¸ng Sinh", szFullLog, 0, 1, 10, 1,"B¸t Nh· lín");
	end
end

function fruitcheckserver()
	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(tFruitAwardServerGroup) do
		for j = 1, getn(tFruitAwardServerGroup[i]) do
			if nServerID == tFruitAwardServerGroup[i][j] then
				return i
			end
		end	
	end
	return 0
end