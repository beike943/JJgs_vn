
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¶ëÃ¼ÃÅÅÉÈÎÎñÊµÌå´¦Àí½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- ÓëÄÑÃñ¶Ô»°µÄ±äÁ¿´¢´æ

-- ÓëÄÑÃñ¼×µÄ¶Ô»°
EM_MANTALK_01 = 1006;
-- ÓëÄÑÃñÒÒµÄ¶Ô»°
EM_MANTALK_02 = 1007;
-- ÓëÄÑÃñ±ûµÄ¶Ô»°
EM_MANTALK_03 = 1008;
-- ÓëÄÑÃñ¶¡µÄ¶Ô»°
EM_MANTALK_04 = 1011;

-- ÓëÕæÈçÊ¦Ì«µÄ¶Ô»°
function task_001()

local strMain = {
		"GÇn Thµnh §« x¶y ra n¹n ®ãi ch­a tõng thÊy trong 100 n¨m qua. §Ö tö Nga My ta ®· ®i cøu tÕ, thËt sù kh«ng thÓ kiÓm tra n¨ng lùc ng­êi lóc nµy. NÕu ng­¬i cã lßng cã thÓ h¹ s¬n ®i cøu tÕ d©n chóng?",
		"Ta nªn lµm thÕ nµo?",
		"<color=yellow>Chu ThiÖn Nh©n<color> ë Thµnh §« phñ lµ ng­êi cã lßng h¶o t©m, y ®ang cøu tÕ d©n chóng ë <color=yellow>Tİn T­íng Tù<color>, ng­¬i h·y gióp y mét tay."
	}
	
TE_Talk(getn(strMain), "task_002", strMain);

end

-- ÓëÕæÈçÊ¦Ì«µÄ¶Ô»°½áÊøºó¸Ä±ä±äÁ¿£º1
function task_002()

	SetTask(1003,1);
	
	TaskTip("Mau ®i Thµnh §« gióp Chu ThiÖn Nh©n!");
	
end

-- ÓëÖÜÉÆÈËµÄ¶Ô»°
function task_003()

local strMain = {
		"Ta muèn ph¸t tiÒn ®Ó cøu tÕ nh­ng bän gia nh©n th× bËn gióp nÊu ch¸o. PhiÒn c« n­¬ng ®Õn th«ng b¸o cho <color=yellow>N¹n d©n Gi¸p, Êt, Bİnh, §inh<color> ë cæng thµnh, b¶o hä ®Õn nhËn cøu tÕ.",
		"§· thÕ ®Ó ta ®i thay «ng."
	}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- ÓëÖÜÉÆÈËµÄ¶Ô»°½áÊøºó¸Ä±ä±äÁ¿£º2
function task_004()

	SetTask(1003,2);
	
	TaskTip("H·y th«ng b¸o cho N¹n d©n Gi¸p, Êt, Bİnh, §inh ë cæng thµnh ®Õn nhËn cøu tÕ!");

end

-- ÓëÄÑÃñ¼×µÄ¶Ô»°
function task_005()

local strMain = {
		"Chu ThiÖn Nh©n më kho ph¸t l­¬ng thùc, sai ta ®Õn th«ng b¸o cho ng­¬i biÕt.",
		"§a t¹ c« n­¬ng ®· ®Õn b¸o tin! ¥n nghÜa nµy c¶ ®êi ta sÏ kh«ng quªn!",
		"§õng kh¸ch s¸o! Ng­¬i mau ®i ®i!"
	}

TE_Talk(getn(strMain), "task_005_add", strMain);

TaskTip("B¹n ®· b¸o tin cho N¹n d©n Gi¸p!");

end

function task_005_add()

	SetTask(EM_MANTALK_01,1);

end

-- ÓëÄÑÃñÒÒµÄ¶Ô»°
function task_006()

local strMain = {
		"Chu ThiÖn Nh©n më kho ph¸t l­¬ng thùc, sai ta ®Õn th«ng b¸o cho ng­¬i biÕt.",
		"§a t¹ c« n­¬ng ®· ®Õn b¸o tin! ¥n nghÜa nµy c¶ ®êi ta sÏ kh«ng quªn!",
		"§õng kh¸ch s¸o! Ng­¬i mau ®i ®i!"
	}

TE_Talk(getn(strMain), "task_006_add", strMain);

TaskTip("B¹n ®· b¸o tin cho N¹n d©n Êt!");

end

function task_006_add()

	SetTask(EM_MANTALK_02,1);

end

-- ÓëÄÑÃñ±ûµÄ¶Ô»°
function task_007()

local strMain = {
		"Chu ThiÖn Nh©n më kho ph¸t l­¬ng thùc, sai ta ®Õn th«ng b¸o cho ng­¬i biÕt.",
		"§a t¹ c« n­¬ng ®· ®Õn b¸o tin! ¥n nghÜa nµy c¶ ®êi ta sÏ kh«ng quªn!",
		"§õng kh¸ch s¸o! Ng­¬i mau ®i ®i!"
	}

TE_Talk(getn(strMain), "task_007_add", strMain);

TaskTip("B¹n ®· b¸o tin cho N¹n d©n Bİnh!");

end

function task_007_add()

	SetTask(EM_MANTALK_03,1);

end


-- ÓëÄÑÃñ¶¡µÄ¶Ô»°
function task_007_01()

local strMain = {
		"Chu ThiÖn Nh©n më kho ph¸t l­¬ng thùc, sai ta ®Õn th«ng b¸o cho ng­¬i biÕt.",
		"§a t¹ c« n­¬ng ®· ®Õn b¸o tin! ¥n nghÜa nµy c¶ ®êi ta sÏ kh«ng quªn!",
		"§õng kh¸ch s¸o! Ng­¬i mau ®i ®i!"
	}

TE_Talk(getn(strMain), "task_007_01_add", strMain);

TaskTip("B¹n ®· b¸o tin cho N¹n d©n §inh!");

end


function task_007_01_add()

	SetTask(EM_MANTALK_04,1);

end


-- »ØÈ¥ÓëÖÜÉÆÈËµÄ¶Ô»°
function task_008()

local strMain = {
		"Ta ®· b¸o tin cho tÊt c¶ c¸c n¹n d©n.",
		"§a t¹ c« n­¬ng!",
		"ı ngµi lµ?",
		"Ta võa nhËn ®­îc tin: ngµy mai trong thµnh vËt gi¸ cña c¸c cöa hiÖu lín sÏ t¨ng 3 lÇn, thÕ th× n¹n d©n lµm sao sèng?",
		"Ch¼ng lÏ c¸c chñ tiÖm trong thµnh kh«ng cã chót l­¬ng t©m sao?",
		"ChuyÖn nµy còng kh«ng thÓ tr¸ch hä, chñ yÕu lµ trong thµnh cã 1 tªn L­u Manh chuyªn hµ hiÕp b¸ t¸nh l­¬ng thiÖn.",
		"Bän chóng d¸m léng hµnh thÕ µ? NhÊt ®Şnh ph¶i cho chóng bµi häc.",
		"L­u Manh ë phİa <color=yellow>T©y Thµnh §«<color>, c« n­¬ng qu¶ cã lßng, h·y trõng trŞ chóng vµ lÊy <color=yellow>2 b×nh Thiªu töu<color> vÒ!"
	}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- ÓëÖÜÉÆÈË¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º4
function task_009()

	SetTask(1003,4); -- Ö±½Ó±äµ½ 4
	TaskTip("B¹n h·y gi¸o huÊn L­u Manh ë T©y Thµnh §«, lÊy 2 b×nh Thiªu töu!");
end

-- »÷°ÜÎŞÀµºó¸Ä±äÈÎÎñ±äÁ¿£º4
--function task_010()
--	FN_SetTaskAdd(FN_EM);
--end

-- »ØÈ¥¼ûÖÜÉÆÈË
function task_011()

local strMain = {
		"C« n­¬ng kh«ng hæ danh lµ ®Ö tö Nga My.",
		"Ta kh«ng ph¶i ®Ö tö Nga My, Ch©n Nh­ S­ Th¸i nãi kh«ng cã thêi gian thö th¸ch ta.",
		"Víi b¶n lÜnh cña c« n­¬ng th× cÇn g× thö th¸ch. Ta sÏ cho bå c©u chuyÓn th­ ®Õn S­ Th¸i. C« n­¬ng h·y quay vÒ Nga My.",
		"Xin ®a t¹!"
	}

if (GetItemCount(2,1,12)>=2) then
	DelItem(2,1,12,2);
	TE_Talk(getn(strMain), "task_012", strMain);
else
	Say("§¸m L­u Manh ë T©y Thµnh §« rÊt léng hµnh, lÇn nµy c« n­¬ng ®i ph¶i cÈn thËn!",0);
	return
end;

end

-- ÓëÖÜÉÆÈË¶Ô»°ºó¸Ä±ä±äÁ¿£º5
function task_012()
	SetTask(1003,5);
	TaskTip("Chu ThiÖn Nh©n b¶o b¹n ®Õn gÆp Ch©n Nh­ S­ Th¸i!");
end


-- »ØÈ¥ÓëÕæÈçÊ¦Ì«µÄ¶Ô»°
function task_013()

local strMain = {
		"Ng­¬i ch­a nhËp m«n nÕu cã thÓ lµm xong viÖc nµy ta sÏ thu nhËn ng­¬i lµm ®Ö tö Nga My.",
		"§a t¹ s­ phô! §Ö tö nhÊt ®Şnh xin ghi nhí lêi cña s­ phô suèt ®êi."
	}

TE_Talk(getn(strMain), "task_014", strMain);

end

-- ÓëÕæÈçÊ¦Ì«¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º6
function task_014()

	SetTask(1003,6);
	
	SetPlayerFaction(3);
	SetPlayerRoute(7);
	i=GetBody()
	if i==3 then 
		AddItem(0,109,81,1)
		AddItem(0,108,81,1)
	else 
		AddItem(0,109,85,1)
		AddItem(0,108,85,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈë¶ëáÒÅÉ");
	TaskTip("B¹n ®· gia nhËp Nga My, cã thÓ b¸i s­ häc nghÖ!");
	
	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_em()
FN_SetTaskState(FN_EM, 0);
Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc gi¶i quyÕt! Ng­¬i cã thÓ gia nhËp m«n ph¸i l¹i.",0);
end;