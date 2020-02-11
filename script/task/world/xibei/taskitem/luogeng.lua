-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÇøÈÎÎñÎïÆ· ÂŞ¸ı Script
-- By StarryNight
-- 2007/07/02 AM 11:11

-- ĞÒ¸££¬ÆäÊµ¾ÍÊÇÄÇĞ©²»¾­Òâ¼ä±»ÒÅÍüµÄÆ¬¶Î¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nXpos,nYpos = 0,0;
local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local Mapid,nxpos,nypos = GetWorldPos();

	--ÅĞ¶ÏÈÎÎñ²½Öè
	if nStep_XBTask_01 == 24 then
	
		if Mapid == 513 then
		
			--ÒÑ¾­ÆÆ»µÁËÒ»¸ö·çË®Ñ¨»ò»¹Ã»»ñµÃ·çË®Ñ¨×ø±ê
			if GetTask(FENGSHUIXUE_ID) == 0 then
				
				nMapDataID = random(1,getn(Fengshuixue_MapData));
				SetTask(FENGSHUIXUE_ID,nMapDataID);
				
			end
				
			nMapDataID = GetTask(FENGSHUIXUE_ID);
			nXpos = Fengshuixue_MapData[nMapDataID][3];
			nYpos = Fengshuixue_MapData[nMapDataID][4];
			
			strTalk = {
				"La Canh cho thÊy, "..nXpos.."},{"..nYpos.." ë ®©y cã dŞ th­êng, ch¾c ®ã chİnh lµ Phong Thñy HuyÖt."
				}	
		
		else
			
			strTalk = {
				"LiÔu Tïng V©n tiÒn bèi tõng nãi La Canh cÇn ®­îc ®Æt ë tÇng 1 Hoµng L¨ng mé thÊt cã ph¸t huy t¸c dông, sö dông ë ®©y sÏ kh«ng cho kÕt qu¶ g× ®©u."
				}
		
		end		
		
	elseif nStep_XBTask_01 == 25 then
		
		strTalk = {
			"§· ph¸ hñy phong thñy trong mé, ®· ®Õn lóc tiÕp tôc ®Õn cöa vµo tÇng 2 t×m ng­êi TrÊn Mé vµ tiªu diÖt TrÊn Mé linh thó ®Ó tiÕn vµo tÇng 2 Hoµng L¨ng mé thÊt.",
			}
			
	elseif nStep_XBTask_01 == 21 then
	
		strTalk = {
			"La Canh nµy ch¾c sÏ cã İch trong viÖc ®i vµo L¨ng mé, ta ph¶i ®Õn t×m LiÔu tiÒn bèi hái cho râ míi ®­îc.",
			}
			
	elseif nStep_XBTask_01 == 22 then
	
		 strTalk = {
			"Theo lêi LiÔu Tïng V©n tiÒn bèi, La Canh ph¶i kÕt hîp víi Ph¸ phong chïy míi sö dông ®­îc, giê Ph¸ phong chïy ®· bŞ Tr¶o v­¬ng c­íp mÊt, ph¶i ®Õn chç Th¸c B¹t Ho»ng t×m hiÓu ®éng tÜnh cña NhÊt PhÈm §­êng míi ®­îc.",
			}
			
	elseif nStep_XBTask_01 == 23 then
	
		 strTalk = {
			"Tr¶o v­¬ng ®· lÊy ®­îc Ph¸ phong chïy ®i vµo tÇng 1 l¨ng mé, chuyÖn kh«ng thÓ chËm trÔ, ph¶i nhanh chãng ®o¹t l¹i Ph¸ phong chïy ngay.",
			}

	else
		strTalk = {
			"VËt nµy d­êng nh­ ®· kh«ng cßn t¸c dông n÷a.",
			}
			
		DelItem(2,0,714,1)
		
	end
	
	TalkEx("",strTalk);
	
end