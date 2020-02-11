--=============================================
--create by baiyun 2009.8.27
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯×ß¾üµÆÁý³õÊ¼»¯½Å±¾
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--Ë¢ÐÂ×ß¾üµÆÁýµÄ×ø±ê
t_denglong_sets = {
	[0] = {"ThiÕu L©m", {204, 1526, 3269}},--ÐÇÆÚÈÕ
	[1] = {"Nga My", {303, 1552, 3232}},--ÐÇÆÚÒ»
	[2] = {"§­êng M«n", {305, 1530, 2921}},--ÐÇÆÚ¶þ
	[3] = {"C¸i Bang", {209, 1515, 3265}},--ÐÇÆÚÈý
	[4] = {"Vâ §ang", {312, 1707, 3477}},--ÐÇÆÚËÄ
	[5] = {"Ngò §éc", {407, 1555, 3286}},--ÐÇÆÚÎå
	[6] = {"D­¬ng M«n", {219, 1655, 3301}},--ÐÇÆÚÁù
};
function main()
	if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
		return
	end
--	local nDate = tonumber(date("%y%m%d"));
--	if nDate > 091206 or nDate < 091106 then
--		return 0;
--	end
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
--	if nDay == 6 or nDay == 0 then
		create_npcs(nDay);
--	else
--		if nHour ~= 0 and nHour ~= 1 then
--			create_npcs(nDay);
--		end
--	end
end

function create_npcs(nDay)
	local nNpcIndex = 0;
	local nNpcLifeTime = 57 * 60;--ÒòÎªsystemtimetask.txtÀïÃæÓÐÐ©ÕûµãµÄÊ±¼äÒÑ¾­±»Õ¼ÓÃ£¬ËùÒÔ±»ÆÈÎ¢µ÷¼¸·ÖÖÓÊ±¼ä
	nNpcIndex = CreateNpc("Lß n­íng b¸nh", "Lß N­íng", gf_UnPack(t_denglong_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\npc_zoujundenglong.lua");
	AddUnitStates(nNpcIndex, 6, GetTime());--¼ÇÂ¼NPC´´½¨µÄÊ±¼ä
	AddGlobalNews("YÕn tiÖc ThÞt N­íng ®­îc chiªu ®·i t¹i ["..t_denglong_sets[nDay][1].."]. Mêi ®ång ®¹o ®Õn tham dù!");
end