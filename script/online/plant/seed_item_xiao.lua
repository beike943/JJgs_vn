Include("\\script\\online\\plant\\tree_head.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse()
--	if GetPlayerRoute() == 0 then
--		Talk(1,"","Ng­êi ch­a gia nhËp m«n ph¸i kh«ng ®­îc sö dông h¹t gièng");
--		return 0;
--	end;
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end	
	if checktime() == 0 then
		Talk(1,"","Lóc nµy linh khÝ ch­a tËp trung, chê thªm mét chót tèt h¬n");
		return 0;
	end;
	if checkplace_maincity() == 0 then
		Talk(1,"","Linh khÝ n¬i ®©y kh«ng m¹nh, e r»ng c©y sÏ kh«ng ph¸t triÓn");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLAN_SMALLTREE_DATE) < nDate then
		SetTask(TASK_PLAN_SMALLTREE_DATE,nDate);
		SetTask(TASK_PLAN_SMALLTREE_COUNT,0);	--Ã¿ÌìÖÖÐ¡Ê÷ÊýÇå¿Õ
	end;
	if GetTask(TASK_PLAN_SMALLTREE_COUNT) >= PLANT_SMALL_TREE_LIMIT then
		Talk(1,"","H«m nay b¹n ®· trång <color=yellow>"..PLANT_SMALL_TREE_LIMIT.."c©y<color> Th¸i H­ B¸t Nh·, h¹t gièng cßn l¹i ®Ó ngµy mai trång tiÕp.");
		return 0;
	end;
	local selTab = {
				"H·y mau trång c©y/plant",
				"Sau nµy trång sÏ tèt h¬n!/nothing",
				}
	Say("N¬i ®©y s¬n thñy thÝch hîp, linh khÝ xung thiªn, chÝnh lµ n¬i trång c©y tiªn, b¹n x¸c nhËn muèn trång c©y?",getn(selTab),selTab)
end;

function plant()
	if checkplace_maincity() == 0 then
		Talk(1,"","Linh khÝ n¬i ®©y kh«ng m¹nh, e r»ng c©y sÏ kh«ng ph¸t triÓn");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTime() - GetTask(TASK_PLANTTIME_SMALL) < TREELIFETIME and GetTask(TASK_PLANTTIME_SMALL) ~= 0 then
		Talk(1,"","B¹n ®· trång thµnh c«ng 1 c©y");
		return 0;
	end;
	if GetItemCount(2,0,351) <= 0 then
		Talk(1,"","B¹n kh«ng cã Lé Thñy, kh«ng thÓ trång c©y Th¸i H­ B¸t Nh· nhá.");
		return 0;
	end;
	DelItem(2,0,351,1);	--ÖÖÏÂµÄÊ±ºòÒ²ÐèÒªÒ»¸öÂ¶Ë®£¬Õâ¸öºÍÖÖ´óÊ÷²»Ò»Ñù£¬ÖÖ´óÊ÷Ê±ÖÖÏÂµÄÊ±ºò²»ÐèÒªÂ¶Ë®£¬Ò²ÊÇÒ»¸öbug°É£¬²»¹ýÓÃ£·¸öÂ¶Ë®¾Í¿ÉÒÔÖÖ´óÊ÷ÒÑ¾­ÉîÈëÃñÐÄ£¬ÏÖÔÚÒ²²»ºÃ¸ÄÁË¡£
	if DelItem(2,0,504,1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(SMALLTREETYPE[1][1],GetName().." trång "..SMALLTREETYPE[1][2],MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc trång c©y, trÞ quay l¹i hµm sè CreateNpc lµ 0. Tham sè nhËp CreateNpc lµ:"..SMALLTREETYPE[1][1]..","..GetName().." trång "..SMALLTREETYPE[1][2]..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,TREELIFETIME)
		SetTask(TASK_TREEINDEX_SMALL,npcTreeIndex);
		SetTask(TASK_TREEGROW_SMALL,1);
		SetTask(TASK_PLANTTIME_SMALL,GetTime());
		SetTask(TASK_PLAN_SMALLTREE_DATE,nDate);
		SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\small_tree_npc.lua");
		SetTask(TASK_PLAN_SMALLTREE_COUNT,GetTask(TASK_PLAN_SMALLTREE_COUNT)+1);
----------------------- Chuçi nhiÖm vô ChuyÓn Sinh §¬n, l­u 3 sè ®Çu bªn ph¶i
		local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)
		if nCSD_BNN < 181 and GetTask(TSK_CSD) == 1 then
			SetTask(TSK_CSD_COUNT_C, GetTask(TSK_CSD_COUNT_C) + 1)
		end
-----------------------Chuçi nhiÖm vô ChuyÓn Sinh 6
		local nCS6_BNN =  floor(GetTask(TSK_CS6_COUNTA)/10000)
		local nCS6_BNN_Num = mod(GetTask(TSK_CS6_COUNTA),10000)
		if mod(nCS6_BNN,1000) < 150 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_BNN = (nCS6_BNN + 1) * 10000 + nCS6_BNN_Num
			SetTask(TSK_CS6_COUNTA, nCS6_BNN)
		end
------------------------
		KichHoatBatNhaNho()	-- phÇn thuëng khi kÝch ho¹t
		local nExp = 2100000
		--- §iÓm VËn May
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--		else
--			Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--		end
--	-----------------------------
		Say("H«m nay, ®©y lµ lÇn thø <color=yellow>"..GetTask(TASK_PLAN_SMALLTREE_COUNT).."<color> b¹n trång c©y Th¸i H­ B¸t Nh· nhá, h«m nay b¹n vÉn cã thÓ trång <color=yellow>"..(PLANT_SMALL_TREE_LIMIT-GetTask(TASK_PLAN_SMALLTREE_COUNT)).."<color> c©y Th¸i H­ B¸t Nh· nhá.",0);		
		StartTimeGuage("T­íi c©y",SMALLTREETYPE[1][3],0,1)

		if GetTask(TASK_PLAN_SMALLTREE_COUNT) == 16 and nDate <= 130120 then	
			gf_AddItemEx2({2,1,30030, 20}, "TiÓu Nh­ Y1", "NIEN THU NHU Y", "hoµn thµnh 16 trång c©y")
		end
		--ÎäÁÖvipÁî
		_vc_PlantSmallBanRuo();
		--cdkey
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_PlantSmallBanRuo()");
	end;
end;
