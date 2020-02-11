--ÔÚÕÆÈÇÊ¦Ì«´¦¼ÓÈëÉÙÁÖ£¬½ÓÊ¦ÃÅÈÎÎñ
Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\practice\\practice_main.lua"); --ĞŞÁ¶µÄ½Å±¾
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76¼¶ÎäÆ÷Éú»î¼¼ÄÜÈÎÎñ½Å±¾
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--ÕÙ»ØÀÏÍæ¼Ò»î¶¯
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Nga My Gi¸o Chñ<color> : "
function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76¼¶ÎäÆ÷Åä·½Ñ§Ï°ÈÎÎñ
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),3) ~= 1 then
		weapon_76_talk(3,nSkillDetail)
		return
	end
	
	if (nTaskValue==0) then
		main_new();
		return		
	elseif (nTaskValue < 5) then
		Say("<color=yellow>Chu ThiÖn Nh©n<color> ë Thµnh §« phñ lµ ng­êi cã lßng h¶o t©m, y ®ang cøu tÕ d©n chóng ë <color=yellow>Tİn T­íng Tù<color>, ng­¬i h·y gióp y mét tay.",0);
		return
	elseif (nTaskValue == 5) then
		task_013();
		return
	elseif (nTaskValue >= 7) then
		fix_em();
		return
	else
		main_new();
	end
end;

-- Ê¦ÃÅÈÎÎñÏà¹Ø
function about_faction_task()
	Say("A Di §µ PhËt!",
		3,
		"Ta muèn cèng hiÕn cho s­ m«n (nhiÖm vô s­ m«n)/start_faction_tasklink",
		"Ta muèn tra xem ®é cèng hiÕn./check_query_faction_contri",
		"Ta muèn t×m hiÓu ®é cèng hiÕn s­ m«n./shimenshuoming")
--		"ÎÒÒªĞŞ¸´Ê¦ÃÅÈÎÎñÎŞ·¨Íê³ÉµÄÎÊÌâ/repair_faction_bug")
end;

-- ĞŞ¸´É±¹ÖÈÎÎñÎŞ·¨Íê³ÉµÄbug
function repair_faction_bug()
	Say("<color=green>Ch©n Nh­ S­ Th¸i<color>: Bæn m«n gÇn ®©y cã nhiÒu viÖc khiÕn ng­¬i còng bËn rén theo. Xem nh­ ng­¬i cã thªm c¬ héi ®Ó ta luyÖn vËy! B©y giê ta sÏ gióp ng­¬i hñy nhiÖm vô trªn, nh­ng ph¶i trõ 5 ®iÓm cèng hiÕn s­ m«n, ng­¬i thÊy thÕ nµo?", 
		2,
		"§­îc, ta ®ång ı/confirm_repair_bug",
		"§Ó ta nghÜ c¸ch kh¸c/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("<color=green>Ch©n Nh­ S­ Th¸i<color>: Xong råi, ta ®· hñy gióp ng­¬i!", 0)
end;

function interemei()		--¼ÓÈëÃÅÅÉ
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then  --ÈëÃÅÈÎÎñ¼ì²â
		Say("Thİ chñ ®· cã ı ®Şnh chän m«n ph¸i kh¸c, tha lçi cho Nga My ph¸i kh«ng thÓ thu nhËn!",0)
	elseif GetSex()==1 then	--ĞÔ±ğ¼ì²â
		Say("Nga My lµ n¬i thanh tu PhËt m«n, xin Thİ chñ h·y quay b­íc.",0)
	elseif GetLevel() < 10 then	--µÈ¼¶¼ì²â
		Say("§¼ng cÊp thİ chñ kh«ng ®ñ, ®¹t ®Õn <color=yellow>cÊp 10<color> h·y quay l¹i!",0)
	elseif GetPlayerFaction() == 3 then
		Say("Ng­¬i ®· lµ ®Ö tö Nga My, sao hå ®å thÕ?",0)
	elseif GetPlayerFaction() > 0 then	--ÃÅÅÉ¼ì²â
		Say("Thİ chñ ®· cã m«n ph¸i, cã nhÇm lÉn g× ch¼ng?",0)
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 3 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Nga My, sao l¹i muèn häc vâ c«ng bæn ph¸i? Häc lĞn vâ c«ng lµ ®¹i kş trong giang hå, cßn kh«ng mau ®i!",0)
	elseif  GetPlayerRoute() == 7 then 
		Say("Nga My chia lµm: Tôc gia vµ XuÊt gia ®Ö tö. XuÊt gia ®Ö tö häc kiÕm, do <color=yellow>TuÖ T©m S­ Th¸i<color> phô tr¸ch; Tôc gia ®Ö tö häc cÇm, do <color=yellow>HuÖ ¢m S­ Th¸i<color> phô tr¸ch; ng­¬i cã thÓ t×m hä ®Ó b¸i s­ häc nghÖ nh­ng chØ cã thÓ chän mét hÖ ph¸i.",0)
		--end
	elseif  GetPlayerRoute() == 8 then
		Say("Ng­¬i lµ ®Ö tö xuÊt gia, häc vâ c«ng nªn t×m <color=yellow>TuÖ T©m S­ Th¸i<color> míi ph¶i.",0)
	else
		Say("Ng­¬i lµ ®Ö tö tôc gia, häc vâ c«ng nªn t×m <color=yellow>HuÖ ¢m S­ Th¸i<color> míi ph¶i.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 3 then
		Say("Thİ chñ kh«ng ph¶i ®Ö tö Nga My, kh«ng phiÒn Thİ chñ.",0)
	else
		taskmain("Ch©n Nh­ s­ th¸i", 3)
	end
end;				


function no()
end;

function practice()
    if GetPlayerFaction() ~= 3 then
       Talk(1,"","Ng­¬i kh«ng ph¶i ®Ö tö Nga My, kh«ng thÓ ®Õn ®©y tu luyÖn.");
    else
        if GetItemCount(2, 0, 207) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say("Muèn vµo ®©y tu luyÖn?",2,"§óng/practice_start","Sai/no");
        else
            Talk(1,"","Ng­¬i kh«ng cã <color=yellow>LÖnh bµi s­ m«n Nga My<color>, kh«ng thÓ tiÕn hµnh bÕ quan tu luyÖn.");
        end;
    end;
end;

-- ¶ëáÒÊ¦ÃÅÖØ¸´ÈÎÎñµÄÈë¿Ú
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 3) then
		Say("ChØ cã ®Ö tö Nga My míi cã thÓ nhËn nhiÖm vô s­ m«n.", 0);
	elseif (GetPlayerRoute() == 7) then 
		Say("H·y ®Õn gÆp hai vŞ S­ th¸i b¸i s­ häc nghÖ, sau ®ã quay l¹i t×m ta!", 0);
	elseif (GetPlayerRoute() == 8) then
		task_main_entrance(TASK_ID_EMEI_FOJIA);		-- ·ğ¼Ò
	else
		task_main_entrance(TASK_ID_EMEI_SUJIA);		-- Ë×¼Ò
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
	
	if (GetPlayerFaction() ~= 3) then	-- ²»ÊÇ±¾ÃÅµÜ×Ó
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña bæn gi¸o, h·y vÒ m«n ph¸i cña ng­¬i mµ tra xem ®é cèng hiÕn s­ m«n nhĞ. Giao diÖn F3 còng cã thÓ tra xem ®é cèng hiÕn s­ m«n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Ch©n Nh­ S­ Th¸i<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--ĞÂµÄÈë¿Ú
function main_new()
	local selTab = {
				"Nguån gèc Nga My ph¸i/know_qiyuan",
				"Vâ c«ng Nga My ph¸i/know_wugong",
				"§iÒu kiÖn nhËp m«n/know_rumentiaojian",
				"Ta muèn gia nhËp Nga My/interemei",
				"Ta muèn lµm nhiÖm vô S­ M«n/about_faction_task",
				"Liªn quan tu luyÖn./practice",
				"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(3)",
				"VÊn an s­ th¸i/no",
				}
	if (GetPlayerRoute() == 8) or (GetPlayerRoute() == 9)  then
		tinsert(selTab, 1, "NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "§Ö tö xin kİnh d©ng s­ phô trµ hoa cóc vµ b¸nh b¸ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 3)");
	end
--	tinsert(selTab,8,"ÎäÁÖÕù°ÔÕ½Ïà¹Ø/wulin_zhengba");				
	Say(g_szInfoHead.."Nga My s¬n c¶nh trİ tuyÖt mü, xin mêi ra ngoµi ngo¹n c¶nh!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."TuyÖt kü Nga My lµ ®iÖu móa kiÕm cã tõ thêi §­êng nh­ng ®­êng kiÕm uyÓn chuyÓn kh«ng gièng kiÕm ph¸p cña nam nh©n, giang hå gäi lµ Ngäc N÷ kiÕm ph¸p hoÆc Nga My kiÕm. Sau ®ã cã ®Ö tö ®Õn nói Nga My khai s¬n lËp ph¸i nªn hµi ©m víi tªn gäi tõ ®ã truyÒn cho ®Õn nay.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Nga My chia ra hai ®­êng PhËt gia, Tôc gia. PhËt gia chñ tu PhËt ph¸p néi c«ng, häc Nga My trŞ th­¬ng ®Ó håi phôc t©m ph¸p, hç trî lµ chİnh, sö kiÕm ®Ó t¨ng thùc lùc cña ®ång ®éi, cã thÓ häc vâ c«ng trÊn ph¸i V¹n T­íng ThÇn C«ng. Tôc gia chñ tu néi khİ, häc Nga My ®µn ®Ó chÕ ngù t©m ph¸p cña ®Şch, lµm cho ®Şch nh©n t©m trİ bÊn lo¹n, dïng tiÕng ®µn ®Ó lµm gi¶m søc chiÕn ®Êu cña ®Şch, chÕ ngù hµnh ®éng cña chóng, cã thÓ häc vâ c«ng trÊn ph¸i Thiªn ¢m TrÊn Hån Khóc."),g_szInfoHead..sf_ConvertColorString("PhËt gia thô nghiÖp s­ phô lµ TuÖ T©m s­ th¸i, Tôc gia thô nghiÖp s­ phô lµ TuÖ ¢m s­ th¸i."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Nga My ph¸i x­a nay chØ thu nhËn n÷ ®Ö tö, kh«ng lµm viÖc ¸c, ch­a gia nhËp m«n ph¸i kh¸c, kh«ng ph¶i lµ ph¶n ®å cña b¶n ph¸i. §Ö tö Nga My ph¶i dïng PhËt t©m ®Ó phæ ®é chóng sinh, hµnh tÈu giang hå ®Ó cøu nh©n ®é thÕ, b¶o vÖ b¸ch tİnh.");
end;