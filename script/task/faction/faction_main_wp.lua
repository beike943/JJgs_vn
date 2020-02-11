
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îå¶¾ÃÅÅÉÈÎÎñÊµÌå´¦Àí½Å±¾ÎÄ¼ş
-- Edited by Starry
-- 2006/02/09 PM 11:31

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\world\\task_head.lua");

--ÉêÇë¼ÓÈëÎå¶¾
function task_000()

local strTalk = {
	"<sex> muèn gia nhËp bæn gi¸o ph¶i ®­îc sù ®ång ı cña tø vŞ Quû S­! H·y ®i gÆp Thñ täa Quû S­ C©u S¸ch tr­íc!"
	}

	TalkEx("",strTalk);
	TaskTip("§Õn T©y B¾c Ngò §éc Gi¸o t×m Thñ täa Quû S­ C©u S¸ch");
	Msg2Player("§Õn T©y B¾c Ngò §éc Gi¸o t×m Thñ täa Quû S­ C©u S¸ch");
	SetTask(FN_WP,1);
end

-- Óë¹´²á¶Ô»°
function task_001()

local strTalk = {
		"Muèn gia nhËp Ngò §éc gi¸o? Hay l¾m! Nh­ng ng­¬i ph¶i v­ît qua vµi thö th¸ch, giê h·y ®i t×m Ph­¬ng Viªn Quû S­!"
	}

	TalkEx("",strTalk);
	TaskTip("Qua phßng bªn c¹nh t×m Ph­¬ng Viªn Quû S­");
	Msg2Player("Qua phßng bªn c¹nh t×m Ph­¬ng Viªn Quû S­");
	SetTask(FN_WP,2);

end


-- Óë·½Ô³¶Ô»°£¨Î´»Ø´ğÎÊÌâ£©
function task_002()

local strTalk = {
	"Hõ! NhËp gi¸o th× nhËp gi¸o! Kh«ng biÕt Gi¸o chñ nghÜ g×! Duy tr× truyÒn thèng cña bæn gi¸o cã g× kh«ng tèt? Cßn ®Şnh cïng bän ThiÕu L©m x­ng huynh ®Ö g× ®ã, thËt sù ®· lµm tr¸i chñ ı cña c¸c gi¸o chñ ®êi tr­íc.",
	"C©u S¸ch Quû S­ nãi ®Õn ®©y ®Ó kh¶o nghiÖm th­êng thøc vâ l©m, xin hái khi nµo cã thÓ b¾t ®Çu?",
	"L·o C©u còng thËt lµ... Râ rµng ph¶n ®èi chuyÖn thay gi¸o quy nh­ng l¹i kh«ng nãi, cßn gióp Gi¸o chñ söa gi¸o quy. Nãi lµ lÊy ®¹i cuéc lµm träng nh­ng gi¸o quy ®­îc truyÒn tõ ®êi Tæ s­ Ngò §éc gi¸o ®Õn nay ch¼ng lÏ kh«ng quan träng? Ta ®· phß trî qua 3 ®êi Gi¸o chñ, ch­a thÊy ai nh­ B¹ch gi¸o chñ……",
	"Xin hái vËy cã cÇn ph¶i thi kiÓm tra?",
	"§­¬ng nhiªn ph¶i kh¶o!"
	}
	TalkEx("task_003",strTalk);
end;

-- Óë·½Ô³¶Ô»°£¨»Ø´ğµÚÒ»²¿·ÖÎÊÌâ£©
function task_003()

local strSay = {
	"Dïng phİm nµo ®Ó chuyÓn ®æi gi÷a ®øng vµ ngåi?",
	"1.Phİm K./exam_fault1",
	"2.Phİm P/exam_fault1",
	"3.Phİm V/exam_pass1",
}
	SelectSay(strSay);
end	

--´ğ¶ÔµÚ1¸öÎÊÌâºó
function exam_pass1()

local strSay = {
	"Phİm chuyÓn ®æi chÕ ®é ch¹y tù ®éng lµ phİm nµo?",
	"1.Phİm K./exam_fault1",
	"2.Phİm L/exam_pass2",
	"3.Phİm O/exam_fault1",
}
	SelectSay(strSay);
end	

--´ğ¶ÔµÚ2¸öÎÊÌâºó
function exam_pass2()

local strSay = {
	"Phİm nhÆt vËt phÈm?",
	"1.Phİm Ctrl/exam_fault1",
	"2.Phİm Space/exam_pass3",
	"3.Phİm Enter/exam_fault1",
}
	SelectSay(strSay);
end

--´ğ¶ÔµÚ3¸öÎÊÌâºó
function exam_pass3()

local strTalk = {
	"Th­êng thøc vâ l©m còng kh¸ ®Êy!"
	}
	TalkEx("task_004",strTalk);
	SetTask(FN_WP,3);
end;

--Î´´ğµÚ4¸öÎÊÌâÇ°
function task_004()

local strSay = {
	"C©u hái cuèi cïng, n¨m x­a ta bŞ mét tªn gian tÆc ThiÕu L©m ®¸nh mét c«n, ®Õn giê mçi khi trêi m­a lµ l­ng mái ch©n ®au, ng­¬i biÕt hÖ ph¸i cña h¾n lµ g×?",
	"1.ThiÕu L©m tôc gia/exam_pass4",
	"2.ThiÕu L©m thiÒn t¨ng/exam_fault2",
	"3.ThiÕu L©m vâ t¨ng/exam_fault2",
	}
	SelectSay(strSay);
end	
	
--´ğ¶ÔµÚ4¸öÎÊÌâºó
function exam_pass4()

local strTalk = {
	"§óng vËy! Chİnh lµ l·o HuyÒn Bi ThiÕu L©m tôc gia. Thï nµy ngµy nµo ch­a tr¶ ta khã mµ vui ®­îc. Nh­ng ta ®· giµ råi cho nªn thu nhËn ng­¬i lµm ®Ö tö, cè g¾ng luyÖn vâ c«ng sau nµy thay ta tr¶ thï?",
	"Quû S­ yªn t©m! T¹i h¹ gia nhËp Ngò §éc gi¸o th× ®· lµ ng­êi bæn gi¸o, sau nµy sÏ thay Quû S­ röa hËn.",
	"Tèt l¾m! Giê h·y ®i t×m V­u Dung Quû S­. H·y men theo con ®­êng nhá ®Õn phİa §«ng sÏ gÆp h¾n."
	}
	TalkEx("",strTalk);
	TaskTip("T×m V­u Dung Quû S­");
	Msg2Player("T×m V­u Dung Quû S­");
	SetTask(FN_WP,4);
end

--´ğ´íÇ°3¸öÎÊÌâºó
function exam_fault1()

local strTalk = {
	"Sai råi! Nh÷ng c©u nµy kh«ng ph¶i ai còng tr¶ lêi ®­îc! Khi nµo biÕt råi h·y ®Õn."
	}
	TalkEx("",strTalk);
end

--´ğ´íµÚ4¸öÎÊÌâºó
function exam_fault2()

local strTalk = {
	"Sai råi! H·y nhí kü! KÎ ®¸nh ta mét c«n lµ ThiÕu L©m tôc gia, ThiÕu L©m tôc gia!"
	}
	TalkEx("",strTalk);
end

-- ÓëÓÈéÅµÄ¶Ô»°1
function task_005()

local strTalk = {
	"Muèn gia nhËp bæn gi¸o? Hay l¾m! Ta thÊy t­ chÊt ng­¬i còng kh¸. Ta ®ång ı!",
	"Kh«ng ph¶i cã vÊn ®Ò cÇn hái?",
	"Th­êng thøc vâ l©m trung nguyªn? Ta khinh! Ta cÇn g× ph¶i häc hái bän chóng?",
	"VËy lµ ng­êi ®ång ı cho t¹i h¹ nhËp gi¸o?",
	"§­¬ng nhiªn kh«ng dÔ dµng nh­ vËy! Ng­¬i ®­a ta {1 l­îng b¹c}! Gi¸o ph¶i cÇn ph¶i tõng b­íc ph¸t triÓn."
	}
	TalkEx("task_006",strTalk);
end

-- ÓëÓÈéÅµÄ¶Ô»°2
function task_006()

local strSay = {
	"VËy µ!",
	"§­a 1 l­îng b¹c/pay_money",
	"Kh«ng ®­a/no_pay"
	}
	SelectSay(strSay);
end

--½»Ò»Á½Òø×Ó¸øÓÈéÅºó
function pay_money()

local strTalk = {};
	
	if Pay(100) == 1 then	
		strTalk = {
			"H·y ®i t×m {T©y §å Quû S­} ®i! ¤ng ta ë {phßng bªn c¹nh}."
		}
		TalkEx("",strTalk);
		TaskTip("T×m T©y §å Quû S­");
		Msg2Player("T×m T©y §å Quû S­");
		SetTask(FN_WP,5);
	else
		strTalk = {
			"Kh«ng ®ñ tiÒn µ? H·y t×m c¸ch ®i! NÕu kh«ng sÏ kh«ng chøng tá thµnh ı muèn nhËp gi¸o cña ng­¬i."
			}
		TalkEx("",strTalk);
	end
end

--²»¸øÓÈéÅÒøÁ½
function no_pay()

local strTalk = {
				"Kh«ng ®ñ tiÒn µ? H·y t×m c¸ch ®i! NÕu kh«ng sÏ kh«ng chøng tá thµnh ı muèn nhËp gi¸o cña ng­¬i."
			}
	TalkEx("",strTalk);
end

-- ÓëÓÈéÅµÄ¶Ô»°3
function task_007()

local strTalk = {
	"Ha ha! Võa ®óng tèi h«m qua thua s¹ch tr¬n, h«m nay l¹i cã 1 l­îng b¹c, th¸ng nµy coi nh­ kh«ng ph¶i ®ãi råi!",
	"…………",
	"Sao l¹i quay l¹i? {T©y §å} ë {phßng bªn c¹nh}. H·y ®i t×m h¾n!",
	"…………"
   }
  TalkEx("",strTalk);
end

--ÓëÎ÷Í¼¶Ô»°
function task_008()

local strTalk = {
	"3 ng­êi ®ã ®· ®ång ı c¶? VËy ®Õn l­ît ta hái ng­¬i, nÕu tr¶ lêi ®­îc xem nh­ qua ¶i.",
	"Xin ®a t¹!"
	}
	TalkEx("task_009", strTalk);
end

--»Ø´ğÎ÷Í¼ÎÊÌâ1
function task_009()

local strSay = {
	"Trong vâ l©m muèn ®i vÒ c¸c thµnh, ph­¬ng ph¸p th­êng dïng lµ?",
	"1.T×m Xa phu/exam_pass5",
	"2.T×m Chñ töu lÇu/exam_fault3",
	"3.T×m Chñ th­¬ng héi/exam_fault3",
	}
	SelectSay(strSay);
end

--´ğ¶ÔÎ÷Í¼ÎÊÌâ1
function exam_pass5()

local strSay = {
	"Giang hå hËu bèi muèn th¨ng ®¼ng cÊp nhanh, ph­¬ng ph¸p hiÖu qu¶ nhÊt lµ?",
	"1.Bµy b¸n/exam_fault3",
	"2.Lµm nhiÖm vô Th­¬ng héi/exam_pass6",
	"3.§¸nh cäc gç/exam_fault3",
	}
	SelectSay(strSay);
end

--´ğ¶ÔÎ÷Í¼ÎÊÌâ2
function exam_pass6()

local strSay = {
	"NÕu hµnh trang cã nhiÒu ng©n l­îng, muèn göi mét İt, th­êng sö dông ph­¬ng ph¸p nµo?",
	"1.Mua b¸n hµng hãa./exam_fault3",
	"2.Göi ë r­¬ng chøa ®å/exam_pass7",
	"3.§­a cho mét ng­êi kh¸c gi÷ giïm/exam_fault3",
	}
	SelectSay(strSay);
end

--´ğ¶ÔÎ÷Í¼ÎÊÌâ2
function exam_pass6()

local strSay = {
	"NÕu hµnh trang cã nhiÒu ng©n l­îng, muèn göi mét İt, th­êng sö dông ph­¬ng ph¸p nµo?",
	"1.Mua b¸n hµng hãa./exam_fault3",
	"2.Göi ë r­¬ng chøa ®å/exam_pass7",
	"3.§­a cho mét ng­êi kh¸c gi÷ giïm/exam_fault3",
	}
	SelectSay(strSay);
end

--´ğ´íÎ÷Í¼ÎÊÌâºó
function exam_fault3()

local strTalk = {
	"ChØ cã thÕ còng kh«ng biÕt! Lµm sao hµnh tÈu giang hå?"
	}
	TalkEx("",strTalk);
end

-- ´ğ¶ÔÎ÷Í¼ÎÊÌâ3
function exam_pass7()

local strTalk = {
	"Ng­¬i còng cã chót kiÕn thøc! Ngò §éc gi¸o cÇn nh÷ng ng­êi cã kinh nghiÖm giang hå nh­ ng­¬i, ch¼ng l©u sau Ngò §éc gi¸o ta sÏ vang danh thiªn h¹!",
	"NghÜa lµ…",
	"Ng­¬i h·y ®i t×m {C©u S¸ch}! Nãi lµ bän ta ®· ®ång ı råi!",
	"§a t¹ T©y §å Quû S­"
	}
	TalkEx("",strTalk);
	TaskTip("§Õn T©y B¾c Ngò §éc Gi¸o t×m Thñ täa Quû S­ C©u S¸ch");
	Msg2Player("§Õn T©y B¾c Ngò §éc Gi¸o t×m Thñ täa Quû S­ C©u S¸ch");
	SetTask(FN_WP,6);
end



--ÒÑ¾­ºÍËÄÎ»¹íÊ¦¶Ô»°ºó·µ»Ø¹´²á´¦
function task_010()

local strTalk = {
	"ThÕ nµo? Bän hä ®ång ı c¶ ch­a? Hä cã nãi g× kh«ng?",
	"Tam vŞ Quû S­ ®Òu ®· ®ång ı nh­ng Ph­¬ng Viªn Quû S­ h¬i cã thµnh kiÕn víi ThiÕu L©m ph¸i.",
	"Ha ha! Tr­íc ®©y y cã khóc m¾c víi ThiÕu L©m. Cßn V­u Dung cã ®ßi tiÒn mi kh«ng?",
	"C©u S¸ch Quû S­ ®Òu biÕt c¶ ­?",
	"TËt xÊu cña hä sao ta l¹i kh«ng biÕt. Bän hä võa thï dai, cê b¹c… cho nªn 3 ®êi gi¸o chñ cña bæn gi¸o ®Òu lµ n÷ l­u. Nh­ng ng­¬i ®õng v× thÕ mµ xem th­êng hä, bän hä ai còng b¶n lÜnh nÕu kh«ng ®· kh«ng thÓ ngåi ë vŞ trİ ®ã. ChØ cÇn ng­¬i cã b¶n lÜnh sÏ cã ngµy ng­¬i næi danh trªn giang hå. H·y nhí lÊy!",
	"Thuéc h¹ hiÓu râ!",
	"Giê ng­¬i h·y ®i t×m B¹ch gi¸o chñ! H·y nãi tø vŞ Quû S­ ®· ®ång ı cho ng­¬i nhËp gi¸o.",
	"§a t¹ C©u S¸ch Quû S­!"
	}
	TalkEx("",strTalk);
	SetTask(FN_WP,7);
	TaskTip("§Õn t×m B¹ch Doanh Doanh xin gia nhËp Ngò §éc gi¸o");
	Msg2Player("§Õn t×m B¹ch Doanh Doanh xin gia nhËp Ngò §éc gi¸o");
end

--¿ÉÒÔ¼ÓÈëÎå¶¾½ÌÁË
function task_011()

local strTalk = {
	"ThÕ nµo? Bän hä ®ång ı c¶ ch­a?",
	"Bän hä ®Òu ®· ®ång ı.",
	"Nh­ vËy xem nh­ ng­¬i ®· gia nhËp Ngò §éc gi¸o. Sau nµy h·y cè g¾ng luyÖn c«ng ph¸t d­¬ng quang ®¹i tuyÖt häc bæn gi¸o.",
	"Thuéc h¹ hiÓu râ!",
	"Giê ng­¬i ®· cã thÓ häc vâ c«ng bæn gi¸o. NÕu muèn häc Khèng Thi thuËt ®Õn t×m Ng« Ng«n; nÕu muèn häc LuyÖn §éc thuËt t×m LiÔu T©n Tróc!"
	}
	
	TalkEx("",strTalk);
	SetTask(FN_WP,8);
	SetPlayerFaction(7);
	i=GetBody();
	if i==1 then 
		AddItem(0,109,125,1,1);
		AddItem(0,108,123,1,1);
	elseif i==2 then
		AddItem(0,109,126,1,1);
		AddItem(0,108,124,1,1);
	elseif i==3 then
		AddItem(0,109,127,1,1);
		AddItem(0,108,125,1,1);
	else
		AddItem(0,109,128,1,1);
		AddItem(0,108,126,1,1);
	end
	ModifyReputation(10,0);
	TaskTip("B¹n ®· gia nhËp Ngò §éc gi¸o, cã thÓ b¸i s­ häc nghÖ!")
	
	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	SetTask(FN_SL, 0);
	SetTask(FN_EM, 0);
	SetTask(FN_WD, 0);
	SetTask(FN_GB, 0);
	SetTask(FN_TM, 0);
	SetTask(FN_YM, 0);
	SetTask(FN_YMM, 0);
end

function task_exit()

end;

function fix_wp()
	SetTask(FN_WP,0);
	Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc gi¶i quyÕt! <sex> cã thÓ gia nhËp m«n ph¸i l¹i.",0);
end;