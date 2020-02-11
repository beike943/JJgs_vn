--½Å±¾¹¦ÄÜ£ºÉÙÁÖÊÛÂôNPC¶ÔÓ¦½Å±¾
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-4-2
--ĞŞ¸Ä¼ÇÂ¼£º
-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

Include("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(8)
	if getn(tDiaSel) > 0 then
		tinsert(tDiaSel, getn(tDiaSel), "Ta cÇn xö lı nh÷ng viÖc kh¸c/other_function");
	end
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end

function other_function()

	--ÔùËÍ¹ÅÑôÃØ¶´ÃÅÆ±
	if GetBit(GetTask(GIVE_TICKET_STATE),1) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Mäi vËt trªn ®êi ®Òu cã néi t©m, ng­êi hµnh y sao cã thÓ ®èi xö thiªn vŞ víi bÖnh nh©n kh¸c nhau?"},
		{"b¹ch ngäc ®iªu lan kim ty sµng, c¬ kû th× kÕt m·n chu ty vâng, thuú tri ®ang niªn ca vò trµng"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--ÔùËÍÃÅÆ±½Å±¾
function give_ticket_01()

local strTalk = {
	"Mai BÊt Dung: Xin chµo <sex>, ta ®o¸n ng­¬i còng biÕt chuyÖn Cæ D­¬ng Thó bŞ Phi th­êng ®¹o nh©n lîi dông. Tr­íc ®©y khi nã bŞ thu phôc ®em lªn C«n Lu©n, S­ huynh niÖm t×nh con thó nµy bŞ ng­êi kh¸c lîi dông nªn cho phĞp ta cøu nã ®Ó thay ®æi d­îc lùc cña Háa luyÖn kim ®an trong ng­êi nã.",
	"Ng­êi ch¬i: Th× ra Cæ D­¬ng Thó sau khi bŞ thu phôc ®· ®­îc ®em lªn C«n Lu©n, C«n Lu©n ph¸i vèn lµ ®¹o gia luyÖn ®an, d­îc lùc trong ng­êi Cæ D­¬ng Thó cã thÓ hãa gi¶i?",
	"Mai BÊt Dung: Ta ®· chuyÓn ®¹i bé phËn cña Cæ D­¬ng thó thµnh kim ®¬n nh­ng l¹i ph¸t hiÖn nã bŞ cho ¨n Kim ®¬n l©u råi, ®· nhËp vµo m¸u huyÕt. C«n L«n s¬n tiªn khİ m¹nh nhÊt, Cæ D­¬ng Thó ë ®©y ®Ó hÊp thô tinh khİ cña trêi ®Êt sÏ kh«ng bŞ nhiÔm tµ khİ, nh­ vËy cã thÓ gióp nã hãa gi¶i d­îc lùc. Ch¼ng ngê trêi ch¼ng chiÒu lßng ng­êi, Cæ D­¬ng Thó sau khi l¹c vµo {Táa Yªu Th¸p} hËu s¬n C«n Lu©n, Cæ D­¬ng Thó bçng nhiªn trë nªn hung ¸c.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ng­êi ch¬i: µ? Cæ D­¬ng Thó d¸m ®Õn g©y rèi, lÏ nµo C«n Lu©n kh«ng muèn gÆp n¹n?",
	"Mai BÊt Dung: Lóc ®ã c¸c ®Ö tö ®Òu nghÜ nh­ thÕ, cho dï cã thÓ t¸i thu phôc Cæ D­¬ng Thó, chØ sî tæn th­¬ng nghiªm träng, ta nghiªn cøu qua Háa luyÖn kim ®an cña Phi th­êng ®¹o nh©n, nã ®­îc chÕ tõ {m¸u huyÕt ma},  khi ph¸t t¸c nÕu kh«ng cã m¸u t­¬i ¸p chÕ, toµn th©n nh­ bŞ löa thiªu. Nh­ng ®Ö tö C«n L«n khi muèn ra tay kh¾c chÕ th× Cæ D­¬ng Thó vïng dËy trèn tho¸t còng kh«ng lµm bŞ th­¬ng mét ai.",
	"Ng­êi ch¬i: Th× ra cßn x¶y ra nhiÒu chuyÖn nh­ vËy, xem ra Cæ D­¬ng Thó qu¶ nhiªn lµ linh thó, vËy nã ®· ch¹y ®i ®©u mÊt råi? Cã ph¶i cÇn t¹i h¹ {thu phôc lÇn n÷a}?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Mai BÊt Dung: Ta lu«n cho r»ng v¹n vËt trªn ®êi nµy ®Òu cã linh tİnh, nªn c¶m thÊy Cæ D­¬ng Thó lµ v× biÕt ¬n C«n Lu©n cho nªn r¸ng chŞu ®au khæ mµ trèn tho¸t, ta ®o¸n nã ®· vÒ Cæ D­¬ng ®éng råi. MÆc dï s­ huynh th­êng tr¸ch ta kh«ng biÕt ph©n biÖt chİnh tµ, cã lóc cßn cøu c¶ yªu ma, nh­ng sinh linh ®Òu b×nh ®¼ng, ng­êi häc ®¹o sao l¹i cã thÓ thÊy chÕt mµ kh«ng cøu? Cho nªn ta ®· chÕ {Bİch Diªu Thanh T©m §¬n}, ph¸t cho nh©n sü vâ l©m. NÕu <sex> cã duyªn nhËn ®­îc, hy väng cã thÓ ®em thuèc nµy ®Õn Cæ D­¬ng ®éng mét chuyÕn, cho Cæ D­¬ng thó uèng ®Ó gióp nã hãa gi¶i d­îc lùc trong ng­êi, ®em thuèc nµy giao cho §Ö tö C«n L«n ë trong ®éng cã thÓ ®i Cæ D­¬ng mËt ®éng. NÕu <sex> nhµn rçi sau nµy khi t×m ®­îc thuèc nµy cã thÓ ®em tiÕp cho nã uèng, uèng l©u ngµy nhÊt ®Şnh cã thÓ hãa gi¶i d­îc lùc trong ng­êi nã.",
	"Ng­êi ch¬i: Th­îng ®Õ cã ®øc hiÕu sinh, c« n­¬ng cã tiÕng nh©n tõ khiÕn ng­êi c¶m kİch, t¹i h¹ sÏ hoµn thµnh t©m nguyÖn cña c« n­¬ng.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1031,1,1);--µÃµ½±ÌÑşÇåĞÄµ¤
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),1,1));
	
end