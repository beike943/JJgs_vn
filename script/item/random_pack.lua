-- ¶ÁÈëËæ»úÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\random\\task_head.lua");

function OnUse()

local nState         = GetTask(TASKSTATE_ID);

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- µÃµ½ÈÎÎñ NPC µÄÃû×Ö
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ÖĞÎÄÃû


	if nState==1 then
		ShowTaskNpcByPack();
		return	
	elseif nState==2 then
		Say("H·y hoµn thµnh nhiÖm vô "..strNpcMap.."-"..strNpcName.." giao cho ng­¬i!"..GetTaskClearInfo(),0);
		return
	else
		Say("S­ phô hiÖn ch­a cã nhiÖm vô míi nµo giao cho b¹n.", 0);
		return
	end;

end;


-- ¸æËßÍæ¼ÒÈÎÎñ NPC µÄÎ»ÖÃ
function ShowTaskNpcByPack()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- µÃµ½ÈÎÎñ NPC µÄÃû×Ö
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ÖĞÎÄÃû

local strBossName    = FactionBossName[GetPlayerFaction()];
local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B¹n nhËn ®­îc bå c©u ®­a th­ cña"..strBossTitle.."{bå c©u ®­a th­}"..strBossName.."nhê b¹n ®Õn <color=yellow>"..strNpcMap.."<color> t×m <color=yellow>"..strNpcName.."<color>, ng­êi nµy cÇn sù gióp ®ì cña b¹n, ®ång thêi dÆn b¹n dï thÕ nµo còng ph¶i hoµn thµnh nhiÖm vô ®­îc giao!",
		2,
		"§Õn n¬i lµm nhiÖm vô/#AcceptTask("..nNpcMapID..")",
		"§ãng/Main_Exit");
end;