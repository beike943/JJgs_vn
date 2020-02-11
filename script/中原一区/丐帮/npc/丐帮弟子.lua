--ÎÄ¼şËµÃ÷
--ÓëØ¤°ïµÜ×Ó¶Ô»°
--created by lizhi
--2005-8-15 10:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_³É¶¼\\task_main.lua");

function main()
    local szTalk = {
        "µi…!",
        "VŞ tiÓu huynh ®Ö ®©y cã ph¶i ®Ö tö C¸i Bang kh«ng? Hång s­ thóc sai ta t×m huynh.",
        "<sex> kh«ng hiÓu ®©u! Kh«ng ph¶i ta kh«ng muèn vÒ, mµ lµ.....",
        "Sao thÕ?",
        "MÊy h«m tr­íc ®i ngang qua L­¬ng S¬n B¹c bŞ ®¸m s¬n tÆc phôc kİch, may ch¹y tho¸t nh­ng hµnh lı ®· bŞ chóng lÊy mÊt.",
        "§Ó ta gióp ng­¬i t×m {hµnh lı} vÒ."
    };
    local szTalk1 = {
        "T×m ®­îc hµnh lı ch­a?",
        "ë ®©y nhiÒu s¬n tÆc qu¸, ®Ó ta t×m l¹i!"
    };
    local szFinished = {
        "T×m ®­îc hµnh lı ch­a?",
        "Hµnh lı nµy ph¶i cña huynh kh«ng?",
        "§óng vËy! §a t¹ <sex>, ta lËp tøc vÒ gÆp s­ thóc ®©y!"
    };
    local szTalk2 = {
        "Kh«ng lo s­ thóc khiÓn tr¸ch n÷a råi!"
    };
    
    local nStep = GetTask(TASK_CD_FOUR);
    
    if nStep == 2 then
        TalkEx("task_four_02", szTalk);
        return
    elseif nStep == 3 then
        TalkEx("task_four_03", szTalk1);
        return
    elseif nStep == 4 then
        TalkEx("task_four_04", szFinished);
        return
    elseif nStep == 5 then
        TalkEx("", szTalk2);
        return
    end;
    
    Talk(1, "", "¸i da……");
end;