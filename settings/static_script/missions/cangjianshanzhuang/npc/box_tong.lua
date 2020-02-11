Include("\\script\\lib\\globalfunctions.lua")
--Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_TongBoxScript = {
	"\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_tong1.lua",
	"\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_tong2.lua",
	"\\settings\\static_script\\missions\\cangjianshanzhuang\\npc\\box_tong3.lua",
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

function create_box_tong(m,x,y, nBoxId)
	if not T_TongBoxScript[nBoxId] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "R≠¨ng ßÂng", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_TongBoxScript[nBoxId]);
	else
		print("create ls tongbaoxiang fail")
	end
end
        
tClause1 = {
    {{"Ti”u truy“n c´ng Æ¨n"    ,{2,1,30312,1,4}},30000},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},10000},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},45000},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},15000},
}
tClause2 = {
    {{"T¯ Linh Quy Nguy™n ß¨n"    ,{2,1,30352,1,4}},5000},
    {{"BÂi Nguy™n ß¨n"    ,{2,1,30351,1,4}},10000},
    {{"Truy“n C´ng ß¨n"    ,{2,1,30313,1,4}},10000},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},5000},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},20000},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10000},
    {{"Thi’t Tinh c p 3"    ,{2,1,30535,1,4}},10000},
    {{"Giµy V∂i Th´"    ,{0,154,1,1,4}},15000},
    {{"Tinh Tr› BË Hµi"    ,{0,154,2,1,4}},15000},
}
tClause3 = {
    {{"T¯ Linh Quy Nguy™n ß¨n"    ,{2,1,30352,1,4}},5000},
    {{"BÂi Nguy™n ß¨n"    ,{2,1,30351,1,4}},5000},
    {{"Truy“n C´ng ß¨n"    ,{2,1,30313,1,4}},5000},
    {{"M∂nh Tu Ch©n Y’u Quy’t"    ,{2,1,30315,1,4}},5000},
    {{"Thi’t Tinh c p 1"    ,{2,1,30533,1,4}},15000},
    {{"Thi’t Tinh c p 2"    ,{2,1,30534,1,4}},10000},
    {{"Thi’t Tinh c p 3"    ,{2,1,30535,1,4}},10000},
    {{"Giµy V∂i Th´"    ,{0,154,1,1,4}},15000},
    {{"Tinh Tr› BË Hµi"    ,{0,154,2,1,4}},15000},
    {{"BË Ch’ Cao ßÂng Ngoa"    ,{0,154,3,1,4}},15000},
} 


tClause = {
	tClause1,
	tClause2,
	tClause3,
	nil,
}

function on_open(nStage)
	local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tWjzTongBox")
end

