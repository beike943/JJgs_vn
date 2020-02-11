-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±¾çÇé¹Ø¿¨ÃÅÆ± »ØÁúË÷ Script
-- By StarryNight
-- 2::7/12/19 PM :4:18

-- ĞÒ¸££¬ÆäÊµ¾ÍÊÇÄÇĞ©²»¾­Òâ¼ä±»ÒÅÍüµÄÆ¬¶Î¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0;
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
".{Th«ng tin vËt phÈm}: {Håi Long S¸ch} vèn lµ c«ng cô cña kÎ c­íp mé, dïng ®Ó më c¬ quan bªn trong. Lµ vËt ®Ó vµo {Hoµng L¨ng mËt ®¹o}.\n.{§Şa ®iÓm sö dông}: N¬i Thñ mé nh©n ®ang canh gi÷ l¨ng mé, tæ ®éi 3-5 l­u ph¸i kh¸c nhau, dïng Håi Long S¸ch më mËt ®¹o.\n.{§iÒu kiÖn sö dông}: Thµnh viªn trong ®éi ®Òu ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c.\n.{H¹n chÕ sö dông}: TuÇn nµy b¹n ®· thö qua kh¸m ph¸ T©y vùc{"..nFinishNum.."} lÇn, cßn cã thÓ kh¸m ph¸ {"..nPlayNum.."} lÇn.",
	}
	
	TalkEx("",strTalk);
	
end