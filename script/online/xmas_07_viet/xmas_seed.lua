--
-- ½£ÏÀÇéÔµÍøÂç°æ2
-- xmas_seed.lua
-- 2007Ô½ÄÏÊ¥µ®»î¶¯ ÖÖ×Ó½Å±¾
-- 2007-12-12
--

Include("\\script\\online\\xmas_07_viet\\xmas_head.lua");

function OnUse(nIdx)
	local nG, nD, nP = GetItemInfoByIndex(nIdx);
	if xmas_v07_is_open() ~= 1 then
		return 0;
	end
	if nG ~= 2 or nD ~= 0 then
		WriteLog("[xmas] Error ItemId: "..nG..","..nD..","..nP);
		return 0;
	end
		
	local nPlantType = 0;
	if nP == 573 then		-- J»áÊ¥µ®Ê÷Ö¦
		nPlantType = XMAS_TYPE_JH;
	elseif nP == 574 then	-- ÃÀÀöÊ¥µ®Ê÷Ö¦
		nPlantType = XMAS_TYPE_ML;
	else
		WriteLog("[xmas] Error Item P: "..nG..","..nD..","..nP);
		return 0;
	end

	setup_global_value(nPlantType);
	XMAS_TREE_TYPE = nPlantType;
	
	if GetLevel() < 10 then
		Talk(1, "", "§¹t ®Õn cÊp 10 míi cã thÓ dïng vËt phÈm nµy!");
		return 0;
	end
	if checkplace_maincity() == 0 then
		Talk(1, "", "ChØ cã thÓ dïng vËt phÈm nµy ë TuyÒn Ch©u, Thµnh §«, BiÖn Kinh.");
		return 0;
	end
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASKID_XMAS_PLANT_DATE) < nDate then
		SetTask(TASKID_XMAS_PLANT_COUNT,0);	--Ã¿ÌìÖÖÐ¡Ê÷ÊýÇå¿Õ
	end;
	if GetTask(TASKID_XMAS_PLANT_COUNT) >= XMAS_PLANT_TREE_LIMIT then
		Talk(1,"","H«m nay b¹n ®· trång <color=yellow>"..XMAS_PLANT_TREE_LIMIT.." c©y <color>"..XMAS_TREE_NAME..", ngµy mai míi cã thÓ sö dông tiÕp.");
		return 0;
	end;
	local selTab = {
				"H·y mau trång c©y/#plant("..nIdx..")",
				"Sau nµy trång sÏ tèt h¬n!/nothing",
				}
	Say("N¬i ®©y linh khÝ héi tô, thÝch hîp ®Ó trång c©y"..XMAS_TREE_NAME.."B¹n muèn trång chø?",getn(selTab),selTab)
end;

function plant(nIdx)
	local nDate = tonumber(date("%y%m%d")); --ÓÃÓÚTASKID_XMAS_PLANT_DATE±äÁ¿
	if GetTime() - GetTask(TASKID_XMAS_PLANTTIME) < XMAS_TREELIFETIME and GetTask(TASKID_XMAS_PLANTTIME) ~= 0 then
		Talk(1,"","B¹n ®· trång thµnh c«ng 1 c©y");
		return 0;
	end;

	if DelItemByIndex(nIdx, 1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(txmas_tree_mode[1], GetName().."-"..XMAS_TREE_NAME,MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[xmas seed]:"..GetName().."Lóc trång c©y, trÞ quay l¹i hµm sè CreateNpc lµ 0. Tham sè nhËp CreateNpc lµ:"..txmas_tree_mode[1]..","..GetName().." trång "..XMAS_TREE_NAME..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,XMAS_TREELIFETIME)
		
		SetTask(TASKID_XMAS_TREEINDEX,npcTreeIndex);
		SetTask(TASKID_XMAS_TREE_GROW, 1);
		SetTask(TASKID_XMAS_TREE_SCORE, 0);
		SetTask(TASKID_XMAS_TREE_TYPE, XMAS_TREE_TYPE);
		
		SetTask(TASKID_XMAS_PLANTTIME,GetTime());
		SetTask(TASKID_XMAS_PLANT_DATE,nDate);
		SetNpcScript(npcTreeIndex,"\\script\\online\\xmas_07_viet\\xmas_tree.lua");
		SetTask(TASKID_XMAS_PLANT_COUNT,GetTask(TASKID_XMAS_PLANT_COUNT)+1);
		Say("H«m nay, ®©y lµ lÇn thø <color=yellow>"..GetTask(TASKID_XMAS_PLANT_COUNT).."<color> lÇn"..XMAS_TREE_NAME..", h«m nay b¹n cßn cã thÓ trång <color=yellow>"..(XMAS_PLANT_TREE_LIMIT-GetTask(TASKID_XMAS_PLANT_COUNT)).."<color> c©y"..XMAS_TREE_NAME..".",0);
	end;
end;

function checkplace_maincity()	--ÖÖÐ¡Ê÷¡£ÊÇ·ñÔÚÖ¸¶¨µØµã£ºÈý´óÖ÷³Ç
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 200 or nMapID == 300 then
		return 1;
	else
		return 0;
	end;
end;
