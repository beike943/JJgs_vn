function OnUse(nItem)
	Say("[Viªn]:".."C¸c h¹ chän h×nh thøc nµo ®Ó viÕt l¹i?",3,"ViÕt l¹i tèn 40 vµng/cost_coin","Dïng bót l«ng viÕt l¹i/cost_item","Tho¸t/do_nothing");
end

function cost_coin()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30450);
	nNum = min(nNum, GetCash() / (40 * 10000));
	nNum = min(nNum, 1000);
	AskClientForNumber("cost_coin_deal", 0, nNum, "H·y nhËp sè l­îng vµo", "");
end

function cost_coin_deal(nNum)
	if DelItem(2, 1, 30450, nNum) ~= 1 then
		return 0;
	end
	if Pay(nNum * 40 * 10000) ~= 1 then
		return 0;
	end
	AddItem(2, 1, 30446, nNum);
end

function cost_item()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30450);
	nNum = min(nNum, GetItemCount(2, 1, 30451));
	nNum = min(nNum, 1000);
	AskClientForNumber("cost_item_deal", 0, nNum, "H·y nhËp sè l­îng vµo", "");
end

function cost_item_deal(nNum)
	if DelItem(2, 1, 30450, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30451, nNum) ~= 1 then
		return 0;
	end
	AddItem(2, 1, 30446, nNum);
end

function do_nothing()
end