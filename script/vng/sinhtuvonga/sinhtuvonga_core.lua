Include("\\script\\vng\\lib\\vnglib_function.lua");

szNpcName = "<color=green>Cæ L·o Ta<color>:"

tbSTVNconfig = { --TaskID, mission name, mission qty, TaskPosStart, TaskPosEnd
	[1] = {TSK_SINHTUVONGA1, "trång c©y Tø Linh", 16,2,1},
	[2] = {TSK_SINHTUVONGA1, "trång c©y B¸t Nh· nhá", 16,4,3},
	[3] = {TSK_SINHTUVONGA1, "trång h¹t gièng", 24,6,5},
	[4] = {TSK_SINHTUVONGA1, "L­¬ng S¬n B¹c", 3,7,7},
	[5] = {TSK_SINHTUVONGA1, "Thiªn M«n TrËn", 3,8,8},
	[6] = {TSK_SINHTUVONGA1, "Thñy Lîi", 3,9,9},
	[7] = {TSK_SINHTUVONGA3, "Cóng TÕ", 3,1,1},
}

tbSTVNDailyMissionConfig = { --TaskID, mission name, mission qty, TaskPosStart, TaskPosEnd
	[1] = {TSK_SINHTUVONGA3, "nhËn th­ëng chiÕn tr­êng b¶o vÖ thµnh tr×", 1,2,2},
	[2] = {TSK_SINHTUVONGA3, "nhËn th­ëng chiÕn tr­êng Nh¹n M«n Quan", 1,3,3},
	[3] = {TSK_SINHTUVONGA3, "hoµn thµnh nhiÖm vô tµi nguyªn chiÕn", 1,4,4},
	[4] = {TSK_SINHTUVONGA3, "nhËn th­ëng Thiªn M«n TrËn", 1,5,5},
}

tbActiveFee = {
	[0] = {{item={{gdp={2,1,30230,800}}}}},
	[1] = {{item={{gdp={2,1,30230,700}}}}},
	[2] = {{item={{gdp={2,1,30230,600}}}}},
	[3] = {{item={{gdp={2,1,30230,500}}}}},
	[4] = {{item={{gdp={2,1,30230,400}}}}},
	[5] = {{item={{gdp={2,1,30230,300}}}}, {item={{gdp={2,1,30490,2}}}, nGold=9990000}},
	[6] = {{item={{gdp={2,1,30490,1}}}, nGold=9990000}},
}

tb_translife_cloth_PS = {
										[1] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}
									
function STVN_time_remain()
	local nSinhTu_End = GetTime()
	if nSinhTu_End - GetTask(TSK_SINHTUVONGA2) <= 5184000 then
		return 1
	end
	return 0
end


function STVN_MissionAccept()
	if STVN_GetStatus() ~= 0 then
		return 0
	end
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	SetTask(TSK_SINHTUVONGA2, GetTime())
	STVN_SetStatus(1)
	if nChuyenSinh < 599 then
		SetTask(TSK_SINHTUVONGA1,33241616)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)
		local szTalk = szNpcName.."C¸c h¹ ®· nhËn nhiÖm vô Sinh Tö V« Ng·. H·y nhanh chãng hoµn thµnh c¸c thö th¸ch sau ®Ó kÝch ho¹t:\n"
		szTalk = szTalk .. "- Trång 16 c©y Tø Linh\n"
		szTalk = szTalk .. "- Trång 16 c©y B¸t Nh· nhá\n"
		szTalk = szTalk .. "- Trång 24 h¹t gièng\n"
		szTalk = szTalk .. "- Hoµn thµnh 3 nhiÖm vô L­¬ng S¬n B¹c\n"
		szTalk = szTalk .. "- NhËn th­ëng 3 lÇn Thiªn M«n TrËn"
		Talk(1,"",szTalk)
	elseif nChuyenSinh == 599 then
		SetTask(TSK_SINHTUVONGA1,333241616)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,3,1,1)
		local szTalk = szNpcName.."C¸c h¹ ®· nhËn nhiÖm vô Sinh Tö V« Ng·. H·y nhanh chãng hoµn thµnh c¸c thö th¸ch sau ®Ó kÝch ho¹t:\n"
		szTalk = szTalk .. "- Trång 16 c©y Tø Linh\n"
		szTalk = szTalk .. "- Trång 16 c©y B¸t Nh· nhá\n"
		szTalk = szTalk .. "- Trång 24 h¹t gièng\n"
		szTalk = szTalk .. "- Hoµn thµnh 3 nhiÖm vô L­¬ng S¬n B¹c\n"
		szTalk = szTalk .. "- NhËn th­ëng 3 lÇn Thiªn M«n TrËn\n"
		szTalk = szTalk .. "- Hoµn thµnh 3 lÇn nhiÖm vô Thñy Lîi\n"
		szTalk = szTalk .. "- Hoµn thµnh 3 lÇn nhiÖm vô Cóng TÕ"
		Talk(1,"",szTalk)
	else
--		VNG_SetTaskPos(TSK_SINHTUVONGA3,2,9,9)
		SetTask(TSK_SINHTUVONGA1,0)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)
		Talk(1,"",szNpcName.."CÊp ®é c¸c h¹ kh«ng cÇn thùc hiÖn nhiÖm vô, h·y mau kÝch ho¹t Sinh Tö V« Ng·.")
	end
	return 1
end


function STVN_GetStatus()
	local nStatus = VNG_GetTaskPos(TSK_SINHTUVONGA3,9,9)
	local tbStatus = {
		[0] = "ch­a nhËn nhiÖm vô Sinh Tö V« Ng·",
		[1] = "®· nhËn nhiÖm vô, ch­a kÝch ho¹t Sinh Tö V« Ng·",
		[2] = "®· kÝch ho¹t thµnh c«ng Sinh Tö V« Ng·",
		[3] = "®· hÕt h¹n nhËn th­ëng",
	}
	if tbStatus[nStatus] == nil then
		nStatus = 0
	end
	return nStatus, tbStatus[nStatus]
end


function STVN_SetStatus(nIndex)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,nIndex,9,9)
end


function STVN_SubMissionComplete(nMissionID)
	if STVN_GetStatus() ~= 1 then
		return 0
	end
	local tbMission = tbSTVNconfig[nMissionID]
	local nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
	if nQty > 0 then
		VNG_SetTaskPos(tbMission[1], nQty - 1, tbMission[4], tbMission[5])
	end
	TaskTip("Sinh Tö V« Ng·: hoµn thµnh 1 lÇn nhiÖm vô "..tbMission[2]..", cÇn hoµn thµnh "..(nQty-1).." lÇn ®Ó kÝch ho¹t.")
	if STVN_AllMissionComplete() == 1 then
		TaskTip("§· hoµn thµnh tÊt c¶ nhiÖm vô, h·y mau kÝch ho¹t Sinh Tö V« Ng·.")
	end
	return 1
end


function STVN_AllMissionComplete()
	local nMission1 = GetTask(TSK_SINHTUVONGA1)
	local nMission2 = VNG_GetTaskPos(TSK_SINHTUVONGA3,1,1)
	if (nMission1 + nMission2) == 0 then
		return 1
	else
		return 0
	end
end


function STVN_GetDailyAwardStatus()
	local nStatus = VNG_GetTaskPos(TSK_SINHTUVONGA3,6,6)
	local tbStatus = {
		[0] = "ch­a nhËn nhiÖm vô h»ng ngµy",
		[1] = "ch­a hoµn thµnh nhiÖm vô",
		[2] = "ch­a nhËn th­ëng nhiÖm vô h»ng ngµy",
		[3] = "®· nhËn th­ëng nhiÖm vô h»ng ngµy",
	}
	return nStatus, tbStatus[nStatus]
end


function STVN_SetDailyAwardStatus(nValue)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,nValue,6,6)
end


function STVN_AllDailyMissionComplete()
	local nCheck = 0
	for i=1,getn(tbSTVNDailyMissionConfig) do
		nCheck = nCheck + VNG_GetTaskPos(TSK_SINHTUVONGA3,tbSTVNDailyMissionConfig[i][4],tbSTVNDailyMissionConfig[i][5])
	end
	if nCheck == 0 then
		return 1
	else
		return 0
	end
end


function STVN_DailyMissionComplete(nMissionID)
	if STVN_GetDailyAwardStatus() >= 2 then
		return 0
	end
	local tbMission = tbSTVNDailyMissionConfig[nMissionID]
	local nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
	if nQty > 0 then
		VNG_SetTaskPos(tbMission[1], nQty - 1, tbMission[4], tbMission[5])
	end
	TaskTip("NhiÖm vô h»ng ngµy Sinh Tö V« Ng·: hoµn thµnh 1 lÇn nhiÖm vô "..tbMission[2])
	if STVN_AllDailyMissionComplete() == 1 then
		TaskTip("§· hoµn thµnh tÊt c¶ nhiÖm vô h»ng ngµy, h·y mau nhËn th­ëng.")
		STVN_SetDailyAwardStatus(2)
	end
	return 1
end


function STVN_DailyMissionView()
	local szMission = szNpcName .."Chi tiÕt nhiÖm vô h»ng Sinh Tö V« Ng·:\n"
	for i=1, getn(tbSTVNDailyMissionConfig) do
		szMission = szMission .. tbSTVNDailyMissionConfig[i][2]..": cßn <color=red>".. VNG_GetTaskPos(TSK_SINHTUVONGA3,tbSTVNDailyMissionConfig[i][4],tbSTVNDailyMissionConfig[i][5]) .."<color> lÇn.\n"
	end
	Talk(1,"",szMission)
end