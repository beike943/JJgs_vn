
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îäµ±ÃÅÅÉÈÎÎñÊµÌå´¦Àí½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- Óë×Ïº×ÕæÈËµÄ¶Ô»°
function task_001()

local strMain = {
		"Phµm lµ ®Ö tö Vâ §ang ph¶i häc thuéc §¹o §øc Kinh, hiÓu ®­îc ngô ı, sau ®ã b¸i tÕ lŞch ®¹i Tæ s­ míi cã thÓ nhËp m«n. Ng­¬i cã thÓ ®Õn Vâ §ang hËu viÖn t×m <color=yellow>Tr­¬ng Ngä D­¬ng<color> hái râ."
	}

TaskTip("Tö H¹c Ch©n Nh©n b¶o b¹n ®i gÆp Tr­¬ng Ngä D­¬ng xin nhËp m«n!");
TE_Talk(getn(strMain), "task_002", strMain);

end


-- ¶Ô»°½áÊøºó¸Ä±ä±äÁ¿£º1
function task_002()

	SetTask(1002,1);

end


-- ÓëÕÅÎçÑôµÄ¶Ô»°
function task_003()

local strMain = {
		"§¹o §øc Kinh do L·o Tö viÕt, chia lµm quyÓn th­îng vµ quyÓn h¹. QuyÓn th­îng cã 37 ch­¬ng, quyÓn h¹ cã 44 ch­¬ng. Mang néi dung tinh th©m vµ lµ chi b¶o cña §¹o gia. Phµm lµ ®Ö tö Vâ §ang, tr­íc khi nhËp m«n ph¶i <color=yellow>häc thuéc §¹o §øc Kinh<color> vµ hiÓu ®­îc ı nghÜa. Ng­¬i cã muèn thö kh«ng?",
		"§Ó ta häc thuéc §¹o §øc kinh tr­íc/task_003_read",
		"§Ó ta ®äc thuéc §¹o §øc kinh/task_003_next",
		"Ta cßn viÖc ph¶i lµm/task_exit"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end


-- Êì¶ÁµÀµÂ¾­
function task_003_read()

local strMain = {
		"§¹o Kh¶ §¹o, Phi Th­êng §¹o. Danh Kh¶ Danh, Phi Th­êng Danh. V« Danh Thiªn §Şa Chi Khëi. H÷u Danh V¹n VËt Chi MÉu. Cè Th­êng V« Dôc DÜ Quan Kú DiÖu.",
		"Th­êng H÷u Dôc DÜ Quan Kú DiÖu. Thö L­ìng Gi¶ §ång XuÊt Nhi DŞ Danh. §ång VŞ Chi HuyÒn. HuyÒn Chi Hùu HuyÒn, Chóng DiÖu Chi M«n.",
		"Cèc ThÇn BÊt Tö ThŞ VŞ HuyÒn T½n. HuyÒn T½n Chi M«n ThŞ VŞ Thiªn §Şa C¨n. Miªn Miªn Nh­îc Tån, Dông Chi BÊt CÇn.",
		"Th­îng ThiÖn Nh­îc Thñy. Thñy ThiÖn Lîi V¹n VËt Nhi BÊt Tranh, Xö Chóng Nh©n Chi Së ¸c, Cè C¬ ¤ §¹o. C­ ThiÖn §Şa, T©m ThiÖn Uyªn D­ ThiÖn Nh©n, Ng«n ThiÖn Tİn, Chİnh ThiÖn TrŞ, Sù ThiÖn N¨ng, §éng ThiÖn Thêi. Phu Duy BÊt Tranh, Cè V« V­u.",
		"§¹i Thµnh Nh­îc KhuyÕt, Kú Dông BÊt TÖ. §¹i Doanh Nh­îc Xung, Kú Dông BÊt Cïng. §¹i Trùc Nh­îc KhuÊt. §¹i X¶o Nh­îc ChuyÕt. §¹i BiÖn Nh­îc Nét. TŞnh Th¾ng T¸o. Thanh TŞnh Vi Thiªn H¹ Ch¸nh.",
		"H÷u VËt Hçn Thµnh tiªn thiªn ®Şa sanh. TŞch HÒ Liªu HÒ §éc LËp BÊt C¶i, Chu Hµnh Nhi BÊt §·i, Kh¶ DÜ Vi Thiªn H¹ MÉu. Ng« BÊt Tri Kú Danh, C­êng Tù Chi ViÕt §¹o. C­êng Vi Chi Danh ViÕt §¹i. §¹i ViÕt ThÖ, ThÖ ViÕt ViÔn, ViÔn ViÕt Ph¶n.",
		"Cè §¹o §¹i, Thiªn §¹i, §Şa §¹i, Nh©n DiÖc §¹i. Vùc Trung H÷u §¹i, Nhi Nh©n C­ Kú NhÊt Yªn. Nh©n Ph¸p §Şa, §Şa Ph¸p Thiªn, Thiªn Ph¸p §¹o, §¹o Ph¸p Tù Nhiªn."
	}
	
TE_Talk(getn(strMain), "task_003", strMain);

end





-- ±³ËĞµÀµÂ¾­
function task_003_next()

local strMain = {
		"C©u ®Çu tiªn cña §¹o §øc Kinh lµ g×?",
		"§¹o Sinh NhÊt, NhÊt Sinh NhŞ, NhŞ Sinh Tam, Tam Sinh V¹n VËt/task_error",
		"Nh©n Ph¸p §Şa, §Şa Ph¸p Thiªn, Thiªn Ph¸p §¹o, §¹o Ph¸p Tù Nhiªn/task_error",
		"§¹o Kh¶ §¹o, Phi Th­êng §¹o, Danh Kh¶ Danh, Phi Th­êng Danh/task_004_next"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_004_next()

local strMain = {
		"Cèc thÇn bÊt tö x­ng lµ:",
		"HuyÒn Vò/task_error",
		"HuyÒn T½n/task_005_next",
		"Hùu HuyÒn/task_error"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_005_next()

local strMain = {
		"Th­îng ThiÖn Nh­îc?",
		" Kim /task_error",
		"Méc/task_error",
		"Thñy/task_006_next",
		"Háa/task_error",
		"Thæ/task_error"
	}

Say(strMain[1],5,strMain[2],strMain[3],strMain[4],strMain[5],strMain[6]);

end

function task_006_next()

local strMain = {
		"C¸i g× lµ vi thiªn h¹ chİnh?",
		"V« vi/task_error",
		"Sung Doanh/task_error",
		"KhuÊt ChuyÕt/task_error",
		"Thanh TŞnh/task_007_next"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

function task_007_next()

local strMain = {
		"Nh©n Ph¸p §Şa, §Şa Ph¸p Thiªn, Thiªn Ph¸p §¹o, §¹o Ph¸p?",
		"Tù nhiªn/task_008",
		"¢m d­¬ng/task_error",
		"V« vi/task_error",
		"H­ thùc/task_error"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

-- È«²¿»Ø´ğÕıÈ·ÁËÖ®ºó¸Ä±äÈÎÎñ±äÁ¿£º2
function task_008()

	SetTask(1002,2);
	
	Say("Trong thêi gian ng¾n ®· häc thuéc §¹o §øc kinh, xem ra t­ chÊt ng­¬i còng kh¸. H·y t×m <color=yellow>1 thanh HiÖp ThiÕu KiÕm<color> vµ <color=yellow>1 b×nh Thiªu töu<color> vÒ ®Ó ta b¸i tÕ Tæ s­. HiÖp ThiÕu KiÕm cã thÓ mua ë Th­¬ng ®iÕm, Thiªu töu th× ®¸nh L­u Manh ngoµi rõng ®Ó lÊy, ng­¬i cÇn g× cã thÓ t×m <color=green>Minh NguyÖt §¹o §ång (218, 208)<color>.",0);
	
	TaskTip("H·y ®i t×m 1 thanh HiÖp ThiÕu KiÕm vµ 1 b×nh Thiªu töu ®Ó b¸i s­!");
	
end


function task_009()

local strMain = {
		"KhÈu n¹p thuÇn d­¬ng khİ, th©n luyÖn tö kim ®¬n!",
		"§· b¸i Tæ s­! Cã thÓ quay vÒ gÆp <color=yellow>Ch­ëng m«n<color>."
	}

	if (GetItemCount(0,2,14)>=1) and (GetItemCount(2,1,12)>=1) then
	
		TE_Talk(getn(strMain), "task_010", strMain);
		
		TaskTip("B¹n ®· b¸i s­, cã thÓ quay vÒ t×m Ch­ëng m«n!");
		
	else
	
		Say("HiÖp ThiÕu KiÕm cã thÓ mua ë Th­¬ng ®iÕm, Thiªu töu th× ®¸nh L­u Manh ngoµi rõng ®Ó lÊy.",0);
	
	end
	
return

end

-- É¾³ı½£ºÍ¾Æ£¬²¢¸Ä±äÈÎÎñ±äÁ¿£º3
function task_010()

	DelItem(0,2,14,1);
	DelItem(2,1,12,1);
	SetTask(1002,3);

end


-- »Ø¼ûÕÆÃÅµÄ¶Ô»°
function task_011()

local strMain = {
		"BÇn ®¹o sÏ nhËn ng­¬i lµm ®Ö tö ®êi thø 4 cña Vâ §ang. Sau nµy ph¶i tu©n thñ m«n quy, cè g¾ng luyÖn vâ, ®õng phô sù kú väng cña ta."
	}
	
TE_Talk(getn(strMain), "task_012", strMain);

end


-- ÓëÕÆÃÅ¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿£º4
function task_012()

	SetTask(1002,4);
	
	SetPlayerFaction(2)
	SetPlayerRoute(13)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,74,1)
		AddItem(0,108,74,1)
	elseif i==2 then
		AddItem(0,109,78,1)
		AddItem(0,108,78,1)
	elseif i==3 then
		AddItem(0,109,82,1)
		AddItem(0,108,82,1)
	else
		AddItem(0,109,86,1)
		AddItem(0,108,86,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈëÎäµ±£¡")
	TaskTip("B¹n ®· gia nhËp Vâ §ang, cã thÓ b¸i s­ häc nghÖ!")
	
	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function task_exit()

end;


function task_error()

	Say("B»ng h÷u ch­a thuéc §¹o §øc Kinh, häc thuéc råi h·y quay l¹i!",0);

end


function fix_wd()
FN_SetTaskState(FN_WD, 0);
Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc gi¶i quyÕt! Ng­¬i cã thÓ gia nhËp m«n ph¸i l¹i.",0);
end;