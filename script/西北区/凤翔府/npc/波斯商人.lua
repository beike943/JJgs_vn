-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPC²¨Ë¹ÉÌÈËScript
-- By StarryNight
-- 2007/06/27 AM 10:16

-- ··ÂôÄãµÄ¸ĞÇé°É£¬µ«ËüÒ»ÎÄ²»Öµ¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±ÈÎÎñ·ÖÖ§1¡ª¡ª09¹âÃ÷×óÊ¹----------------------------------
	
	--Ñ¯ÎÊÓĞÃ»ÓĞ²¨Ë¹ÆÏÌÑ¾ÆÂô
	if nStep_XBTask_01 == 2 then
		task_009_03_0();
		return
	end
	
	--»¹Ã»È¡µÃÆÏÌÑ¾Æand²¹·¢ÑÌºº´¥·¢Æ÷
	if nStep_XBTask_01 == 3 then
		task_009_03_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Con ®­êng vËn chuyÓn t¬ lôa tuy tèt nh­ng qu¸ dµi… Tõ Phông T­êng ®Õn An Tøc ph¶i mÊt hai m­¬i mÊy ngµy."},
		{"Ng«n ng÷ trung nguyªn khã häc qu¸, ng­êi trung nguyªn l¹i kh«ng chŞu häc tiÕng cña ta, biÕt thªm mét sè tiÕng cã g× kh«ng tèt chø? Ta còng biÕt nãi ng«n ng÷ cña mét sè quèc gia vËy."},
		{"Ng­¬i chí cã nghe tªn §­êng Hå L« nãi bËy, T©y Vùc lµm g× cã ph­¬ng ph¸p lµm l¹nh, ta chØ chuyªn b¸n hµng hãa T©y Vùc, R­îu Ba T­."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
