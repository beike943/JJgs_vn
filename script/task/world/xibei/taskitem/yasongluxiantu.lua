-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÇøÈÎÎñÎïÆ·ÑºËÍÂ·ÏßÍ¼Script
-- By StarryNight
-- 2007/06/12 PM 3:15

-- Ã»ÓÐÔ­Ôò£¬ºÍ×öÒ»Ìõ¹·ÓÐßã·Ö±ð£¿

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nMapName = "";
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = 0,0,0,0,0;
local mapID,xPos,yPos = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {};
local nStep_XBTask = GetTask(TASK_XB_ID);

	--ÅÐ¶ÏÈÎÎñ²½Öè
	if nStep_XBTask >= 20 and nStep_XBTask <= 23 then
	
		nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
		nMapName = Map_Data[nMapDataID][1];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];
		
		--ÉÐÎ´È¡µÃÑÌÄ»µ¯
		if nStep_XBTask <= 22 or GetItemCount(2,0,694) <= 0 then
			strTalk = {
				"Theo b¶n ®å ®­êng ®i cña Viªn bé ®Çu, ®oµn ¸p t¶i S¸t thñ Oa Oa ch¾c ch¾n sÏ ®i ngang "..nMapName.."("..nXpos..", "..nYpos..") nµy. NÕu vÉn ch­a t×m ®­îc ®¹n khãi dïng khi c­íp tï nh©n, h·y mau tíi Phông T­êng t×m DiÖp l·o.",
				}
			TalkEx("",strTalk);
		else
			strTalk = {
				"Theo b¶n ®å ®­êng ®i cña Viªn bé ®Çu, ®oµn ¸p t¶i S¸t thñ Oa Oa ch¾c ch¾n sÏ ®i ngang "..nMapName.."("..nXpos..", "..nYpos..") nµy. Nay ®· cã ®­îc ®¹n khãi nªn mau chãng ®i cøu S¸t thñ Oa Oa. ",
				}
			TalkEx("",strTalk);
		end
	else
		strTalk = {
			"S¸t thñ Oa Oa ®· ®­îc cøu, b¶n ®å nµy còng ch¼ng cßn t¸c dông n÷a, nªn vøt ®i ®Ó trèng chç.",
				}
		TalkEx("",strTalk);
		DelItem(2,0,693,1);
	end		

end
