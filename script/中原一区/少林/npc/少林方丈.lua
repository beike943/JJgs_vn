--ÔÚĞş´È´¦¼ÓÈëÉÙÁÖ£¬½ÓÊ¦ÃÅÈÎÎñ
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_½­½ò´å\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --ĞŞÁ¶µÄ½Å±¾
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76¼¶ÎäÆ÷Éú»î¼¼ÄÜÈÎÎñ½Å±¾
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--ÕÙ»ØÀÏÍæ¼Ò»î¶¯
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>ThiÕu L©m Gi¸o Chñ <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_SL);
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76¼¶ÎäÆ÷Åä·½Ñ§Ï°ÈÎÎñ
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),1) ~= 1 then
		weapon_76_talk(1,nSkillDetail)
		return
	end
	
	if (nTaskValue==0) then
		main_new();
		return
	elseif (nTaskValue < 7) then
		Say("Cô thÓ nh­ thÕ nµo, thİ chñ gÆp HuyÒn Minh ®Ó hái", 0);
		return
	elseif (nTaskValue == 7) then
		task_014();
		return
	elseif (nTaskValue >= 9) then
		fix_sl();
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
	Say("C«ng viÖc bËn rén, ta quªn nhiÖm vô cña ng­¬i råi. Xem nh­ lÇn nµy ta thö ng­¬i! B©y giê ta gióp ng­¬i hñy nhiÖm vô tr­íc, nh­ng ph¶i trõ ng­¬i 5 ®iÓm cèng hiÕn s­ m«n, ng­¬i x¸c ®Şnh ch­a??", 
		2,
		"§­îc, ta ®ång ı/confirm_repair_bug",
		"§Ó ta nghÜ c¸ch kh¸c/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Ta ®· hñy gióp ng­¬i råi!", 0)
end;

function intershaolin()		--¼ÓÈëÃÅÅÉ
	if ((GetTask(1002) > 0) or 
		(GetTask(1003) > 0) or 
		(GetTask(1004) > 0) or 
		(GetTask(1005) > 0) or 
		(GetTask(1031) > 0) or 
		(GetTask(1032) > 0) or 
		(GetTask(1033) > 0)) then --ÈëÃÅÈÎÎñ¼ì²â
		Say("Thİ chó ®· cã ı gia nhËp m«n ph¸i kh¸c, bÇn t¨ng ®©y kh«ng tiÔn.", 0);
	elseif GetSex() == 2 then	--ĞÔ±ğ¼ì²â
		Say("Trong tù toµn nam nh©n, kh«ng thu nhËn <color=yellow>n÷ giíi<color>, mêi thİ chñ ®i n¬i kh¸c!", 0);
	elseif GetLevel() < 10 then	--µÈ¼¶¼ì²â
		Say("§¼ng cÊp thİ chñ kh«ng ®ñ, ®¹t <color=yellow>cÊp 10<color> ®Õn t×m ta!", 0);
	elseif GetPlayerFaction() == 1 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i ®· lµ ®Ö tö ThiÕu L©m, ®Õn ®©y g©y rèi lµm g×?", 0);
	elseif GetPlayerFaction() > 1 then	--ÃÅÅÉ¼ì²â
		Say("Thİ chñ ®· cã m«n ph¸i ®õng trªu ghÑo l·o n¹p!", 0);
	else
		task_001();
		return
	end
end;

function gettask()
	if GetPlayerFaction() ~= 1 then
		Say("Thİ chñ kh«ng ph¶i ®Ö tö bæn ph¸i, kh«ng d¸m lµm phiÒn!", 0);
	else
		taskmain("HuyÒn Tõ", 1)
	end
end;


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 20 then
        task_20_00();
        return
    elseif nStep == 21 then
        task_21_00();
        return
    elseif nStep == 30 then
        task_30_00();
        return
    end;
    
	Say("A Di §µ PhËt!");
end;

function practice()
    if GetPlayerFaction() ~= 1 then
       Talk(1, "", "Thİ chñ kh«ng ph¶i ®Ö tö cña ThiÕu L©m, kh«ng thÓ ®Õn ®©y tu luyÖn.");
    else
        if GetItemCount(2, 0, 205) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say("Cã ph¶i vµo ®©y tu luyÖn?",
            	2,
            	"§óng/practice_start",
            	"Sai/no_practice");
        else
            Talk(1, "", "Ng­¬i kh«ng cã <color=yellow>lÖnh bµi s­ m«n ThiÕu L©m<color>, kh«ng thÓ vµo tu luyÖn.");
        end;
    end;
end;

function no_practice()
	Say("A Di §µ PhËt!");
end;

-- ÉÙÁÖÊ¦ÃÅÖØ¸´ÈÎÎñµÄÈë¿Ú
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 1) then
		Say("ChØ cã ®Ö tö ThiÕu L©m míi cã thÓ cèng hiÕn cho bæn ph¸i.", 0);
	elseif (GetPlayerRoute() == 1) then 
		Say("Ng­¬i nªn ®Õn c¸c m«n ph¸i kh¸c b¸i s­ häc vâ, cèng hiÕn søc lùc cña m×nh.!", 0);
	elseif (GetPlayerRoute() == 2) then
		task_main_entrance(TASK_ID_SHAOLIN_SUJIA);			-- Ë×¼Ò
	elseif (GetPlayerRoute() == 3) then
		task_main_entrance(TASK_ID_SHAOLIN_CHANSENG);		-- ìøÉ®
	else
		task_main_entrance(TASK_ID_SHAOLIN_WUSENG);			-- ÎäÉ®
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
	
	if (GetPlayerFaction() ~= 1) then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña bæn gi¸o, h·y vÒ m«n ph¸i cña ng­¬i mµ tra xem ®é cèng hiÕn s­ m«n nhĞ. Giao diÖn F3 còng cã thÓ tra xem ®é cèng hiÕn s­ m«n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>HuyÒn Tõ<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--ĞÂµÄÈë¿Ú
function main_new()
	local selTab = {
				"ThiÕu L©m ph¸i/know_qiyuan",
				"Vâ c«ng ThiÕu L©m ph¸i/know_wugong",
				"§iÒu kiÖn nhËp m«n/know_rumentiaojian",
				"Ta muèn gia nhËp ThiÕu L©m/intershaolin",
				"Ta muèn lµm nhiÖm vô S­ M«n/about_faction_task",
				"Liªn quan tu luyÖn./practice",
				"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(1)",
				"VÊn an Ph­¬ng Tr­îng/no",
				}
	if (GetPlayerRoute() == 2) or (GetPlayerRoute() == 3) or (GetPlayerRoute() == 4) then
		tinsert(selTab, 1, "NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_32");
	end
--	tinsert(selTab,8,"ÎäÁÖÕù°ÔÕ½Ïà¹Ø/wulin_zhengba");		
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "§Ö tö xin kİnh d©ng s­ phô trµ hoa cóc vµ b¸nh b¸ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 1)");
	end
	Say(g_szInfoHead.."A di ®µ phËt! ThiÕu L©m tù x­a nay yªn tŞnh, chí g©y ån µo, lµm phiÒn ®Õn thiÖn nh©n.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Ngôy HiÕu V¨n §Õ th¸i hßa 19 n¨m, Thiªn Tróc T¨ng Nh©n B¹t §µ tõ T©y T¹ng ®Õn trung nguyªn, ®­îc HiÕu V¨n §Õ quı träng. B¹t §µ nh×n thÊy Tung S¬n nh­ mét ®ãa hoa sen, bÌn lËp tù ë ®ã, më ra ThiÕu L©m. 30 n¨m sau, Nam Thiªn Tróc T¨ng Nh©n §¹t Ma ®Õn ThiÕu L©m, truyÒn d¹y ThiÒn c«ng, vâ nghÖ, ThiÕu L©m ngµy mét h­ng thŞnh. §Çu thêi §­êng, TÇn V­¬ng Lı ThÕ D©n vµ V­¬ng ThÕ Sung chiÕn tranh ë L¹c D­¬ng, ba th¸ng rßng ch­a døt, ®· mêi 30 ThiÕu L©m vâ t¨ng xuÊt trËn, liÒn giµnh th¾ng lîi, ThiÕu L©m vang danh thiªn h¹ tõ ®ã.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("ThiÕu L©m cã 72 tuyÖt kü, 3 ®­êng vâ häc. Vâ t¨ng {Néi c«ng}, luyÖn ThiÕu L©m QuyÒn C­íc Vâ NghÖ, së tr­êng vÒ chiªu thøc liªn hoµn, g©y s¸t th­¬ng cho ®èi thñ ë diÖn réng, cã thÓ häc vâ c«ng trÊn ph¸i {Nh­ Lai ThÇn Ch­ëng}. Tôc gia {G©n cèt}, luyÖn ThiÕu L©m §ao C«n Vâ NghÖ, m¹nh vÒ phßng ngù, cã n¨ng lùc phßng ngù cao ë cù ly gÇn, cã thÓ häc vâ c«ng trÊn ph¸i {DŞch c©n kinh}. ThiÒn t«ng {néi c«ng}, luyÖn ThiÕu L©m Néi Gia Vâ NghÖ, dïng thiÒn tr­îng tÊn c«ng xa, cã thÓ häc vâ c«ng trÊn ph¸i {TÈy tñy kinh}."),g_szInfoHead..sf_ConvertColorString("S­ phô vâ t¨ng lµ §¹t Ma §­êng Thñ Täa {HuyÒn Khæ §¹i S­}, s­ phô tôc gia lµ Ban Nh­îc §­êng Thñ Täa {HuyÒn Bi §¹i S­}; s­ phô thiÒn t¨ng lµ Tµng Kinh C¸c Thñ Täa {HuyÒn H«i §¹i S­}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."ThiÕu L©m tõ khi khai t«ng ®Õn nay, chØ thu nam ®Ö tö, ch­a gia nhËp m«n ph¸i kh¸c, kh«ng ph¶i ph¶n ®å ThiÕu L©m ®Òu cã thÓ nhËp m«n. ThiÕu L©m cã 5 ®¹i khiÕt: S¸t sinh, väng ng÷, d©m tµ, th©u ®¹o, hu©n töu, ®Ö tö ThiÕu L©m ph¶i tu©n thñ tuyÖt ®èi. 30 tiÓu khiÕt, kh«ng ®­îc xem nhÑ.");
end;
