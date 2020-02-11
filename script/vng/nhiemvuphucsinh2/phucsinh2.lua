Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

NOPVATPHAM_FILE = "\\script\\vng\\nhiemvuphucsinh2\\nopvatpham.lua";
HOANTHANHNHANH_FILE = "\\script\\vng\\nhiemvuphucsinh2\\hoanthanhnhanh.lua";

--*************************************
-- Task: TSK_DONGHANH = 2189
-- From: 7/5/2013
-- End: ...
--*************************************

function NhiemVuPhucSinh2_Menu()
	local tbSay = {}
	if PhucSinh2_CheckActive() == 0 then
		tinsert(tbSay, "Ta muèn nhËn thö th¸ch cña Tø Linh Phôc Sinh 2 (tiªu hao 04 B¹ch Kim §¹i Hång Bao chøa 4000v )/PhucSinh2_Start")
	end
	if PhucSinh2_CheckActive() == 1 then
		if PhucSinh2_GetCount() < nMISSION_QTY then
			local nQuestID = PhucSinh2_GetDailyMission()
			if  nQuestID ~= 0 and tbPhucSinh2Name[nQuestID][3] == 1 and PhucSinh2_GetStatus() == 0 then
				tinsert(tbSay, "Nép vËt phÈm/PhucSinh2_NopItem")
			end
			tinsert(tbSay, "NhËn nhiÖm vô ngµy ("..PhucSinh2_CountDailyMission().."/5)/PhucSinh2_NhanNhiemVuNgay")
			tinsert(tbSay, "Lµm míi nhiÖm vô/PhucSinh2_LamMoiNhiemVu")
			tinsert(tbSay, "TiÕn ®é hoµn thµnh nhiÖm vô ngµy/PhucSinh2_TienDoNhiemVuNgay")
			tinsert(tbSay, "TiÕn ®é hoµn thµnh chuçi 50 nhiÖm vô/PhucSinh2_TienDoPhucSinh2")
			tinsert(tbSay, "Hoµn thµnh nhanh nhiÖm vô/PhucSinh2_HoanThanhNhanh")
--			tinsert(tbSay, "Test - Hoµn thµnh 1 phÇn nhiÖm vô/PhucSinh2_SetMissionPart")
--			tinsert(tbSay, "Test - Hoµn thµnh nhiÖm vô/PhucSinh2_SetStatus")
--			tinsert(tbSay, "Test - NhËn nhiÖm vô chuÈn v·i/PhucSinh2_TestNhanNhiemVu_Menu")
		else
			tinsert(tbSay, "Thu thËp nguyªn liÖu/PhucSinh2_NopNguyenLieu_Menu")
		end
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say(szNPCName.."Ng­¬i muèn lÜnh ngé c¶nh giíi míi cña Tø Linh Phôc Sinh, tr­íc hÕt ph¶i v­ît qua c¸c thö th¸ch cña ta.",getn(tbSay), tbSay)
end


function PhucSinh2_Start()
	local tbNguyenLieu = {item={{gdp={2,1,30229,4}, name="B¹ch Kim Hång Bao"}}}
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	if nPhucSinh < 1 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a Phôc Sinh lÇn nµo, kh«ng thÓ lÜnh héi bÝ kÝp Phôc Sinh cÊp cao h¬n.")
		return 0
	end
	if GetLevel() < 99 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a ®¹t ®¼ng cÊp 99, luyÖn bÝ kÝp sÏ rÊt nguy hiÓm. H·y tu luyÖn thªm nhÐ.")
		return 0
	end
	if PhucSinh2_CheckActive() == 1 then
		Talk(1,"",szNPCName.."Ng­¬i ®· nhËn thö th¸ch, kh«ng cÇn ph¶i nhËn l¹i.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu)
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieu)
	PhucSinh2_Active()
	gf_WriteLogEx("NHIEM VU PHUC SINH 2", "kick ho¹t thµnh c«ng", 1, "Phôc Sinh 2 kÝch ho¹t")
	Talk(1,"",szNPCName.."Ng­¬i ®· ®ång ý nhËn thö th¸ch cña ta, tõ giê h·y kiªn tr× hoµn thµnh thö th¸ch nhÐ.")
end


function PhucSinh2_NhanNhiemVuNgay()
	if PhucSinh2_CheckActive() == 0 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a nhËn thö th¸ch, kh«ng thÓ nhËn nhiÖm vô h»ng ngµy.")
		return 0
	end
	if PhucSinh2_CountDailyMission() >= nSoLuongNhiemVuNgay then
		Talk(1,"",szNPCName.."Ng­¬i ®· hoµn thµnh ®ñ "..nSoLuongNhiemVuNgay.." mçi ngµy. Mai nhí quay l¹i nhÐ.")
		return 0
	end
	if PhucSinh2_GetStatus() == 0 and PhucSinh2_GetDailyMission() ~= 0 then
		Talk(1,"",szNPCName.."Ng­¬i ch­a hoµn thµnh nhiÖm vô hiÖn t¹i. H·y hoµn thµnh råi quay l¹i nhÐ.")
		return 0
	end
	PhucSinh2_SetDailyMission()
end


function PhucSinh2_LamMoiNhiemVu()
	if PhucSinh2_GetStatus() == 1 then
		Talk(1,"",szNPCName.."NhiÖm vô ®· hoµn thµnh, ng­¬i kh«ng cÇn ph¶i ®æi.")
		return 0
	end
	local tbSay = {}
	tinsert(tbSay, "Tiªu hao 69 vµng/#PhucSinh2_LamMoiNhiemVu_Done(1)")
	tinsert(tbSay, "Tiªu hao 19 xu vËt phÈm/#PhucSinh2_LamMoiNhiemVu_Done(2)")
	tinsert(tbSay, "Ta muèn suy nghÜ thªm/gf_DoNothong")
	Say(szNPCName.."Ng­¬i cã thÓ bá ra Ýt lÖ phÝ ®Ó ®æi nhiÖm vô kh¸c nÕu cÇn.", getn(tbSay), tbSay)
end


function PhucSinh2_LamMoiNhiemVu_Done(nOption)
	local tbNguyenLieu = {
		[1] = {nGold = 690000},
		[2] = {item={{gdp={2,1,30230,19}, name="Xu VËt PhÈm"}}},
	}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu[nOption])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieu[nOption])
	PhucSinh2_SetDailyMission()
end


function PhucSinh2_TienDoNhiemVuNgay()
	local nQuestID = PhucSinh2_GetDailyMission() or 0
	if nQuestID == 0 then
		Talk(1,"",szNPCName.."HiÖn ng­¬i ch­a nhËn thö th¸ch Phôc sinh nµo.")
		return 0
	end
	local nPart = PhucSinh2_GetMissionPart()
	Talk(1,"",szNPCName.."Ng­¬i ph¶i <color=yellow>"..tbPhucSinh2Name[nQuestID][1].."<color>. CÇn thùc hiÖn <color=red>"..nPart.."<color> lÇn n÷a ®Ó hoµn thµnh nhiÖm vô.")
end


function PhucSinh2_TienDoPhucSinh2()
	local nCount = PhucSinh2_GetCount()
	Talk(1,"",szNPCName.."Ng­¬i ®· hoµn thµnh <color=yellow>"..nCount.."/"..nMISSION_QTY.."<color> thö th¸ch Phôc Sinh 2.")
end

function PhucSinh2_NopItem()
	local nQuestID = PhucSinh2_GetDailyMission()
	PutinItemBox(tbPhucSinh2Name[nQuestID][1] ,1, szNPCName.."X¸c nhËn nép vËt phÈm nµy.", NOPVATPHAM_FILE, 1)
end


function PhucSinh2_NopNguyenLieu_Menu()
	local tbSay = {}
	for i=1, getn(tbNguyenLieuThuThap) do
		if gf_GetTaskBit(TSK_PHUCSINH2, tbNguyenLieuThuThap[i][6]) == 0 then
			tinsert(tbSay, "Nép "..tbNguyenLieuThuThap[i][4].." "..tbNguyenLieuThuThap[i][5].."/#PhucSinh2_ThuThapNguyenLieu("..i..")")
		end
	end
	tinsert(tbSay, "Ta cÇn chuÈn bÞ thªm/gf_DoNothing")
	Say(szNPCName.."NÕu c¸c h¹ ®· cã ®ñ nguyªn liÖu cÇn thiÕt, h·y nhanh chãng giao l¹i cho ta.", getn(tbSay), tbSay)
end


function PhucSinh2_TestNhanNhiemVu_Menu()
	AskClientForNumber("PhucSinh2_SetDailyMission",1,41,"ID nhiÖm vô:")
end


function PhucSinh2_HoanThanhNhanh()
	local nQuestID = PhucSinh2_GetDailyMission()
	PutinItemBox("Hoµn thµnh nhanh nhiÖm vô" ,1, szNPCName.."X¸c nhËn nép vËt phÈm nµy.", HOANTHANHNHANH_FILE, 1)
end