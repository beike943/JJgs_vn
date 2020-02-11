-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©Íõ¶´NPCÒ©ÈË²İScript
-- By StarryNight
-- 2007/08/04 AM 11:23

-- ÎÒÊÇÒ»¿Å²İ~(*^__^*) ÎûÎû¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local strTalk = {};

	---------------------------------- Î÷±±Çø18·ÖÖ§1_9ÜÆº®ÁÒÑô----------------------------------
	
	SetNpcLifeTime(index,0);
	SetNpcScript(index,"");
	
	if nStep_XBTask_01 == 41 then
	
		SetTask(KILL_YAORENBOSS_NUM,GetTask(KILL_YAORENBOSS_NUM)+1);
		
		if GetTask(KILL_YAORENBOSS_NUM) >= 5 then
			
			DelItem(2,0,725,1);--É¾È¥ÁÒÑôË®
			SetTask(KILL_YAORENBOSS_NUM,0);--±äÁ¿ÇåÁã
			SetTask(TASK_XB_ID_01,42);--³É¹¦ÏûÃğ5ÖêÒ©ÈË²İ
			strTalk = {
				"Tİch D­¬ng thñy qu¶ nhiªn kh¾c chÕ ®­îc ®éc tİnh cña D­îc Nh©n Th¶o, vËy lµ ©m m­u cña D­îc V­¬ng vµ T©y H¹ t¹m thêi bŞ khèng chÕ. Chi b»ng ®Õn hái ¢u D­¬ng Häa tiÒn bèi b­íc tiÕp theo nªn lµm sao.",
				}
			TalkEx("",strTalk);
			Msg2Player("§· tiªu diÖt D­îc Nh©n Th¶o, quay vÒ t×m ¢u D­¬ng tiÒn bèi bµn b¹c.");
			TaskTip("§· tiªu diÖt D­îc Nh©n Th¶o, quay vÒ t×m ¢u D­¬ng tiÒn bèi bµn b¹c.");
		
		else
			
			strTalk = {
				"L¹i diÖt ®­îc 1 D­îc Nh©n Th¶o, xem ra Tİch D­¬ng thñy qu¶ lµ c«ng hiÖu, hiÖn giê ®· tiªu diÖt ®­îc "..GetTask(KILL_YAORENBOSS_NUM).." c©y, ph¶i tiªu diÖt 5 c©y míi kiÒm h·m ®­îc sù sinh s¶n cña D­îc Nh©n Th¶o"
				}
				
			TalkEx("",strTalk);
			
		end
		
	end

end
