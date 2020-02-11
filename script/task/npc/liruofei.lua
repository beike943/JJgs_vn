Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\tmp_task_id_def.lua")


nMapId, nX, nY = GetWorldPos();
if nMapId ~= 6025 then
	Msg2Player("NhiÖm vô khëi ®éng thÊt b¹i, h·y hñy nhiÖm vô vµ b¾t ®Çu l¹i");
	return 0;
end
if tGtTask:check_cur_task(109) == 0  then
	Msg2Player("NhËn nhiÖm vô thÊt b¹i, h·y hñy nhiÖm vô vµ thö l¹i l¹i.");
	return 0;
end

--npcIndex = CreateNpc("zhandouyuebuqun", "ÔÀ²»Èº", GetWorldPos());
--print(npcIndex)
--SetCampToNpc(npcIndex,"camp_enemy");
--SetNpcLifeTime(npcIndex, 4 * 60);
--SetCampToPlayer("camp_enemy");


npcIndex = CreateNpc("liruofei", "Lý Nh­îc Phi", nMapId, nX + 2, nY + 2);
SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\liruofei_death.lua");
--SetCampToNpc(npcIndex, "camp_evil");
Msg2Player("Lý Nh­îc Phi ®· xuÊt hiÖn!")

