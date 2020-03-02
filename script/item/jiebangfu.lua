--解绑符物品脚本
Include("\\script\\lib\\globalfunctions.lua")

t_award = 
{
	n_gold = 800,
	n_room_need = 2,
	n_weight_need = 50,
	t_item = {
		{2,1,30470,1,"解绑符"},
		{2,1,1009,10,"陨铁精石"},
		},
}

function OnUse(nItemIdx)
	return _OnUseReal(nItemIdx)
end

function _OnUseReal(nItemIdx)
	local tbSay = {}
	local szTitle = format("%s:这个道具已经不能使用,但可以兑换成其它道具<color=yellow>绑定<color>类似的功能:\n%s",
		GetItemName(nItemIdx), _get_award_desc(t_award))
	tinsert(tbSay, format("确定兑换/#_OnUseReal_Confirm(%d)", nItemIdx))
	tinsert(tbSay, "让我想想筰/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OnUseReal_Confirm(nItemIdx)
	if gf_Judge_Room_Weight(t_award.n_room_need,t_award.n_weight_need,"") ~= 1 then
		--Talk(1,"",format("背包空间不足%d或已达负重上限!", t_award.n_room_need))
		return 0
	end
	local nDelResult = DelItemByIndex(nItemIdx, -1)
	if 1 == nDelResult then
		if t_award.n_gold then
			Earn(t_award.n_gold*10000)
		end
		if t_award.t_item then
    		for i = 1, getn(t_award.t_item) do
    			local t = t_award.t_item[i]
        		AddItem(t[1],t[2],t[3],t[4],4)--绑定的
        	end
		end
	end
end

function _get_award_desc(_t_award)
	local szDesc = ""
	local t = _t_award
	if t then
		if t.n_gold then
			szDesc = format("%d金币", t.n_gold)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		szDesc = format("%s+%s(x%d)", szDesc, t.t_item[i][5], t.t_item[i][4])
        	end
		end
	else
		szDesc = ""
	end
	return szDesc
end

function no()
end
