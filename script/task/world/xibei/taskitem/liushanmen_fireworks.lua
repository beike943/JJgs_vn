-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÇøÈÎÎñÎïÆ·¡±ÁùÉÈÃÅÑÌ»ğ¡°Script
-- By StarryNight
-- 2007/06/12 AM 10:43

-- ÊÀ½ç±ä»¯µÄÌ«¿ì£¬ÕäÏ§Ö»ÊÇÎŞ»üÖ®Ì¸¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nMapName = "";
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = 0,0,0,0,0;
local mapID,xPos,yPos = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {};

	--ÅĞ¶ÏÈÎÎñ²½Öè
	if GetTask(TASK_XB_ID) == 19 then
	
		nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
		nMapName = Map_Data[nMapDataID][1];
		nMapID = Map_Data[nMapDataID][2];
		nXworldpos = Map_Data[nMapDataID][3];
		nYworldpos = Map_Data[nMapDataID][4];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];
		
		--ÅĞ¶ÏÄ¿±êµØµãÊÇ·ñÕıÈ·
		if nMapID == mapID and ((nXworldpos - 50) <= xPos ) and (xPos <=(nXworldpos + 50)) and ((nYworldpos - 50) <= yPos ) and (yPos<=(nYworldpos + 50)) then
			DelItem(2,0,692,1);
			DoFireworks(808,1);--ÑÌ»¨Ğ§¹û
			nNpcIndex = CreateNpc("Viªn Phi V©n ","Danh bæ Viªn Phi V©n ",nMapID,nXworldpos,nYworldpos);
			SetNpcLifeTime(nNpcIndex,1200);
			SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\·ïÏè¸®\\npc\\Ô¬·ÉÔÆ.lua");
			SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--¼ÇÂ¼Ô¬·ÉÔÆNpcIndex
		else			
			strTalk = {
			"Theo nh­ lêi B¸ch HiÓu Sinh tiÒn bèi, Viªn bé ®Çu hiÖn ®ang ë gÇn "..nMapName.."("..nXpos..", "..nYpos.."), sö dông Ph¸o hiÖu Lôc PhiÕn m«n lµ cã thÓ gÆp nhau råi.",
				}
			TalkEx("",strTalk);
		end
	
	
	else
		strTalk = {
			"Ph¸o hiÖu nµy d­êng nh­ ch¼ng cã t¸c dông g×, nªn vøt ®i ®Ó ®ì chiÕm chç.",
				}
		TalkEx("",strTalk);
		DelItem(2,0,692,1);
	end		

end
