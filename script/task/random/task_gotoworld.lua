
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ëæ»úÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/08/08 PM 13:45

-- Ö»ÓĞÍíÉÏËûÃÇÊÇÔÚÒ»ÆğµÄ
-- Ëû¿¿½üËı£¬Óµ±§Ëı
-- ËûµÄÊÖÖ¸ºÍÆ¤·ô
-- Ëı¿´×ÅËû£¬ĞÄÀïÈáÈí¶øÌÛÍ´
-- ËıÏë£¬Ëı»¹ÊÇ°®Ëû
-- Ëı²»Ïë±§Ô¹Ê²Ã´
-- Ã¿ÌìÍíÉÏËûÃÇ¶¼ÔÚ×ö°®
-- Ëı²»ÖªµÀ£¬³ıÁËÕâÖÖ½Ó´¥£¬ËıµÄ°²È«¸ĞºÍÎÂÅ¯£¬»¹ÄÜ´ÓÄÄÀïÈ¡µÃ
-- ËıÏ²»¶ÄÇÒ»Ë²¼ä¡£·Â·ğÔÚºÚ°µµÄ´óº£ÉÏ£¬Æ¯ÏòÊÀ½çµÄ¾¡Í·

-- ======================================================


-- ±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

tabPos = new(KTabFile, "\\settings\\inside_pos.txt");

-- ¸ù¾İÒ»¸öµØÍ¼µÄ ID µÃµ½Õâ¸öµØÍ¼µÄÖĞÎÄÃû¡¢´«Èë X Öá¡¢´«Èë Y Öá¡¢Õ½¶·×´Ì¬
function getMapPos(nMapID)

local strName, nX, nY = "", 0, 0;
local nRow = 0;
local i=0;

-- µÃµ½½øÈë´ËµØÍ¼Ê±³õÊ¼µÄÕ½¶·×´Ì¬
local nFightState = 0;

	for i=1, tabPos:getRow() do
		if tabPos:getCell(i, "MapID")==tostring(nMapID) then
			nRow = i;
			break;
		end;
	end;
	
	if nRow==0 then
		Msg2Player("ID b¶n ®å- täa ®é kh«ng tån t¹i!");
		return nil;
	end;
	
	strName = tabPos:getCell(nRow, "MapName");
	nX = tonumber(tabPos:getCell(nRow, "EnterPosX"));
	nY = tonumber(tabPos:getCell(nRow, "EnterPosY"));
	nFightState = tonumber(tabPos:getCell(nRow, "FightState"));
	
	return strName, nX, nY, nFightState;

end;


function gotoWorld(nMapID)

local strName, nX, nY, nFightState = getMapPos(nMapID);

-- ³ö´í´¦Àí£º
	if nMapID==0 or nMapID==nil then
		WriteLog("[Lçi nhiÖm vô s­ m«n]:gotoWorld Sai quy c¸ch nhËp hµm sè,"..GetName());
		return 
	end;
	CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
	NewWorld(nMapID, nX, nY);
	SetFightState(nFightState);
end;