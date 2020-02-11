--¾ü¹¦ÕÂ¶Ò»»½Å±¾
T_NEED_ITEM = {
	{"Qu©n C«ng Ch­¬ng",2,1,9999,1},
	{"Qu©n C«ng §¹i",2,1,9998,1},
	{"Qu©n C«ng Huy Hoµng",2,1,9977,1},
	{" Kim ",-1, -1, -1, 100},
}

T_GAIN_ITEM = {
	{"qu©n c«ng ch­¬ng vinh dù ",2,1,30642,1,7},
}

SZ_NEED=""
SZ_GAIN=""

function OnJunGongZhangExchg(nItem)
	_updateItemMsg()
	local tbSay = {}
	local szTitle = format("Tiªu hao <color=yellow>%s<color> cã thÓ ®æi <color=yellow>%s<color>, ®ång ý ®æi kh«ng?", SZ_NEED, SZ_GAIN)
	tinsert(tbSay, "X¸c ®Þnh ®æi/_ConfirmExchg")
	tinsert(tbSay, "Ta chØ ghÐ ch¬i/nothing")
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _ConfirmExchg()
	_ConfirmExchg_Real(1,1)
end

function _ConfirmExchg_Real(bDelete, bNotify)
	for i = 1, getn(T_NEED_ITEM) do
    	local ti = T_NEED_ITEM[i]
    	if ti[2] ~= -1 then
        	if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        		if 1 == bNotify then
        			Talk(1,"",format("%sx%d kh«ng ®ñ, kh«ng thÓ ®æi!", ti[1], ti[5]))
        		end
        		return 0
        	end
    	else
    		if GetCash() < ti[5]*10000 then
    			if 1 == bNotify then
        			Talk(1,"",format("kh«ng cã %d%s, kh«ng thÓ ®æi!",  ti[5], ti[1]))
        		end
        		return 0
    		end
    	end

	end
	
	if 1 == bDelete then --ËùÓÐ¶¼¼ì²éÍ¨¹ýÁË£¬Ö´ÐÐÉ¾³ý
		for i = 1, getn(T_NEED_ITEM) do
            local ti = T_NEED_ITEM[i]
        	if ti[2] ~= -1 then
        		local nDelResult = DelItem(ti[2], ti[3], ti[4], ti[5])
        		if not nDelResult or nDelResult ~= 1  then
        			return 0
        		end
        	else
        		if 1 ~= Pay(ti[5]*10000) then
        			return 0
        		end
        	end
    	end
    	
    	--add item
    	for i = 1, getn(T_GAIN_ITEM) do
            local ti = T_GAIN_ITEM[i]
    		local nResult,nIndex = AddItem(ti[2], ti[3], ti[4], ti[5])
    		
    		local nLastDay = ti[6] or 0
    		if nLastDay > 0 then
    			SetItemExpireTime(nIndex, nLastDay*24*3600)
    		end
    	end
	end
end

function _updateItemMsg()
	SZ_NEED = _getItemInfo(SZ_NEED, T_NEED_ITEM)
	SZ_GAIN = _getItemInfo(SZ_GAIN, T_GAIN_ITEM)
end

function _getItemInfo(szInfo, tItem)
	if szInfo == "" then
		szInfo = format("%d%s%s", tItem[1][5], tItem[1][1], _get_expire_days(tItem[1]))
		for i = 2, getn(tItem) do
			szInfo = format("%s %d%s%s", szInfo, tItem[i][5], tItem[i][1], _get_expire_days( tItem[i]))
		end
	end
	return szInfo
end

function _get_expire_days(tItme)
	local szMsg = ""
	if tItme and tItme[6] then
		szMsg = format("(HiÖu lùc %d ngµy)", tItme[6])
	end
	return szMsg
end

function nothing()
end
