
-- ¶ÁÈëÈÎÎñÒıÇæÍ·ÎÄ¼ş
Include("\\script\\lib\\task_main.lua");

--ÔÚ×Ïº×ÕæÈË´¦¼ÓÈëÎäµ±£¬½ÓÊ¦ÃÅÈÎÎñ
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş

Include("\\script\\task\\faction\\faction_main_wd.lua"); -- ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş

Include("\\script\\task\\practice\\practice_main.lua"); --ĞŞÁ¶µÄ½Å±¾

-------ÏåÑôÈÎÎñ------
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");
----------------------
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76¼¶ÎäÆ÷Éú»î¼¼ÄÜÈÎÎñ½Å±¾
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--ÕÙ»ØÀÏÍæ¼Ò»î¶¯
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Vâ §ang Gi¸o Chñ <color>: "

function main()
	local nTaskValue = FN_GetTaskState(FN_WD);
	local strMain_001 = {
	"Ng­¬i biÕt ng­¬i ®· lµm sai mét chuyÖn råi kh«ng!",
	"ı s­ phô lµ?",
	"B×nh gèm cña T­ M· Th¸i Thó ë T­¬ng D­¬ng tuy kh«ng ®¸ng gi¸ nh­ng bªn trong nã cã giÊu m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn Hoµng Th­îng ®ang b¾t c¸c quan phñ ®Şa ph­¬ng mau chãng t×m vËt ®ã, tªn Th¸i Thó cã ı t¹o ph¶n v× thÕ kh«ng chŞu giao nép m¶nh b¶n ®å nµy.",
	"GÇn ®©y cã ng­êi nghe T­ M· Th¸i Thó t­ th«ng víi n­íc Liªu, cã kh¶ n¨ng sÏ chuyÓn tÊm b¶n ®å nµy ra quan ngo¹i, nÕu ®Ó tÊm b¶n ®å S¬n Hµ X· T¾c r¬i vµo tay n­íc Liªu th× §¹i Tèng ta gÆp ®¹i ho¹n!",
	"Ta cã nhê bang chóng ë trªn Phôc Ng­u s¬n ra mÆt nµo ngê l¹i bŞ ng­¬i ®o¹t lÊy!",
	"……Xem ra lçi lµ ë do t¹i h¹ ph¶i do t¹i h¹ bï ®¾p.",
	"HiÖn giê tªn Th¸i Thó ch¾c ®ang ®Şnh chuyÓn m¶nh b¶n ®å ra quan ngo¹i, ng­¬i mau ®Õn T­¬ng D­¬ng t×m <color=yellow>Xa phu<color> hái cã ng­¬i trong phñ Th¸i Thó ra ngoµi kh«ng?",
	"§Ö tö lËp tøc lªn ®­êng!"
}
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76¼¶ÎäÆ÷Åä·½Ñ§Ï°ÈÎÎñ
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),2) ~= 1 then
		weapon_76_talk(2,nSkillDetail)
		return
	end

	if CTask:IsTaskStart("T­¬ng D­¬ng_t×m Tö H¹c Ch©n Nh©n")==1 then
		CTask:TalkEx("task_yes_001", strMain_001);
		return
	end;
	
	if CTask:IsTaskStart("T­¬ng D­¬ng_t×m Xa phu")==1 then
		Say("Ng­¬i mau ®Õn T­¬ng D­¬ng t×m <color=yellow>Xa phu<color> hái xem Th¸i Thó cã ph¸i ng­êi chuyÓn m¶nh b¶n ®å S¬n Hµ X· T¾c ®i ch­a!",0);
		return
	end;

	if (nTaskValue==0) then
		main_new();
		return
	elseif (nTaskValue==1) or (nTaskValue==2) then
	
		Say("ChuyÖn nhËp m«n ng­¬i cã thÓ t×m <color=yellow>Tr­¬ng Ngä D­¬ng<color> th­¬ng l­îng.",0);
		return
				
	elseif (nTaskValue==3) then
	
		task_011();
		return
	elseif (nTaskValue>=5) then
	
		fix_wd();
		return
		
	else
		main_new();
	end
end;

-- Ê¦ÃÅÈÎÎñÏà¹Ø
function about_faction_task()
	Say("T×m BÇn ®¹o cã viÖc g×?",
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

-- ¿ªÊ¼ĞÂµÄÈÎÎñ£¬È¥ÕÒ³µ·ò
function task_yes_001()
	CTask:FinishTask("T­¬ng D­¬ng_t×m Tö H¹c Ch©n Nh©n");
	CTask:PayAward("T­¬ng D­¬ng_t×m Tö H¹c Ch©n Nh©n");
	CTask:StartTask("T­¬ng D­¬ng_t×m Xa phu");
	return
end;

function interwudang()		--¼ÓÈëÃÅÅÉ
	if (GetTask(1001)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then
		Say("Ng­¬i ®· gia nhËp m«n ph¸i kh¸c, thø lçi §­êng M«n ta kh«ng tiÖn thu n¹p!",0)
	elseif GetLevel() < 10 then	--µÈ¼¶¼ì²â
		Say("Muèn trë thµnh ®Ö tö Vâ §ang ph¶i cã t­ chÊt nhÊt ®Şnh míi ®­îc. Ng­¬i ®¹t ®Õn <color=yellow>cÊp 10<color> h·y quay l¹i!",0)
	elseif GetPlayerFaction() == 2 then	--ÃÅÅÉ¼ì²â
		Say("Hå ®å! Ng­¬i ®· gia nhËp Vâ §ang, sao mau quªn thÕ!",0)
	elseif GetPlayerFaction() > 0 then	--ÃÅÅÉ¼ì²â
		Say("C¸i g×? Lµm lo¹n ë m«n ph¸i kh¸c ch­a ®ñ cßn muèn ®Õn Vâ §ang ta kiÕm chuyÖn?",0)
	else
		task_001();
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 2 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö Vâ §ang! Thø lçi BÇn ®¹o kh«ng tiÖn nãi râ.",0)
	elseif  GetPlayerRoute() == 13 then 
		Say("Vâ §ang m«n ®å chia lµm 2 hÖ §¹o gia vµ Tôc gia, <color=yellow>§¹o gia<color> ®Ö tö do <color=yellow>Du ChÊn Sinh<color> truyÒn thô vâ c«ng, <color=yellow>Tôc gia<color> ®Ö tö do <color=yellow>§¹i KiÕm Ch©u<color> truyÒn thô vâ c«ng. Mçi ng­êi chØ cã thÓ chän mét hÖ ph¸i.",0)
	elseif  GetPlayerRoute() == 14 then
		Say("Ng­¬i lµ <color=yellow>§¹o gia<color> ®Ö tö, muèn häc vâ c«ng ph¶i t×m <color=yellow>Du ChÊn Sinh<color>.",0)
	else 
		Say("Ng­¬i lµ <color=yellow>Tôc gia<color> ®Ö tö, muèn häc vâ c«ng ph¶i t×m <color=yellow>§¹i KiÕm Ch©u<color>.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 2 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Vâ §ang! Kh«ng d¸m lµm phiÒn!",0)
	else
		taskmain("Tö H¹c ch©n nh©n", 2)
	end
end;				

function no()

end;

function task_xy()
-------ÏåÑôÈÎÎñ------


    local nStep = GetTask(TASK_XYTY);
    if nStep == 2 then
        task_02_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    elseif nStep == 5 then
    	task_05_00();
    	return
    elseif nStep == 6 then
        task_06_00();
        return
    elseif nStep == 8 then
        task_08_00();
        return
    elseif nStep == 14 then
        task_14_00();
        return
    elseif nStep == 15 then
        task_15_00();
        return
    elseif nStep == 19 then
        task_19_00();
        return
    elseif nStep == 21 then
        task_21_00();
        return
    elseif nStep == 50 then
        task_50_00();
        return
    elseif nStep == 51 then
        task_51_00();
        return
    elseif nStep == 52 then
        task_52_00();
        return
    end;

    local nStep = GetTask(TASK_XY_TWO);
    if nStep == 1 then
        two_01_00();
        return
    elseif nStep == 2 then
        two_02_00();
        return
    elseif nStep == 3 then
        two_03_00();
        return
    end;
end;

function practice()
    if GetPlayerFaction() ~= 2 then
       Talk(1,"","Ng­¬i kh«ng ph¶i ®Ö tö Vâ §ang, kh«ng thÓ vµo bæn ph¸i luyÖn c«ng.");
    else
        if GetItemCount(2, 0, 206) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say("Muèn vµo ®©y luyÖn c«ng?",2,"§óng/practice_start","Sai/no");
        else
            Talk(1,"","Ng­¬i kh«ng cã <color=yellow>lÖnh bµi m«n ph¸i Vâ §ang<color>, kh«ng thÓ vµo ®©y bÕ quan luyÖn c«ng.");
        end;
    end;
end;

-- Îäµ±Ê¦ÃÅÖØ¸´ÈÎÎñµÄÈë¿Ú
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 2) then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö Vâ §ang, thø lçi BÇn ®¹o kh«ng tiÖn giao phã.", 0);
	elseif (GetPlayerRoute() == 13) then 
		Say("Ng­¬i h·y chän mét trong hai hÖ ph¸i §¹o gia hoÆc Tôc gia råi ®Õn ®©y tiÕp nhËn nhiÖm vô còng ch­a muén.", 0);
	elseif (GetPlayerRoute() == 14) then
		task_main_entrance(TASK_ID_WUDANG_DAOJIA);		-- µÀ¼Ò
	else 
		task_main_entrance(TASK_ID_WUDANG_SUJIA);		-- Ë×¼Ò
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
	
	if (GetPlayerFaction() ~= 2) then	-- ²»ÊÇ±¾ÃÅµÜ×Ó
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña bæn gi¸o, h·y vÒ m«n ph¸i cña ng­¬i mµ tra xem ®é cèng hiÕn s­ m«n nhĞ. Giao diÖn F3 còng cã thÓ tra xem ®é cèng hiÕn s­ m«n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Tö H¹c Ch©n Nh©n<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--ĞÂµÄÈë¿Ú
function main_new()
	local selTab = {
				"Nguån gèc Vâ §ang ph¸i /know_qiyuan",
				"Vâ c«ng Vâ §ang ph¸i/know_wugong",
				"§iÒu kiÖn nhËp m«n/know_rumentiaojian",
				"Ta muèn gia nhËp Vâ §ang/interwudang",
				"Ta muèn lµm nhiÖm vô S­ M«n/about_faction_task",
				"Liªn quan tu luyÖn./practice",
				"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(2)",
				"VÊn an ch©n nh©n/task_xy",
				}
	if (GetPlayerRoute() == 14) or (GetPlayerRoute() == 15)  then
		tinsert(selTab, 1, "NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_32");
	end
--	tinsert(selTab,8,"ÎäÁÖÕù°ÔÕ½Ïà¹Ø/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "§Ö tö xin kİnh d©ng s­ phô trµ hoa cóc vµ b¸nh b¸ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 2)");
	end
	Say(g_szInfoHead.."Xin mêi ngo¹n c¶nh, Vâ §ang s¬n lµ n¬i s¬n thanh thuû tó hiÕm thÊy trªn thÕ gian!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."L·o Tö më ®Çu §¹o gia, hËu thÕ chia lµm 2 hÖ ph¸i Thiªn S­ vµ ThuÇn D­¬ng. Thiªn S­ luyÖn phï, ThuÇn D­¬ng luyÖn ®¬n. Vâ §ang thuéc hÖ ThuÇn D­¬ng. Vâ §ang s¬n Th¸i Hoµ cung ®­îc dùng lªn vµo thêi §­êng, t«n Ch©n Vâ ®¹i ®Õ lµm thÇy. Vâ c«ng b¶n ph¸i chñ yÕu thiªn vÒ h­, lÊy néi chèng ngo¹i. Cã nhiÒu cao nh©n ngµy x­a, ®Õn ngµy nay vÉn ®­îc giang hå kİnh träng.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Vâ §ang chia thµnh 2 hÖ vâ c«ng §¹o gia vµ Tôc gia. §¹o gia chñ tu néi c«ng, tu luyÖn Vâ §ang néi gia t©m ph¸p, lÊy néi c«ng th©m hËu lµm träng, lÊy tiªn thiªn kiÕm khİ ®Ó ®¸nh b¹i ®Şch thñ, cã thÓ häc vâ c«ng trÊn ph¸i V« Th­îng Th¸i Cùc KiÕm. Tôc gia cã thÓ tù th©n linh ®éng, tu luyÖn Vâ §ang bót ph¸p, dïng ®ßn tÊn c«ng nhanh liªn tôc ®Ó ®¸nh b¹i ®èi ph­¬ng, cã thÓ häc vâ c«ng trÊn ph¸i Th¸i Cùc ThÇn C«ng."),g_szInfoHead..sf_ConvertColorString("§¹o gia thô nghiÖp s­ phô lµ Du ChÊn Sinh, Tôc gia thô nghiÖp s­ phô lµ §¹i KiÕm Ch©u."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh«ng giíi h¹n nam n÷, ph¶i lµ ng­êi kh«ng lµm viÖc ¸c, ch­a gia nhËp m«n ph¸i, kh«ng ph¶i lµ ph¶n ®å cña b¶n ph¸i ®Òu cã thÓ gia nhËp. §Ö tö Vâ §ang kh«ng ®­îc lµm viÖc ¸c, kh«ng ®­îc kÕt giao víi tµ ma ngo¹i ®¹o, khi hµnh tÈu giang hå ph¶i gi÷ g×n thanh quy, hµnh hiÖp tr­îng nghÜa.");
end;