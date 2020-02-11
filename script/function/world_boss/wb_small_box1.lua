--´óÕ½±¦ºÐ
Include("\\script\\function\\world_boss\\wb_head.lua")

function main()
	local npcIndex = GetTargetNpc()
	if wb_GetSmallBoxFlag1() > 0 then
		Talk(1,"",format("§· nhËn phÇn th­ëng %s råi, kh«ng thÓ nhËn l¹i", GetNpcName(npcIndex)));
		return
	end
	local boss = wb_GetBossName()
	if not boss then
		Talk(1,"","ChØ cã ng­êi ch¬i tham gia tiªu diÖt BOSS míi cã thÓ më b¶o r­¬ng");
		return
	end
	if wb_SmallBoxAward() == 1 then
		wb_SetSmallBoxFlag1()
		SetNpcLifeTime(npcIndex, 0);
	end
end