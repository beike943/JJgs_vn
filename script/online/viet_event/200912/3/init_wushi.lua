--=============================================
--create by baiyun 2009.11.13
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯±ùÀäÎ×Ê¦³õÊ¼»¯½Å±¾
--============================================
Include("\\script\\lib\\globalfunctions.lua");
t_wushi_sets = {
	{"T©y TuyÒn Ch©u", {105, 1532, 3021}},
	{"B¾c TuyÒn Ch©u", {108, 1512, 3072}},
};
function main()
	local nDate = tonumber(date("%y%m%d"));	
      if nDate > 100117 or nDate < 091218 then
	    return 0;
	end
	if SubWorldID2Idx(105) <= 0 then
		return 0;
	end
	local nRandSet = random(1, 2);
	local nNpcIndex = CreateNpc("Phï thñy b¨ng gi¸", "Phï thñy b¨ng gi¸", gf_UnPack(t_wushi_sets[nRandSet][2]));
	SetNpcLifeTime(nNpcIndex, 120 * 60);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--AddUnitStates(nNpcIndex, 6, GetTime());--¼ÇÂ¼NPC´´½¨µÄÊ±¼ä
	AddGlobalNews(format("Phï Thñy B¨ng Gi¸ ®· xuÊt hiÖn t¹i  %s. Vâ l©m l¹i s¾p cã mét ®ît b¨ng gi¸. C¸c h¹ h·y mau mau ®i thu phôc ¶ ®Ó tr¸nh mét ®ît b·o tuyÕt cã thÓ sÏ x¶y ra!", t_wushi_sets[nRandSet][1]));
end

