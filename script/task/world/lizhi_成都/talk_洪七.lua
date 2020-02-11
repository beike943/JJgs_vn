--ÎÄ¼þËµÃ÷
--ÓëºéÆß¶Ô»°
--created by lizhi
--2005-8-15 9:59

Include("\\script\\task\\world\\lizhi_³É¶¼\\task_main.lua");

function talk_four()
    local szTalk = {
        "Xin hái cã ph¶i lµ Hång ThÊt ®¹i ca kh«ng? T¹i h¹ phông mÖnh Ph¹m Träng Yªn ®Õn th¨m hái, ®©y lµ tÝn vËt xin xem qua!",
        "<sex> kh«ng cÇn ®a lÔ. <sex> ®Õn ®©y v× chuyÖn cña Ph¹m tiªn sinh ph¶i kh«ng?",
        "§óng vËy!",
        "Ta ®· cho ®Ö tö C¸i Bang ®Õn ph©n ®µ Thµnh §« dß la, hiÖn vÉn ch­a vÒ. Ng­¬i gióp ta khai th«ng con ®­êng ®Õn D· Tr­ l©m ®­îc kh«ng?"
    };
    local szTalk1 = {
        "H¾n ta vÒ ch­a? Theo lÞch tr×nh h«m qua lµ tíi.",
        "§Ó t¹i h¹ ®i xem sao"
    };
    local szBack = {
        "§Ö tö dß la tin tøc ®· vÒ. §a t¹ <sex> däc ®­êng gióp ®ì.",
        "Hång ®¹i ca ®õng qu¸ kh¸ch s¸o, kh«ng biÕt Thµnh §« cã tin tøc g× kh«ng?"
    };
    local szBack2 = {
        "<sex> chuÈn bÞ lªn ®­êng ch­a?",
        "Ta ®· s½n sµng. PhiÒn Hång ®¹i ca!/task_four_yes",
        "Ta cÇn chuÈn bÞ, sÏ quay l¹i sau!/task_exit"
    };
    
    local nStep = GetTask(TASK_FOUR);
    
    if nStep == 1 then
        TalkEx("task_four_01", szTalk);
        Msg2Player("T×m ®Ö tö C¸i Bang");
        TaskTip("T×m ®Ö tö C¸i Bang");
    elseif nStep == 2 or nStep == 3 or nStep == 4 then
        TalkEx("", szTalk1);
    elseif nStep == 5 then        
        SetTask(TASK_FOUR, 6);
        AddItem(2,0,80,1);
        TalkEx("task_four_05", szBack);
    elseif nStep == 6 then
        SelectSay(szBack2);
    end;
    
end;

function task_four_05()
    local szBack1 = {
        "HiÖn Thµnh §« ®ang n¸o lo¹n. PhiÒn <sex> mang th­ nµy vÒ cho Ph¹m tiªn sinh. Cã cÇn ta ®­a <sex> vÒ Thµnh §« kh«ng?",
        "Ta ®· s½n sµng. PhiÒn Hång ®¹i ca!/task_four_yes",
        "Ta cÇn chuÈn bÞ, sÏ quay l¹i sau!/task_exit"
    };
    SelectSay(szBack1);
end;