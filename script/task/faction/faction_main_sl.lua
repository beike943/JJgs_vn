
-- ½£ÏÀÇéÔµ II Ê¦ÃÅÈÎÎñ
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

-- ¿ªÊ¼ÓëĞş´È¶Ô»°
function task_001()

local strMain = {
	"Xin thİ chñ tÈy trÇn tr­íc sau ®ã quay l¹i t×m bÇn t¨ng.",
	"Mäi viÖc thİ chñ cã thÓ hái HuyÒn Minh."
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("§i t×m HuyÒn Minh hái chuyÖn nhËp m«n!");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º1
function task_002()

	SetTask(1001,1);

end

-- ÓëĞşÃ÷¶Ô»°
function task_003()

local strMain = {
	"Tr­íc tù cã con suèi nhá, mêi Thİ chñ ®Õn ®ã t×m <color=yellow>Háa C«ng §Çu (177.204)<color> ®Ó tÈy trÇn, sau ®ã h·y quay l¹i t×m ta."
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("§i t×m Háa C«ng §Çu (177.204)!");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º2
function task_004()

	SetTask(1001,2);

end


-- Óë»ï¹¤Í·¶Ô»°
function task_005()

local strMain = {
	"Xin Thİ chñ bè thİ 50 ®ång tiÒn nhang ®Ìn råi h·y tÈy trÇn tŞnh th©n.",
	"§­a 50 ®ång/task_005_okay",
	"Ta kh«ng mang theo tiÒn/task_005_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_005_okay()

	if (Pay(50) == 1) then
	
		-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º3
		SetTask(1001,3);
		
		Say("Thİ chñ h·y tŞnh t©m tr­íc ®·! H·y ®i gÆp Thñ täa HuyÒn Minh ®Ó ®­îc h­íng dÉn!",0);
		RestoreStamina()
		
		TaskTip("Háa C«ng §Çu b¶o b¹n ®i t×m HuyÒn Minh!");
		
	else
		Say("Thİ chñ t×m ®ñ 50 ®ång råi h·y quay l¹i!",0);
	end

end


function task_005_no()

	Say("Thİ chñ t×m ®ñ 50 ®ång råi h·y quay l¹i!",0);
	
end


-- »Ø¼ûĞşÃ÷µÄ¶Ô»°
function task_006()

local strMain = {
	"Phµm ®Ö tö ThiÕu L©m ta, tr­íc khi nhËp tù ph¶i cóng 1 chĞn <color=yellow>ch¸o L¹p B¸t<color> ®Ó tá lßng thµnh kİnh.",
	"Thİ chñ cã thÓ ®Õn <color=yellow>ch©n nói<color> hái <color=yellow>H­¬ng Kh¸ch<color>, bän hä thµnh t©m lÔ PhËt ch¾c cã thø ®ã."
	}

TE_Talk(getn(strMain), "task_007", strMain);

TaskTip("H·y xuèng ch©n nói t×m H­¬ng Kh¸ch xin 1 chĞn ch¸o L¹p B¸t!");

end


-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º4
function task_007()

	SetTask(1001,4);
		
end


-- ÓëÉ½ÏÂµÄÏã¿Í¶Ô»°
function task_008()

local strMain = {
	"§¹i thóc! Ta muèn gia nhËp ThiÕu L©m nh­ng thiÕu mét chĞn ch¸o L¹p B¸t ®Ó cóng PhËt tæ, kh«ng biÕt «ng cã thÓ cho ta xin 1 chĞn?",
	"Cho ng­¬i? Nãi dÔ nghe thÕ! Ch¸o L¹p B¸t cña ta ph¶i dïng Xuyªn Bèi, C¸t C¸nh, Kim Liªn Hoa, BÊt Tö Th¶o vµ Thiªn S¬n TuyÕt Liªn nÊu trong b¶y b¶y bèn m­¬i chİn ngµy! Cho ng­¬i µ! Hõ!",
	"V·n bèi v« tri! Xin §¹i thóc chØ ®iÓm thªm!",
	"§i 3 ngµy ®­êng, ta còng mÖt råi, trõ phi ng­¬i vËn dông <color=yellow>Kü n¨ng giang hå<color> lµm <color=yellow>3 c¸i b¸nh ng«<color> ®Ó ®æi, nÕu kh«ng ta sÏ ¨n chĞn ch¸o nµy!",
	"Kh«ng ph¶i §¹i thóc dïng chĞn ch¸o nµy ®Ó kİnh PhËt µ? Huèng chi t¹i h¹ còng ch¼ng cã kü n¨ng giang hå.",
	"KĞm qu¸! Kü n¨ng giang hå lµ b¶n n¨ng vèn cã cña mçi ng­êi, ng­¬i chØ cÇn nhÊn <color=yellow><F5><color> më giao diÖn kü n¨ng vâ c«ng, nhÊn chän <color=yellow>Sèng<color> sÏ hiÓu.",
	"V·n bèi sÏ thö lµm b¸nh ng«, ®¹i thóc h·y chê lÊy!"
	}
	
TE_Talk(getn(strMain), "task_009", strMain);

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º5
function task_009()
	TaskTip("H­¬ng Kh¸ch b¶o b¹n lµm 3 c¸i b¸nh ng« ®æi ch¸o L¹p B¸t!");
	SetTask(1001,5);
end

-- Íæ¼ÒÓĞÎÑÍ·À´½»ÈÎÎñÊ±
function task_010()

local strMain = {
		"§¹i thóc! §©y lµ b¸nh ng« cña ng­êi!",
		"Hay l¾m! ChĞn <color=yellow>Ch¸o L¹p B¸t<color> nµy xin d©ng lªn PhËt tæ dïm!"
	}

	if (GetItemCount(1,1,1)>=3) then
		TE_Talk(getn(strMain), "task_011", strMain);		
	else
		Say("Ch­a lµm xong b¸nh ng«? H·y mau lªn nÕu kh«ng ta sÏ ¨n chĞn ch¸o nµy µ!",0);
		return
	end;

end;

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º6
-- É¾³ıÎÑÍ·£¬Ôö¼ÓÀ°°ËÖà
function task_011()
	TaskTip("B¹n ®· lÊy ®­îc ch¸o L¹p B¸t, cã thÓ quay vÒ t×m HuyÒn Minh!");
	DelItem(1,1,1,3);
	AddItem(2,0,5,1);
	SetTask(1001,6);
end;


-- »ØÈ¥ÓëĞşÃ÷µÄ¶Ô»°
function task_012()

local strMain = {
	"A Di §µ PhËt!",
	"Thİ chñ tÈy trÇn xong, cã thÓ ®i t×m <color=yellow>Ph­¬ng Tr­îng §¹i S­<color> ®Ó gia nhËp ThiÕu L©m!"
	}

TE_Talk(getn(strMain), "task_013", strMain);

TaskTip("HuyÒn Minh b¶o b¹n t×m Ph­¬ng Tr­îng ®Ó gia nhËp ThiÕu L©m!");

end


-- ¿Û³ıÀ°°ËÖà£¬¸Ä±ä±äÁ¿£º7
function task_013()

DelItem(2,0,5,1);
SetTask(1001,7);

end


-- »ØÈ¥ÓëĞş´ÈµÄ¶Ô»°
function task_014()

local strMain = {
	"Muèn gia nhËp PhËt m«n ta ph¶i hµnh thiÖn tİch ®øc, kh«ng ®­îc lo¹n s¸t v« cí, thİ chñ cã thÓ lµm ®­îc kh«ng?",
	"§ång ı/task_015",
	"Kh«ng ®ång ı/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_015()

local strMain = {
	"Gia nhËp PhËt m«n ph¶i tŞnh t©m tu hµnh, thİ chñ cã lµm ®­îc kh«ng?",
	"§ång ı/task_016",
	"Kh«ng ®ång ı/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_016()

local strMain = {
	"Gia nhËp PhËt m«n lôc c¨n thanh tŞnh, kh«ng ®­îc cã tµ niÖm, d©m «! Thİ chñ cã lµm ®­îc kh«ng?",
	"§ång ı/task_017",
	"Kh«ng ®ång ı/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_017()
	-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º8
	SetTask(1001,8);
	SetPlayerFaction(1)
	SetPlayerRoute(1)
	Say("A Di §µ PhËt! Hoan nghªnh ThiÕu hiÖp gia nhËp ThiÕu L©m.",0);
	i=GetBody()
	if i==1 then 
		AddItem(0,109,73,1)
		AddItem(0,108,73,1)
	else 
		AddItem(0,109,77,1)
		AddItem(0,108,77,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈëÉÙÁÖÅÉ£¡")
	TaskTip("B¹n ®· gia nhËp ThiÕu L©m, cã thÓ b¸i s­ häc nghÖ!")

	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


-- Ñ¡Ôñ²»µÄÑ¡Ïî
function task_no()
	Say("Thİ chñ cßn v­¬ng vÊn hång trÇn, bæn tù kh«ng thÓ thu nhËn! Xin Thİ chñ vÒ ®i!",0);
end


function fix_sl()
FN_SetTaskState(FN_SL, 0);
Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc gi¶i quyÕt! ThiÕu hiÖp cã thÓ gia nhËp m«n ph¸i l¹i.",0);
end;