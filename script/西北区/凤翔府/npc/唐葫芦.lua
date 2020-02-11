-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÌÆºùÂ«Script
-- By StarryNight
-- 2007/08/07 PM 4:07

-- ºÃ¶àÌÇºùÂ«°¡¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"KÑo Hå L« do ta lµm chua chua ngät ngät, cã thÓ coi la ngon nhÊt §¹i Tèng."},
		{"X©u KÑo Hå L« lµ ph¶i chän ®­îc qu¶ s¬n tra kİch th­íc b»ng nhau, ghim trªn khóc gç tr«ng nh­ c©y con."},
		{"Kh¸ch quan thö qua b¨ng trÊn §­êng Hå L« ch­a? NÕu cã thÓ häc ®­îc c¸ch lµm l¹nh cña T©y T¹ng th× kÑo hå l« ®¸ sÏ trë thµnh mãn ngon cña nh©n gian."},
		}
	local i = random(1,getn(strTalk));
	
	local  tSay = aah_GetSayDialog(95);
	if tSay and getn(tSay) ~= 0 then
		tinsert(tSay, "T¹i h¹ chØ xem qua th«i/do_nothing");
		Say(strTalk[i][1], getn(tSay), tSay);
		return 0;
	end
	
	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- Î÷±±Çø20·ÖÖ§1_11±ø²»ÑáÕ©----------------------------------
	
	--ÓëÌÆºùÂ«¶Ô»°ÂòÌÇºùÂ«
	if nStep_XBTask_01 == 54 then
		task_020_04_0();
		return
	end
	
	--Î´È¡µÃ10¸ö±ùÌÇºùÂ« ²¹·¢´¥·¢Æ÷
	if nStep_XBTask_01 == 55 then
		task_020_04_1();
		return
	end

	TalkEx("",strTalk[i]);
	return
	
end;

function do_nothing()
end
