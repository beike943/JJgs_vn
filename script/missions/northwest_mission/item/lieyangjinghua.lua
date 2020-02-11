-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±¾çÇé¹Ø¿¨ÃÅÆ± ÁÒÑô¾«»ª Script
-- By StarryNight
-- 2007/12/19 PM 04:18

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
".{Th«ng tin vËt phÈm}: Tİch D­¬ng c¨n, {Tİch D­¬ng Tinh Hoa} lÊy 3 lo¹i Tİch D­¬ng c¨n luyÖn chÕ thµnh. Lµ kh¾c tinh cña D­îc Nh©n Th¶o, cã thÓ kh¾c chÕ D­îc Nh©n. VËt ®Ó vµo {LuyÖn ®¬n ®éng}.\n.{§Şa ®iÓm sö dông}: D­îc thÊt thñ vÖ, D­îc Nh©n rÊt sî vËt nµy, tæ ®éi 3-5 ng­êi l­u ph¸i kh¸c nhau, mang theo vËt nµy lµ cã thÓ vµo trong.\n.{§iÒu kiÖn sö dông}: Thµnh viªn trong ®éi ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c\n.{H¹n chÕ sö dông}: TuÇn nµy b¹n ®· kh¸m ph¸ T©y vùc{"..nFinishNum.."} lÇn, cßn cã thÓ kh¸m ph¸ {"..nPlayNum.."} lÇn.",
	}
	
	TalkEx("",strTalk);
	
end