--ÎÄ¼þËµÃ÷
--³É¶¼½Å±¾
--created by lizhi
--2005-8-12 14:41

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua")

function task_one_00()
    local szTalk = {
        "T¸i h¹ thu lai phong c¶nh dÞ, Hµnh d­¬ng nh¹n khø v« l­u ý…",
        "Th¬ hay l¾m! Ph¹m tiªn sinh v¨n ch­¬ng xuÊt chóng, hËu sinh kh©m phôc.",
        "<sex> qu¸ khen! Kh«ng biÕt <sex> t×m Ph¹m mç cã chuyÖn g×?",
        "T¹i h¹ trong lóc ®iÒu tra Thanh Minh Th­îng Hµ ®å ph¸t hiÖn T« Hµng m­în danh vËn chuyÓn Hoa Th¹ch C­¬ng thùc chÊt vËn chuyÓn m¶nh S¬n Hµ X· T¾c vµo cung. §¸m ng­êi L­¬ng s¬n bµy m­u c­íp Hoa Th¹ch C­¬ng vµ S¬n Hµ X· T¾c. Sù viÖc träng ®¹i D· TÈu nhê ta hái ý kiÕn Ph¹m tiªn sinh.",
        "ChuyÖn nµy kh«ng ®¬n gi¶n! HiÖn Ph¹m mç cã chót chuyÖn muèn nhê <sex> gióp ®ì!",
        "Gióp ®­îc tiÒn bèi lµ vinh dù cña v·n bèi ®©y.",
        "Ph¹m mç cã nhê §­êng Kþ gióp lµm Lang Cèt töu, kh«ng biÕt xong ch­a? PhiÒn <sex> ®Õn ®ã xem thö! Vµ mang r­îu vÒ ®©y!",
        "Xin Ph¹m tiªn sinh ®îi tin vui cña ta!"
    };
    TalkEx("task_one_01", szTalk);
end;

function task_one_01()
    DelItem(2,0,49,1);
    GivePlayerAward("Level_10", "easy");    --½±Àø
	GivePlayerExp(SkeyCDFanzhongyan,"baifangfanzhongyan")	--°Ý·Ã·¶ÖÙÑÍ
    SetTask(TASK_CD_ONE, 1);
    SetTask(TASK_CD_TWO, 101);
    Msg2Player("§Õn §­êng M«n t×m §­êng Kþ mang Lang Cèt töu vÒ!");
    TaskTip("§Õn §­êng M«n t×m §­êng Kþ mang Lang Cèt töu vÒ!");
end;

function task_one_01_00()
    local szTalk = {
        "<sex>, ta nghe nãi Lang Cèt töu cña §­êng M«n danh chÊn thiªn h¹, kh«ng biÕt khi nµo míi th­ëng thøc ®­îc."
    };
    TalkEx("", szTalk);
end;

function task_two_01()
    local szTalk = {
        "<sex> ®Õn cã chuyÖn g× kh«ng?",
        "Ph¹m tiªn sinh b¶o ta ®Õn lÊy Lang Cèt töu.",
        "Do d¹o nµy §­êng phñ bËn nhiÒu viÖc quªn mÊt chuyÖn Lang Cèt töu, kh«ng biÕt <sex> cã thÓ gióp ta t×m {10 Thæ Lang cèt}, {10 Thanh Lang cèt} kh«ng?",
        "§¬n gi¶n th«i, ®Ó ta t×m vÒ!"
    };
    TalkEx("task_two_01_01", szTalk);
end;

function task_two_01_01()
    SetTask(TASK_CD_TWO, 102);
    
    CreateTrigger(0, 513, KILL_CD_TL); --É±Ð¡ÍÁÀÇ
    CreateTrigger(0, 514, KILL_CD_QL); --É±Ð¡ÇàÀÇ
    Msg2Player("Thu thËp 10 Thæ Lang cèt vµ 10 Thanh Lang cèt");
    TaskTip("Thu thËp 10 Thæ Lang cèt vµ 10 Thanh Lang cèt");
end;

function task_two_02()
    local szTalk = {
        "Nh­ng muèn lµm Lang Cèt töu cÇn {8 ®ãa Tö Tinh Hoa}, {B¸ch NhËt TiÔn} ë gÇn §­êng M«n cã lo¹i hoa nµy. <sex> gióp ta nhÐ!"
    };
    local szNot = {
        "<sex> ch­a t×m ®ñ {Thæ lang cèt} vµ {Thanh lang cèt} µ?"
    };
    if GetItemCount(2,0,74) >= 10 and GetItemCount(2,0,75) >= 10 then
        TalkEx("task_two_02_01", szTalk);
    else
        TalkEx("task_two_02_02", szNot);
    end;
end;

function task_two_02_02()
    if GetTrigger(KILL_CD_TL) == 0 then
        CreateTrigger(0, 513, KILL_CD_TL); --É±Ð¡ÍÁÀÇ
    end;
    if GetTrigger(KILL_CD_QL) == 0 then
        CreateTrigger(0, 514, KILL_CD_QL); --É±Ð¡ÇàÀÇ
    end;
end;

function task_two_02_01()

    GivePlayerAward("Level_14", "easy");    --½±Àø
	GivePlayerExp(SkeyCDFanzhongyan,"nenglishilian")	--ÄÜÁ¦ÊÔÁ¶
    RemoveTrigger(GetTrigger(KILL_CD_TL));
    RemoveTrigger(GetTrigger(KILL_CD_QL));

    DelItem(2,0,74,10);
    DelItem(2,0,75,10);
    SetTask(TASK_CD_TWO, 103);
    CreateTrigger(0,515,KILL_CD_BRJ);   --É±°ÙÈÕ¼ý
    
    Msg2Player("Thu thËp 8 ®ãa Tö Tinh hoa");
    TaskTip("Thu thËp 8 ®ãa Tö Tinh hoa");
end;

function task_two_03()
    local szSay = {
        "B¸ch NhËt TiÔn tuy lîi h¹i nh­ng kh«ng ®¸nh l¹i <sex> ®©u.",
        "§­¬ng nhiªn! Ta ®· mang Tö Tinh hoa vÒ./task_two_03_yes",
        "……/task_two_03_no"
    };
    SelectSay(szSay);
end;

function task_two_03_no()
    if GetTrigger(KILL_CD_BRJ) == 0 then
        CreateTrigger(0,515,KILL_CD_BRJ);   --É±°ÙÈÕ¼ý
    end;
end;

function task_two_03_yes()
    local szTalk = {
        "Vâ c«ng cña <sex> qu¶ nhiªn cao c­êng. Lang Cèt töu ®©y. PhiÒn <sex> mang cho Ph¹m tiªn sinh."
    };
    local szNot = {
        "<sex> ch­a t×m ®ñ {Tö Tinh hoa} µ?"
    };
    
    if GetItemCount(2,0,76) >= 8 then
        TalkEx("task_two_03_01", szTalk);
    else
        TalkEx("task_two_03_no", szNot);
    end;
end;

function task_two_03_01()
    RemoveTrigger(GetTrigger(KILL_CD_BRJ));
    DelItem(2,0,76,8);
    AddItem(2,0,77,1);  --ÀÇ¹Ç¾Æ
    SetTask(TASK_CD_TWO, 104);
    SetTask(TASK_CD_THREE, 1);
    Msg2Player("Mang Lang Cèt töu vÒ cho Ph¹m Träng Yªm");
    TaskTip("Mang Lang Cèt töu vÒ cho Ph¹m Träng Yªm");
end;

function task_three_01()
    local szTalk = {
        "<sex> vÒ råi µ? Cã mang Lang Cèt töu kh«ng?",
        "Lang Cèt töu ®©y, tiÒn bèi xem ®óng kh«ng?",
        "R­îu ngon! R­îu ngon! <sex> gióp Ph¹m mç mét lÇn n÷a ®­îc kh«ng? Th¸i thó Thµnh §« muèn t×m Ph¹m mç, phiÒn <sex> ®Õn ®ã mét chuyÕn."
    };
    TalkEx("task_three_00_01", szTalk);
end;

function task_three_00_01()
    GivePlayerAward("Level_14", "hard", "head", "Level_14");    --½±Àø
	GivePlayerExp(SkeyCDFanzhongyan,"zhengyishilian1")	--ÕýÒåÊÔÁ¶1
    DelItem(2,0,77,1);
    SetTask(TASK_CD_THREE, 2);
    SetTask(TASK_CD_ONE, 2);   --Ïûµô°Ý·Ã·¶ÖÙÑÍÈÎÎñÃæ°å
    
    Msg2Player("Th¨m th¸i thó Thµnh §«");
    TaskTip("Th¨m th¸i thó Thµnh §«");
end;

function task_three_02()
    local szTalk = {
        "Th¸i thó t×m ta kh«ng biÕt cã chuyÖn g× kh«ng?",
        "§Ó taÞ h¹ ®Õn ®ã xem sao"
    };
    TalkEx("", szTalk);
end;

function task_three_02_01()
    local szTalk = {
        "Lµ ai vËy?",
        "T¹i h¹ phông mÖnh Ph¹m tiªn sinh ®Õn t×m th¸i thó, kh«ng biÕt ng­êi ®ang phiÒn muén chuyÖn g×?",
        "Haha! VÞ hËu bèi nµy cã muèn ra søc gióp triÒu ®×nh kh«ng?",
        "HiÖn ®Êt n­íc ®ang lo¹n trong giÆc ngoµi, ng­êi häc vâ nh­ t¹i h¹ ®©y sao cã thÓ ®øng lµm ng¬.",
        "ChØ cÇn <sex> gióp ta lµm mét chuyÖn, bæn quan b¶o ®¶m tiÒn ®å cña ng­¬i kh«ng tåi ®©u.",
        "Kh«ng biÕt ®¹i nh©n muèn nãi chuyÖn g×?",
        "L·o giµ Ph¹m Träng Yªm kh«ng nÓ mÆt bæn quan, mµ cßn l¨ng m¹ n÷a, ta muèn <sex> hñy ho¹i danh tiÕng cña h¾n.",
        "ChuyÖn nµy t¹i h¹ kh«ng gióp ®­îc.",
        "<sex> xin chËm b­íc! VÒ víi ta, c«ng danh bæng léc, vinh hoa phó quý c¶ ®êi h­ëng kh«ng hÕt.",
        "T¹i h¹ ®· quyÕt, xin c¸o tõ!"
    };
    TalkEx("task_three_02_02", szTalk);
end;

function task_three_02_02()
    SetTask(TASK_CD_THREE, 3);
end;

function task_three_03()
    local szTalk = {
        "<sex> vÒ råi µ? Kh«ng biÕt th¸i thó t×m ta cã chuyÖn g×?",
        "Th¸i thó muèn mua chuéc ta h·m h¹i Ph¹m tiªn sinh, tuy t¹i h¹ kh­íc tõ nh­ng thiÕt nghÜ «ng ta sÏ kh«ng bá qua chuyÖn nµy ®©u.",
        "<sex> tÝnh khÝ th¼ng th¾n, nÕu «ng ta cã c¸ch th× ta rêi khái ®©y l©u råi. <sex> ®õng qu¸ lo l¾ng!",
        "Kh«ng lÏ Ph¹m tiªn sinh biÕt ®­îc ý ®å cña «ng ta?",
        "B¶n ®å S¬n Hµ X· T¾c liªn qua tíi vËn mÖnh quèc gia. Ph¹m mç cÇn ph¶i kiÓm tra n¨ng lùc <sex>, ®i t×m Lang Cèt töu ®Ó thö lßng kiªn nhÉn <sex>, t×m th¸i thó muèn hiÓu phÈm chÊt cña <sex>. <sex> qu¶ nhiªn ng­¬i lµ ng­êi ngay th¼ng kh«ng mµng danh lîi, thËt ®¸ng kh©m phôc!",
        "Kh«ng d¸m! Kh«ng d¸m! VËy b­íc tiÕp theo sÏ lµm g×?",
        "C¸i Bang tai m¾t nhiÒu, l·o cã viÕt bøc th­ nhê ®Ö tö C¸i Bang dß la tin tøc! Xin gióp ta mang tÝn vËt nµy ®Õn C¸i Bang t×m Hång ThÊt."
    };
    TalkEx("task_three_03_02", szTalk);
end;

function task_three_03_02()

    GivePlayerAward("Level_16", "hell");    --½±Àø
    GivePlayerExp(SkeyCDFanzhongyan,"zhengyishilian2")	--ÕýÒåÊÔÁ¶2
    AddItem(2,0,78,1);
    --RemoveTrigger(GetTrigger(153));
    SetTask(TASK_CD_FOUR, 1);
    SetTask(TASK_CD_THREE, 4);
    Msg2Player("§Õn C¸i Bang dß la tin tøc");
    TaskTip("§Õn C¸i Bang dß la tin tøc");
end;

function task_three_03_01()
    local szTalk = {
        "<sex> ®æi ý ®Õn gióp bæn quan råi ­?",
        "ChØ ngang qua th«i! C¸o tõ!"
    };
    TalkEx("", szTalk);
end;

function task_three_04()
    local szTalk = {
        "C¸i Bang tai m¾t nhiÒu, kh«ng chõng ®· cã tin tøc.",
        "T¹i h¹ ®Õn C¸i Bang ngay!"
    };
    TalkEx("", szTalk);
end;

function task_four_01()

    GivePlayerAward("Level_18", "easy");    --½±Àø
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing1")	--Ø¤°ïÖ®ÐÐ1
    DelItem(2,0,78,1);
    SetTask(TASK_CD_FOUR, 2);
    Msg2Player("T×m ®Ö tö C¸i Bang");
    TaskTip("T×m ®Ö tö C¸i Bang");
end;

function task_four_02()
    SetTask(TASK_CD_FOUR, 3);
    CreateTrigger(0, 516, KILL_CD_XT); --É±Ð¡Íµ
    CreateTrigger(0, 517, KILL_CD_FZ); --ÉÙ·ÉÔô
    Msg2Player("Gióp ®Ö tö C¸i Bang t×m hµnh lý");
    TaskTip("Gióp ®Ö tö C¸i Bang t×m hµnh lý");
end;

function task_four_03()
    if GetTrigger(KILL_CD_XT) == 0 then
        CreateTrigger(0, 516, KILL_CD_XT); --É±Ð¡Íµ
    end;
    if GetTrigger(KILL_CD_FZ) == 0 then
        CreateTrigger(0, 517, KILL_CD_FZ); --É±·ÉÔô
    end;
end;

function task_four_04()

    GivePlayerAward("Level_18", "easy");    --½±Àø
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing2")	--Ø¤°ïÖ®ÐÐ2
    DelItem(2,0,79,1);
    SetTask(TASK_CD_FOUR, 5);
end;

function task_four_05()
    local szBack1 = {
        "HiÖn Thµnh §« ®ang n¸o lo¹n. PhiÒn <sex> mang th­ nµy vÒ cho Ph¹m tiªn sinh. Cã cÇn ta ®­a <sex> vÒ Thµnh §« kh«ng?",
        "Ta ®· s½n sµng. PhiÒn Hång ®¹i ca!/task_four_yes",
        "Ta cÇn chuÈn bÞ, sÏ quay l¹i sau!/task_exit"
    };
    SelectSay(szBack1);
end;

function task_four_yes()
    --RemoveTrigger(GetTrigger(154));
    
    SetTask(TASK_CD_FOUR, 7);
    
    --´«ËÍµ½³É¶¼
	SetFightState(0);
	i=random(1,3);
--	if i==1 then
--		NewWorld(300, 1896 ,3655)
	if i==2 then
		NewWorld(300, 1677 ,3671);
	elseif i==3 then
		NewWorld(300, 1681 ,3464);
	else 
		NewWorld(300, 1911 ,3442);
	end;
end;

function task_four_0607()
    local szTalk = {
        "<sex> vÊt v¶ qu¸! Cã tin tøc g× tõ C¸i Bang kh«ng?",
        "Cã th­ cña Hång ThÊt ®¹i ca, mêi tiªn sinh xem qua.",
        "Th× ra cßn bÝ mËt bªn trong.",
        "Tiªn sinh sao ®¨m chiªu vËy?",
        "Ng­¬i biÕt T©y H¹ NhÊt PhÈm ®­êng kh«ng?",
        "T¹i h¹ míi b­íc ch©n vµo chèn giang hå, xin tiªn sinh chØ gi¸o.",
        "§ã lµ mét tæ chøc gi¸n ®iÖp cña n­íc T©y H¹, hä phô tr¸ch phÝa t©y ph¸ ho¹i vµ ng¨n c¶n ng­êi kh¸c. T©y H¹ mËt b¸o cho L­¬ng S¬n biÕt ©m m­u Hoa Th¹ch C­¬ng bªn trong chøa b¶n ®å S¬n Hµ X· T¾c.",
        "Nãi nh­ vËy gi÷a chóng cã mèi quan hÖ mËt thiÕt?",
        "L­¬ng S¬n tuy lµ S¬n tÆc nh­ng thñ lÜnh Tèng Giang chÝnh trùc, cã lßng yªu n­íc kh«ng thÓ nµo cÊu kÕt víi ®¸m ng­êi T©y H¹. Sù viÖc hÖ träng! Xin mang tÝn vËt nµy ®Õn Giang T©n Th«n t×m Gia C¸t Kú.",
        "T¹i h¹ lËp tøc lªn ®­êng ngay!"
    };
    TalkEx("task_four_0607_01", szTalk);
end;

function task_four_0607_01()
    GivePlayerAward("Level_18", "hell");    --½±Àø
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing3")	--Ø¤°ïÖ®ÐÐ3
    SetTask(TASK_CD_FOUR, 8);
    SetTask(TASK_JJC, 1);
    AddItem(2,0,78,1);
    DelItem(2,0,80,1);
    Msg2Player("§Õn Giang T©n Th«n t×m Gia C¸t Kú");
    TaskTip("§Õn Giang T©n Th«n t×m Gia C¸t Kú");
end;

function task_four_08()
    local szTalk = {
        "Giang hå s¾p cã cuéc ®Ém m¸u n÷a."
    };
    TalkEx("", szTalk);
end;

function task_exit()

end;
