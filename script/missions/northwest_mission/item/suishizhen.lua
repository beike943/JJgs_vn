-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±¾çÇé¹Ø¿¨ÃÅÆ± ËéÊ¯Õğ Script
-- By StarryNight
-- 2007/12/19 PM 04:18

-- ĞÒ¸££¬ÆäÊµ¾ÍÊÇÄÇĞ©²»¾­Òâ¼ä±»ÒÅÍüµÄÆ¬¶Î¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
".{Th«ng tin vËt phÈm}: {To¸i th¹ch chÊn} lµ háa khİ cña nh÷ng tªn c­íp mé, cã thÓ ph¸ th¹ch m«n ngh×n c©n. VËt®Ó vµo {Hoµng L¨ng mËt thÊt}.\n.{§Şa ®iÓm sö dông}: Thñ Mé T­íng Qu©n, tæ ®éi 3-5 ng­êi l­u ph¸i kh¸c nhau, dïng To¸i th¹ch chÊn ph¸ hñy th¹ch m«n.\n.{§iÒu kiÖn sö dông}: Thµnh viªn trong ®éi ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c\n.{H¹n chÕ sö dông}: TuÇn nµy b¹n ®· kh¸m ph¸ T©y vùc{"..nFinishNum.."} lÇn, cßn cã thÓ kh¸m ph¸ {"..nPlayNum.."} lÇn.",
	}
	
	TalkEx("",strTalk);
	
end