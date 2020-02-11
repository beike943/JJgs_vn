g_tbItem = {
		--ID1, ID2, ID3,     name,Ôö¼ÓÖµ,ÏÞÖÆÖµ
	[1] = {2,	1,	1156,	"NghÞch L©n",	1,	10},
	[2] = {2,	1,	1157,	"§Êu hån",	10,	10},
	}
	
--ÕòÅÉ¼¼ÄÜÃû×Ö
g_tbSkillName = {
	[0] = "",
	[1] = "",
	[2] = "DÞch C©n Kinh",
	[3] = "TÈy Tñy Kinh",
	[4] = "Nh­ Lai ThÇn Ch­ëng",
	[5] = "",
	[6] = "HÊp Tinh TrËn",
	[7] = "",
	[8] = "V¹n T­íng ThÇn C«ng",
	[9] = "Thiªn ¢m TrÊn Hån Khóc",
	[10] = "",
	[11] = "Gi¸ng Long ThËp B¸t Ch­ëng",
	[12] = "§¶ CÈu c«n ph¸p",
	[13] = "",
	[14] = "V« Th­îng Th¸i Cùc KiÕm",
	[15] = "Th¸i Cùc ThÇn C«ng",
	[16] = "",
	[17] = "Liªn Hoµn Toµn Long th­¬ng",
	[18] = "B¸ V­¬ng T­êng Phông TiÔn",
	[19] = "",
	[20] = "V« Thiªn Ma C«ng",
	[21] = "V« ¶nh Ma Cæ",
	[22] ="",
	[23] ="V« Cùc Phong L«i QuyÕt",
	[24] ="",
	[25] ="Cµn Kh«n §¹i Na Di",
	[26] ="Quang Minh Ngò Hµnh TrËn",
	[27] ="Hµn B¨ng Miªn Ch­ëng",
	[28] ="",
	[29] ="Loan Phông Cöu Thiªn",
	[30] ="Cöu Vü Hoa Tiªn QuyÕt",
	[31] = "Thiªn ¶nh tuyÖt s¸t",
	[32] = "V¹n kiÕm hãa vò trËn",
};
	

function OnUse(nItemIdx)
	local nIdx = get_item_idx(nItemIdx);
	if nIdx == 0 then
		Talk(1,"","VËt phÈm b¹n sö dông kh«ng thÓ t¨ng trÞ s¸t khÝ! ");
		return 0;
	end;
	
	if chk_can_use() == 0 then
		Say("Khu vùc hiÖn t¹i kh«ng thÓ sö dông "..g_tbItem[nIdx][4]..".",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","B¹n ch­a häc ®­îc tuyÖt kü TrÊn ph¸i nµo, kh«ng thÓ sö dông "..g_tbItem[nIdx][4]..".");
		return 0;
	end;
	use(nItemIdx,nIdx)
--	local nCurShaQi = GetMomentum();
--	local selTab = {
--			format("§ång ý/#use(%d,%d)",nItemIdx,nIdx),
--			"Hñy bá/nothing",
--			}
--	Say("Ng­¬i ®ång ý sö dông <color=yellow>"..g_tbItem[nIdx][4].."<color>? Sau khi sö dông cã thÓ gia t¨ng <color=yellow>"..g_tbItem[nIdx][5].."<color> TrÞ s¸t khÝ. TrÞ s¸t khÝ cña b¹n lµ <color=yellow>"..nCurShaQi.."<color>.",getn(selTab),selTab);
end;

function use(nItemIdx,nIdx)
	local nCurShaQi = GetMomentum();
	if nCurShaQi >= g_tbItem[nIdx][6] then
		Talk(1,"","TrÞ s¸t khÝ hiÖn t¹i cña b¹n lµ <color=yellow>"..nCurShaQi.."<color> kh«ng thÓ sö dông <color=yellow>"..g_tbItem[nIdx][4].."<color>.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= 606 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("B¹n ®· sö dông 1 "..g_tbItem[nIdx][4]..", trÞ s¸t khÝ t¨ng 1 . ");
			else
				SetMomentum(10);
				Msg2Player("B¹n ®· sö dông 1 "..g_tbItem[nIdx][4]..", trÞ s¸t khÝ thµnh 10 .");
			end;
		end;
	else
		SetMomentumBoundSwitch(0);
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("B¹n ®· sö dông 1 "..g_tbItem[nIdx][4]..", trÞ s¸t khÝ t¨ng 1 . ");
			else
				SetMomentum(10);
				Msg2Player("B¹n ®· sö dông 1 "..g_tbItem[nIdx][4]..", trÞ s¸t khÝ thµnh 10 .");
			end;
		end;
		SetMomentumBoundSwitch(1);
	end	
	
end;

function get_item_idx(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function nothing()

end;

function chk_can_use()
	local nMapID = GetWorldPos()
	if nMapID >= 839 and nMapID <= 842 then
		return 0
	end
	if GetMissionS(10) == "¶i s­ m«n" then	--¿´¿´ÊÇ²»ÊÇÔÚÌØÊâ¹Ø¿¨ÀïÃæ
		return 0;
	end;
	return 1
end