Include("\\script\\lib\\globalfunctions.lua")

function roll_item(szCallBackScript, szCallBackFun, tbItem)
	if (type(szCallBackScript) ~= "string" or type(szCallBackFun) ~= "string" or
		type(tbItem) ~= "table" or getn(tbItem) < 3) then
	
		return
	end
	
	--roll(1,100) time 300s 
	local nDiceId = ApplyItemDice(1, 100, 300, szCallBackScript, szCallBackFun, GetTeamSize());
	if (nDiceId == nil) then
		return
	end
	
	AddDiceItemInfo(nDiceId, tbItem[1],tbItem[2],tbItem[3],tbItem[4] or 1,tbItem[5] or 1,tbItem[6] or -1,tbItem[7] or -1,tbItem[8] or -1,tbItem[9] or -1,tbItem[10] or -1,tbItem[11] or -1)
	
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		RollItem(nDiceId)
	end
	PlayerIndex = nPlayerOld
	
	return nDiceId;
end

function check_roll_state(dwID)
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("§ang gi¸m ®Þnh thuéc tÝnh vËt phÈm!")
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwID)
		if n == 0 then
			local szMsg = GetName().."NhÆt ®­îc "..szItem
			gf_Msg2Team(szMsg)
		elseif n == 1 then
			Msg2Player("Kho¶ng trèng trong hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn vËt phÈm" .. "(" .. szItem .. ")")
		end
	elseif nState == 2 then
		Msg2Player("Kh«ng cßn vËt phÈm trong r­¬ng")
	end
end

function show_roll_info(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."NÐm"..value[2].." ®iÓm" .. "(" .. szItem .. ")"
		if value[3] == 0 then
			str = value[1].."Phãng" .. "(" .. szItem .. ")"
		elseif value[3] == 1 then
			str = str.." (TuyÕt cÇu)"
			if value[4] == 1 then
				str = str.." -- Ê°È¡ÁË" .. "£¨" .. szItem .. "£©"
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- Ê°È¡ÁË" .. "£¨" .. szItem .. "£©"
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("TÊt c¶ ng­êi ch¬i ®· bá cuéc" .. "(" .. szItem .. ")")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh÷ng ng­êi ch¬i kh¸c ®· v­ît qu¸ thêi gian, xem nh­ bá cuéc" .. "(" .. szItem .. ")")
	end
end