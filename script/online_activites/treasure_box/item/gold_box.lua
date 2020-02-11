--by liubo
--½ð±¦Ïä½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_GOLD_BOX_AWARD = {
 	{2, 2000, 5000000, 1},
 	{3, 1000, 680000, 1},
 	{1, 900, "§¹i B¹ch C©u hoµn", {2, 1, 1007, 1}, 7 * 24 * 3600},
 	{1, 900, "C­êng Tam Thanh hoµn", {2, 1, 1098, 1}, 7 * 24 * 3600},
 	{1, 900, "C­êng Lôc ThÇn hoµn", {2, 1, 1065, 1}, 7 * 24 * 3600},
 	{1, 400, "§¹i Tô Linh Hoµn", {2, 1, 30459, 1}, 7 * 24 * 3600},
 	{1, 700, "B¹ch C©u Tiªn ®¬n", {2, 1, 1008, 1}, 7 * 24 * 3600},
 	{1, 700, "Tam Thanh Tiªn ®¬n", {2, 1, 1099, 1}, 7 * 24 * 3600},
 	{1, 700, "Lôc ThÇn Tiªn ®¬n", {2, 1, 1066, 1}, 7 * 24 * 3600},
 	{1, 300, "Tô Linh Tiªn §¬n", {2, 1, 30460, 1}, 7 * 24 * 3600},
 	{1, 600, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
 	{1, 170, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
 	{1, 69, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
-- 	{1, 22, "Th¸i DÞch Hçn Nguyªn Phæ", {2, 0, 1083, 1}, 0},
--	{1, 6, "L¨ng Ba Vi Bé", {0, 112, 78, 1, 1}, 0},
	{31, 622, "Book_Pet1()", ""},
     {1, 39, "B¹ch Kim R­¬ng", {2, 1, 30343, 1}, 0},
--     {1, 1, "ChuyÓn Sinh §¬n", {2, 1, 30345, 1}, 30 * 24 * 3600},
}
VET_BOOK_PET1 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 1", {2,150,1,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 1", {2,150,5,1}, 0},
	{1, 699, "C­êng Th©n B¸ ThÓ CÊp 1", {2,150,9,1}, 0},
	{1, 699, "¢m Phong Thùc Cèt CÊp 1", {2,150,13,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 1", {2,150,17,1}, 0},
	{1, 699, "V« Hµnh V« T­¬ng CÊp 1", {2,150,21,1}, 0},
	{1, 699, "Kim Linh Phô ThÓ CÊp 1", {2,150,25,1}, 0},
	{1, 699, "Méc Linh Phô ThÓ CÊp 1", {2,150,29,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 1", {2,150,33,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 1", {2,150,37,1}, 0},
	{1, 699, "Thæ Linh Phô ThÓ CÊp 1", {2,150,41,1}, 0},
	{1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 1", {2,150,45,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 1", {2,150,49,1}, 0},
	{1, 456, "Khinh Linh TÊn TËt CÊp 1", {2,150,53,1}, 0},
	{1, 700, "V« H×nh Chi Cæ CÊp 1", {2,150,57,1}, 0},
}

function OnUse(nItem)
--	Talk(1, "", "TÝnh n¨ng t¹m ®ãng ®Ó b¶o tr×. B¹n vui lßng quay l¹i sau !!")
--	do return end
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Thêi ®iÓm hiÖn t¹i ch­a cho phÐp ®æi r­¬ng, c¸c h¹ h·y sö dông sau nhÐ.")
			do	return	end
		end
	end
	
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if DelItemByIndex(nItem,1) == 1 then
		gf_EventGiveRandAward(VET_GOLD_BOX_AWARD,10000, "", "Than Tai Bao Ruong","Sö dông Kim R­¬ng")
	end
end

function Book_Pet1()
	gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "Than Tai Bao Ruong","Sö dông Kim R­¬ng")
end