Include("\\script\\lib\\globalfunctions.lua")

VET_201211_CHRISTMAS_ID = 79;

VET_CHRISTMAS_TREE_DIALOG = {
	"Mua c©y th«ng Noel (cÇn 68 vµng)/buy_christmas_tree_coin",
	"Mua c©y th«ng Noel (cÇn 19 Xu vËt phÈm)/buy_christmas_tree_xu",
};

function VET_201211_AdditionDialog(tbSayDialog,szSayHead)
	if gf_CheckEventDateEx(VET_201211_CHRISTMAS_ID) == 1 then
		for i = 1, getn(VET_CHRISTMAS_TREE_DIALOG) do
			tinsert(tbSayDialog, VET_CHRISTMAS_TREE_DIALOG[i]);
		end
	end
	return tbSayDialog,szSayHead;
end

function buy_christmas_tree_coin()
	local nNum = floor(GetCash() / 680000);
	AskClientForNumber("buy_christmas_tree_coin_deal",1,nNum,"H·y nhËp sè l­îng cÇn mua","")
end

function buy_christmas_tree_coin_deal(nNum)
	if GetCash() < nNum * 680000 then
		Talk(1,"",format("Vµng trong hµnh trang kh«ng ®ñ <color=red>%d<color>", nNum * 68));
		return 
	end
	if GetFreeItemRoom() < nNum then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end
	if Pay(nNum * 680000) == 1 then
		for i = 1, nNum do
			local nRet, nIndex = AddItem(2, 1, 30471, 1);
			SetItemExpireTime(nIndex, 24 * 3600);
		end
	end
end

function buy_christmas_tree_xu()
	local nNum = floor(GetItemCount(2,1,30230)/19);
	AskClientForNumber("buy_christmas_tree_xu_deal",1,nNum,"H·y nhËp sè l­îng cÇn mua","")
end

function buy_christmas_tree_xu_deal(nNum)
	if GetItemCount(2,1,30230) < nNum * 19 then
		Talk(1,"",format("Xu trong hµnh trang kh«ng ®ñ <color=red>%d<color>", nNum * 19));
		return 
	end
	if GetFreeItemRoom() < nNum then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end
	if DelItem(2,1,30230,nNum * 19) == 1 then
		for i = 1, nNum do
			local nRet, nIndex = AddItem(2, 1, 30471, 1);
			SetItemExpireTime(nIndex, 24 * 3600);
		end
	end
end

