Include("\\script\\online\\plant\\tree_head.lua");
--Ô½ÄÏ09Äê7ÔÂ»î¶¯¿ª¹ØÍ·ÎÄ¼þ
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\globalfunctions.lua");
--Ô½ÄÏ09Äê12ÔÂ»î¶¯Í·ÎÄ¼þ
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
--ËùÓÐ»î¶¯¸øÖÖÊ÷½±ÀøµÄÍ³Ò»Í·ÎÄ¼þ
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\plant\\guoshi13_24.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

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
	for i=1,getn(SMALLTREETYPE) do	--Õâ¸öÊÇÓÃÀ´¼ì²éÄ¿±êNPCÊÇ²»ÊÇÊ÷£¬²»¹ý¸Ð¾õºÃÏñÃ»Ê²Ã´ÒâÒå
		if npcModel == SMALLTREETYPE[i][1] then
			bIsTree = 1;
			break;
		end;
	end;
	if bIsTree == 0 then
		SetNpcScript(npcIdx,"");
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:NPC:"..npcName.."Lçi files gèc");
		return 0;
	end;
	local npcTreeIndex = GetTargetNpc();
	if npcTreeIndex == 0 then
		 WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Khi t­íi n­íc, GetTargetNpc trÞ quay l¹i lµ 0");
		 return 0;
	end;
	if bJudgeByName == 0 then
		if GetTime() - GetTask(TASK_PLANTTIME_SMALL) > TREELIFETIME or GetTask(TASK_PLANTTIME_SMALL) == 0 or npcTreeIndex ~= GetTask(TASK_TREEINDEX_SMALL) then
			Msg2Player("§©y kh«ng ph¶i lµ c©y b¹n trång");
			return 0;
		end;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	if nTreeGrow < 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].." sinh tr­ëng rÊt tèt, t¹m thêi kh«ng cÇn t­íi n­íc nh­ng kh«ng nªn ®i qu¸ xa, nÕu sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> sau kh«ng t­íi, c©y sÏ thiÕu n­íc mµ chÕt. Thêi gian t­íi n­íc lÇn sau cßn <color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color>.");
			return 0;
		end;
	end;
	local sSaySth = "";
	local selTab = {};
	if nTreeGrow == 3 then
		if nTimePassed < SMALLTREETYPE[nTreeGrow][3] then
			Talk(1,"",SMALLTREETYPE[nTreeGrow][2].." võa míi ph¸t triÓn, kh«ng nªn nhæ c©y, sau <color=yellow>"..Get_Time_String(SMALLTREETYPE[nTreeGrow][3]-nTimePassed).."<color> h·y nhæ.");
			return 0;
		end;
		tinsert(selTab,"H·y nhæ c©y ®i! Trång tiÕp nã còng kh«ng ph¸t triÓn./getfruit");
		tinsert(selTab,"Sau nµy h·y nhæ!/nothing");
		sSaySth = "H¹t Th¸i H­ nhá chØ cã thÓ ph¸t triÓn thµnh c©y Th¸i H­ nhá! B©y giê nhæ c©y cã thÓ nhËn ®­îc quµ bÊt ngê! Cã muèn nhæ c©y? NÕu sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> sau kh«ng nhæ th× c©y sÏ chÕt!";
	else
		tinsert(selTab,"T­íi n­íc (cÇn "..SMALLTREETYPE[nTreeGrow+1][4].." phÇn Lé Thñy)/givewater");
		tinsert(selTab,"Sau nµy h·y t­íi./nothing");
		sSaySth = SMALLTREETYPE[nTreeGrow][2].." ®ang cÇn t­íi Lé Thñy, cã muèn t­íi kh«ng? NÕu sau <color=yellow>"..Get_Time_String(TREELIFETIME-GetTime()+GetTask(TASK_PLANTTIME_SMALL)).."<color> kh«ng t­íi th× c©y thiÕu n­íc mµ chÕt.";
	end;
	
	Say(sSaySth,getn(selTab),selTab);
end;

function givewater()
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	local npcTreeIndex = GetTask(TASK_TREEINDEX_SMALL);
	if npcTreeIndex == 0 then
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc t­íi n­íc, TASK_TREEINDEX biÕn l­îng nhiÖm vô lµ 0");
		return 0;
	end;	
	if DelItem(2,0,351,SMALLTREETYPE[nTreeGrow+1][4]) ~= 1 then
		Talk(1,"","Kh«ng ®ñ Lé Thñy!");
		return 0;
	end;
	local MapID,MapX,MapY = GetNpcWorldPos(npcTreeIndex)
	SetNpcLifeTime(npcTreeIndex,0);
	SetNpcScript(npcTreeIndex,"");
	npcTreeIndex = CreateNpc(SMALLTREETYPE[nTreeGrow+1][1],GetName().." trång "..SMALLTREETYPE[nTreeGrow+1][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc t­íi c©y, trÞ quay l¹i hµm sè CreateNpc lµ 0. Tham sè nhËp CreateNpc:"..SMALLTREETYPE[nTreeGrow+1][1]..","..GetName().." trång "..SMALLTREETYPE[nTreeGrow+1][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,TREELIFETIME);
	SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua")
	SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
	SetTask(TASK_TREEGROW_SMALL,nTreeGrow+1);
	SetTask(TASK_PLANTTIME_SMALL,GetTime());
	local nTimePassed = GetTime() - GetTask(TASK_PLANTTIME_SMALL);
	local nTreeGrow = GetTask(TASK_TREEGROW_SMALL);
	if nTreeGrow ==3 then
		StartTimeGuage("Thu ho¹ch",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)			
	else
		StartTimeGuage("T­íi c©y",SMALLTREETYPE[nTreeGrow][3]-nTimePassed,0,1)	
	end
end;

function getfruit()
	if GetTask(TASK_TREEGROW_SMALL) == 3 then
		local npcTreeIndex = GetTargetNpc();
		if npcTreeIndex == 0 then
			 WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc nhæ c©y, GetTargetNpc trÞ quay l¹i lµ 0");
			 return 0;
		end;
		SetNpcScript(npcTreeIndex,"");
		SetNpcLifeTime(npcTreeIndex,0);
		SetTask(TASK_TREEINDEX_SMALL,0);
		SetTask(TASK_TREEGROW_SMALL,0);
		SetTask(TASK_PLANTTIME_SMALL,0);
		ModifyExp(100000);	--Ê®Íò¾­Ñé
		Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm kinh nghiÖm");
		local nRandomNum = 0;
		nRandomNum = random(1,100);
		if nRandomNum <= 20 then
			ModifyExp(100000);	--Ê®Íò¾­Ñé
			Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm kinh nghiÖm");
			WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 100000 ®iÓm kinh nghiÖm");
		end;
		nRandomNumSuper = random(1,100);
		if nRandomNumSuper <=70 then
			nRandomNum = random(1,100);
			if nRandomNum <= 20 then
				if AddItem(2,2,7,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 m¶nh Thiªn Th¹ch");
					WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 1 m¶nh Thiªn Th¹ch");
				end;		
			end;
			nRandomNum = random(1,100);
			if nRandomNum == 1 then
				if AddItem(2,1,473,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 Th¸i H­ B¸t Qu¸i Bµi-Li");
					WriteLog("[Ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."NhËn ®­îc 1 Th¸i H­ B¸t Qu¸i Bµi-Li");
				end;		
			end;
		else
			local nRetCode, nIndex = gf_AddItemEx({2, 1, 30114, 1}, "B¸t Nh· Chøng Th­");
			if nRetCode == 1 then
				SetItemExpireTime(nIndex, 15 * 24 * 3600);
				WriteLogEx("Uy thac trong cay", "Trong cay Bat Nha nho", 1, "Bat Nha Chung Thu");
			end
		end
		--Give_YuanXiao_Award(1);
		
		--¸ø09Äê6ÔÂ7ÔÂ»î¶¯³Â¾ÉÃÜ±¾½±Àø
		give_viet20090607_miben();
		--¸ø09Äê8ÔÂ»î¶¯Ë®¹û´ü½±Àø
		give_viet200908_shuiguodai();
		--¸ø09Äê9ÔÂÖÐÇï»î¶¯°×Ãæ°ü½±Àø
		give_viet200909_baimianbao();
		give_viet200911_hoacuc()
           give_viet200912_shengdantangguo()
           Give_XiaoBanRuoShu_Award();
           Give_Fruit_Award();
           VietSmallFruit_Award();
           ThuHoachBatNhaNho();
           --IP Bonus
		--Give_IpBonus_SmallTree()
		
--           if GetTask(TASK_PLAN_SMALLTREE_COUNT) == 8 then
--           	local nGroup = fruitcheckserver()
--			gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 2}, tFruitAwardJune2010[nGroup][7], "Trong Bat Nha Nho", "nhËn khi trång 8 c©y")
--           end
           
           --Bang héi tinh anh 6 , nguån ra hoa hång
           if (GetTask(TASK_PLAN_SMALLTREE_COUNT) == 8 or GetTask(TASK_PLAN_SMALLTREE_COUNT) == 16) and tonumber(date("%Y%m%d")) >= 20110930 and tonumber(date("%Y%m%d")) <= 20111023 then
           	gf_AddItemEx2({2, 0, 1164, 20, 1}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "trång B¸t Nh· Nhá")
           end
	     --nhiÖm vô lµm giµu
	     if CFG_NhiemVuLamGiau == 1 then
		     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 7) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 7, 1, 0)
		     		TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Trång thµnh c«ng 01 B¸t Nh· Nhá.")
		     end
		end
		-----------------------Chuçi nhiÖm vô §ång Hµnh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 18 then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
  		-- NhiÖm vô ChuyÓn Sinh 3        	
          	if GetTask(TRANSLIFE_MISSION_ID) == 19 and gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) < 128 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) == 128 then
				TaskTip("Hoµn thµnh yªu cÇu cña §¶o Chñ §µo Hoa §¶o 128 lÇn trång thµnh c«ng B¸t Nh· Nhá")
			end
		end
		
		-- NhiÖm vô ChuyÓn Sinh 4
		if GetTask(TRANSLIFE_MISSION_ID) == 26 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) < 32 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
			if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3) == 10 then
				gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, 0)
				gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) +1)
			end
			if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) == 32 then
				TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh 320 lÇn trång thµnh c«ng B¸t Nh· Nhá")
			end
		end
		
		-- NhiÖm vô chuyÓn sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) < 32 then
		gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34,TRANSLIFE_BYTE_TASK3) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3) == 10 then
			gf_SetTaskByte(TRANSLIFE_TASK_34, TRANSLIFE_BYTE_TASK3, 0)
			gf_SetTaskByte(TRANSLIFE_TASK_34_FLAG, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) +1)
		end
		if gf_GetTaskByte(TRANSLIFE_TASK_34_FLAG,TRANSLIFE_BYTE_TASK3) == 32 then
			TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh 320 lÇn trång thµnh c«ng C©y B¸t Nh· Nhá")
		end
	end
		
		if GetTask(TASK_PLAN_SMALLTREE_COUNT) > 3 then
	           local nLastLingshuDate = GetTask(85)
	           local nMultiCount = GetTask(86)
			local nDate = tonumber(date("%Y%m%d"))
			local nSMPoint = 5
			if nDate >= 20100821 and nDate <= 20100822 then
				nSMPoint = 10
			end
	           if nLastLingshuDate == nDate then
	           	local nBonusExp = nMultiCount * nSMPoint
	           	SetTask(336, GetTask(336) + nBonusExp)
	           	Msg2Player("NhËn ®­îc "..nBonusExp.." ®iÓm cèng hiÕn S­ M«n.")
	           else
				SetTask(86, 1)
				SetTask(336, GetTask(336) + nSMPoint)
	           	Msg2Player("NhËn ®­îc "..nSMPoint.." ®iÓm cèng hiÕn S­ M«n.")
			end
		end
	end;
end;

function Give_Fruit_Award()
--		gf_AddItemEx2({2, 1, 30165, 1}, "Ch«m Ch«m","Hoat dong thang 4 nam 2010","PhÇn th­ëng trång c©y b¸t nh· nhá");
	if GetTask(TASK_PLAN_SMALLTREE_COUNT) >= 9 then
		local nGroup = fruitcheckserverNov()
		if nGroup == 0 then
			nGroup = mod(random(0,1000),20) + 1
		end
		gf_AddItemEx2(tFruitAwardNov2010[nGroup][6], tFruitAwardNov2010[nGroup][7], "Trong Bat Nha Nho", "nhËn khi trång 1 c©y")
	end
end

function nothing()

end;

--¸ø09Äê6ÔÂ7ÔÂ³Â¾ÉÃÜ±¾½±Àø
function give_viet20090607_miben()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		gf_SetLogCaption("Truy t×m tr­êng sinh phæ");
		gf_AddItemEx({2, 1, 30088, 100}, "BÝ Phæ Cò N¸t");
		WriteLogEx("Hoat dong thang 6","B¸t Nh· Nhá",100,"BÝ Phæ Cò N¸t");
		gf_SetLogCaption("");
	end
end

--¸ø09Äê8ÔÂ»î¶¯Ë®¹û´ü½±Àø
function give_viet200908_shuiguodai()
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		gf_SetLogCaption("[Hoat dong thang 8]");
		nRet = gf_AddItemEx({2, 1, 30097, 100}, "Tói Tr¸i C©y");
		if nRet == 1 then
			WriteLogEx("Hoat dong thang 8","Nhan tui trai cay",100,"Trong cay bat nha nho");
		end
		gf_SetLogCaption("");
	end
end

--¸ø09Äê9ÔÂÖÐÇï»î¶¯°×Ãæ°ü½±Àø
function give_viet200909_baimianbao()
	if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 091026 then
		gf_SetLogCaption("[Hoat dong trung thu 2009]");
		gf_AddItemEx({2, 1, 30106, 100}, "Bét M×");
		WriteLogEx("Hoat dong trung thu","B¸t Nh· Nhá",100,"Bét M×");
		gf_SetLogCaption("");
	end
end

function give_viet200911_hoacuc()
	if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
		gf_AddItemEx({2, 1, 30118, 20}, "Hoa Cóc");
		WriteLogEx("Hoat dong thang 11","B¸t Nh· Nhá",20,"Hoa Cóc");		
	end
end

--¸ø09Äê12ÔÂÊ¥µ®ÌÇ¹û½±Àø
function give_viet200912_shengdantangguo()
	if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 100117 then
	    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE
	    gf_AddItemEx2({2, 1, 30138, 40}, "C©y KÑo Gi¸ng Sinh", szFullLog, 0, 1, 10, 1,"B¸t Nh· nhá");
	end
end

function  Give_IpBonus_SmallTree()
	if GetExtPoint(4) == 1 then
		local nTimes = GetTask(429)
		if  nTimes >= 1 and nTimes <= 3 then
			ModifyExp(100000 )
			Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm kinh nghiÖm ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nhËn 100000 ®iÓm kinh nghiÖm")
		elseif  nTimes >= 4 and nTimes <= 8 then
			ModifyExp(150000 )
			Msg2Player("B¹n nhËn ®­îc 150000 ®iÓm kinh nghiÖm ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nhËn 150000 ®iÓm kinh nghiÖm")
		elseif  nTimes >= 9 and nTimes <= 16 then
			ModifyExp(250000 )
			Msg2Player("B¹n nhËn ®­îc 250000 ®iÓm kinh nghiÖm ")
			gf_WriteLogEx("IpBonus trong cay bat nha nho" ,"nhËn 250000 ®iÓm kinh nghiÖm")
		else
			return
		end
	end
end