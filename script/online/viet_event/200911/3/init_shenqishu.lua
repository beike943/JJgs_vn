--=============================================
--create by baiyun 2009.10.19
--describe:Ô½ÄÏ°æ11ÔÂÇï»î¶¯ÉñÆæÊ÷³õÊ¼»¯½Å±¾
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--Ë¢ÐÂ×ß¾üµÆÁýµÄ×ø±ê
t_shenqishu_sets = {
	[0] = {"ThiÕu L©m", {204, 1526, 3269}},--ÐÇÆÚÈÕ
	[1] = {"Nga My", {303, 1554, 3235}},--ÐÇÆÚÒ»
	[2] = {"§­êng M«n", {305, 1530, 2921}},--ÐÇÆÚ¶þ
	[3] = {"C¸i Bang", {209, 1515, 3265}},--ÐÇÆÚÈý
	[4] = {"Vâ §ang", {312, 1707, 3477}},--ÐÇÆÚËÄ
	[5] = {"Ngò §éc", {407, 1555, 3286}},--ÐÇÆÚÎå
	[6] = {"D­¬ng M«n", {219, 1655, 3301}},--ÐÇÆÚÁù
};
function main()
	do return end
end

function create_npcs(nDay)
	if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
		return
	end
	local nNpcIndex = 0;
	local nNpcLifeTime = 30 * 60;
	nNpcIndex = CreateNpc("c©y §a MËt Hoa Qu¶ lín", "C©y thÇn kú", gf_UnPack(t_shenqishu_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200911\\3\\npc_shenqishu.lua");
	AddGlobalNews("Cã ng­êi ph¸t hiÖn c©y thÇn kú xuÊt hiÖn t¹i ["..t_shenqishu_sets[nDay][1].."]");
	
	local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
	SetGlbValue(1014, nNpcIndex);
	SetGlbValue(1015, nMapId);
	SetGlbValue(1016, nMapX);
	SetGlbValue(1017, nMapY);
	
	SubWorld = SubWorldID2Idx(nMapId);
	OpenMission(48, nMapId);
end