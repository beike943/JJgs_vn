Include("\\script\\vng\\lib\\vnglib_award.lua")

szLogTitle = "NHIEM VU PHUC SINH 2"
szNPCName = "<color=green>B¹ch Tiªn Sinh:<color> "
nMISSION_QTY = 50
nSoLuongNhiemVuNgay = 5
tbPhucSinh2Rate = {
	[1] = {[1] = 1, nRate = 2.10},	-- Sö dông thµnh c«ng 40 Ph¸o Hoa
	[2] = {[1] = 2, nRate = 2.10},	-- Tiªu diÖt 200 KiÕm Tiªn Tö
	[3] = {[1] = 3, nRate = 2.10},	-- Tiªu diÖt 200 Sa M¹c Hµnh Nh©n
	[4] = {[1] = 4, nRate = 2.10},	-- Tiªu diÖt 200 XÝch LuyÖn Háa Hå
	[5] = {[1] = 5, nRate = 2.10},	-- Tiªu diÖt 200 TiÓu Lam Xoa Quû
	[6] = {[1] = 6, nRate = 2.10},	-- Nép 02 Tói H¹t Gièng
	[7] = {[1] = 7, nRate = 2.10},	-- Thu ho¹ch thµnh c«ng 10 H¹t Gièng
	[8] = {[1] = 8, nRate = 2.10},	-- Nép 10 b¸t nh· nhá
	[9] = {[1] = 9, nRate = 2.10},	-- Thu ho¹ch thµnh c«ng 10 b¸t nh· nhá
	[10] = {[1] = 10, nRate = 2.10},	-- Nép 08 b¸t nh· lín
	[11] = {[1] = 11, nRate = 2.10},	-- Thu ho¹ch thµnh c«ng 10 b¸t nh· lín
	[12] = {[1] = 12, nRate = 2.10},	-- Nép 08 c©y tø linh
	[13] = {[1] = 13, nRate = 2.10},	-- Thu ho¹ch thµnh c«ng 10 c©y tø linh
	[14] = {[1] = 14, nRate = 2.10},	-- Nép 30 Thanh long qu¶
	[15] = {[1] = 15, nRate = 2.10},	-- Nép 30 HuyÒn Vò C¨n
	[16] = {[1] = 16, nRate = 2.10},	-- Nép 30 B¹ch Hæ DiÖp
	[17] = {[1] = 17, nRate = 2.10},	-- Nép 30 Háa Phông Qu¶
	[18] = {[1] = 18, nRate = 20.20},	-- Nép 29 tr¸i c©y bÊt kú cïng lo¹i (1 trong 20 lo¹i)
	[19] = {[1] = 19, nRate = 2.10},	-- Sö dông 20 lo¹i tr¸i c©y , mçi lo¹i 10 tr¸i
	[20] = {[1] = 20, nRate = 2.10},	-- Tham gia 01 lÇn Th¸i H­ (miÔn phÝ)
	[21] = {[1] = 21, nRate = 2.10},	-- Tham gia 01 lÇn Th¸i H­ (thu phÝ)
	[22] = {[1] = 22, nRate = 0.00},	-- V­ît ¶i 7 Tµng KiÕm S¬n trang 01 lÇn
	[23] = {[1] = 23, nRate = 2.10},	-- Hoµn thµnh 01 lÇn nhiÖm vô Thiªn m«n trËn
	[24] = {[1] = 24, nRate = 2.10},	-- Hoµn thµnh 01 lÇn nhiÖm vô Tµi Nguyªn ChiÕn
	[25] = {[1] = 25, nRate = 0.00},	-- Hoµn thµnh 01 lÇn nhiÖm vô Th«ng Thiªn §Ønh
	[26] = {[1] = 26, nRate = 2.10},	-- Nép 100 Vâ l©m b¶o h¹p
	[27] = {[1] = 27, nRate = 2.10},	-- N«p 01 Ch×a Khãa §ång
	[28] = {[1] = 28, nRate = 2.10},	-- Nép 01 Ch×a Khãa B¹c
	[29] = {[1] = 29, nRate = 2.10},	-- Nép 01 Ch×a Khãa Vµng
	[30] = {[1] = 30, nRate = 2.10},	-- Nép 02 Nh©n S©m V¹n N¨m
	[31] = {[1] = 31, nRate = 2.10},	-- Nép 02 Phi YÕn Th¹ch
	[32] = {[1] = 32, nRate = 2.10},	-- Nép 01 Thiªn Qu¸i Th¹ch
	[33] = {[1] = 33, nRate = 2.10},	-- Nép 10 M¶nh B¹ch Kim
	[34] = {[1] = 34, nRate = 2.10},	-- Nép 03 Thiªn Th¹ch Tinh Th¹ch
	[35] = {[1] = 35, nRate = 2.10},	-- Nép 20 M¶nh Thiªn Th¹ch
	[36] = {[1] = 36, nRate = 2.15},	-- Nép 20 Thiªn Th¹ch
	[37] = {[1] = 37, nRate = 2.10},	-- Nép 03 Qu©n C«ng Ch­¬ng
	[38] = {[1] = 38, nRate = 2.10},	-- Nép 02 Qu©n C«ng §¹i
	[39] = {[1] = 39, nRate = 2.10},	-- Nép 01 Qu©n C«ng Huy Hoµng
	[40] = {[1] = 40, nRate = 2.10},	-- Sö dông 100 N÷ oa B¶o h¹p
	[41] = {[1] = 41, nRate = 2.10},	-- Sö dông 16 Ng«i Sao May M¾n
}
tbPhucSinh2Name = {
	[1] = {"Sö dông thµnh c«ng 40 Ph¸o Hoa", 40, 0},		-- {Quest name, Quest ID, Quest Type}; Type = 1: nop item; Type = 2: danh quai
	[2] = {"Tiªu diÖt 200 KiÕm Tiªn Tö", 200, 2},
	[3] = {"Tiªu diÖt 200 Sa M¹c Hµnh Nh©n", 200, 2},
	[4] = {"Tiªu diÖt 200 XÝch LuyÖn Háa Hå", 200, 2},
	[5] = {"Tiªu diÖt 200 TiÓu Lam Xoa Quû", 200, 2},
	[6] = {"Nép 02 Tói H¹t Gièng", 1,1},
	[7] = {"Thu ho¹ch thµnh c«ng 10 H¹t Gièng", 10, 0},
	[8] = {"Nép 10 b¸t nh· nhá", 1, 1},
	[9] = {"Thu ho¹ch thµnh c«ng 10 b¸t nh· nhá", 10, 0},
	[10] = {"Nép 08 b¸t nh· lín", 1, 1},
	[11] = {"Thu ho¹ch thµnh c«ng 10 b¸t nh· lín", 10, 0},
	[12] = {"Nép 08 c©y tø linh", 1, 1},
	[13] = {" Thu ho¹ch thµnh c«ng 10 c©y tø linh", 10, 0},
	[14] = {"Nép 30 Thanh long qu¶", 1, 1},
	[15] = {"Nép 30 HuyÒn Vò C¨n", 1, 1},
	[16] = {"Nép 30 B¹ch Hæ DiÖp", 1, 1},
	[17] = {"Nép 30 Háa Phông Qu¶", 1, 1},
	[18] = {"Nép 29 tr¸i c©y bÊt kú cïng lo¹i (1 trong 20 lo¹i)", 1, 1},
	[19] = {"Sö dông 20 lo¹i tr¸i c©y, mçi lo¹i 10 tr¸i", 20},
	[20] = {"Tham gia 01 lÇn Th¸i H­ (miÔn phÝ)", 1, 0},
	[21] = {"Tham gia 01 lÇn Th¸i H­ (thu phÝ)", 1, 0},
	[22] = {"V­ît ¶i 7 Tµng KiÕm S¬n trang 01 lÇn", 1, 0},
	[23] = {"Hoµn thµnh 01 lÇn nhiÖm vô Thiªn m«n trËn", 1, 0},
	[24] = {"Hoµn thµnh 01 lÇn nhiÖm vô Tµi Nguyªn ChiÕn", 1, 0},
	[25] = {"Hoµn thµnh 01 lÇn nhiÖm vô Th«ng Thiªn §Ønh", 1, 0},
	[26] = {"Nép 100 Vâ l©m b¶o h¹p", 1, 1},
	[27] = {"Nép 01 Ch×a Khãa §ång", 1, 1},
	[28] = {"Nép 01 Ch×a Khãa B¹c", 1, 1},
	[29] = {"Nép 01 Ch×a Khãa Vµng", 1, 1},
	[30] = {"Nép 02 Nh©n S©m V¹n N¨m", 1, 1},
	[31] = {"Nép 02 Phi YÕn Th¹ch", 1, 1},
	[32] = {"Nép 01 Thiªn Qu¸i Th¹ch", 1, 1},
	[33] = {"Nép 10 M¶nh B¹ch Kim", 1, 1},
	[34] = {"Nép 03 Thiªn Th¹ch Tinh Th¹ch", 1, 1},
	[35] = {"Nép 20 M¶nh Thiªn Th¹ch", 1, 1},
	[36] = {"Nép 20 Thiªn Th¹ch", 1, 1},
	[37] = {"Nép 03 Qu©n C«ng Ch­¬ng", 1, 1},
	[38] = {"Nép 02 Qu©n C«ng §¹i", 1, 1},
	[39] = {"Nép 01 Qu©n C«ng Huy Hoµng", 1, 1},
	[40] = {"Sö dông 100 N÷ oa B¶o h¹p", 100},
	[41] = {"Sö dông 16 Ng«i Sao May M¾n", 16},
}

tbNguyenLieuThuThap = {
	[1] = {1,1,19,666, "T©y B¾c Väng", 17},		-- {nG, nD, nP, nQty, szItemName, nBit}
	[2] = {1,1,17,666, "Minh NguyÖt D¹", 18},
	[3] = {1,1,15, 1999, "B¸nh Bét vµng", 19},
	[4] = {2,2,8,3999, "Thiªn th¹ch", 20},
	[5] = {2,2,7, 3999, "M¶nh Thiªn th¹ch", 21},
--	[6] = {2,1,1009,299, "Thiªn Th¹ch Tinh Th¹ch", 22},
	[6] = {2,1,1005,6, "ChiÕn ThÇn Hoµn", 22},
	[7] = {2,1,30499,200, "Hu©n Ch­¬ng Anh Hïng", 23},
}
	
function PhucSinh2_CheckActive() -- KiÓm tra tr¹ng th¸i nhËn thö th¸ch: 1 = ®· nhËn
	local nCheck = gf_GetTaskByte(TSK_PHUCSINH2,1)
	return nCheck
end

function PhucSinh2_Active() -- Set tr¹ng th¸i nhËn thö th¸ch: 1 = ®· nhËn
	if gf_GetTaskByte(TSK_PHUCSINH2,1) < 1 then
		gf_SetTaskByte(TSK_PHUCSINH2, 1, 1)
		return 1
	else
		return 0
	end
end

function PhucSinh2_DeActive() -- Set tr¹ng th¸i nhËn thö th¸ch: 0 = ch­a nhËn
	if GetTask(TSK_PHUCSINH2) == 1 then
		gf_SetTaskByte(TSK_PHUCSINH2, 1, 0)
		return 1
	else
		return 0
	end
end

function PhucSinh2_CheckFinishMission()
	if gf_GetTaskByte(TSK_PHUCSINH2, 2) == nMISSION_QTY and gf_GetTaskByte(TSK_PHUCSINH2, 3) == 127 then	--63
		return 1
	else
		return 0
	end
end

function PhucSinh2_Award_GetStatus()
	return gf_GetTaskByte(TSK_PHUCSINH2, 4)
end

function PhucSinh2_Award_SetStatus()
	if PhucSinh2_Award_GetStatus() == 0 then
		gf_SetTaskByte(TSK_PHUCSINH2, 4, 1)
	end
end


--==========================
function PhucSinh2_GetCount()	-- §Õm sè l­îng nhiÖm vô hoµn thµnh
	return gf_GetTaskByte(TSK_PHUCSINH2,2)
end

function PhucSinh2_AddCount(nValue)	-- Thªm sè lÇn hoµn thµnh nhiÖm vô
	nValue = nValue or 1
	local nMissionCount = PhucSinh2_GetCount() + nValue
	if nMissionCount > nMISSION_QTY then
		return 0
	end
	gf_SetTaskByte(TSK_PHUCSINH2, 2, nMissionCount)
	TaskTip("Hoµn thµnh nhiÖm vô thö th¸ch Phôc Sinh 2 mçi ngµy. Mau vÒ gÆp B¹ch Tiªn Sinh nhËn nhiÖm vô míi.")
	gf_WriteLogEx(szLogTitle,"hoµn thµnh",1,"Hoµn thµnh nhiÖm vô thø "..nMissionCount.."/"..nMISSION_QTY)
end

--===========================
function PhucSinh2_GetDailyMission()	-- LÊy ID nhiÖm vô ®ang thùc hiÖn
	local nTaskValue = GetTask(TSK_PHUCSINH2_COUNT)
	return mod(floor(nTaskValue/10000),100)
end

function PhucSinh2_SetDailyMission(nQuestID)	-- Set ID nhiÖm vô ®ang thùc hiÖn
	if PhucSinh2_GetCount() >= nMISSION_QTY then
		Talk(1,"",szNPCName.."Ng­¬i ®· hoµn thµnh "..nMISSION_QTY.."/"..nMISSION_QTY.." nhiÖm vô, kh«ng cÇn ph¶i lµm thªm.")
		return 0
	end
	local nMissionID = nQuestID
	if nQuestID == nil then
		nMissionID = LIB_Award:GetValueByRate(tbPhucSinh2Rate)
	end
	local nTaskValue = GetTask(TSK_PHUCSINH2_COUNT)
	SetTask(TSK_PHUCSINH2_COUNT, floor(nTaskValue/1000000)*1000000 + nMissionID*10000 + tbPhucSinh2Name[nMissionID][2])
	Talk(1,"", szNPCName.."Thö th¸ch lÇn nµy cña ng­¬i lµ <color=yellow>"..tbPhucSinh2Name[nMissionID][1].."<color>! H·y mau chãng hoµn thµnh.")
	TaskTip("NhËn ®­îc mét thö th¸ch Phôc Sinh 2.")
	if PhucSinh2_GetDailyMission() == 19 then
		PhucSinh2_FruitCheck()
	end
end

function PhucSinh2_CountDailyMission()
	return floor(GetTask(TSK_PHUCSINH2_COUNT)/1000000)
end

function PhucSinh2_GetStatus()	-- LÊy tr¹ng th¸i hoµn thµnh nhiÖm vô. 0/1 = Ch­a hoµn thµnh/ hoµn thµnh
	return mod(floor(GetTask(TSK_PHUCSINH2_COUNT)/1000),10)
end

function PhucSinh2_SetStatus(nStatus)	-- Set tr¹ng th¸i hoµn thµnh nhiÖm vô.
	nStatus = nStatus or 1
	if PhucSinh2_GetStatus() == 0 then
		SetTask(TSK_PHUCSINH2_COUNT, GetTask(TSK_PHUCSINH2_COUNT) + 1001000)
		
		PhucSinh2_AddCount()
		return 1
	else
		return 0
	end
end

--============================
function PhucSinh2_SetMissionPart()
	local nPart = mod(GetTask(TSK_PHUCSINH2_COUNT),1000)
	if nPart >0 then
		nPart = nPart  - 1
		Msg2Player("Hoµn thµnh mét lÇn thö th¸ch phôc sinh 2, cßn "..nPart.." lÇn n÷a")
		SetTask(TSK_PHUCSINH2_COUNT, GetTask(TSK_PHUCSINH2_COUNT) - 1)
		if nPart == 0 then
			PhucSinh2_SetStatus()
		end
	end
end

function PhucSinh2_GetMissionPart()
	return mod(GetTask(TSK_PHUCSINH2_COUNT), 1000)
end


--==============================
function PhucSinh2_FruitCheck()
	local tbFruitTask = {TSK_USEFRUIT_FLAG_1, TSK_USEFRUIT_FLAG_2, TSK_USEFRUIT_FLAG_3, TSK_USEFRUIT_FLAG_4}
	local nCount = 0
	for i=1, getn(tbFruitTask) do
		local nTaskValue = GetTask(tbFruitTask[i])
		for j=1,5 do
			if mod(nTaskValue,100) == 10 then
				nCount = nCount + 1
			end
			nTaskValue = floor(nTaskValue/100)
		end
	end
	if nCount >= 20 then
		PhucSinh2_SetStatus()
	else
		SetTask(TSK_PHUCSINH2_COUNT, floor(GetTask(TSK_PHUCSINH2_COUNT)/1000)*1000 + (20 - nCount))
	end
end


function PhucSinh2_ThuThapNguyenLieu(nIndex)
	if tbNguyenLieuThuThap[nIndex] == nil then
		return 0
	end
	if gf_GetTaskBit(TSK_PHUCSINH2, tbNguyenLieuThuThap[nIndex][6]) == 1 then
		return 0
	end
	if GetItemCount(tbNguyenLieuThuThap[nIndex][1], tbNguyenLieuThuThap[nIndex][2], tbNguyenLieuThuThap[nIndex][3]) < tbNguyenLieuThuThap[nIndex][4] then
		Talk(1,"",szNPCName .."C¸c h¹ kh«ng cã ®ñ <color=yellow>"..tbNguyenLieuThuThap[nIndex][4].." "..tbNguyenLieuThuThap[nIndex][5].."<color>.")
		return 0
	end
	if DelItem(tbNguyenLieuThuThap[nIndex][1], tbNguyenLieuThuThap[nIndex][2], tbNguyenLieuThuThap[nIndex][3], tbNguyenLieuThuThap[nIndex][4]) == 1 then
		gf_SetTaskBit(TSK_PHUCSINH2, tbNguyenLieuThuThap[nIndex][6], 1, 0)
		Talk(1,"",szNPCName .."Ta ®· nhËn ®ñ <color=yellow>"..tbNguyenLieuThuThap[nIndex][4].." "..tbNguyenLieuThuThap[nIndex][5].."<color> cña c¸c h¹.")
	end
end