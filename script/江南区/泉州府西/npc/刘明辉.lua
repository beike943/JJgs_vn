--  ÎÄ¼şËµÃ÷
--  ¶ÔÓ¦NPCÃû³Æ£ºÁõÃ÷êÍ
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_ÈªÖİ\\14¼¶\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Ha ha! Nöa ®êi sau cña ta kh«ng cÇn sèng lÖ thuéc vµo ng­êi kh¸c!"
    };

    nStep = GetTask(TASK_LEV_14_ID);

    if (nStep == 3) then
        task_003_02();
    elseif (nStep == 4) then
        task_004_01();
    else
        TalkEx("", szTalk);
    end;

end;
