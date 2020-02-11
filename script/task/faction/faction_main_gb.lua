
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ø¤°ïÃÅÅÉÈÎÎñÊµÌå´¦Àí½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- Îª½ÚÊ¡ÈÎÎñ±äÁ¿¶ø½«µ¥¸ö±äÁ¿²ğ·ÖÎª 8 BIT£¬Ö»ÓÃÁËÇ°Îå¸ö
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;

-- ÓëÁúÔÚÌìµÄ¶Ô»°
function task_001()

local strMain = {
		"C¸i Bang ta tuy x­ng lµ Thiªn H¹ §Ö NhÊt §¹i Bang, nh­ng ®Òu lµ ¨n mµy, cã b÷a nay kh«ng biÕt ngµy mai. Ng­êi b¹n trÎ! H·y lo thi cö, kh«ng nªn ch«n vïi tiÒn ®å tèt ®Ñp cña m×nh.",
		"L·o tiÒn bèi! C¸i Bang b¾c chèng Liªu, T©y chèng T©y H¹, Nam chèng Thæ Phån, v× quèc quªn th©n ®Òu lµ nh÷ng anh hïng hµo hiÖt, sao gièng ¨n xin b×nh th­êng chø?",
		"T¹i h¹ lu«n muèn cuéc sèng tiªu diªu tù t¹i nh­ ng­êi trong C¸i bang, cói mong Bang chñ thu nhËn t¹i h¹.",
		"H·y ra ngoµi thµnh ®¸nh tªn L­u Manh lÊy <color=yellow>6 b×nh Thiªu töu<color>, rãt cho <color=yellow>c¸c huynh ®Ö trong bang<color> mçi ng­êi 1 chĞn, ®Ó chøng kiÕn ng­¬i vµo bang.",
		"§Ö tö tu©n lÖnh!"
	}

TaskTip("Long T¹i Thiªn nhê b¹n t×m 6 b×nh Thiªu töu ph©n ph¸t cho c¸c ®Ö tö C¸i Bang!");

TE_Talk(getn(strMain), "task_002", strMain);

end

-- ÓëÁúÔÚÌì¶Ô»°½áÊøºó¸Ä±ä±äÁ¿£º1
function task_002()

	SetTask(1004,1);

end

-- ÓëºéÆßµÄ¶Ô»°
function task_003()
local strMain = {
		"Ta ®· nhËn ®­îc NhËp Bang töu cña ng­¬i! Xin ®a t¹."
	}

TaskTip("B¹n ®· d©ng NhËp Bang töu cho Hång ThÊt!");

TE_Talk(getn(strMain), "task_003_add", strMain);

end

function task_003_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_001, 1));
end


-- ÓëÓÈÖªÎ¶µÄ¶Ô»°
function task_004()
local strMain = {
		"Ta ®· nhËn ®­îc NhËp Bang töu cña ng­¬i! Giái l¾m! NhËp bang xong ®Õn chç ta c¹n chĞn!"
	}
	
TaskTip("B¹n ®· d©ng NhËp Bang töu cho V­u Tri VŞ!");

TE_Talk(getn(strMain), "task_004_add", strMain);

end

function task_004_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_002, 1));
end


-- ÓëËÎÔª°²µÄ¶Ô»°
function task_005()
local strMain = {
		"Ta ®· nhËn ®­îc NhËp Bang töu cña ng­¬i! H·y suy nghÜ kü nªn chän sau nµy theo ¤ Y hay TŞnh Y?"
	}

TaskTip("B¹n ®· d©ng NhËp Bang töu cho Tèng Nguyªn An!");

TE_Talk(getn(strMain), "task_005_add", strMain);

end

function task_005_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_003, 1));
end


-- ÓëÂí¾¸ÉúµÄ¶Ô»°
function task_006()
local strMain = {
		"Ta ®· nhËn ®­îc NhËp Bang töu cña ng­¬i! H·y suy nghÜ kü nªn chän sau nµy theo ¤ Y hay TŞnh Y?"
	}

TaskTip("B¹n ®· d©ng NhËp Bang töu cho M· TŞnh Sinh!");

TE_Talk(getn(strMain), "task_006_add", strMain);

end

function task_006_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_004, 1));
end


-- Óë³ÂÖÓº×µÄ¶Ô»°
function task_007()
local strMain = {
		"Ta ®· nhËn ®­îc NhËp Bang töu cña ng­¬i! Sau khi nhËp bang ph¶i tu©n thñ Bang quy nÕu kh«ng ta sÏ kh«ng dung t×nh."
	}

TaskTip("B¹n ®· d©ng NhËp Bang töu cho TrÇn Chung H¹c!");

TE_Talk(getn(strMain), "task_007_add", strMain);

end

function task_007_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005)

	if (n==0) then
		DelItem(2,1,12,1);
	end

	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_005, 1));
end


-- ·µ»ØÀ´ÓëÁúÔÚÌìµÄ¶Ô»°
function task_008()

local nTalk_001 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001);
local nTalk_002 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002);
local nTalk_003 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003);
local nTalk_004 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004);
local nTalk_005 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005);

local strMain = {
		"Huynh ®Ö trong bang ®Òu ®· cã r­îu?",
		"§· ph©n ph¸t xong!",
		"Hay l¾m! Cã phóc cïng h­ëng cã häa cïng chia chİnh lµ tiªu chİ cña bang ta.",
		"TÊm lßng cña ng­¬i qu¶ hiÕm thÊy! H·y gia nhËp C¸i Bang ta!"
	}

if (nTalk_001==1) and (nTalk_002==1) and (nTalk_003==1) and (nTalk_004==1) and (nTalk_005==1) then
	DelItem(2,1,12,1);
	TaskTip("B¹n ®· d©ng NhËp Bang töu cho Bang chñ Long T¹i Thiªn!");
	TE_Talk(getn(strMain), "task_009", strMain);
else
	Say("Ng­¬i h·y ®i t×m mét İt Thiªu töu, ph©n ph¸t cho huynh ®Ö trong bang",0);
end

end

-- ÓëÁúÔÚÌì¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º2
function task_009()

	SetTask(1004,2);
	
	SetPlayerFaction(4)
	SetPlayerRoute(10)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,75,1)
		AddItem(0,108,75,1)
	elseif i==2 then
		AddItem(0,109,79,1)
		AddItem(0,108,79,1)
	elseif i==3 then
		AddItem(0,109,83,1)
		AddItem(0,108,83,1)
	else
		AddItem(0,109,87,1)
		AddItem(0,108,87,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈëØ¤°ï")
	TaskTip("B¹n ®· gia nhËp C¸i Bang, cã thÓ b¸i s­ häc nghÖ!")

	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_gb()
FN_SetTaskState(FN_GB, 0);
Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc gi¶i quyÕt! B»ng h÷u cã thÓ gia nhËp m«n ph¸i l¹i.",0);
end;