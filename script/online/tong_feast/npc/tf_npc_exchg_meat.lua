Include("\\script\\online\\tong_feast\\tf_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

T_EXCHG_ITEM = {
		TF_ITEM_SHEEP,
		TF_ITEM_PIG,
		TF_ITEM_COW,
		TF_ITEM_BACON,
}
		
function npc_talk_exchg_meat()
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate < 20140315 or nDate > 20140430 then
--		Talk(1, "", format("Ph­ëng thøc ®æi ®· qu¸ h¹n"));
--		return
--	end
	local tSay = {
		"§­îc/_confirm_exchg",
		"Hñy bá/nothing",
	}
	Say("Cã thÓ sö dông 1 thÞt lîn, 1 thÞt bß, 1 thÞt hun khãi ®æi 3 thÞt dª, muèn ®æi kh«ng?", getn(tSay), tSay);
end


function _confirm_exchg()
	local nCount = _get_max_exchg_cnt()
	AskClientForNumber("_confirm_exchg_num", 1, nCount, "H·y nhËp sè l­îng d©ng tÆng:", "");
end

function _confirm_exchg_num(nNum)
	local nCount = _get_max_exchg_cnt()
	if nCount < nNum then
		return
	end
	if gf_Judge_Room_Weight(getn(T_EXCHG_ITEM)-1, 0, " ") ~= 1 then
		return 0;
	end
	for i= 2, getn(T_EXCHG_ITEM) do
		if DelItem(T_EXCHG_ITEM[i][1], T_EXCHG_ITEM[i][2], T_EXCHG_ITEM[i][3], nNum) ~= 1 then
			Talk(1, "", format("Kh«ng ®ñ %s",T_EXCHG_ITEM[i][4]));
			return 0;
		end
	end
	local nGain = nNum*(getn(T_EXCHG_ITEM)-1)
	AddItem(T_EXCHG_ITEM[1][1], T_EXCHG_ITEM[1][2], T_EXCHG_ITEM[1][3], nGain)
	Msg2Player(format("§æi thµnh c«ng %d%s",nGain, T_EXCHG_ITEM[1][4]))
	WriteLog(GetName().." exchange tong_frest yangrou: "..nGain);
end

function _get_max_exchg_cnt()
	local nCount = 999
	for i= 2, getn(T_EXCHG_ITEM) do
		local _nCnt = GetItemCount(T_EXCHG_ITEM[i][1], T_EXCHG_ITEM[i][2], T_EXCHG_ITEM[i][3])
		if _nCnt < nCount then
			nCount = _nCnt
		end
	end
	return nCount
end

function nothing()
end