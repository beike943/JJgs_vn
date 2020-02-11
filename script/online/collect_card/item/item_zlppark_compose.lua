--ÐÂ×ÊÁÏÆ¬Àñ°üºÏ³É
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")


function OnUse(nItem)
	local tSay = {
		format("Tiªu hao %d tiÒn vµng ®æi lÊy LÔ Bao N©ng CÊp Phiªn B¶n Míi/#sure_exchange()", CC_ZLP_PARK_COST, 1),
		"Ta suy nghÜ l¹i/do_nothing",	
	}
	Say("§¹i hiÖp muèn ®æi LÔ Bao N©ng CÊp chø?", getn(tSay), tSay);
end

function sure_exchange()
	local nFreeRoom = GetFreeItemRoom();
	local nCount = min(GetItemCount(2, 1, 30540), floor(GetCash()/(CC_ZLP_PARK_COST * 10000)));
	AskClientForNumber("sure_exchange_deal",0,min(nFreeRoom, nCount),"NhËp sè l­îng","")
end

function sure_exchange_deal(nNum)
	for i = 1, nNum do
		if GetFreeItemRoom() < 2 then
			Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
			return 0;
		end
		if GetItemCount(2, 1, 30540) < 1 then 
			Talk(1,"","ThiÕu LÔ Bao N©ng CÊp Phiªn B¶n Míi, kh«ng thÓ n©ng cÊp.");
			return 0;
		end
		if GetCash() < CC_ZLP_PARK_COST * 10000 then
			Talk(1,"","TiÒn vµng trong hµnh trang kh«ng ®ñ");
			return 0;
		end
		if DelItem(2, 1, 30540, 1) ~= 1 then
			return 0;
		end
		if Pay(CC_ZLP_PARK_COST * 10000) ~= 1 then
			return 0;
		end
		gf_AddItemEx2({2, 1, 30541, 1}, "LÔ bao N©ng CÊp Phiªn B¶n Míi", CC_LOG_TITLE, "§æi LÔ Bao N©ng CÊp Phiªn B¶n Míi", 0, 1);
	end
end 


function do_nothing()
end