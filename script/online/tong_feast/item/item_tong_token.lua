Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	show_equip_shop(3036);
end


--Include("\\script\\online\\tong_feast\\tf_head.lua")
--
--function OnUse(nItem)
--	local tSay = {
--		format("徽章箱（%d个）/#ExchageTongToken(%d,%d)",15,15,1),
--		format("挂衣箱（%d个）/#ExchageTongToken(%d,%d)",15,15,2),
--		format("鞋子箱（%d个）/#ExchageTongToken(%d,%d)",15,15,3),
--		format("高级徽章箱（%d个）/#ExchageTongToken(%d,%d)",30,30,4),
--		format("高级挂衣箱（%d个）/#ExchageTongToken(%d,%d)",30,30,5),
--		format("高级鞋子箱（%d个）/#ExchageTongToken(%d,%d)",30,30,6),
--		format("徽章箱，挂衣箱，鞋子箱各一个（%d个）/#ExchageTongToken(%d,%d)",35,35,7),
--		format("高级徽章箱，高级挂衣箱，高级鞋子箱各一个（%d个）/#ExchageTongToken(%d,%d)",70,70,8),
--		format("帮派特殊坐骑（%d个）/#ExchageTongToken(%d,%d)",100,100,9),		
--		"我只是看看而已/nothing",
--	}
--	Say("帮派令牌兑换如下：", getn(tSay), tSay);
--end
--
--function ExchageTongToken(nNum, nKind)
--	local tFreeRoom = {1,1,1,1,1,1,3,3,1};
--	if GetFreeItemRoom() < tFreeRoom[nKind] then
--		Talk(1,"","背包空间不足");
--		return 0;
--	end
--	if GetItemCount(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3]) < nNum then
--		Talk(1,"",format("背包内帮会令牌的数量不足%d无法完成对换", nNum));
--		return 0;
--	end
--	if DelItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum) ~= 1 then
--		return 0;
--	end
--	if nKind == 1 then
--		gf_AddItemEx2({2,1,30593,1,4}, "徽章箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 2 then
--		gf_AddItemEx2({2,1,30594,1,4}, "挂衣箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 3 then
--		gf_AddItemEx2({2,1,30595,1,4}, "鞋子箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 4 then
--		gf_AddItemEx2({2,1,30596,1,4}, "高级徽章箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 5 then
--		gf_AddItemEx2({2,1,30597,1,4}, "高级挂衣箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 6 then
--		gf_AddItemEx2({2,1,30598,1,4}, "高级鞋子箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 7 then
--		gf_AddItemEx2({2,1,30593,1,4}, "徽章箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--		gf_AddItemEx2({2,1,30594,1,4}, "挂衣箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--		gf_AddItemEx2({2,1,30595,1,4}, "鞋子箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 8 then
--		gf_AddItemEx2({2,1,30596,1,4}, "高级徽章箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--		gf_AddItemEx2({2,1,30597,1,4}, "高级挂衣箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--		gf_AddItemEx2({2,1,30598,1,4}, "高级鞋子箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	elseif nKind == 9 then
--		gf_AddItemEx2({0,105,10120,1,4,-1,-1,-1,-1,-1,-1}, "徽章箱", "帮会盛宴", "帮会令牌兑换", 0, 1);
--	end
--end
--
--function nothing()
--	
--end