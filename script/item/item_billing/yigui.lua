-- ÒÂ¹ñ
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")  -- ChuyÓn sinh VN

YIGUI_WEIGHT_PER_ITEM = 10		-- ¸ºÖØ

nTType =
{
	[1] = {0, 108, "Nãn",199},
	[2] = {0, 109, "Y phôc",277},
	[3] = {0, 110, "H¹ y",89},
}

function OnUse(nIdx)
	local nItemIndex = tonumber(nIdx)
	local nTime = GetItemExpireTime(nItemIndex)
	local szHeader = "Xin hái <color=yellow>"..Zgc_pub_sex_name().."<color> cÇn lo¹i trang phôc nµo?"
	local tSay = {}		
	tinsert(tSay,"Nãn/#yigui_item(1,"..nTime..")")
	tinsert(tSay,"Y phôc/#yigui_item(2,"..nTime..")")
	tinsert(tSay,"H¹ y/#yigui_item(3,"..nTime..")")
	tinsert(tSay,"Ngo¹i trang T­íng Qu©n/#general_equips("..nTime..")")
	tinsert(tSay,"Ngo¹i trang V¨n Sö (dµnh cho nh©n vËt ®· häc Hçn Nguyªn C«ng thµnh thø 4)/#vansu_equips("..nTime..", "..nIdx..")")
	tinsert(tSay,"T¹m thêi ch­a cÇn!/yigui_no")
	
	Say(szHeader, getn(tSay), tSay)
end

function general_equips(time)
	local nBody = GetBody() - 1
	local nTime = tonumber(time)
	if Zgc_pub_goods_add_chk(3, 3 * YIGUI_WEIGHT_PER_ITEM) == 0 then
		return
	end
	
	for i = 1, 3 do
		local nOk, nItemIndex = AddItem(nTType[i][1], nTType[i][2],nTType[i][4] + nBody, -1, 1)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
			SetItemExpireTime(nItemIndex, nTime)
		end
	end
end

function yigui_item(nType, time)
	local tYigui = {}
	local nBody = GetBody() - 1
	local nCount = 0
	
	tYigui[1] = "TÊt c¶ "..nTType[nType][3].."/#GetItemAll("..nType..","..time..")"
	for i = 1, 6 do
		local szItemName = GetItemName(nTType[nType][1], nTType[nType][2], nBody*18+i)
		tYigui[i + 1] = szItemName.."/#GetItem("..nType..","..(nBody*18+i)..","..time..")"
		nCount = nCount + 1
	end
	local nTT = getn(tYigui)
	tYigui[nTT + 1] = "Trang kÕ/#yigui_page("..nType..","..nCount..","..time..")"
	tYigui[nTT + 2] = "T¹m thêi ch­a cÇn!/yigui_no"
	
	Say("Mêi <color=yellow>"..Zgc_pub_sex_name().."<color> tù do lùa chän.", getn(tYigui), tYigui)
end

function yigui_page(nType, nIndex, time)
	local tYigui = {}
	local nBody = GetBody() - 1
	local nCount = nIndex
	local nEnd = nIndex + 6
	if nEnd > 18 then
		nEnd = 18
	end
	if (nIndex - 6) == 0 then
		tYigui[1] = "Trang tr­íc/#yigui_item("..nType..","..time..")"
	else
		tYigui[1] = "Trang tr­íc/#yigui_page("..nType..","..(nIndex - 6)..","..time..")"
	end
	
	for i = nIndex + 1, nEnd do
		local szItemName = GetItemName(nTType[nType][1], nTType[nType][2], 18*nBody+i)
		tYigui[i - nIndex + 1] = szItemName.."/#GetItem("..nType..","..(nBody*18+i)..","..time..")"
		nCount = nCount + 1
	end
	local nTT = getn(tYigui)
	if nEnd == 18 then
		tYigui[nTT + 1] = "Trang kÕ/#add_other("..nType..","..nIndex..","..time..")"
		tYigui[nTT + 2] = "T¹m thêi ch­a cÇn!/yigui_no"
	else
		tYigui[nTT + 1] = "Trang kÕ/#yigui_page("..nType..","..nCount..","..time..")"
		tYigui[nTT + 2] = "T¹m thêi ch­a cÇn!/yigui_no"
	end
	
	Say("Mêi <color=yellow>"..Zgc_pub_sex_name().."<color> tù do lùa chän.", getn(tYigui), tYigui);
end

function GetItemAll(nType, time)
	local nBody = GetBody() - 1
	local nTime = tonumber(time)
	if Zgc_pub_goods_add_chk(21, 21 * YIGUI_WEIGHT_PER_ITEM) == 0 then
		return
	end
	
	for i = 1, 18 do
		local nOk, nItemIndex = AddItem(nTType[nType][1], nTType[nType][2], 18*nBody+i, -1, 1)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
			SetItemExpireTime(nItemIndex, nTime)
		end
	end
	for i=1,3 do	
		local nOk, nItemIndex = AddItem(nTType[nType][1], nTType[nType][2], 518+nBody+(i-1)*4, -1, 1)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
			SetItemExpireTime(nItemIndex, nTime)
		end
	end
end

function GetItem(nType, nParticular, time)
	if Zgc_pub_goods_add_chk(1, YIGUI_WEIGHT_PER_ITEM) == 0 then
		return
	end
	local nTime = tonumber(time)
	local nOk, nItemIndex = AddItem(nTType[nType][1], nTType[nType][2], nParticular, -1, 1)
	if nOk == 1 then
		SetItemStatus(nItemIndex, 0, 1)
		SetItemExpireTime(nItemIndex, nTime)
	end
end

function yigui_no()

end

function add_other(nType,nIndex,time)
	local tYigui = {}
	local nBody = GetBody() - 1
	
	tYigui[1] = "Trang tr­íc/#yigui_page("..nType..","..nIndex..","..time..")"
	
	for i = 1,3 do
		local szItemName = GetItemName(nTType[nType][1], nTType[nType][2], 518+nBody+(i-1)*4)
		tYigui[i+1] = szItemName.."/#GetItem("..nType..","..(518+nBody+(i-1)*4)..","..time..")"
	end		

	local nTT = getn(tYigui)
	tYigui[nTT + 1] = "T¹m thêi ch­a cÇn!/yigui_no"
	
	Say("Mêi <color=yellow>"..Zgc_pub_sex_name().."<color> tù do lùa chän.", getn(tYigui), tYigui)	
	

end

function vansu_equips(time, nIdx)
	if GetTranslifeCount() < 2 then
		Talk(1, "", "Ch­a ®¹t ®­îc Hçn Nguyªn C«ng thµnh thø 4 nªn kh«ng thÓ nhËn ngo¹i trang nµy!")
		return
	end
	if GetLevel() < 97 then
		Talk(1, "", "§¼ng cÊp 97 trë lªn míi cã thÓ nhËn ngo¹i trang nµy!")
		return
	end
	local nBody = GetBody()
	local nTime = tonumber(time)
	local nRootIndex = tonumber(nIdx)
	if Zgc_pub_goods_add_chk(3, 3 * YIGUI_WEIGHT_PER_ITEM) == 0 then
		return
	end
	
	if DelItemByIndex(nRootIndex, -1) == 1 then
		for i = 1, 3 do
			local nOk, nItemIndex = AddItem(0, 107 + i,569 + nBody, 1, 1)
			if nOk == 1 then
				SetItemStatus(nItemIndex, 0, 1)
				SetItemExpireTime(nItemIndex, nTime)
			end
		end
	end
end