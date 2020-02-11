-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÇøÈÎÎñÎïÆ· Î÷ÏÄ·¨ÍõÃÜº¯ Script
-- By StarryNight
-- 2007/08/03 AM 11:11

-- ÐÒ¸££¬ÆäÊµ¾ÍÊÇÄÇÐ©²»¾­Òâ¼ä±»ÒÅÍüµÄÆ¬¶Î¡£

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	--ÅÐ¶ÏÈÎÎñ²½Öè
	if nStep_XBTask_01 >= 24 and nStep_XBTask_01 <= 28 then
	
	strTalk = {
		"T©y H¹ ph¸p v­¬ng mËt hµm: KÕt cÊu tÇng 2 gÇn gièng víi tÇng 1, ®«ng t©y nam b¾c ®Òu cã bèn TrÊn Mé t­íng qu©n, ®¸nh b¹i chóng th× ph¸ ®­îc phong thñy tÇng 2, r­¬ng b¸u sÏ xuÊt hiÖn. R­¬ng b¸u ¾t sÏ cã TrÊn Mé linh thó trÊn gi÷, nÕu nã lµ Quû t­íng qu©n th× ph¶i hÕt søc cÈn thËn, chØ cã Phi Th­êng ®¹o phï cña Phi Th­êng §¹o Nh©n míi ®ñ søc triÖt h¹, b»ng kh«ng r­¬ng b¸u sÏ biÕn mÊt, cÇn ph¶i ph¸ hñy Phong Thñy trËn lÇn n÷a.",
		}
	
	else
		
		strTalk = {
			"MËt hµm nµy ®· kh«ng cßn t¸c dông n÷a.",
			}
			
		DelItem(2,0,716,1);--ÃÜº¯¹ýÆÚÉ¾µô
	
	end
	
	TalkEx("",strTalk);
	
end