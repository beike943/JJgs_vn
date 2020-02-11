--ÔÚÌÆ³şºì´¦¼ÓÈëÉÙÁÖ£¬½ÓÊ¦ÃÅÈÎÎñ
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ÌÆÃÅÊ¦ÃÅÈÎÎñµÄ½Å±¾Í·ÎÄ¼ş
Include("\\script\\task\\practice\\practice_main.lua"); --ĞŞÁ¶µÄ½Å±¾
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76¼¶ÎäÆ÷Éú»î¼¼ÄÜÈÎÎñ½Å±¾
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--ÕÙ»ØÀÏÍæ¼Ò»î¶¯
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>§­êng M«n Gi¸o Chñ <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_TM)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76¼¶ÎäÆ÷Åä·½Ñ§Ï°ÈÎÎñ
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),4) ~= 1 then
		weapon_76_talk(4,nSkillDetail)
		return
	end

	if (nTaskValue==7) then
		
		task_012();
		return
	elseif (nTaskValue >= 9) then
		fix_tm();
		return
	elseif ((nTaskValue > 0) and (nTaskValue < 7)) then
		Say("Ng­¬i ®i t×m <color=yellow>Thiªn TiÕu<color>, y sÏ an bµi mäi viÖc cho ng­¬i còng nh­ ®Ó L·o l·o thÊy lßng <color=yellow>trung thµnh<color> cña ng­¬i thÕ nµo.",0);
		return
	else
		main_new();
	end
end;

-- Ê¦ÃÅÈÎÎñÏà¹Ø
function about_faction_task()
	Say("T×m ta cã viÖc g×?",
		3,
		"Ta muèn cèng hiÕn cho s­ m«n (nhiÖm vô s­ m«n)/start_faction_tasklink",
		"Ta muèn tra xem ®é cèng hiÕn./check_query_faction_contri",
		"Ta muèn t×m hiÓu ®é cèng hiÕn s­ m«n./shimenshuoming")
--		"ÎÒÒªĞŞ¸´Ê¦ÃÅÈÎÎñÎŞ·¨Íê³ÉµÄÎÊÌâ/repair_faction_bug")
end;

-- ĞŞ¸´É±¹ÖÈÎÎñÎŞ·¨Íê³ÉµÄbug
function repair_faction_bug()
	Say("Bæn m«n gÇn ®©y cã nhiÒu viÖc khiÕn ng­¬i còng bËn rén theo. Xem nh­ ng­¬i cã thªm c¬ héi ®Ó ta luyÖn vËy! B©y giê ta sÏ gióp ng­¬i hñy nhiÖm vô trªn, nh­ng ph¶i trõ 5 ®iÓm cèng hiÕn s­ m«n, ng­¬i thÊy thÕ nµo?", 
		2,
		"§­îc, ta ®ång ı/confirm_repair_bug",
		"§Ó ta nghÜ c¸ch kh¸c/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Xong råi, ta ®· hñy gióp ng­¬i!", 0)
end;

function intertangmen()		--¼ÓÈëÃÅÅÉ
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then
		Say("Ng­¬i ®· gia nhËp m«n ph¸i kh¸c, thø lçi §­êng M«n ta kh«ng tiÖn thu n¹p!",0)
	elseif GetLevel() < 10 then	  --µÈ¼¶¼ì²â
		Say("Muèn gia nhËp §­êng M«n ph¶i cã thùc lùc nhÊt ®Şnh, ng­¬i ch­a ®¹t <color=yellow>cÊp 10<color> chø?thÓ gia nhËp bæn m«n. Khi nµo ®¹t ®Õn cÊp 10 h·y quay l¹i!",0)
	elseif GetPlayerFaction() == 5 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i ®· lµ ®Ö tö §­êng M«n, cßn muèn gia nhËp g× n÷a?",0)
	elseif GetPlayerFaction() > 0 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®· gia nhËp m«n ph¸i? Ch¼ng lÏ cßn muèn ph¶n béi s­ m«n?",0)
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 5 then		--²»ÊÇÌÆÃÅµÜ×Ó
		Say("Ng­¬i kh«ng ph¶i ®Ö tö bæn m«n, tuyÖt häc gia truyÒn lı nµo l¹i ®Ó ng­¬i biÕt ®­îc.",0)
	elseif  GetPlayerRoute() == 5 then 	--ÊÇÌÆÃÅµÜ×Óµ«ÊÇ»¹Ã»ÓĞÈ¥°İÊ¦
		Say("Ta giµ råi! ViÖc truyÒn thô vâ c«ng chi b»ng h·y ®Õn t×m <color=yellow>Thiªn TiÕu<color> ®i! ¤ng ta míi lµ tæng qu¶n cña §­êng M«n.",0)
	else  	--ÌÆÃÅµÜ×Ó£¬ÇÒÒÑ¾­°İÊ¦
		Say("Muèn häc vâ c«ng h·y t×m <color=yellow>Thiªn TiÕu<color> lµm <color=yellow>NhiÖm vô<color> míi ®Õn t×m ta.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 5 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö §­êng M«n, chuyÖn cña §­êng M«n kh«ng thÓ cho ng­¬i biÕt ®­îc.",0)
	else
		taskmain("§­êng Së Hång", 5)
	end
end;				


function no()
end;

function practice()
    if GetPlayerFaction() ~= 5 then
       Talk(1,"","Ng­¬i kh«ng ph¶i lµ ®Ö tö §­êng M«n! Kh«ng thÓ tu luyÖn ë ®©y.");
    else
        if GetItemCount(2, 0, 209) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say("Muèn vµo ®©y tu luyÖn?",2,"§óng/practice_start","Sai/no");
        else
            Talk(1,"","Ng­¬i kh«ng cã <color=yellow>LÖnh bµi §­êng M«n<color>, kh«ng thÓ vµo ®©y bÕ quan tu luyÖn.");
        end;
    end;
end;

-- ÌÆÃÅÊ¦ÃÅÖØ¸´ÈÎÎñÈë¿Ú
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 5) then		--²»ÊÇÌÆÃÅµÜ×Ó
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö §­êng M«n, nhiÖm vô m«n ph¸i sao cã thÓ ®Ó ng­¬i lµm!", 0)
	elseif (GetPlayerRoute() == 5) then 	--ÊÇÌÆÃÅµÜ×Óµ«ÊÇ»¹Ã»ÓĞÈ¥°İÊ¦
		Say("H·y t×m Thiªn TiÕu tæng qu¶n häc vâ c«ng tr­íc råi quay l¹i ®©y nhËn nhiÖm vô.", 0)
	else  	--ÌÆÃÅµÜ×Ó£¬ÇÒÒÑ¾­°İÊ¦
		task_main_entrance(TASK_ID_TANGMEN);
	end
end;

function shimenshuoming()
		Say("<color=green>ThuyÕt minh ®é cèng hiÕn s­ m«n<color>: \n <color=yellow>§é cèng hiÕn s­ m«n<color>: Th«ng qua viÖc hoµn thµnh nhiÖm vô S­ M«n ®¹t ®Õn mét ®¼ng cÊp nhÊt ®Şnh, b¹n cã thÓ nhËn ®­îc trang phôc hoÆc vò khİ cña S­ M«n. \n <color=yellow>Giíi h¹n ®é cèng hiÕn s­ m«n<color>: HiÖn nay ®é cèng hiÕn S­ M«n kh«ng bŞ h¹n chÕ, chØ cÇn hoµn thµnh nhiÖm vô th× cã thÓ n©ng cao ®é cèng hiÕn. \n <color=yellow>Sù kiÖn Vâ L©m<color>: Lµm xong nhiÖm vô cè ®Şnh sÏ nhËn thªm mét nhiÖm vô ngÉu nhiªn, hoµn thµnh sÏ nhËn ®­îc 50 ®iÓm cèng hiÕn S­ m«n vµ cã kh¶ n¨ng nhËn ®­îc mËt tŞch s­ m«n.", 
			1,
			"Trang kÕ/shuoming2")		
end;

function shuoming2()
		Say("<color=green>ThuyÕt minh ®é cèng hiÕn s­ m«n<color>: \n <color=yellow>Giíi h¹n ®¼ng cÊp ®é cèng hiÕn S­ M«n<color>: §¼ng cÊp kh¸c nhau th× ®iÓm tİch lòy ®é cèng hiÕn còng kh«ng gièng nhau. §é cèng hiÕn S­ M«n cµng cao cµng n©ng cao ®¼ng cÊp cña m×nh, tõ sau cÊp 75 th× kh«ng cßn giíi h¹n ®é cèng hiÕn n÷a. \n <color=yellow>§iÓm kinh nghiÖm ngÉu nhiªn<color>. Lµm nhiÒu nhiÖm vô s­ m«n ®é cèng hiÕn cµng cao ®iÓm kinh nghiÖm cµng nhiÒu. §iÓm cèng hiÕn <3000 <color=yellow>§iÓm kinh nghiÖm t­¬ng ®èi<color>, >3000 <color=yellow>®iÓm kinh nghiÖm cµng nhiÒu<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- Ã»ÓĞ¼ÓÈëÃÅÅÉ
		Say("Muèn lµm nhiÖm vô s­ m«n tr­íc tiªn ph¶i gia nhËp bæn gi¸o. Sau ®ã h·y gia nhËp tr­êng ph¸i, råi quay l¹i chç ta nhËn nhiÖm vô. Sau khi hoµn thµnh nhiÖm vô s­ m«n sÏ nhËn ®­îc ®é cèng hiÕn s­ m«n, tİch lòy ®é cèng hiÕn nhÊt ®Şnh cã thÓ mua vËt phÈm bİ truyÒn bæn m«n.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 5) then	-- ²»ÊÇ±¾ÃÅµÜ×Ó
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña bæn gi¸o, h·y vÒ m«n ph¸i cña ng­¬i mµ tra xem ®é cèng hiÕn s­ m«n nhĞ. Giao diÖn F3 còng cã thÓ tra xem ®é cèng hiÕn s­ m«n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>§­êng Së Hång<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--ĞÂµÄÈë¿Ú
function main_new()
	local selTab = {
				"Khëi nguyªn §­êng M«n/know_qiyuan",
				"Vâ c«ng §­êng M«n/know_wugong",
				"§iÒu kiÖn nhËp m«n/know_rumentiaojian",
				"T¹i h¹ muèn gia nhËp §­êng M«n/intertangmen",
				"Ta muèn lµm nhiÖm vô S­ M«n/about_faction_task",
				"Liªn quan tu luyÖn./practice",
				"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(5)",
				"VÊn an L·o L·o/no",
				}
	if (GetPlayerRoute() == 6)  then
		tinsert(selTab, 1, "NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "§Ö tö xin kİnh d©ng s­ phô trµ hoa cóc vµ b¸nh b¸ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 5)");
	end
--	tinsert(selTab,8,"ÎäÁÖÕù°ÔÕ½Ïà¹Ø/wulin_zhengba");		
	Say(g_szInfoHead.."§­êng M«n kh«ng ph¶i lµ n¬i cã thÓ tuú tiÖn ra vµo, cã chuyÖn g× mau nãi ®i, nÕu kh«ng th× mêi lïi b­íc!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."§­êng M«n thuéc ®Êt Thôc, ®· mÊy tr¨m n¨m hïng cø t¹i ®Êt Thôc, næi tiÕng trªn vâ l©m vÒ 4 m«n: ho¶ khİ, ¸m khİ, c¹m bÉy, dïng ®éc. §­êng M«n ®Şa linh nh©n kiÖt, rÊt giái thiÕt kÕ, ph¸t minh c¸c lo¹i ¸m khİ vµ c¬ quan míi, cã uy lùc kinh ng­êi. V× §­êng M«n rÊt hiÕm khi hµnh tÈu giang hå, n¬i ë l¹i trµn ngËp c¬ quan, ¸m khİ, khã x©m nhËp, cho nªn §­êng M«n tuy cã danh tiÕng trªn giang hå, nh­ng kh«ng muèn cho ng­êi kh¸c nh×n thÊy khu«n mÆt cña m×nh. Kh«ng muèn kÕt giao víi danh m«n chİnh ph¸i, còng kh«ng giao du víi tµ ma ngo¹i ®¹o, thiÖn ¸c tuú t©m, tù do tù t¹i.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Vâ c«ng §­êng M«n kh«ng chia hÖ ph¸i, v× cho dï lµ ¸m khİ, c¬ quan hay dïng ®éc, ®Òu cã mèi liªn hÖ chÆt chÏ víi nhau. §­êng M«n th©n ph¸p nhanh nhÑn, kü thuËt tinh x¶o, sö dông c¬ quan, ¸m khİ tÈm ®éc cã thÓ khiÕn cho kÎ ®Şch r¬i vµo tr¹ng th¸i xÊu, h¹n chÕ hµnh ®éng cña kÎ ®Şch, cã thÓ häc ®­îc vâ c«ng trÊn ph¸i HÊp Tinh TrËn."),g_szInfoHead..sf_ConvertColorString("§­êng M«n thô nghiÖp s­ phô lµ tæng qu¶n §­êng Thiªn TiÕu."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh«ng giíi h¹n nam n÷. Tuy kh«ng ph¶i lµ danh m«n chİnh ph¸i, nh­ng §­êng M«n còng rÊt ghĞt bän tiÓu nh©n bØ æi. Nh÷ng ai ch­a gia nhËp m«n ph¸i, kh«ng ph¶i lµ ph¶n ®å cña b¶n ph¸i ®Òu cã thÓ gia nhËp. 'Thµ ®i gÆp Diªm V­¬ng, chí ®ông §­êng M«n lang.' §Ö tö §­êng M«n hµnh tÈu giang hå, tù do tù t¹i, lu«n tËn trung tËn nghÜa víi ng­êi cña b¶n ph¸i.");
end;