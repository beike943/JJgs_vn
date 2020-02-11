-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±¾çÇé¹Ø¿¨ÃÅÆ± ÁúÃÅÑçÇë¼í Script
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
"{.Th«ng tin vËt phÈm}: Lı Nguyªn Kh¸nh ®İch th©n ®Õn Long M«n TrÊn, ®·i tiÖc chiªu ®·i nh÷ng ai cã hiÒm khİch víi NhÊt PhÈm §­êng. NÕu bŞ ThiÕt chu lÖnh truy s¸t, ®em {ThiÖp mêi Long M«n} cã thÓ tham gia khiªu chiÕn Lı Nguyªn Kh¸nh t¹i {yÕn tiÖc Long M«n}.\n{.§Şa ®iÓm sö dông}: TiÓu NhŞ, {Mçi thø 6, thø 7 tõ 16:00 - 16:10} ®Õn {qu¸n trä Long M«n TrÊn} ®­a thiÖp ra lµ cã thÓ tham dù.\n{.§iÒu kiÖn sö dông}: Hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c.\n",
	}
	
	TalkEx("",strTalk);
	
end