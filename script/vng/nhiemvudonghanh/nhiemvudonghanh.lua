Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

TANGMATTICH_FILE = "\\script\\vng\\nhiemvudonghanh\\tangmattich.lua";
TANGTRAICAY_FILE = "\\script\\vng\\nhiemvudonghanh\\tangtraicay.lua";

--*************************************
-- Task: TSK_DONGHANH = 2189
-- From: 7/5/2013
-- End: ...
--*************************************

function NhiemVuDongHanh_Menu()
	local tbSay = {}
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetCount() == 365 and DongHanh_GetFinalAward() == 0 then
			tinsert(tbSay, "Ta ®· v­ît qua 365 nhiÖm vô, ta muèn nhËn thµnh qu¶/NhiemVuDongHanh_FinalAward")
		end
		if DongHanh_GetStatus() == 1 and DongHanh_GetAward() == 1 then
			tinsert(tbSay, "NhËn th­ëng nhiÖm vô ngµy/NhiemVuDongHanh_DailyAward")
		end
		tinsert(tbSay, "NhËn nhiÖm vô ®ång hµnh/NhiemVuDongHanh_Nhan")
		tinsert(tbSay, "Xem sè l­îng nhiÖm vô ®· thùc hiÖn/NhiemVuDongHanh_Count")
		tinsert(tbSay, "Nhê Ch©n Nh©n hoµn thµnh gióp nhiÖm vô (tiªu hao 02 xu vËt phÈm + 02 vµng)/NhiemVuDongHanh_Support")
		if gf_GetTaskByte(TSK_DONGHANH_COUNT,1) > 0 then
			tinsert(tbSay, "Ta muèn nhËn thªm nhiÖm vô/NhiemVuDongHanh_GetMore")
		end
		tinsert(tbSay, "Xem nhiÖm vô hiÖn t¹i/NhiemVuDongHanh_Show")
		if DongHanh_GetMission() == 22 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "TÆng Long Quang Ch©n Nh©n 02 mËt tŞch./#DongHanh_TangMatTich(2)")
		end
		if DongHanh_GetMission() == 23 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "TÆng Long Quang Ch©n Nh©n 03 mËt tŞch./#DongHanh_TangMatTich(3)")
		end
		if DongHanh_GetMission() == 24 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "TÆng Long Quang Ch©n Nh©n 20 tr¸i c©y./DongHanh_TangTraiCay")
		end
		if DongHanh_GetMission() == 25 and DongHanh_GetStatus() == 0 then
			tinsert(tbSay, "TÆng Long Quang Ch©n Nh©n 8 vµng vµ 8 xu vËt phÈm./DongHanh_TangTien")
		end
	end
	tinsert(tbSay, "Ta chØ ghĞ th¨m/gf_DoNothing")
	Say(szNPCName .."§ång hµnh ®ång hµnh, thiªn h¹ ®ång hµnh, giang hå hung hiÓm, cïng ta ®ång hµnh?", getn(tbSay), tbSay)
end


function NhiemVuDongHanh_Nhan()
	if DongHanh_GetCount() >= 365 then
		Talk(1,"",szNPCName.."Ng­¬i ®· hoµn thµnh tÊt c¶ nhiÖm vô, ta sÏ gäi ng­¬i khi cã nhiÖm vô míi.")
		return 0
	end
	if DongHanh_GetAward() == 1 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a tr¶ nhiÖm vô lÇn tr­íc, h·y tr¶ nhiÖm vô råi míi nhËn thªm nhĞ.")
		return 0
	end
	local nQty = gf_GetTaskByte(TSK_DONGHANH_COUNT, 1)
	if DongHanh_GetStatus() == 1 then
		Talk(1,"",szNPCName.."H«m nay ng­¬i ®· hoµn thµnh "..nQty.." nhiÖm vô, mai h·y quay l¹i nhĞ.")
		return 0
	end
	
	if DongHanh_GetMission() ~= 0 then
		Talk(1,"",szNPCName.."H«m nay ng­¬i ®· nhËn nhiÖm vô, cßn kh«ng mau ®i thùc hiÖn?")
		return 0
	end
	
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh < 1 or nChuyenSinh > 4 then
		Talk(1,"",szNPCName.."§iÒu kiÖn chuyÓn sinh kh«ng phï hîp, ng­¬i kh«ng thÓ nhËn nhiÖm vô.")
		return 0
	end
	
	DongHanh_SetMission()
end


function NhiemVuDongHanh_Count()
	Talk(1,"",szNPCName.."§Õn h«m nay ng­¬i ®· hoµn thµnh <color=yellow>".. DongHanh_GetCount() .."/365<color> nhiÖm vô, mai tiÕp tôc cè g¾ng nhĞ.")
end


function NhiemVuDongHanh_Show()
	local nMissionID = DongHanh_GetMission()
	if nMissionID > 0 then
		Talk(1,"",szNPCName.."Ta ®· giao cho ng­¬i <color=yellow>".. tbDongHanhName[nMissionID][1] .."<color>, cßn kh«ng mau ®i thùc hiÖn?")
	else
		Talk(1,"", szNPCName.."Ng­¬i ch­a nhËn nhiÖm vô h«m nay.")
	end
end


function NhiemVuDongHanh_DailyAward()
	if DongHanh_GetStatus() ~= 1 then
		Talk(1,"", szNPCName.."Ng­¬i ch­a hoµn thµnh yªu cÇu cña ta, ch­a thÓ nhËn th­ëng.")
		return 0
	end

	if DongHanh_GetAward() == 0 then
		Talk(1,"", szNPCName.."Ng­¬i ch­a hoµn thµnh nhiÖm vô hoÆc ®· nhËn th­ëng.")
		return 0
	end
	
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNPCName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhĞ!");
		return 0
	end
	
	DongHanh_SetAward(0)
	DongHanh_AddCount()
	Talk(1,"",szNPCName.."Kh¸ khen cho ng­¬i ®· hoµn thµnh nhiÖm vô h«m nay. Mai h·y tiÕp tôc ®Õn t×m ta nhĞ.")
	--gf_AddItemEx2({2,1,30341,1}, "Tµng R­¬ng", szLogTitle, "nhËn")
end


function DongHanh_TangTien()
	if GetCash() < 80000 then
		Talk(1,"", szNPCName.."Ng­¬i ch­a ®ñ 8 vµng, ta kh«ng nhËn ®©u.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < 8 then
		Talk(1,"", szNPCName.."Ng­¬i ch­a ®ñ 8 xu vËt phÈm, ta kh«ng nhËn ®©u.")
		return 0
	end
	
	if Pay(80000) == 1 and DelItem(2,1,30230,8) == 1 then
		DongHanh_SetStatus()
	end
end


function DongHanh_TangMatTich(nQty)
	PutinItemBox("TÆng "..nQty.." MËt tŞch" ,nQty , szNPCName.."Ng­¬i tÆng ta "..nQty.." quyÓn mËt tŞch nµy thËt chø?", TANGMATTICH_FILE, 1)
end


function DongHanh_TangTraiCay()
	PutinItemBox("TÆng 20 tr¸i c©y" ,1, szNPCName.."Ng­¬i tÆng ta 20 tr¸i nµy thËt chø?", TANGTRAICAY_FILE, 1)
end


function NhiemVuDongHanh_FinalAward()
	local tSay = 	{
		"Ta muèn tu luyÖn theo h­íng Long Tö!/#DongHanh_select_translife(1)",
		"Ta muèn tu luyÖn theo h­íng Hæ Tö!/#DongHanh_select_translife(2)",
		"Ta muèn tu luyÖn theo h­íng ¦ng Tö!/#DongHanh_select_translife(3)",
		"Ta muèn tu luyÖn theo h­íng Phông Tö!/#DongHanh_select_translife(4)",
		"Ta suy nghÜ l¹i ®·./gf_DoNothing",
	}
	Say(szNPCName.."<color=yellow>Hçn Tôc Hßa Quang<color> hÊp thu linh khİ ©m d­¬ng, v¹n vËt sinh diÖt ®Òu cã thÓ khèng chÕ, ng­¬i muèn tu luyÖn theo h­íng nµo?",getn(tSay),tSay)
end


function DongHanh_select_translife(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if DongHanh_GetFinalAward() == 1 then
		Talk(1,"", szNPCName.."Chóc mõng ng­¬i ®· trë thµnh cao thñ vâ l©m, tù do b«n ba giang hå.")
		return 0
	end
	
	if DongHanh_GetCount() < 365 then
		Talk(1,"", szNPCName.."Ng­¬i ch­a v­ît qua 365 thö th¸ch, ta ch­a thÓ truyÒn thô Hçn Nguyªn C«ng cho ng­¬i.")
		return 0
	end 
	
	DongHanh_SetFinalAward()
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	local nRoute = GetPlayerRoute()
	-- Set sè lÇn chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5)
	-- Set h­íng chuyÓn sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	
	local nTransCount = GetTranslifeCount()	
	gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
	for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
		P = P + GetBody() - 1
		Pnew = 561 + GetBody()
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
		gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Tø Linh ViÖt Trang","Chuyen Sinh","nhËn ngo¹i trang",120*24*3600,1)
	end
	RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
	AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
	SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
	
	--SetTaskTrans()
	SetTask(TRANSLIFE_MISSION_ID, 37)
	ResetProperty()
	SetLevel(79,0)
	Msg2Player("§ang truyÒn Hçn Nguyªn C«ng chiªu thøc thø t­...")
	AddGlobalNews("Tin ®ån chÊn ®éng giang hå: nghe nãi Cao Thñ Vâ L©m <color=green>"..GetName().."<color> v­ît qua thö th¸ch Long Quang Ch©n Nh©n, ®­îc truyÒn thô 8 thµnh <color=green>Hçn Nguyªn C«ng<color> theo  h­íng <color=yellow>"..tb_translife_seal[nType][3].."<color>!")
--		WriteLogEx("Chuyen Sinh","thµnh c«ng lÇn "..nTransCount.." theo h­íng "..tb_translife_seal[nType][3])	
	gf_WriteLogEx(szLogTitle, "th­ëng", 1, "PhÇn th­ëng cuèi CS5")
	DoWait(15,15,10)
end


function NhiemVuDongHanh_Support()
	if DongHanh_GetMission() == 0 then
		Talk(1,"",szNPCName .. "Ng­¬i ch­a nhËn nhiÖm vô, kh«ng cÇn ta ph¶i gióp ®ì.")
		return 0
	end
	
	if DongHanh_GetStatus() == 1 then
		Talk(1,"",szNPCName .. "Ng­¬i ®· hoµn thµnh nhiÖm vô, kh«ng cÇn ta ph¶i gióp ®ì.")
		return 0
	end
	
	if DongHanh_GetAward() == 1 then
		Talk(1,"",szNPCName .. "Ng­¬i ch­a tr¶ nhiÖm vô tr­íc, ta kh«ng thÓ gióp ®ì.")
		return 0
	end
	
	if GetCash() < 20000 then
		Talk(1,"",szNPCName .. "Ng­¬i kh«ng cã ®ñ 2 vµng, sao ta l¹i ph¶i gióp.")
		return 0
	end
	if GetItemCount(2,1,30230) < 2 then
		Talk(1,"",szNPCName .. "Ng­¬i kh«ng cã ®ñ 2 xu vËt phÈm, sao ta l¹i ph¶i gióp.")
		return 0
	end
	if Pay(20000) == 1 and DelItem(2,1,30230,2) == 1 then
		DongHanh_SetStatus()
		gf_WriteLogEx(szLogTitle,"hoµn thµnh",1,"Hç trî hoµn thµnh")
	end
end


function NhiemVuDongHanh_GetMore()
	if DongHanh_GetStatus() ~= 1 then
		Talk(1,"",szNPCName .. "NhiÖm vô hiÖn t¹i ch­a hoµn thµnh, ng­¬i kh«ng cÇn ph¶i nhËn thªm.")
		return 0
	end
	
	if DongHanh_GetAward() == 1 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a tr¶ nhiÖm vô lÇn tr­íc, h·y tr¶ nhiÖm vô råi míi nhËn thªm nhĞ.")
		return 0
	end
	
	local nQty = gf_GetTaskByte(TSK_DONGHANH_COUNT,1) + 1
	if tbMissionQty[nQty] == nil then
		Talk(1,"",szNPCName .. "Sè lÇn thùc hiÖn nhiÖm vô h«m nay ®· hÕt, ta kh«ng thÓ gióp ng­¬i thªm n÷a.")
		return 0
	end
	
	if GetCash() < tbMissionQty[nQty]["nGold"]*10000 then
		Talk(1,"",szNPCName .."Ng­¬i kh«ng cã ®ñ "..tbMissionQty[nQty]["nGold"].." vµng, ta sÏ kh«ng gióp.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMissionQty[nQty]["nXu"] then
		Talk(1,"",szNPCName .."Ng­¬i kh«ng cã ®ñ "..tbMissionQty[nQty]["nXu"].." xu vËt phÈm, ta sÏ kh«ng gióp.")
		return 0
	end
	
	if Pay(tbMissionQty[nQty]["nGold"]*10000) == 1 and DelItem(2,1,30230,tbMissionQty[nQty]["nXu"]) then
		gf_SetTaskByte(TSK_DONGHANH, 3, 0)
		gf_SetTaskBit(TSK_DONGHANH, 25, 0, 0)
		gf_SetTaskBit(TSK_DONGHANH, 26, 0, 0)
		Talk(1,"",szNPCName .."LÔ vËt cña ng­¬i còng kh¸ hËu hÜnh, ta vui lßng cho ng­¬i nhËn tiÕp nhiÖm vô lÇn "..(nQty))
	end
end