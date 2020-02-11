Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse()
	Create_Map_Trigger();
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ng­êi ch­a gia nhËp m«n ph¸i kh«ng ®­îc sö dông h¹t gièng");
		return 0;
	end;
	if checktime() == 0 then
		Talk(1,"","Lóc nµy linh khÝ ch­a tËp trung, chê thªm mét chót tèt h¬n");
		return 0;
	end;
	if checkplace() == 0 then
		Talk(1,"","Linh khÝ n¬i ®©y kh«ng m¹nh, e r»ng c©y sÏ kh«ng ph¸t triÓn");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLAN_BIGTREE_DATE) < nDate then
		SetTask(TASK_PLAN_BIGTREE_COUNT,0);	--Ã¿ÌìÖÖÐ¡Ê÷ÊýÇå¿Õ
		SetTask(TASK_PLAN_BIGTREE_DATE,nDate);
	end;
	if GetTask(TASK_PLAN_BIGTREE_COUNT) >= PLANT_BIG_TREE_LIMIT then
		Talk(1,"","H«m nay b¹n ®· trång <color=yellow>"..PLANT_BIG_TREE_LIMIT.."c©y<color> Th¸i H­ B¸t Nh·, ngµy mai h·y trång tiÕp!");
		return 0;
	end;
	local selTab = {
				"H·y mau trång c©y/plant",
				"Sau nµy trång sÏ tèt h¬n!/nothing"
				}
	Say("N¬i ®©y s¬n thñy thÝch hîp, linh khÝ xung thiªn, chÝnh lµ n¬i trång c©y tiªn, b¹n x¸c nhËn muèn trång c©y?",getn(selTab),selTab)
end;

function plant()
	if checktime() == 0 then
		Talk(1,"","Lóc nµy linh khÝ ch­a tËp trung, chê thªm mét chót tèt h¬n");
		return 0;
	end;
	if checkplace() == 0 then
		Talk(1,"","Linh khÝ n¬i ®©y kh«ng m¹nh, e r»ng c©y sÏ kh«ng ph¸t triÓn");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTime() - GetTask(TASK_PLANTTIME) < TREELIFETIME and GetTask(TASK_PLANTTIME) ~= 0 then
		Talk(1,"","B¹n ®· trång thµnh c«ng 1 c©y");
		return 0;
	end;
	if DelItem(2,0,398,1) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		local npcTreeIndex = CreateNpc(TREETYPE[1][1],GetName().." trång "..TREETYPE[1][2],MapID,MapX,MapY)
		if npcTreeIndex == 0 then
			WriteLog("[Lçi ho¹t ®éng trång c©y Th¸i H­]:"..GetName().."Lóc trång c©y, trÞ quay l¹i hµm sè CreateNpc lµ 0. Tham sè nhËp CreateNpc lµ:"..TREETYPE[1][1]..","..GetName().." trång "..TREETYPE[1][2]..","..MapID..","..MapX..","..MapY);
		end;
		SetNpcLifeTime(npcTreeIndex,TREELIFETIME)
		SetTask(TASK_TREEINDEX,npcTreeIndex);
		SetTask(TASK_TREEGROW,1);
		SetTask(TASK_PLANTTIME,GetTime());
		SetNpcScript(npcTreeIndex,"\\script\\online\\plant\\tree_npc.lua");
		SetDeathScript("\\script\\online\\plant\\playerdeath.lua");
		SetTask(TASK_PLAN_BIGTREE_DATE,nDate);
		SetTask(TASK_PLAN_BIGTREE_COUNT,GetTask(TASK_PLAN_BIGTREE_COUNT)+1);
		Say("C©y ch­a tr­ëng thµnh rêi khái chóng sÏ chÕt. H«m nay b¹n ®· trång <color=yellow>"..GetTask(TASK_PLAN_BIGTREE_COUNT).."<color> lÇn c©y Th¸i H­ B¸t Nh·, cßn trång ®­îc <color=yellow>"..(PLANT_BIG_TREE_LIMIT-GetTask(TASK_PLAN_BIGTREE_COUNT)).."<color> c©y Th¸i H­ B¸t Nh·.",0);
		StartTimeGuage("T­íi c©y",TREETYPE[1][3],0,1)
		local nMapID = GetWorldPos();
		if nMapID == 301 then
			WriteLogEx("Trong cay Bat Nha", "Tay Thanh Do");
		elseif nMapID == 504 then
			WriteLogEx("Trong cay Bat Nha", "Bac Tuyen Chau");
		end
		--ÎäÁÖvipÁî
		_vc_PlantBigBanRuo();
	end;
end;
