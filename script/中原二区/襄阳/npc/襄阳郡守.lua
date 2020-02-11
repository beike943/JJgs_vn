--talk to ÏåÑô¿¤ÊØ
--created by lizhi
--2005-8-30 10:35

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function main()
    local nStep = GetTask(TASK_XY_ONE);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 2 then
        task_02_00();
        return
    elseif nStep == 3 then
        task_03_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    elseif nStep == 5 then
        task_05_00();
        return
    end;
    Talk(1,"","C«ng viÖc bÒ bén, tiÕp ®ãn kh«ng ®­îc nång nhiÖt, xin miÔn chÊp!");
end;
        
function task_01_00()
    local szTalk = {
        "C«ng viÖc bÒ bén, tiÕp ®ãn kh«ng ®­îc chu ®¸o! Xin miÔn chÊp!",
    	"T¹i h¹ phôc mÖnh C«ng T«n Th­ ®Õn th«ng b¸o qu©n t×nh.",
    	"Th× ra lµ ng­êi cña C«ng T«n tiªn sinh. <sex> cã g× cÇn th«ng b¸o kh«ng?",
    	"Liªu Quèc vµ T©y H¹ ®ang ®ãng qu©n ë Phôc Ng­u S¬n B¾c, m­u toan ®¸nh chiÕm KiÕm M«n Quan. ViÖc nµy rÊt gÊp, mong Tæng binh chuÈn bŞ nh©n m· ®Ó øng chiÕn. T¹i h¹ cã mang theo tÊm b¶n ®å cña Phôc Ng­u S¬n xin ng­êi xem qua.",
    	"MÊy ngµy gÇn ®©y t×nh h×nh ngoµi ¶i kh¸c th­êng, th× ra lµ qu©n Liªu ®ang ®iÒu ®éng binh m·. ThËt ®a t¹ <sex> vµ C«ng T«n tiªn sinh ®· vÊt v¶.  Ta còng chØnh ®èn nh©n m· chuÈn bŞ xuÊt binh, vÖic nµy quan träng kh«ng thÓ chËm trÔ ®­îc. <sex> t¹m thêi nghØ ng¬i nhĞ!",
    	"Quèc gia cã thŞnh v­îng th× b¸ t¸nh míi an vui §­îc! T¹i h¹ lµm sao cã thÓ ngåi yªn nh×n bän giÆc ng«ng cuång nh­ vËy ®­îc. H·y ®Ó cho t¹i h¹ ®­îc ®ãng gãp mét chót c«ng søc.",
    	"<sex>! Ta ®· nghiªn cøu kü s¬ ®å! Liªu qu©n ë Phôc Ng­u S¬n chia lµm 2 nh¸nh, mçi bªn ®Òu cã {LÇu canh}. <sex> t×m c¸ch x©m nhËp vµo {®èt 2 lÇu canh} cña chóng.  Thõa lóc Liªu qu©n ho¶ng lo¹n ta sÏ ®­a binh x«ng vµo nhÊt ®Şnh sÏ chiÕm ®­îc hai doanh tr¹i cña chóng.",
        "ThËt lµ diÖu kÕ! T¹i h¹ sÏ ®i {®èt 2 lÇu canh} cña chóng!"
    };
    TalkEx("task_01_01", szTalk);
end;


function task_01_01()
    AddItem(2,0,70,2);
    SetTask(TASK_XY_ONE, 2);
    Msg2Player("Phãng háa g¸c canh qu©n Liªu");
    TaskTip("Phãng háa g¸c canh qu©n Liªu");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyBJKouzhun,"yehuoliangyuan")		--±ø·ÖÁ½Â·
end;

function task_02_00()
    local szTalk = {
        "<sex> cã thÓ lµm chuyÖn nµy kh«ng?",
        "Qu©n liªu canh phßng nghiªm ngÆt, g¸c canh kiªn cè mét İt thuèc næ vÇy e lµ kh«ng ®ñ…",
        "<sex> cÇn bao nhiªu qu©n dông xin cø nãi!"
    };
    local szMsg = {
        "Qu©n Liªu ë Phôc Ng­u S¬n chia lµm hai nh¸nh, mçi bªn ®Òu cã {LÇu canh}. <sex> h·y cÈn thËn nhĞ!"
    };
    if GetItemCount(2,0,70) < 2 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_02_01()
    AddItem(2,0,70,2);
end;

function task_03_00()
    local szTalk = {
        "<sex> tuæi trÎ tµi cao! {Ph¸ ®­îc 2 LÇu canh} khiÕn nhuÖ khİ ®Şch qu©n gi¶m sót rÊt nhiÒu!",
        "Còng lµ nhê m­u kÕ cña Tæng binh. Nh©n lóc qu©n Liªu ho¶ng lo¹n sao ta kh«ng thõa th¾ng x«ng lªn tiªu diÖt s¹ch bän chóng?",
        "Ta cã ı nh­ thÕ nµy, qu©n Liªu thÕ lùc tuy m¹nh nh­ng binh ph¸p rÊt kĞm, l­¬ng th¶o nu«i qu©n chóng kh«ng biÕt b¶o qu¶n. Chi b»ng ta c­íp s¹ch l­¬ng th¶o th× kh«ng cÇn ®¸nh chóng còng thÊt b¹i råi.",
        "HiÖn nay ®ang lµ mïa kh«, dïng háa lµ c¸ch tèt nhÊt. Cã lÏ t¹i h¹ ph¶i ®Õn Phôc Ng­u S¬n lÇn n÷a. {§èt l­¬ng thùc qu©n ®Şch}"
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_XY_ONE, 4);
    AddItem(2,0,70,1);
    Msg2Player("Phãng háa ®èt l­¬ng thùc qu©n Liªu");
    TaskTip("Phãng háa ®èt l­¬ng thùc qu©n Liªu");
    --GivePlayerAward("Level_32", "easy");
end;

function task_04_00()
    local szTalk = {
        "L­¬ng thùc chóng mang theo rÊt nhiÒu, háa d­îc kh«ng ®ñ dïng",
        "<sex> cÇn bao nhiªu qu©n dông xin cø nãi!"
    };
    local szMsg = {
        "L­¬ng th¶o qu©n Liªu kh«ng ®­îc canh gi÷, ®©y lµ c¬ héi tèt <sex> mau ®éng thñ ®i!"
    };
    if GetItemCount(2,0,70) < 1 then
        TalkEx("task_04_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_04_01()
    AddItem(2,0,70,1);
end;

function task_05_00()
    local szTalk = {
        "<sex> qu¶ lµ tuæi trÎ tµi cao.",
        "§a t¹ Tæng binh! Mét chót c«ng søc kh«ng ®¸ng lµ bao!"
    }
    TalkEx("",szTalk);
end;