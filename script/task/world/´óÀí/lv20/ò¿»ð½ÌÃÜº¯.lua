-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñò¿»ğ½ÌÃÜº¯Script
-- By StarryNight
-- 2005/12/31 PM 14:30

--ÒÒÓÏÄê  Îì×ÓÔÂ ¼º³óÈÕ

-- ======================================================
-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local strTalk = {
	"Trong th­ viÕt g× vËy?",
	"{NhŞ Hoµng Tö} ®ang ë {T©y Song B¶n N¹p}? Ph¶i lËp tøc b¸o ngay cho {Cao Quèc C«ng} th«i.",
	}
	TalkEx("",strTalk);
	if GetTask(TASK_DL_LV70_ID) == 2 then
		SetTask(TASK_DL_LV70_ID,3);--ÒÑ¾­ÔÄ¶ÁÁËĞÅ¼ş
		Msg2Player("§Õn §¹i Lı th«ng b¸o cho Cao Quèc C«ng vÒ néi dung trong th­.");
		TaskTip("§Õn §¹i Lı th«ng b¸o cho Cao Quèc C«ng vÒ néi dung trong th­.");
	end
	return
end
