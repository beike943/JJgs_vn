--Ììî¸ÁîÀñ°üºÏ³É
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tSay = {
		format("Sö dông %d Thiªn C­¬ng LÖnh vµ %d Thiªn C­¬ng LÖnh LÔ Bao ®æi lÊy 1 LÔ Bao N©ng CÊp Thiªn C­¬ng LÖnh/#sure_exchange(%d)", CC_TGL_COST_NUM, 1, nItem),
		"Ta suy nghÜ l¹i/do_nothing",	
	}
	Say("§¹i hiÖp muèn ®æi LÔ Bao Th¨ng CÊp chø?", getn(tSay), tSay);
end

function sure_exchange(nItem)
	local nFreeRoom = GetFreeItemRoom();
	local nCount = min(GetItemCount(2, 1, 30508), floor(GetItemCount(2, 95, 204)/CC_TGL_COST_NUM));
	AskClientForNumber("sure_exchange_deal",0,min(nFreeRoom, nCount),"NhËp sè l­îng","")
end

function sure_exchange_deal(nNum)
	for i = 1, nNum do
		if GetFreeItemRoom() < 2 then
			Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
			return 0;
		end
		if GetItemCount(2, 95, 204) < CC_TGL_COST_NUM then 
			Talk(1,"",format("CÇn cã <color=red> %d <color> Thiªn C­¬ng LÖnh míi cã thÓ ®æi 1 LÔ Bao N©ng CÊp Thiªn C­¬ng LÖnh", CC_TGL_COST_NUM));
			return 0;
		end
		if DelItem(2, 1, 30508, 1) ~= 1 then
			return 0;
		end
		if DelItem(2, 95, 204, CC_TGL_COST_NUM) ~= 1 then
			return 0;
		end
		gf_AddItemEx2({2, 1, 30510, 1}, "LÔ bao Thiªn Cang LÖnh N©ng CÊp", CC_LOG_TITLE, "§æi LÔ Bao N©ng CÊp Thiªn C­¬ng LÖnh", 0, 1);
	end
end

function do_nothing()
end