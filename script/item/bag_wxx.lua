--ÎåÐÐÐ¬Àñ°ü
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then
		return 0;
	end
	local nCount = api_daily_limit_get_yinquan_left_capacity()
	if nCount < 2500 then
		Msg2Player(format("Giíi h¹n cßn l¹i ®Ó nhËn ng©n phiÕu h«m nay kh«ng ®ñ %d", 2500));
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	--exp
	gf_Modify("Exp", 50000000);
	--Òø¾í
	--ModifyYinJuan(1000, 1);
	api_daily_limit_award_yinquan(2500, 0, 1)
	--ÎåÐÐÐ¬
	local  tFoot = {
		{1, 17, "ChiÕn Hµi Kim ChÕ ngò hµnh", {0, 154, 4, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "ChiÕn Hµi Méc ChÕ ngò hµnh", {0, 154, 5, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "ChiÕn Hµi Thñy ChÕ ngò hµnh", {0, 154, 6, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "ChiÕn Hµi Háa ChÕ ngò hµnh", {0, 154, 7, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 17, "ChiÕn Hµi Thæ ChÕ ngò hµnh", {0, 154, 8, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 15, "ChiÕn Hµi ¢m ChÕ ngò hµnh", {0, 154, 9, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tFoot, gf_SumRandBase(tFoot), 1, "LÔ Bao Ngò Hµnh Hµi", "LÔ Bao Ngò Hµnh Hµi");
end
