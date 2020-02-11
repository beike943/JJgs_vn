
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îäµ±ÃÅÅÉÈÎÎñÊµÌå´¦Àí½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

function task_001()

local strMain = {
	"§­êng M«n ta lµ danh m«n Tø Xuyªn. Ai ai còng muèn nhËp m«n. Ng­¬i cã g× h¬n ng­êi h·y nãi cho l·o l·o ®©y biÕt?",
	"T¹i h¹ trung thµnh víi §­êng M«n, tõ x­a ®Õn nay ch¼ng ai b× ®­îc.",
	"TiÓu tö ng­¬i còng biÕt khua m«i móa mĞp. Ng­¬i h·y ®i t×m <color=yellow>§­êng Thiªn TiÕu<color> ®Ó h¾n s¾p xÕp cho ng­¬i còng nh­ ®Ó l·o l·o xem ng­¬i trung thµnh thÕ nµo."
}

TE_Talk(getn(strMain), "task_002", strMain);

end

-- ¶Ô»°½áÊøºóĞŞ¸ÄÈÎÎñ±äÁ¿£º1
function task_002()
	TaskTip("§i t×m §­êng Thiªn TiÕu nhËn thö th¸ch!");
	SetTask(1005,1);
end


-- ÓëÌÆÌìĞ¥µÄ¶Ô»°
function task_003()

local strMain = {
	"Mäi viÖc cø theo ı l·o l·o vËy.",
	"§­îc råi! Ta sÏ s¾p xÕp mäi viÖc cho ng­¬i. Tæng qu¶n phßng thuèc <color=yellow>§­êng Xu©n<color> ®ang chÕ 1 lo¹i thuèc míi, cã thÓ sÏ cÇn ng­¬i. H·y ®Õn ®ã thö xem!"
}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- ¶Ô»°½áÊøºóĞŞ¸ÄÈÎÎñ±äÁ¿£º2
function task_004()
	TaskTip("§i t×m Tæng qu¶n D­îc phßng §­êng Xu©n!");
	SetTask(1005,2);
end


-- ÓëÌÆ´ºµÄ¶Ô»°
function task_005()

local strMain = {
	"Ng­¬i ®Õn lµm t¹p dŞch hay lµm thuèc?",
	"Lµm T¹p dŞch/task_005_01",
	"Ng­êi phèi d­îc/task_005_02",
	"Kh«ng lµm/task_005_03"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

-- Ñ¡Ôñ×öÔÓÒÛ
function task_005_01()

local strMain = {
	"Ng­¬i h·y xuèng nói t×m <color=yellow>5 R¨ng sãi<color> vÒ. ChÕ t¹o ®· l©u giê ®Ó xem Hãa Cèt PhÊn cã thµnh c«ng kh«ng!"
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- Ñ¡Ôñ×öÒ©ÈË
function task_005_02()

local strMain = {
	"B¹n trÎ! Tù nguyÖn ®Õn lµm thuèc µ, ®óng lµ cã chót lßng thµnh!",
	"ChØ v× Hãa Cèt PhÊn cña ta rÊt lîi h¹i, víi c«ng lùc cña ng­¬i hiÖn giê nÕu thö sÏ rÊt nguy hiÓm, h·y xuèng nói t×m <color=yellow>5 R¨ng sãi x¸m<color> vÒ."
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- Ñ¡ÔñÊ²Ã´¶¼²»×ö
function task_005_03()

	Say("Thö th¸ch cña ta ng­¬i kh«ng qua ®­îc cßn muèn gia nhËp §­êng M«n, kh«ng lÏ ng­¬i lµ gian tÕ?",0);

end


-- ÓëÌÆ´º¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º3
function task_005_add()
	TaskTip("§­êng Xu©n b¶o b¹n t×m R¨ng sãi x¸m!");
	SetTask(1005,3);
end


-- ÕÒÀ´ÍÁÀÇÑÀºóÓëÌÆ´ºµÄ¶Ô»°
function task_006()

local strMain = {
	"Hay l¾m! Hãa Cèt PhÊn qu¶ nhiªn ®· cã c«ng hiÖu, tõ nay §­êng M«n ta l¹i cã mét vò khİ ®Ó tung hoµnh giang hå.",
	"Ng­¬i ®Õn phßng c¬ quan t×m <color=yellow>§­êng V©n<color>, hái «ng ta c¸ch sö dông Hãa Cèt PhÊn."
}

	if (GetItemCount(2,1,3)>=5) then
	
		TE_Talk(getn(strMain), "task_007", strMain);
	
	else
	
		Say("Sai ng­¬i ®i t×m <color=yellow>R¨ng sãi x¸m<color>, sao l¹i quay vÒ ®©y?",0);
		return
	
	end

end

-- É¾ÁËÍÁÀÇÑÀ£¬²¢¸Ä±äÈÎÎñ±äÁ¿£º4
function task_007()
	DelItem(2,1,3,5);
	TaskTip("§i t×m §­êng V©n hái c¸ch dïng Hãa Cèt PhÊn!");
	SetTask(1005,4);
end

-- ÓëÌÆÔÆµÄ¶Ô»°
function task_008()

local strMain = {
	"Dïng thÕ nµo µ? §­¬ng nhiªn lµ r¾c vµo bÉy råi. NÕu nh­ lµ b¹n th× chóng ta ch÷a trŞ cho hä, ng­îc l¹i th× mÆc kÖ chóng.",
	"GÇn ®©y nhiÒu ng­êi ra vµo §­êng M«n, kh«ng thÓ kh«ng ®Ò phßng. ë ®©y cã 1 c¸i xÎng s¾t, ng­êi h·y <color=yellow>®µo 1 c¸i bÉy<color> d­íi ch©n nói.",
	"§µo ®Ó lµm g×?",
	"Hái nhiÒu lµm chi? Sai ng­¬i ®µo bÉy th× cø ®µo ®i, nhí lµ ch©n nói cã 2 c¸i c©y täa ®é lµ <color=yellow>(196.187)<color>, ®õng nªn nhÇm chç!"
}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- ÓëÌÆÔÆ¶Ô»°½áÊø£¬¸øÒ»°ÑÌúÇÂ²¢¸Ä±ä±äÁ¿£º5
function task_009()
	AddItem(2,0,6,1);
	TaskTip("§Õn ch©n nói (196.187) ®µo 1 c¸i bÉy! ");
	SetTask(1005,5);
end


-- ¼ì²âÊÇ·ñÔÚÕıÈ·µÄµØµãÊ¹ÓÃÁËÌúÇÂ£¬²¢¸Ä±ä±äÁ¿£º6
function task_CheckPos()

local mapID, mapX, mapY = GetWorldPos();

	if (mapX>1562) and (mapX<2993) and (mapY>1579) and (mapY<3019) and (FN_GetTaskState(FN_TM)==5) then
		Say("B¹n ®· ®µo mét c¸i bÉy! Quay vÒ phôc mÖnh §­êng V©n.",0);
		TaskTip("B¹n ®· ®µo mét c¸i bÉy! Quay vÒ phôc mÖnh §­êng V©n.");
		SetTask(1005,6);
	else
		return
	end

end


-- Èç¹ûÍæ¼ÒÒÑ¾­ÍÚÁËÏİÚå»ØÀ´ÏòÌÆÔÆ¸´Ãü
function task_010()

local strMain = {
	"Tèt! Kh«ng ngê ng­¬i lµm viÖc còng nhanh nhÑn. ChuyÖn h«m nay kh«ng ®­îc nãi cho ng­êi kh¸c biÕt, ng­¬i h·y ®i t×m <color=yellow>§­êng M«n L·o L·o<color> ®i."
}

TE_Talk(getn(strMain), "task_011", strMain);

end


-- ÓëÌÆÔÆ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º7
function task_011()
	DelItem(2,0,6,1);
	TaskTip("§i t×m §­êng M«n L·o L·o!");
	SetTask(1005,7);
end



-- ÓëÌÆÃÅÀÑÀÑµÄ¶Ô»°
function task_012()

local strMain = {
	"TrÎ tuæi mµ cã thÓ lµm nh÷ng viÖc nh­ thÕ thËt ®¸ng kh©m phôc! Ta sÏ nhËn ng­¬i lµm ®Ö tö §­êng M«n.",
	"H·y nhí mét khi gia nhËp §­êng M«n, sèng lµm ng­êi cña §­êng M«n, chÕt lµm ma cña §­êng M«n. Lu«n lu«n trung thµnh nÕu kh«ng sÏ bŞ trõng trŞ nghiªm kh¾c",
	"§a t¹ l·o l·o, ®Ö tö nhÊt ®Şnh ghi nhí trong lßng."
}

TE_Talk(getn(strMain), "task_013", strMain);

end

-- ÓëÌÆÃÅÀÑÀÑµÄ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º8
function task_013()
	SetPlayerFaction(5)
	SetPlayerRoute(5)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,76,1)
		AddItem(0,108,76,1)
	elseif i==2 then
		AddItem(0,109,80,1)
		AddItem(0,108,80,1)
	elseif i==3 then
		AddItem(0,109,84,1)
		AddItem(0,108,84,1)
	else
		AddItem(0,109,88,1)
		AddItem(0,108,88,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈëÌÆÃÅ")
	TaskTip("B¹n ®· gia nhËp §­êng M«n, cã thÓ b¸i s­ häc nghÖ!")
	SetTask(1005,8);
	Say("Ta nh×n s¬ ®· biÕt ng­¬i lµ ng­êi th«ng minh, gia nhËp §­êng M«n ph¶i hÕt lßng v× bæn m«n!",0);
	
	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_WD, 0);
	
end


function fix_tm()
FN_SetTaskState(FN_TM, 0);
Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc gi¶i quyÕt! B»ng h÷u cã thÓ gia nhËp m«n ph¸i l¹i.",0);
end;