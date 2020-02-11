--ÎÄ¿ý»¨½õºÐ
--2007-08-29´å³¤×ªÒÆµ½Ãâ·ÑÇø
Suit_be_date_num = 30

tAll_cloth = {
	{  --±ê×¼ÄÐ
		{"V¨n CÈm Bµo 1",259},{"V¨n CÈm Bµo 1",260}
	},
	{  --¿ýÎàÄÐ
		{"V¨n CÈm Bµo 2",261},{"V¨n CÈm Bµo 2",262}
	},
	{  --ÐÔ¸ÐÅ®
		{"V¨n CÈm Th­êng (§á)",263},{"V¨n CÈm Th­êng (Hång)",264},{"V¨n CÈm Th­êng (Xanh L¸)",265},{"V¨n CÈm Th­êng (Xanh D­¬ng)",266},
		{"V¨n CÈm Th­êng (Vµng)",267},{"V¨n CÈm Th­êng (Cam)",268},{"V¨n CÈm Th­êng (§en)",269}
	},
	{  --½¿Ð¡Å®
		{"V¨n CÈm Th­êng (§á)",270},{"V¨n CÈm Th­êng (Hång)",271},{"V¨n CÈm Th­êng (Xanh L¸)",272},{"V¨n CÈm Th­êng (Xanh D­¬ng)",273},
		{"V¨n CÈm Th­êng (Vµng)",274},{"V¨n CÈm Th­êng (Cam)",275},{"V¨n CÈm Th­êng (§en)",276}	
	},
}

tLinglong = {  -- Í·,ÒÂ·þ,¿ã×Ó
		{{207,213}, {281,287}, {281,287}, "Linh Lung Th­êng (§á) "},  --ºì
		{{208,214}, {282,288}, {282,288}, "Linh Lung Th­êng (Vµng)"},  --»Æ
		{{209,215}, {283,289}, {283,289}, "Linh Lung Th­êng (PhÊn)"},  --·Û
		{{210,216}, {284,290}, {284,290}, "Linh Lung Th­êng (TÝm)"},  --×Ï
		{{211,217}, {285,291}, {285,291}, "Linh Lung Th­êng (Lam)"},  --À¶
		{{212,218}, {286,292}, {286,292}, "Linh Lung Th­êng (Lôc)"},  --ÂÌ
}
tLinglongPart = {{108,"Linh Lung Qu¸n "},{109,"Trang søc Linh Lung"},{110,"Linh Lung h¹ trang"}}

function OnUse(nItemIdx)
	local player_sex = GetBody()
	if player_sex < 3 then
		Say("Nh©n vËt nam kh«ng thÓ sö dông V¨n CÈm H¹p! ",0)
		return
	end
	Say("§¹i hiÖp cÇn ngo¹i trang lo¹i nµo? Xin tïy ý lùa chän: ",3,
			"Ta cÇn V¨n CÈm Th­êng/#give_wenkui("..nItemIdx..")",
			"Ta cÇn Linh Lung Th­êng /#give_linglong("..nItemIdx..")",
			"Ta suy nghÜ l¹i/end_say"
	)
end

function give_wenkui(nItemIdx)
	local player_sex = GetBody()
	local tSay = {}
	for i = 1,getn(tAll_cloth[player_sex]) do
		tinsert(tSay,tAll_cloth[player_sex][i][1].."/#wk_give_cloth("..tAll_cloth[player_sex][i][2]..", "..nItemIdx..")")
	end
	tinsert(tSay,"Ta suy nghÜ l¹i/end_say")
	Say("§¹i hiÖp cÇn ngo¹i trang lo¹i nµo? Xin tïy ý lùa chän: ",getn(tSay),tSay)
end

function give_linglong(nItemIdx)
	local tSay = {}
	for i = 1,getn(tLinglong) do
		tinsert(tSay,tLinglong[i][4].."/#ll_give_cloth("..i..", "..nItemIdx..")")
	end
	tinsert(tSay,"Ta suy nghÜ l¹i/end_say")
	Say("§¹i hiÖp cÇn Linh Lung Th­êng lo¹i nµo? Xin tïy ý lùa chän: ",getn(tSay),tSay)
end

function wk_give_cloth(nDetail, nItemIdx)
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 5 then
		Say("Hµnh trang cña b¹n ®· kh«ng cßn chç trèng. Xin s¾p xÕp l¹i! ",0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local add_flag,goods_index = AddItem(0,109,nDetail,1)
		SetItemExpireTime(goods_index, nExpireTime)
	end
end

function ll_give_cloth(nDetail, nItemIdx)
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 50 then
		Say("Hµnh trang cña b¹n ®· kh«ng cßn chç trèng. Xin s¾p xÕp l¹i! ",0)
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody()
		for i = 1,3 do
			local add_flag,goods_index = AddItem(0,tLinglongPart[i][1],tLinglong[nDetail][i][nBody-2],1,1)
			SetItemExpireTime(goods_index, nExpireTime)
		end
	end
end

function end_say()
end