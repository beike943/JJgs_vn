--08ÐÂÄêÐ¡Ê¥µ®Ê÷£¨Ê÷ÖÖ£©½Å±¾
--by vivi
--2007/11/12

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	if get_chrims_state() ~= 1 then
		Talk(1,"","Ho¹t ®éng gi¸ng sinh ®· kÕt thóc, c©y th«ng ®· kh«ng cßn ý nghÜa g×.");
		return
	end
	local strtab = {
		"§Æt c©y th«ng xuèng /drop_plant",
		"Kh«ng ph¶i, ®Æt chËm l¹i./nothing"}
	Say("Ng­¬i muèn ®Ó c©y th«ng xuèng?",
		getn(strtab),
		strtab);	
end

function drop_plant()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>C©y Gi¸ng Sinh<color>: §¼ng cÊp cña b¹n qu¸ thÊp, lín h¬n hoÆc b»ng cÊp 40 míi ®­îc tham gia ho¹t ®éng nµy.");
		return
	end
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"","Khu vùc hiÖn t¹i kh«ng thÓ ®Ó xuèng ®­îc!");
		return
	end
	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("Mäi ng­êi ë gÇn dÔ dµng t×m ®­îc c©y th«ng cña ng­¬i. Xin chän n¬i kh¸c.", 0)
		return
	end 	
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then
		Talk(1,"","Mçi ngµy mét ng­êi chØ cã thÓ trång"..PLANT_TREE_NUM.." c©y th«ng.");
		return
	end
	local nTime = GetTime();
	if  nTime-GetTask(TASK_PLANT_TIME) < PLANT_LIFE_TIME and GetTask(TASK_PLANT_TIME) ~= 0 then
		Talk(1,"","B¹n ®· quªn n¬i ®Ó c©y th«ng? Kh«ng sao, chót n÷a nã sÏ quay vÒ.");
		return
	end
	local MapID,MapX,MapY = GetWorldPos();
	local nNum = GetTask(TASK_TREE_NUM);
	local nSharpIdx = GetTask(TASK_SHARP_IDX);
	if nSharpIdx == 0 then
		nSharpIdx = random(1,4);
		SetTask(TASK_SHARP_IDX,nSharpIdx);
	end
	local npcTreeIndex = CreateNpc(tTreeNpc[nNum+1][nSharpIdx][1],GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2],MapID,MapX,MapY);
	if npcTreeIndex == 0 then
		WriteLog("[C©y th«ng n¨m míi 08 bÞ lçi]:"..GetName().."Khi ®Æt c©y th«ng vµo, CreateNpc trÞ hµm sè quay l¹i lµ 0, trong hµm sè CreateNpc tham sè nhËp vµo lµ:"..tTreeNpc[nNum+1][nSharpIdx][1]..","..GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2]..","..MapID..","..MapX..","..MapY);
	end;
	SetNpcLifeTime(npcTreeIndex,PLANT_LIFE_TIME);
	SetTask(TASK_CHRIMS_TREE_IDX,npcTreeIndex);
	SetTask(TASK_IS_PLANT,1);
	SetTask(TASK_PLANT_TIME,GetTime());
	SetNpcScript(npcTreeIndex,"\\script\\online\\newyear08\\chrims_tree_npc.lua");
	Talk(1,"","Ng­¬i ®· ®Æt c©y th«ng vµo.");
end
