--Õ≠±¶œ‰1
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\taiyi\\tyfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function main()
	local tAward = {
		{30, {"Ti”u truy“n c´ng Æ¨n", {2, 1, 30312, 1, 4}}},
    {10, {"M∂nh Tu Ch©n Y’u Quy’t", {2, 1, 30315, 1, 4}}},
    {45, {"Thi’t Tinh c p 1", {2, 1, 30533, 1, 4}}},
    {15, {"Thi’t Tinh c p 2", {2, 1, 30534, 1, 4}}},
	}
	local tItem = gf_RandRate(tAward)[2];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");	
	gf_TeamOperateEX(vaf_award_api, "tTYTTongBox")
end