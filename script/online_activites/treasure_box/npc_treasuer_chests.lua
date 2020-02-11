--by liubo
--±¦ÏäÉÌÈË½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\equip_feed\\feed_up_attr_recoup.lua")
Include("\\script\\vng\\weapon_upgrade\\trangbichiencuong.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

FILE_NAME = "\\script\\online_activites\\treasure_box\\npc_treasuer_chests.lua";	
NANGCAPDIEUDUONG_F1 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc1.lua";
NANGCAPDIEUDUONG_F2 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc2.lua";
NANGCAPDIEUDUONG_NGOCBOI = "\\script\\vng\\weapon_upgrade\\dieuduong_nangcapngocboi.lua"
g_szNpcName = "<color=green>Th­¬ng Nh©n B¶o R­¬ng: <color>";

TSK_TMP_CHANGE_BKVD = 206
function main()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	--ÊÇ·ñ¿ªÆôÅÐ¶Ï
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[5])
		return 0
	end
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­×ªÉú
	--
	--
--	if GetTask(1538) == 0 then
--		Talk(1,"",tSTRING_TREASUER_NPC[1])
--		return 0
--	end
	local tbSay = {}
	if nDate < 20130904 then
		tinsert(tbSay,"NhËn hç trî trang bÞ Kim Xµ/_On_Repair")
	end
--	tinsert(tbSay, "Ta muèn ®æi nguyªn liÖu lÊy kinh nghiÖm/Trade_Material2Exp_Menu")
	if tbGioiHanThanTaiBaoRuong[nNation] == nil or nDate >= tbGioiHanThanTaiBaoRuong[nNation] then
		tinsert(tbSay,tSTRING_TREASUER_NPC[3].."/get_wooden")
		tinsert(tbSay,"Ta muèn ®æi 1 B¹ch Kim R­¬ng (tiªu hao 5 Tµng R­¬ng)/get_BKR")
		tinsert(tbSay,"Ta muèn ®æi 1 ThÇn Tµi B¶o R­¬ng (tiªu hao 55 Tµng R­¬ng)/get_TTBR")
	end
	tinsert(tbSay,"§æi trang bÞ H¹o NguyÖt/get_haonguyet")
	tinsert(tbSay,"§æi trang bÞ DiÖu D­¬ng/NangCapDieuDuong")
	tinsert(tbSay,"N©ng cÊp ngäc béi DiÖu D­¬ng 6% thµnh 8%/NangCapDieuDuong_NgocBoi")
--		"N©ng cÊp B¹ch Kim Viªm §Õ/get_BKVD",
--		tSTRING_TREASUER_NPC[4].."/get_treasure",
	tinsert(tbSay, "§æi trang bÞ ChiÕn Cuång/TrangBiChienCuong_Form")
	tinsert(tbSay,"Rêi khái/do_nothing")
	
	Say(tSTRING_TREASUER_NPC[2], getn(tbSay), tbSay)
end

function get_wooden()
	local nNum = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,1}
	local nIndex = floor(nNum/20)+1
--	if nIndex < 3 then
--		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumWooden[nIndex],nIndex*20-nNum),2,format("Ta muèn mua/#pay_award(%d,0,%d)",nIndex*20-nNum,tNumWooden[nIndex]),"Kh«ng cÇn ®©u/do_nothing")
--	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumWooden[3]),2,format("Ta muèn mua/#pay_award(%d,0,%d)",999,tNumWooden[3]),"Kh«ng cÇn ®©u/do_nothing")
--	end
end

function get_treasure()
	local nNum = GetTask(VET_TREASURE_BOX_CNUM)	
	local tNumTreasure = {66,135,300}
	
	local nIndex = 0
	if nNum < 5 then
		nIndex = 1
	elseif nNum >= 5 and nNum < 20 then
		nIndex = 2
	else
		nIndex = 3
	end
	
	local tboxremain = {5, 20}
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumTreasure[nIndex],tboxremain[nIndex] - nNum),2,format("Ta muèn mua/#pay_award(%d,1,%d)",tboxremain[nIndex] - nNum,tNumTreasure[nIndex]),"Kh«ng cÇn ®©u/do_nothing")
		print("So ruong con lai: "..tboxremain[nIndex] - nNum)
	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumTreasure[3]),2,format("Ta muèn mua/#pay_award(%d,1,%d)",999,tNumTreasure[3]),"Kh«ng cÇn ®©u/do_nothing")
	end
end

function pay_award(nNum1,nNum2,nNum3)
	local nNum = GetItemCount(2,1,30230)
	if nNum2 == 0 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_wooden",1,nNum1,"H·y nhËp sè l­îng","")
	end
	if nNum2 == 1 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_treasure",1,nNum1,"H·y nhËp sè l­îng","")
	end
end

function pay_wooden(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,1}
	local nIndex = floor(nNumTask/20)+1
	if nIndex > 3 then nIndex = 3 end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if GetItemCount(2,1,30230) < nNum * tNumWooden[3] then
		Talk(1,"",format(tSTRING_TREASUER_NPC[7],nNum * tNumWooden[3]))
		return 0 
	end
	if DelItem(2,1,30230,nNum * tNumWooden[3]) == 1 then
		if gf_AddItemEx2({2,1,30340,nNum},"§æi Méc R­¬ng lo¹i "..tNumWooden[3].." xu","Than Tai Bao Ruong","§æi Méc R­¬ng thµnh c«ng",0,1) ~= 1 then
			return 0
		end
  		gf_WriteLogEx("Than Tai Bao Ruong", "®æi thµnh c«ng", nNum, "Xu §æi Méc R­¬ng")   		
		SetTask(VET_TREASURE_BOX_MNUM,nNumTask+nNum)
		return 1
	end
	return 0
end

function pay_treasure(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = {66,135,300}
	--local nIndex = floor(nNumTask/20)+1
	--if nIndex > 3 then nIndex = 3 end
	local nIndex = 0
	if nNumTask < 5 then
		nIndex = 1
	elseif nNumTask >= 5 and nNumTask < 20 then
		nIndex = 2
	else
		nIndex = 3
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
  	end
	if GetItemCount(2,1,30230) < nNum * tNumTreasure[nIndex] then
		Talk(1,"",format(tSTRING_TREASUER_NPC[7],nNum * tNumTreasure[nIndex]))
		return 0 
	end	
	if DelItem(2,1,30230,nNum * tNumTreasure[nIndex]) == 1 then
		if gf_AddItemEx2({2,1,30341,nNum},"§æi Tµng R­¬ng lo¹i "..tNumTreasure[nIndex].." xu","Than Tai Bao Ruong","§æi Tµng R­¬ng thµnh c«ng",0,1) ~= 1 then
			return 0
		end
		SetTask(VET_TREASURE_BOX_CNUM,nNumTask+nNum)
		return 1
	end
	return 0
end

function do_nothing()
end

function get_BKVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän trang bÞ cÇn n©ng cÊp."
	
	tinsert(tbSayDialog, "- Ta cÇn ®æi 1 B¹ch Kim Viªm §Õ Kh«i (100 M¶nh B¹ch Kim + 3 B¹ch Kim Hång Bao (cã chøa 4000 vµng + 1 Thiªn Chi Viªm §Õ Kh«i[+12])/#get_BKVD_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi 1 B¹ch Kim Viªm §Õ Gi¸p (100 M¶nh B¹ch Kim + 3 B¹ch Kim Hång Bao (cã chøa 4000 vµng + 1 Thiªn Chi Viªm §Õ Gi¸p[+12])/#get_BKVD_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi 1 B¹ch Kim Viªm §Õ Trang (100 M¶nh B¹ch Kim + 3 B¹ch Kim Hång Bao (cã chøa 4000 vµng + 1 Thiªn Chi Viªm §Õ Trang[+12])/#get_BKVD_confirm(3,0)")
	tinsert(tbSayDialog, "Trë l¹i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_haonguyet()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän trang bÞ cÇn ®æi."
	
	tinsert(tbSayDialog, "- Ta cÇn ®æi Nãn H¹o NguyÖt (8 M¶nh B¹ch Kim + 1 N÷ Oa Tinh Th¹ch + 1 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi ¸o H¹o NguyÖt (6 M¶nh B¹ch Kim + 1 N÷ Oa Tinh Th¹ch + 1 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi QuÇn H¹o NguyÖt (6 M¶nh B¹ch Kim + 1 N÷ Oa Tinh Th¹ch + 1 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(3,0)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi Trang Søc H¹o NguyÖt (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/get_haonguyet_trangsuc")
	tinsert(tbSayDialog, "- Ta cÇn ®æi Vò KhÝ H¹o NguyÖt (16 M¶nh B¹ch Kim + 4 N÷ Oa Tinh Th¹ch + 4 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(5,0)")
	tinsert(tbSayDialog, "Trë l¹i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_haonguyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän trang bÞ cÇn ®æi."
	
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-XÝch T­íc Hoµn (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,1)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-Tö Giao Ngäc Béi (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,2)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-V©n Hæ LÖnh (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,3)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-¤ L©n B¶o Giíi (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,4)")
	tinsert(tbSayDialog, "- Ta cÇn ®æi H¹o NguyÖt-BÝch Quy Liªn (12 M¶nh B¹ch Kim + 2 N÷ Oa Tinh Th¹ch + 2 B¹ch Kim §¹i Hång Bao( cã chøa 4000 vµng)/#get_haonguyet_confirm(4,5)")
	tinsert(tbSayDialog, "Trë l¹i/get_haonguyet")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_BKVD_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph¶i gia nhËp hÖ ph¸i míi n©ng cÊp trang bÞ ®­îc!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[1][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[2][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHANGE_BKVD,nGetType)
	local nSlot = BKVD_need[nGetType][1]		
	PutinItemBox("§æi trang bÞ" ,nSlot , "X¸c nhËn muèn thùc hiÖn n©ng cÊp trang bÞ?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		return 0;
	end
	
	local tb_item = BKVD_need[nGetType][3]
	local tItem = {}
	local check = 0

	for i = 1, getn(tb_item) do
		tinsert(tItem,tb_item[i])
	end
	for i=1,getn(tItem) do
		local nG, nD, nP = gf_UnPack(tb_item[i])
		if (GetEquipAttr(idx,2) < 12) and genre == 0 then
			Talk(1,"",g_szNpcName.."§é c­êng hãa vËt phÈm ph¶i tõ 12 trë lªn");
			return 0;		
		end
		if (genre == nG and detail == nD and particular == nP) then	
			check = 1	
		end
	end
	if check == 1 then
		return 1
	end
	Talk(1, "", g_szNpcName.."ChØ cã thÓ bá vµo "..BKVD_need[nGetType][2]);
	return 0;
end

function OnPutinComplete(param)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= BKVD_need[nGetType][1] then
		Talk(1, "", g_szNpcName.."Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[1][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B¹n kh«ng ®ñ "..tItem_need[2][1].." ®Ó ®æi trang bÞ B¹ch Kim Viªm §Õ")
		return 0
	end
	local nResult = 1
	for i = 1, getn(t) do		
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
			break;
		end
	end
	local nItemNum1 = tItem_need[1][3]
	local nItemNum2 = tItem_need[2][3]
	local nbody = GetBody()
	if nResult ==1 then
		if DelItem(2,1,30346, nItemNum1) == 1 and DelItem(2,1,30229, nItemNum2) == 1 then
			SetTaskTemp(TSK_TMP_CHANGE_BKVD,0)
			local nItem = BKVD_suc[nGetType][2][nbody]
			gf_AddItemEx2(nItem, "N©ng cÊp trang bÞ thµnh c«ng", "NANG CAP TRANG BI BKVD", "n©ng cÊp thµnh c«ng")
			Talk(1,"","Chóc mõng b¹n nhËn ®­îc 1 trang bÞ B¹ch Kim Viªm §Õ!")
		end
	end
end

function get_haonguyet_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph¶i gia nhËp hÖ ph¸i míi n©ng cÊp trang bÞ ®­îc!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
     if nGetType == 1 then
    		if GetItemCount(2,1,30346) < 8 then
			Talk(1, "", "B¹n kh«ng ®ñ 8 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end		
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end			
     end
     if nGetType == 2 then
    		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B¹n kh«ng ®ñ 6 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end					
     end
     if nGetType == 3 then
     		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B¹n kh«ng ®ñ 6 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end   
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B¹n kh«ng ®ñ 1 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end							
     end     
     if nGetType == 4 then
    		if GetItemCount(2,1,30346) < 12 then
			Talk(1, "", "B¹n kh«ng ®ñ 12 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 2 then
			Talk(1, "", "B¹n kh«ng ®ñ 2 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end		
    		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", "B¹n kh«ng ®ñ 2 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end					
     end
     if nGetType == 5 then
    		if GetItemCount(2,1,30346) < 16 then
			Talk(1, "", "B¹n kh«ng ®ñ 16 m¶nh B¹ch Kim ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 4 then
			Talk(1, "", "B¹n kh«ng ®ñ 4 B¹ch Kim §¹i Hång Bao ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end		
    		if GetItemCount(2,1,504) < 4 then
			Talk(1, "", "B¹n kh«ng ®ñ 4 N÷ Oa Tinh Th¹ch ®Ó ®æi trang bÞ H¹o NguyÖt")
			return 0
		end					
     end          

	local nbody = GetBody()
	local nfaction = GetPlayerRoute()
     if nGetType == 1 then	
     		if DelItem(2,1,30346, 8) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nNon = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nNon, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
     		end
     end
	if nGetType == 2 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nAo = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nAo, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
     		end
     end
     if nGetType == 3 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nQuan = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nQuan, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
     		end
     end
     if nGetType == 4 then
          	if DelItem(2,1,30346, 12) == 1 and DelItem(2,1,30229, 2) == 1 and DelItem(2,1,504, 2) == 1 then
			local nTrangsuc = tHaoNguyet_suc[nGetType][nSelected][2]
			gf_AddItemEx2(nTrangsuc, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng ")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
		end
	end
	if nGetType == 5 then
	 	if DelItem(2,1,30346, 16) == 1 and DelItem(2,1,30229, 4) == 1 and DelItem(2,1,504, 4) == 1 then
			local nVukhi = tHaoNguyet_suc[nGetType][nfaction][2]
			gf_AddItemEx2(nVukhi, "§æi trang bÞ thµnh c«ng", "DOI TRANG BI", "®æi thµnh c«ng ")
			Talk(1,"","§æi trang bÞ thµnh c«ng!")
		end
	end
	
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then  
			nCount = nCount + 1
		end
	end
	return nCount
end

function get_BKR()
	AskClientForNumber("Confirm_get_BKR", 1, 999, "B¹ch Kim R­¬ng")
end
function get_TTBR()
	AskClientForNumber("Confirm_get_TTBR", 1, 999, "ThÇn Tµi R­¬ng")
end

function Confirm_get_BKR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 5 * nCount then
		Talk(1, "", "B¹n kh«ng ®ñ Tµng R­¬ng ®Ó ®æi B¹ch Kim R­¬ng")
		return 0
	end    	
	if DelItem(2,1,30341, 5 * nCount) == 1 then
		gf_AddItemEx2({2,1,30343,nCount}, "B¹ch Kim R­¬ng", "Than Tai Bao Ruong", "nhËn thµnh c«ng")
        gf_WriteLogEx("Than Tai Bao Ruong", "®æi thµnh c«ng", nCount, "Sè l­îng B¹ch Kim R­¬ng")			
	end
end

function Confirm_get_TTBR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 55 * nCount then
		Talk(1, "", "B¹n kh«ng ®ñ Tµng R­¬ng ®Ó ®æi ThÇn Tµi B¶o R­¬ng")
		return 0
	end    	
	if DelItem(2,1,30341, 55 * nCount) == 1 then
		gf_AddItemEx2({2,1,30344,nCount}, "ThÇn Tµi R­¬ng", "Than Tai Bao Ruong", "nhËn thµnh c«ng")
		gf_WriteLogEx("Than Tai Bao Ruong", "®æi thµnh c«ng", nCount, "Sè l­îng ThÇn Tµi R­¬ng")	
	end
end


function NangCapDieuDuong()
	local tbSay = {
		"N©ng cÊp b»ng Thiªn M«n Kim LÖnh vµ trang bÞ H¹o NguyÖt/NangCapDieuDuong_CongThuc1_Form",
		"N©ng cÊp b»ng Thiªn M«n Kim LÖnh, Cæ Linh Ngäc vµ trang bÞ H¹o NguyÖt/NangCapDieuDuong_CongThuc2_Form",
	}
	Say("N©ng cÊp trang bÞ H¹o NguyÖt thµnh DiÖu D­¬ng", getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1_Form()
	local szTitle = "N©ng cÊp trang bÞ H¹o NguyÖt thµnh DiÖu D­¬ng cÇn:\n- Nãn: 5 Thiªn M«n Kim LÖnh\n- ¸o: 6 Thiªn M«n Kim LÖnh\n- QuÇn: 7 Thiªn M«n Kim LÖnh\n- Trang søc: 6 Thiªn M«n Kim LÖnh\n- Vò KhÝ: 11 Thiªn M«n Kim LÖnh"
	local tbSay = {
		"Ta muèn n©ng cÊp/NangCapDieuDuong_CongThuc1",
		"Ta chØ ghÐ xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc2_Form()
	local szTitle = "N©ng cÊp trang bÞ H¹o NguyÖt thµnh DiÖu D­¬ng cÇn:\n- Nãn: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- ¸o: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- QuÇn: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- Trang søc: 3 Thiªn M«n Kim LÖnh, 500 Cæ Linh Ngäc\n- Vò KhÝ: 6 Thiªn M«n Kim LÖnh, 1000 Cæ Linh Ngäc"
	local tbSay = {
		"Ta muèn n©ng cÊp/NangCapDieuDuong_CongThuc2",
		"Ta chØ ghÐ xem th«i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NANGCAPDIEUDUONG_F1, 1)
end


function NangCapDieuDuong_CongThuc2()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NANGCAPDIEUDUONG_F2, 1)
end


function NangCapDieuDuong_NgocBoi()
	PutinItemBox("N©ng cÊp trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NANGCAPDIEUDUONG_NGOCBOI, 1)
end