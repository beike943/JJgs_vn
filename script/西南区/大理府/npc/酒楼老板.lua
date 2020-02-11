
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¾ÆÂ¥ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
Include("\\script\\vng\\doinguyenlieu.lua");
Include("\\script\\vng\\weapon_upgrade\\viemde2thienchiviemde.lua");
Include("\\script\\vng\\weapon_upgrade\\thienchiviemde2bachkimviemde.lua");

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "<color=green>Chñ Töu LÇu:<color> Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."

	tinsert(tbSayDialog, "NhËn nhiÖm vô ®æi Viªm §Õ thµnh Thiªn Chi Viªm §Õ (tiªu hao 1000 vµng)/get_VD2TCVD")
	tinsert(tbSayDialog, "NhËn nhiÖm vô ®æi Thiªn Chi Viªm §Õ thµnh B¹ch Kim Viªm §Õ (tiªu hao 2000 vµng)/get_TCVD2BKVD")
	tinsert(tbSayDialog, "Hoµn thµnh nhiÖm vô: NhËn trang bÞ Thiªn Chi Viªm §Õ/finish_VD2TCVD")
	tinsert(tbSayDialog, "Hoµn thµnh nhiÖm vô: NhËn trang bÞ B¹ch Kim Viªm §Õ/finish_TCVD2BKVD")
	tinsert(tbSayDialog, "Ta chØ ghÐ th¨m th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end;

function nothing()

end