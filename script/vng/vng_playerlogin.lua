Include("\\script\\online\\chuyen_sinh\\translife_head.lua")
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
Include("\\script\\lib\\globalfunctions.lua") 
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
szLogTitle = "TAI XUAT GIANG HO"
function vng_playerlogin_init()
	local nDate = tonumber(date("%y%m%d"))
	VNG_ThangTienPhucSinh()
--	VNG_Del1Time()
	VNG_Pet_Effect()
	VNG_SinhTuVoNga_Init()
	CS7_Trigger_Init()
	Xoa_KNB()
	VNG_ResetTitleCS()
	if nDate >= 140221 and nDate <= 140320 then
		TaiXuatGiangHo_Init()
	end
end


function vng_merge_server()
--	:::::::::::::::::::::::: §æi quèc tÞch ::::::::::::::::::::::::::::::::
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 67 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 7)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 60 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 10)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 72 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 20)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 5 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 68)
--	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 13 then
--		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 47)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 59 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 71)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 47 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 58 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 21)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 76 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 38)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 74 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 25)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 55 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 11)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 13 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 62)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 19 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 66)
--	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 24 then
--		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 73)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 28 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 38 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 12)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 36 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 73)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 75 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 63)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 82 then	--------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 10)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 80 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 24)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 86 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 29)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 81 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 35)			
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 77 then	--------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 25)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 79 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 32)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 87 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 23)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 88 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 21)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 52 then	--------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 63)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 53 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 62)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 83 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 84 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)			
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 85 then	----------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 20)									
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 29 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 35)								
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 73 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 43)								
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 21 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)														
	end
	
--	:::::::::::::::::::::::: §æi hé chiÕu =))  ::::::::::::::::::::::::::::::::
	if GetTask(TSK_CHANGE_SERVER) == 67 then
		SetTask(TSK_CHANGE_SERVER, 7)
	elseif GetTask(TSK_CHANGE_SERVER) == 60 then
		SetTask(TSK_CHANGE_SERVER, 10)
	elseif GetTask(TSK_CHANGE_SERVER) == 72 then
		SetTask(TSK_CHANGE_SERVER, 20)
	elseif GetTask(TSK_CHANGE_SERVER) == 5 then
		SetTask(TSK_CHANGE_SERVER, 68)
--	elseif GetTask(TSK_CHANGE_SERVER) == 13 then
--		SetTask(TSK_CHANGE_SERVER, 47)
	elseif GetTask(TSK_CHANGE_SERVER) == 59 then
		SetTask(TSK_CHANGE_SERVER, 71)
	elseif GetTask(TSK_CHANGE_SERVER) == 47 then
		SetTask(TSK_CHANGE_SERVER, 50)
	elseif GetTask(TSK_CHANGE_SERVER) == 58 then
		SetTask(TSK_CHANGE_SERVER, 21)
	elseif GetTask(TSK_CHANGE_SERVER) == 76 then
		SetTask(TSK_CHANGE_SERVER, 38)
	elseif GetTask(TSK_CHANGE_SERVER) == 74 then
		SetTask(TSK_CHANGE_SERVER, 25)
	elseif GetTask(TSK_CHANGE_SERVER) == 55 then
		SetTask(TSK_CHANGE_SERVER, 11)
	elseif GetTask(TSK_CHANGE_SERVER) == 13 then
		SetTask(TSK_CHANGE_SERVER, 62)
	elseif GetTask(TSK_CHANGE_SERVER) == 19 then
		SetTask(TSK_CHANGE_SERVER, 66)
--	elseif GetTask(TSK_CHANGE_SERVER) == 24 then
--		SetTask(TSK_CHANGE_SERVER, 73)
	elseif GetTask(TSK_CHANGE_SERVER) == 28 then
		SetTask(TSK_CHANGE_SERVER, 16)
	elseif GetTask(TSK_CHANGE_SERVER) == 38 then
		SetTask(TSK_CHANGE_SERVER, 12)
	elseif GetTask(TSK_CHANGE_SERVER) == 36 then
		SetTask(TSK_CHANGE_SERVER, 73)
	elseif GetTask(TSK_CHANGE_SERVER) == 75 then		
		SetTask(TSK_CHANGE_SERVER, 63)	
	elseif GetTask(TSK_CHANGE_SERVER) == 82 then		---------
		SetTask(TSK_CHANGE_SERVER, 10)		
	elseif GetTask(TSK_CHANGE_SERVER) == 80 then
		SetTask(TSK_CHANGE_SERVER, 24)
	elseif GetTask(TSK_CHANGE_SERVER) == 86 then
		SetTask(TSK_CHANGE_SERVER, 29)
	elseif GetTask(TSK_CHANGE_SERVER) == 81 then
		SetTask(TSK_CHANGE_SERVER, 35)	
	elseif GetTask(TSK_CHANGE_SERVER) == 77 then		---------
		SetTask(TSK_CHANGE_SERVER, 25)		
	elseif GetTask(TSK_CHANGE_SERVER) == 79 then
		SetTask(TSK_CHANGE_SERVER, 32)
	elseif GetTask(TSK_CHANGE_SERVER) == 87 then
		SetTask(TSK_CHANGE_SERVER, 23)
	elseif GetTask(TSK_CHANGE_SERVER) == 88 then
		SetTask(TSK_CHANGE_SERVER, 21)	
	elseif GetTask(TSK_CHANGE_SERVER) == 52 then		---------
		SetTask(TSK_CHANGE_SERVER, 63)		
	elseif GetTask(TSK_CHANGE_SERVER) == 53 then
		SetTask(TSK_CHANGE_SERVER, 62)
	elseif GetTask(TSK_CHANGE_SERVER) == 83 then
		SetTask(TSK_CHANGE_SERVER, 50)
	elseif GetTask(TSK_CHANGE_SERVER) == 84 then
		SetTask(TSK_CHANGE_SERVER, 39)	
	elseif GetTask(TSK_CHANGE_SERVER) == 85 then		---------------
		SetTask(TSK_CHANGE_SERVER, 20)		
	elseif GetTask(TSK_CHANGE_SERVER) == 29 then
		SetTask(TSK_CHANGE_SERVER, 35)	
	elseif GetTask(TSK_CHANGE_SERVER) == 73 then
		SetTask(TSK_CHANGE_SERVER, 43)	
	elseif GetTask(TSK_CHANGE_SERVER) == 21 then
		SetTask(TSK_CHANGE_SERVER, 39)																	
	end
end


function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end


function VNG_Pet_Effect()
	local tNoiNgoai = {
			 [1] = {
						{"Néi C«ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh Lùc +6000", "state_life_max_point_add", 8000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Kh¸ng tÊt c¶ +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo¹i C«ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh Lùc +6000", "state_life_max_point_add", 10000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Néi phßng/Ngo¹i phßng +60", "state_i_defence_point_add", 60},
						{"Ngo¹i phßng +60", "state_o_defence_point_add", 60},
					},
				}
	--buff Phôc Sinh PET
	local nWay = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/1000),10) --h­íng phôc sinh
	local nAttrId = 2908130 --29/08/13 + x
	if mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10) >= 1 then --x¸c ®Þnh cã phôc sinh PEt
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end			
	end
end


function VNG_SinhTuVoNga_Init()
	---remove title cña cs 1,2,3,4,5 ==> add title cña cs5 cho role tham gia Sinh Tö V« Ng·
	if GetPlayerRebornParam(0) > 0 then -- b¾t cs6 trë lªn ko thùc hiÖn remove title
		return 0
	end
	local nRoute = GetPlayerRoute()
	if GetTask(TSK_SINHTUVONGA2) > 0 then
		for i = 1, 5 do
			RemoveTitle(tb_translife_tittle[i][nRoute][2], tb_translife_tittle[i][nRoute][3])
		end
		
		AddTitle(tb_translife_tittle[5][nRoute][2], tb_translife_tittle[5][nRoute][3])
	end
end

function CS7_Trigger_Init()
	-- NhiÖm vô ®¸nh qu¸i chuyÓn sinh 7
	if GetTrigger(2558) ~= 0 then
		RemoveTrigger(GetTrigger(2558))
	end
	if PhucSinh2_CheckActive() == 1 then
		local nQuestID = PhucSinh2_GetDailyMission()
		if  nQuestID ~= 0 and tbPhucSinh2Name[nQuestID][3] == 2 and PhucSinh2_GetStatus() == 0 then
			CreateTrigger(0,1279,2558)
		end
	end
end

function VNG_Del1Time()
	local tb_translife_cloth_PS_Xoa = {	--tb_translife_cloth_PS
													{"ChuyÓn Sinh Trang", {0,108,30029,1,4,7,639,3,371,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,342,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30029,1,4,4,282,7,250,7,102}},
													{"ChuyÓn Sinh Trang", {0,108,30029,1,4,7,27,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,342,4,409,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30029,1,4,5,292,5,293,7,102}},
													 {"ChuyÓn Sinh Trang", {0,108,30029,1,4,3,13075,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,342,2,346,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30029,1,4,4,282,7,250,7,102}},
													 {"ChuyÓn Sinh Trang", {0,108,30029,1,4,6,302,7,409,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,13219,5,13220,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30029,1,4,4,290,7,250,7,102}},
									}
	local nCount = getn(tb_translife_cloth_PS_Xoa)
	local nCheckXoa = VNG_GetTaskPos(TSK_DUNGCHUNG, 1, 1)
	if nCheckXoa >= 1 then
		return
	end
	for i=1, getn(tb_translife_cloth_PS_Xoa) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = 	gf_UnPack(tb_translife_cloth_PS_Xoa[i][2])		--gf_UnPack(tb_translife_cloth_PS_Xoa[nType_cs6][i][2])
			for j=1, 4 do
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))
				P = P +  1
			end
		end
	VNG_SetTaskPos(TSK_DUNGCHUNG, 1, 1, 1)	
	gf_WriteLogEx("CHUYEN SINH 7", "xãa thµnh c«ng", 1, "Xãa thµnh c«ng ngo¹i trang PS2")
end


function Xoa_KNB()
	if  gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,1) == 0 then
		BigDelItem(0,102,27,BigGetItemCount(0,102,27))
		gf_SetTaskBit(TSK_XOA_KHUATNGUYENBOI, 1, 1, 0)
	end
end


function TaiXuatGiangHo_Init()
	local nTimeCondition = 30
	local nLastLogin = GetLastLoginTime()
	local nNow = GetTime()
	local nLeaveTime = floor((nNow - nLastLogin)/(24*3600))
	if nLastLogin == 0 then
		return 0
	end
	if GetLevel() < 83 then
		gf_WriteLogEx(szLogTitle, "fail", 1, "Level fail")
		return 0
	end
	if gf_Check55HaveSkill() == 0 then
		gf_WriteLogEx(szLogTitle, "fail", 1, "No skill 55")
		return 0
	end
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) ~= 0 then
		return 0
	end
	if nLeaveTime > 30 then
		gf_SetTaskBit(TSK_TAIXUAT_FLAG,1,1,0)
		Talk(1,"","Chµo mõng ®¹i hiÖp ®· t¸i xuÊt giang hå sau <color=yellow>"..nLeaveTime.." ngµy<color> Èn dËt. H·y nhanh chãng ®Õn gÆp B¾c §Èu L·o Nh©n ®Ó t×m hiÓu quyÒn lîi cña c¸c h¹.")
	end
end

function VNG_ResetTitleCS()
	local nRoute = GetPlayerRoute()
	local nTransCount = GetTranslifeCount()	
	if nTransCount < 5 and nTransCount > 0 then
		RemoveTitle(tb_translife_tittle[5][nRoute][2], tb_translife_tittle[5][nRoute][3])
		if nTransCount > 0 then
			AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		end
	end
end

function VNG_ThangTienPhucSinh()
	local nStatus = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH, 1, 1)
	local nExp = 2000000000
	if nStatus == 2 then
		for i = 1, 5 do
			ModifyExp(nExp)
		end
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 3, 1, 1)
		gf_WriteLogEx("THANG TIEN PHUC SINH", "chuyÓn sinh thµnh c«ng", 1, "NhËn 10 tû ®iÓm kinh nghiÖm")	
	end
end