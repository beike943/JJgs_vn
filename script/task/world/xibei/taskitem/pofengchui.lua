-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÇøÈÎÎñÎïÆ· ÆÆ·çé³ Script
-- By StarryNight
-- 2007/07/02 AM 11:14

-- Ñ¹Á¦ºÃ´ó£¬ÒªÕñ×÷°¡£¡

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local Mapid,nxpos,nypos = GetWorldPos();
local nMapDataID = GetTask(FENGSHUIXUE_ID);

	--ÅÐ¶ÏÈÎÎñ²½Öè
	if nStep_XBTask_01 == 24 then
	
		if Mapid == 513 then
		
			if nMapDataID ~= 0 then
			
				nXworldpos,nYworldpos = Fengshuixue_MapData[nMapDataID][1],Fengshuixue_MapData[nMapDataID][2];
		
				--ÔÚÄ¿±êÎ»ÖÃ·¶Î§ÄÚ
				if nxpos >= (nXworldpos - 50) and nxpos <= (nXworldpos + 50) and nypos >= (nYworldpos - 50) and nypos <= (nYworldpos + 50) then
					
					SetTask(FENGSHUIXUE_STATE,GetTask(FENGSHUIXUE_STATE)+1);
					SetTask(FENGSHUIXUE_ID,0);
					
					if GetTask(FENGSHUIXUE_STATE) == 4 then
					
						strTalk = {
							"LiÔu tiÒn bèi nãi, 4 Phong Thñy HuyÖt ®· bÞ ph¸, ®· ®Õn lóc tiÕn tíi cöa vµo tÇng 1 ®i t×m ng­êi TrÊn Mé, tiªu diÖt TrÊn Mé linh thó ®­îc vµo tÇng 2 Hoµng L¨ng mé thÊt."
							}
						DelItem(2,0,715,1);--É¾µôÆÆ·çé³
						DelItem(2,0,714,1);--É¾µôÂÞ¸ý
						SetTask(FENGSHUIXUE_STATE,0);
						SetTask(FENGSHUIXUE_ID,0);
						SetTask(TASK_XB_ID_01,25);
						TaskTip("§Õn cöa vµo tÇng 2, t×m ng­êi TrÊn Mé vµ tiªu diÖt TrÊn Mé thó ®Ó vµo ®­îc tÇng 2.");
						Msg2Player("Phong thñy trong mé thÊt ®· bÞ ph¸, mau ®Õn cöa vµo tÇng 1 t×m ng­êi TrÊn Mé vµ tiªu diÖt TrÊn Mé thó ®Ó vµo tÇng 2.");
						
					else
					
						strTalk = {
							"§· ph¸ thµnh c«ng 1 Phong Thñy HuyÖt, hiÖn nay ®· ph¸ ®­îc "..GetTask(FENGSHUIXUE_STATE).." Phong Thñy HuyÖt, cßn l¹i "..(4-GetTask(FENGSHUIXUE_STATE)).." c¸i ph¶i t×m ra vµ ph¸ hñy ®Ó ph¸ gi¶i hoµn toµn phong thñy tÇng 1."
							}
						DelItem(2,0,713,1);--É¾µôÒ»¸ù¶ÏË®èÆ
					end
					
				else
					
					strTalk = {
						"NÕu thÊy ph¶n øng g×, d­êng nh­ ®©y kh«ng ph¶i Phong Thñy HuyÖt, tèt nhÊt vÉn nªn dïng La Canh xem xÐt cho kü."
						}
				end
				
			else
				
				strTalk = {
					"NÕu thÊy ph¶n øng g×, d­êng nh­ ®©y kh«ng ph¶i Phong Thñy HuyÖt, tèt nhÊt vÉn nªn dïng La Canh xem xÐt cho kü.",
					}	
			end
		
		else
			
			strTalk = {
				"LiÔu Tïng V©n tiÒn bèi tõng nãi Ph¸ phong chïy cÇn ®­îc ®Æt ë tÇng 1 Hoµng L¨ng mé thÊt cã ph¸t huy t¸c dông, sö dông ë ®©y sÏ kh«ng cho kÕt qu¶ g× ®©u."
				}
		
		end		
		
	elseif nStep_XBTask_01 == 25 then
		
		strTalk = {
			"§· ph¸ hñy phong thñy trong mé, ®· ®Õn lóc tiÕp tôc ®Õn cöa vµo tÇng 1 t×m ng­êi TrÊn Mé vµ tiªu diÖt TrÊn Mé linh thó ®Ó tiÕn vµo tÇng 2 Hoµng L¨ng mé thÊt.",
			}
		
	else
		strTalk = {
			"VËt nµy d­êng nh­ ®· kh«ng cßn t¸c dông n÷a.",
			}
		DelItem(2,0,715,1);--É¾µôÆÆ·çé³
		
	end
	
	TalkEx("",strTalk);
	
end
