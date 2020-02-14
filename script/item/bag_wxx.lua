--五行鞋礼包
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then
		return 0;
	end
	local nCount = api_daily_limit_get_yinquan_left_capacity()
	if nCount < 2500 then
		Msg2Player(format("剩下的钱不够支付了%d", 2500));
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	--exp
	gf_Modify("Exp", 50000000);
	--银卷
	--ModifyYinJuan(1000, 1);
	api_daily_limit_award_yinquan(2500, 0, 1)
	--五行鞋
	local  tFoot = {
		{1, 17, "Chi課 H礽 Kim Ch? ng? h祅h", {0, 154, 4, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi課 H礽 M閏 Ch? ng? h祅h", {0, 154, 5, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi課 H礽 Th駓 Ch? ng? h祅h", {0, 154, 6, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi課 H礽 H醓 Ch? ng? h祅h", {0, 154, 7, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "Chi課 H礽 Th? Ch? ng? h祅h", {0, 154, 8, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 15, "Chi課 H礽  Ch? ng? h祅h", {0, 154, 9, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tFoot, gf_SumRandBase(tFoot), 1, "五行鞋", "五行鞋");
end
