--ÌÒ»¨Ê÷½Å±¾
Include("\\script\\online\\spring2014\\sp_head.lua")

function main()
	sp_DailyReset();
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85, 1) ~= 1 then
			return 0;
	end
	local nTimes = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsDrop);
	if nTimes >= 3 then
		Talk(1,"",format("N¨m míi vui vÎ! §¹i hiÖp h«m nay ®· nhËn hÕt %d phÇn th­ëng, h·y ®Õn ng¾m hoa ®µo vµ nhËn th­ëng vµo ngµy mai nhĞ !", 3));
		return 0;
	end
	--µã»÷¼ä¸ô60s
	if GetTime() - SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsChickTime) < 60 then
		--Talk(1,"",format("ĞèµÈ´ı%dÃë²Å¿É¼ÌĞøµã»÷³é½±£¬×£´ó¼ÒºÃÔËÁ¬Á¬£¡", 60));
		return 0;
	end
	if random(1000) <= 500 then
		return 0;
	end
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsDrop, nTimes + 1);
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsChickTime, GetTime());
	local tAward = {
		{31, 40, "spths_Exp()", 1},
		{31, 40, "spths_ZhenQi()", 1},
		{31, 20, "spths_YinJuan()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1);
end

function spths_Exp()
	local tAward = {
		{2, 25, 100, 1},
		{2, 25, 1000, 1},
		{2, 25, 10000, 1},
		{2, 20, 100000, 1},
		{2, 5, 20132014, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end

function spths_ZhenQi()
	local tAward = {
		{31, 60, "AwardGenuineQi(10)", 1},
		{31, 30, "AwardGenuineQi(50)", 1},
		{31, 5, "AwardGenuineQi(100)", 1},
		{31, 4, "AwardGenuineQi(500)", 1},
		{31, 1, "AwardGenuineQi(1000)", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end

function spths_YinJuan()
	local tAward = {
		{31, 50, "ModifyYinJuan(10, 1)", 1},
		{31, 40, "ModifyYinJuan(100, 1)", 1},
		{31, 10, "ModifyYinJuan(1000, 1)", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end