--ÎÄ¼þËµÃ÷
--ÓëØ¤°ïµÜ×Ó¶Ô»°
--created by lizhi
--2005-8-15 10:11

Include("\\script\\task\\world\\lizhi_³É¶¼\\task_main.lua");

function talk_four()
    local szTalk = {
        "µi…!",
        "VÞ tiÓu huynh ®Ö ®©y cã ph¶i ®Ö tö C¸i Bang kh«ng? Hång s­ thóc sai ta t×m huynh.",
        "<sex> kh«ng hiÓu ®©u! Kh«ng ph¶i ta kh«ng muèn vÒ, mµ lµ.....",
        "Sao thÕ?",
        "MÊy h«m tr­íc ®i ngang qua L­¬ng S¬n B¹c bÞ ®¸m s¬n tÆc phôc kÝch, may ch¹y tho¸t nh­ng hµnh lý ®· bÞ chóng lÊy mÊt.",
        "§Ó ta gióp ng­¬i t×m {hµnh lý} vÒ."
    };
    local szTalk1 = {
        "T×m ®­îc hµnh lý ch­a?",
        "ë ®©y nhiÒu s¬n tÆc qu¸, ®Ó ta t×m l¹i!"
    };
    local szFinished = {
        "T×m ®­îc hµnh lý ch­a?",
        "Hµnh lý nµy ph¶i cña huynh kh«ng?",
        "§óng vËy! §a t¹ <sex>, ta lËp tøc vÒ gÆp s­ thóc ®©y!"
    };
    local szTalk2 = {
        "Kh«ng lo s­ thóc khiÓn tr¸ch n÷a råi!"
    };
    
    local nStep = GetTask(TASK_FOUR);
    
    if nStep == 2 then
        TalkEx("task_four_02", szTalk);
        Msg2Player("Gióp ®Ö tö C¸i Bang t×m hµnh lý");
        TaskTip("Gióp ®Ö tö C¸i Bang t×m hµnh lý");
    elseif nStep == 3 then
        TalkEx("", szTalk1);
    elseif nStep == 4 then
        TalkEx("task_four_04", szFinished);
    elseif nStep == 5 then
        TalkEx("", szTalk2);
    end;
end;
    