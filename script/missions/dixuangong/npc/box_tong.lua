Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_tong1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong2.lua",
	nil,
	"\\script\\missions\\dixuangong\\npc\\box_tong4.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong5.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong6.lua",
	nil,
}

T_TONG_BOX_IDX = {}
function remove_tong_box()
	for i,v in T_TONG_BOX_IDX do
		if GetNpcName(i) == "R≠¨ng ßÂng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_TONG_BOX_IDX = {}
end

function create_box_tong(nNpcIdx, nBoxId)
	if not T_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	--ÃÏ“ı√‹œ‰1∏ˆ
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "R≠¨ng ßÂng", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc]  = 1
--		SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_BoxScript[nBoxId]);
	else
		print("create tongbaoxiang fail")
	end
end
        
tClause1 = {
    {{"Ti”u truy“n c´ng Æ¨n"    ,{2,1,30312,1,4}},10*30},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},10*10},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},10*45},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10*15},
}
tClause2 = {
    {{"Ti”u truy“n c´ng Æ¨n"    ,{2,1,30312,1,4}},10*10},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},10*10},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},10*40},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10*30},
    {{"∏o Choµng Tπo BË"    ,{0,152,1,1,4}},10*10},
}
--tClause3 = {
--    {{"Àƒ¡ÈπÈ‘™µ§"    ,{2,1,30352,1,4}},10*5},
--    {{"≈‡‘™µ§"    ,{2,1,30351,1,4}},10*10},
--    {{"¥´π¶µ§"    ,{2,1,30313,1,4}},10*10},
--    {{"–ﬁ’Ê“™æ˜≤–“≥"    ,{2,1,30315,1,4}},10*5},
--    {{"1º∂Ã˙æß"    ,{2,1,30533,1,4}},10*20},
--    {{"2º∂Ã˙æß"    ,{2,1,30534,1,4}},10*10},
--    {{"3º∂Ã˙æß"    ,{2,1,30535,1,4}},10*10},
--    {{"‘Ì≤ºπ““¬"    ,{0,152,1,1,4}},10*20},
--    {{"Ωı∂–π““¬"    ,{0,152,2,1,4}},10*10},
--} 
--tClause4 = {
--    {{"Àƒ¡ÈπÈ‘™µ§"    ,{2,1,30352,1,4}},10*5},
--    {{"≈‡‘™µ§"    ,{2,1,30351,1,4}},10*10},
--    {{"¥´π¶µ§"    ,{2,1,30313,1,4}},10*10},
--    {{"–ﬁ’Ê“™æ˜≤–“≥"    ,{2,1,30315,1,4}},10*5},
--    {{"1º∂Ã˙æß"    ,{2,1,30533,1,4}},10*20},
--    {{"2º∂Ã˙æß"    ,{2,1,30534,1,4}},10*10},
--    {{"3º∂Ã˙æß"    ,{2,1,30535,1,4}},10*10},
--    {{"‘Ì≤ºπ““¬"    ,{0,152,1,1,4}},10*15},
--    {{"Ωı∂–π““¬"    ,{0,152,2,1,4}},10*15},
--} 
tClause4 = {
    {{"T¯ Linh Quy Nguy™n ß¨n"    ,{2,1,30352,1,4}},10*5},
   {{"BÂi Nguy™n ß¨n"    ,{2,1,30351,1,4}},10*5},
    {{"Truy“n C´ng ß¨n"    ,{2,1,30313,1,4}},10*5},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},10*5},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},10*10},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10*10},
    {{"Thi’t Tinh c p 3"    ,{2,1,30535,1,4}},10*10},
    {{"∏o Choµng Tπo BË"    ,{0,152,1,1,4}},10*15},
    {{"∏o Choµng C»m ßoπn"    ,{0,152,2,1,4}},10*20},
    {{"∏o Choµng H·a V©n"    ,{0,152,3,1,4}},10*15},
} 
tClause5 = {
    {{"V‚ l©m b∏o mÌi"    ,{2,1,30314,1,4}},10*5},
    {{"Th∏nh VÀt S≠ M´n"    ,{2,1,30311,1,4}},10*5},
    {{"Truy“n C´ng ß¨n"    ,{2,1,30313,1,4}},10*5},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},10*5},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},10*10},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10*10},
    {{"Thi’t Tinh c p 3"    ,{2,1,30535,1,4}},10*10},
    {{"∏o Choµng Tπo BË"    ,{0,152,1,1,4}},10*15},
    {{"∏o Choµng C»m ßoπn"    ,{0,152,2,1,4}},10*20},
    {{"∏o Choµng H·a V©n"    ,{0,152,3,1,4}},10*15},
}
tClause6 = {
    {{"V‚ l©m b∏o mÌi"    ,{2,1,30314,1,4}},10*5},
    {{"Th∏nh VÀt S≠ M´n"    ,{2,1,30311,1,4}},10*5},
    {{"Truy“n C´ng ß¨n"    ,{2,1,30313,1,4}},10*5},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},10*5},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},10*10},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10*10},
    {{"Thi’t Tinh c p 3"    ,{2,1,30535,1,4}},10*10},
    {{"∏o Choµng Tπo BË"    ,{0,152,1,1,4}},10*15},
    {{"∏o Choµng C»m ßoπn"    ,{0,152,2,1,4}},10*20},
    {{"∏o Choµng H·a V©n"    ,{0,152,3,1,4}},10*15},
}                              

tClause = {
	tClause1,
	tClause2,
	nil,--tClause3,
	tClause4,
	tClause5,
	tClause6,
	nil,--tClause7,
}

function on_open(nStage)
	local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGTongBox")
end

