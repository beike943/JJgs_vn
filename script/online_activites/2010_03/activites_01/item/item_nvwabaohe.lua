--=============================================
--create by baiyun 2010.2.24
--describe:Ô½ÄÏ°æ2010Äê3ÔÂ»î¶¯1 Å®æ´±¦ºÐ½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--»î¶¯Í·ÎÄ¼þ
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\award\\feature_award.lua")


function OnUse(nItemIdx)
--    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
--        return 0;
--    end
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate > 151231 then
		Talk(1,"","N÷ Oa b¶o h¹p ®· hÕt h¹n sö dông!")
		do	return	end
	end
	
    if GetLevel() < 73 then
       Talk(1,"", "§¼ng cÊp 73 trë lªn míi sö dông ®­îc vËt phÈm nµy." )
    	  return
    end
    if GetPlayerRoute() == 0 then
       Talk(1,"", "Gia nhËp m«n ph¸i míi sö dông ®­îc vËt phÈm nµy." )
    	  return
    end
   	if gf_Judge_Room_Weight(9, 100) ~= 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end 
 --   if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return end
    local nLastGetDate = GetTask(VET_201003_01_TASK_GET_BAOHE_DATE);
--    if nDate > 100704 then
--		return
--    end    
    if nLastGetDate ~= nDate then
    	   SetTask(VET_201003_01_TASK_GET_BAOHE_DATE,nDate)
        SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, 0);
        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, 0);               
    end
    
    local nUse = 100
    -- VBonus ver 2
	if CheckVbonus() == 1 then
		nUse = 200
	end
--     if nDate >= 120210 and nDate <= 120229 then
--    		nUse = 400
--    end
    
    --local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
    
--    local nWeek = tonumber(date("%w"))
--	if nWeek == 2 or nWeek == 3 then
--		nUse = 64
--	elseif nWeek == 4 or nWeek == 5 then
--		nUse = 88
--	end
--    if nDate <= 100905 then
--    		nUse = 64
--    end
--    if nDate >= 100909 and nDate <= 100912 then
--    		nUse = 128
--    end
    if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= nUse then
    	  Talk(1,"", "B¹n ®· sö dông tèi ®a sè N÷ Oa B¶o H¹p trong ngµy, kh«ng thÓ sö dông thªm!")
    	  return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
   	   SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT,GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) + 1)
--    	  if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and mod(GetTask(TASK_VNG_PET), 100) >= 2 then
--    	  	Pet_AddGP(1)
--    	  end

    	  -- NhiÖm vô chuyÓn sinh 5
    	  if GetTask(TRANSLIFE_MISSION_ID) == 34 and GetTask(TRANSLIFE_TASK_5_2) < 2000 then
    	  	SetTask(TRANSLIFE_TASK_5_2, GetTask(TRANSLIFE_TASK_5_2) + 1)
    	  	if GetTask(TRANSLIFE_TASK_5_2) == 2000 then
    	  		TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh sö dông 2000 N÷ Oa B¶o H¹p")
    	  	end 
    	  end
    	 
--	  gf_EventGiveCustomAward(1, nExp, 0, "Nu Oa Bao Hap")
--   	  gf_EventGiveRandAward(VET_201003_01_NVWABAOHE_AWARD_LIST, 100, 3, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[9][1]);
 	 --- §iÓm VËn May
 --	  	local nExp = 1000000
--		local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		local nExpVM = (nPointVM - 100)/100*nExp
--		ModifyExp(nExpVM)
--		if nExpVM > 0 then
--			Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--		else
--			Msg2Player("B¹n bÞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--		end   	
	-----------	  
--        if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 400 then
--    	  		gf_AddItemEx2({2,1,30130,1}, "Phi Yªn Th¹ch", VET_201003_01_STR_LOG_TITLE, "nhËn Phi Yªn Th¹ch" )
--    	  		Msg2Player("B¹n nhËn ®­îc 1 Phi Yªn Th¹ch")
--    	  end
		gf_WriteLogEx("DA THONG KINH MACH", "®æi thµnh c«ng", nExpChanKhi, "®iÓm ch©n khÝ N÷ Oa")		
		VietWaBaoHe(); --thªm nguyªn liÖu event hµng th¸ng
        	Use_Award_NuOa() --phÇn th­ëng khi sö dông N÷ Oa
    		if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == nUse then        
    			Use_Award_NuOa_100()
    		end
        ----------- Chuçi nhiÖm vô ChuyÓn Sinh 6
       	local nCS6_BH =  floor(GetTask(TSK_CS6_GET1TIME)/1000)
		local nCS6_BH_Num = mod(GetTask(TSK_CS6_GET1TIME),1000)
		if mod(nCS6_BH,10000) < 1000 and GetTask(TSK_CS6_TULINH) < 2 then
			nCS6_BH = (nCS6_BH + 1) * 1000 + nCS6_BH_Num
			SetTask(TSK_CS6_GET1TIME, nCS6_BH)
		end
    --nhiÖm vô lµm giµu
     if CFG_NhiemVuLamGiau == 1 then
	     if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) >= 5 and gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 1) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 1, 1, 0)
	     		TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Sö dông 05 n÷ oa b¶o h¹p.")
	     end
	end

     if GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) == 100 and nDate <= 130120 then
  		gf_AddItemEx2({2,1,30030, 50}, "TiÓu Nh­ Y1", "NIEN THU NHU Y", "hoµn thµnh 100 N÷ oa ")
     end 		
        --cdkey
        SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemNvWa()");
    end
end
