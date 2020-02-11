Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nItem)
--	print("OnUse",nItem)
	if tGtTask:check_cur_task(145) ~= 1 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 304 then
		Talk(1,"","VËt phÈm nµy chØ ®­îc sö dông t¹i Nam Thµnh §«");
		return 0;
	end
	SetItemUseLapse(nItem, 10*60*18);
	local npcIndex = CreateNpc("qiannianyuguai", "Ng­ Qu¸i", GetWorldPos());
	SetNpcLifeTime(npcIndex, 10*60);
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yuguai_death.lua");
	Msg2Player("Ng­ Qu¸i xuÊt hiÖn råi , h·y nhanh chãng tiªu diÖt nã ®i !");
end