Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --ĞŞÁ¶µÄ½Å±¾
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_½­½ò´å\\task_main.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76¼¶ÎäÆ÷Éú»î¼¼ÄÜÈÎÎñ½Å±¾
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--ÕÙ»ØÀÏÍæ¼Ò»î¶¯
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>C¸i Bang Gi¸o Chñ <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_GB)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76¼¶ÎäÆ÷Åä·½Ñ§Ï°ÈÎÎñ
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),5) ~= 1 then
		weapon_76_talk(5,nSkillDetail)
		return
	end

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_008();
		return
	elseif (nTaskValue==1) then
		Say("Cã r­îu thŞt h·y ®Ó c¸c huynh ®Ö trong bang dïng tr­íc! Ta lµ bang chñ, ®õng lo cho ta!",0);
		return
	elseif (nTaskValue>=3) then
		fix_gb()
		return
	else
		main_new();
	end
end;

-- Ê¦ÃÅÈÎÎñÏà¹Ø
function about_faction_task()
	Say("Khµ khµ! Ng­¬i t×m L·o KhiÕu Hãa cã chuyÖn chi?",
		3,
		"Ta muèn cèng hiÕn cho s­ m«n (nhiÖm vô s­ m«n)/start_faction_tasklink",
		"Ta muèn tra xem ®é cèng hiÕn./check_query_faction_contri",
		"Ta muèn t×m hiÓu ®é cèng hiÕn s­ m«n./shimenshuoming")
--		"ÎÒÒªĞŞ¸´Ê¦ÃÅÈÎÎñÎŞ·¨Íê³ÉµÄÎÊÌâ/repair_faction_bug")
end;

-- ĞŞ¸´É±¹ÖÈÎÎñÎŞ·¨Íê³ÉµÄbug
function repair_faction_bug()
	Say("Bæn bang c«ng viÖc rÊt nhiÒu, ta quªn nhiÖm vô cña ng­¬i råi. Xem nh­ lÇn nµy ta thö ng­¬i! B©y giê ta gióp ng­¬i hñy nhiÖm vô tr­íc, nh­ng ph¶i trõ ng­¬i 5 ®iÓm cèng hiÕn s­ m«n, ng­¬i x¸c ®Şnh ch­a?", 
		2,
		"§­îc, ta ®ång ı/confirm_repair_bug",
		"§Ó ta nghÜ c¸ch kh¸c/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("Ta ®· hñy gióp ng­¬i råi!", 0)
end;

function intergaibang()		--¼ÓÈëÃÅÅÉ
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0)  or (GetTask(1033)>0) then --ÈëÃÅÈÎÎñ¼ì²â
		Say("B»ng h÷u ®· cã ı ®Õn m«n ph¸i kh¸c, C¸i Bang ta còng kh«ng tiÖn gi÷ ch©n!",0)
	elseif GetLevel() < 10 then	--µÈ¼¶¼ì²â
		Say("KhiÕu Hãa Tö cuéc sèng thanh bÇn, sèng ®êi lang b¹t! B»ng h÷u kh«ng t×m ®­îc ®©u! Chi b»ng <color=yellow>cÊp 10<color> h·y ®Õn!",0)
	elseif GetPlayerFaction() == 4 then	
		Say("TiÓu KhiÕu Hãa Tö! L¹i ®Õn gióp vui cho bang chñ µ? Cßn kh«ng mau ®i t×m KhiÕu Hãa Kª cho ta!?",0)
	elseif GetPlayerFaction() > 0 then	
		Say("Ch¼ng ph¶i ng­¬i ®· cã m«n ph¸i råi sao?",0)
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 4 then
		Say("Kh«ng ph¶i ®Ö tö C¸i Bang, kh«ng thÓ häc ®­îc vâ c«ng bæn ph¸i!",0)
	elseif  GetPlayerRoute() == 10 then 
		Say("Bang chóng C¸i Bang ta chia lµm 2 ph¸i <color=yellow>TŞnh Y<color> vµ <color=yellow>¤ Y<color>. Vâ c«ng TŞnh Y ph¸i do Hé C«n tr­ëng l·o <color=yellow>M· TŞnh Sinh<color> truyÒn thô. Vâ c«ng ¤ Y ph¸i do Tr× B¸t tr­ëng l·o <color=yellow>Tèng Nguyªn An<color> truyÒn thô. H·y suy nghÜ cÈn thËn, chän hÖ ph¸i råi t×m c¸c tr­ëng l·o thØnh gi¸o vâ c«ng!",0)
	elseif  GetPlayerRoute() == 11 then
		Say("§Ö tö <color=yellow>TŞnh Y<color> nªn t×m <color=yellow>M· tr­ëng l·o<color> häc vâ c«ng míi ®óng!",0)
	else 
		Say("§Ö tö <color=yellow>¤ Y<color> nªn t×m <color=yellow>Tèng tr­ëng l·o<color> häc vâ c«ng míi ®óng!",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 4 then
		Say("Ng­¬i ch¼ng ph¶i ®Ö tö C¸i Bang, KhiÕu Hãa Tö ta ch¼ng d¸m lµm phiÒn!",0)
	else
		taskmain("Long T¹i Thiªn", 4)
	end
end;				


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 31 then
        task_31_00();
        return
    end;
end;


function StartTask001()
	local strMain = {
		"Cã viÖc g× kh«ng?",
		"Ta phông lÖnh Tèng Giang ®¹i ca ë L­¬ng S¬n B¹c nhê Long Bang chñ ph¸i cao thñ ®Õn chÕ ngù quan binh!",
		"M¸u ch¹y ruét mÒm, ta nhÊt ®Şnh sÏ ra tay gióp søc. Nh­ng gÇn ®©y, võa lóc C¸i Bang ta s¾p cö hµnh Hiªn Viªn ®¹i héi, cßn nhiÒu viÖc ph¶i lµm, e lµ….",
		"T¹i h¹ cã thÓ gióp ®­îc g× kh«ng?",
		"H·y gióp ta t×m 10 b×nh Tóy Méng Töu ®Ó tæ chøc ®¹i héi! Cö hµnh xong ta sÏ gióp søc cho Tèng ®¹i ca!",
		"§­îc! Ta ®i t×m ngay ®©y!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("S¬n tr¹i Long T¹i Thiªn");
	TaskTip("T×m 10 b×nh Tóy Méng Töu cho C¸i Bang më Hiªn Viªn ®¹i héi!")
end


function FinishTask001()
local strMain = {
	"Long bang chñ! H·y nhËn lÊy 10 b×nh Tóy Méng Töu!",
	"Tèt l¾m! B»ng h÷u qu¶ nhiªn träng ch÷ tİn, C¸i Bang ta còng kh«ng phô lßng. B»ng h÷u cø trë vÒ nãi víi Tèng ®Çu lÜnh, cö hµnh xong Hiªn Viªn ®¹i héi, C¸i Bang ta sÏ ®Õn ngay!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("S¬n tr¹i Long T¹i Thiªn")
	CTask:PayAward("S¬n tr¹i Long T¹i Thiªn")
end;

function practice()
    if GetPlayerFaction() ~= 4 then
       Talk(1,"","Kh«ng ph¶i ®Ö tö bæn bang, kh«ng thÓ vµo bang tu luyÖn!");
    else
        if GetItemCount(2, 0, 208) >= 1 then  --Ê¦ÃÅÁîÅÆ
            Say("Vµo tu luyÖn ph¶i kh«ng?",2,"§óng/practice_start","Sai/no_practice");
        else
            Talk(1,"","Ng­¬i ch­a cã <color=yellow>C¸i Bang s­ m«n lÖnh bµi<color>, kh«ng thÓ bÕ quan tu luyÖn!");
        end;
    end;
end;

function no_practice()

end;

-- Ø¤°ïÊ¦ÃÅÖØ¸´ÈÎÎñµÄÈë¿Ú
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 4) then
		Say("Kh«ng ph¶i ®Ö tö C¸i Bang, sao cã thÓ cèng hiÕn cho ta!", 0);
	elseif (GetPlayerRoute() == 10) then 
		Say("Chi b»ng h·y ®Õn c¸c tr­ëng l·o cña bæn bang b¸i s­ häc nghÖ, råi h·y nhËn nhiÖm vô!", 0);
	elseif (GetPlayerRoute() == 11) then
		task_main_entrance(TASK_ID_GAIBANG_JINGYI);			-- ¾»ÒÂ
	else 
		task_main_entrance(TASK_ID_GAIBANG_WUYI);			-- ÎÛÒÂ
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
	
	if (GetPlayerFaction() ~= 4) then	-- ²»ÊÇ±¾ÃÅµÜ×Ó
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña bæn gi¸o, h·y vÒ m«n ph¸i cña ng­¬i mµ tra xem ®é cèng hiÕn s­ m«n nhĞ. Giao diÖn F3 còng cã thÓ tra xem ®é cèng hiÕn s­ m«n.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Long T¹i Thiªn<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--ĞÂµÄÈë¿Ú
function main_new()
	local selTab = {
				"Nguån gèc C¸i Bang/know_qiyuan",
				"Vâ c«ng C¸i Bang/know_wugong",
				"§iÒu kiÖn nhËp m«n/know_rumentiaojian",
				"Ta muèn gia nhËp C¸i Bang/intergaibang",
				"Ta muèn lµm nhiÖm vô S­ M«n/about_faction_task",
				"Liªn quan tu luyÖn./practice",
				"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(4)",
				"Tham kiÕn Bang chñ/no",
				}
	if (GetPlayerRoute() == 11) or (GetPlayerRoute() == 12) then
		tinsert(selTab, 1, "NhiÖm vô ChuyÓn Sinh - C¶i L·o Hoµn §ång/trans_talk_32");
	end
--	tinsert(selTab,8,"ÎäÁÖÕù°ÔÕ½Ïà¹Ø/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "§Ö tö xin kİnh d©ng s­ phô trµ hoa cóc vµ b¸nh b¸ch hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 4)");
	end
	Say(g_szInfoHead.."Mét n¬i lôp xôp nh­ thÕ nµy, mong l­îng thø cho!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Thêi ®¹i nµo còng ®Çy d·y ¨n mµy, nh÷ng ng­êi bŞ n¹n, thuÕ m¸ l¹i cao, n¹n néi chiÕn liªn miªn, thÕ lùc C¸i Bang còng tõ ®ã më réng, hä mét lßng mét d¹ chèng ngo¹i x©m, ph¸t huy bang ph¸i.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("C¸i Bang ph©n thµnh 2 hÖ ¤ Y vµ TŞnh Y. TŞnh Y chuyªn luyÖn vÒ ngo¹i c«ng, chuyªn vÒ C¸i Bang Ch­ëng Ph¸p, chiªu thøc chó träng vÒ tÊn c«ng, dïng quyÒn ®¸nh ra ®ßn chİ m¹ng, cã thÓ häc ®­îc vâ c«ng trÊn ph¸i {Gi¸ng Long ThËp B¸t Ch­ëng}. ¤ Y chó träng th©n ph¸p nhanh nhÑn, chuyªn vÒ C¸i Bang C«n Ph¸p, quyÒn bæng nhanh nhÑn ®iªu luyÖn, dïng ®¶ cÈu bæng tÊn c«ng kÎ thï, cã thÓ häc vâ c«ng trÊn ph¸i {§¶ CÈu C«n TrËn}."),g_szInfoHead..sf_ConvertColorString("S­ phô TŞnh Y lµ Bæng tr­ëng l·o {M· TŞnh Sinh}, S­ phô ¤ Y lµ Ch­ëng B¸t tr­ëng l·o {Tèng Nguyªn An}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh«ng ph©n biÖt nam n÷, xuÊt th©n, chØ cÇn kh«ng lµm ®iÒu ¸c, kh«ng gia nhËp bang ph¸i kh¸c, kh«ng ph¶i lµ ph¶n ®å cña bæn ph¸i. ¡n mµy th× cÇn quy t¾c g× chø? ChØ cÇn tu©n theo qui ®Şnh cña bæn m«n, v× ®¹i nghÜa d©n téc, b¶o vÖ x· t¾c.");
end;