--  ÎÄ¼þËµÃ÷
--  ¶ÔÓ¦NPCÃû³Æ£ºÖÜ±ó¾Ù
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\14¼¶\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Chu B©n Cö: Giai kh«ng tr÷ lËp, tóc ®iÓu quy phi cÊp. Hµ xö thÕ quy tr×nh? Tr­êng ®×nh liªn ®o¶n ®×nh."
    };

    nStep = GetTask(TASK_LEV_14_ID);
    if (nStep == 1) then
        task_001_02();
    elseif (nStep == 2) then
        task_002_01();
    elseif (nStep == 3) then
        task_003_01();
    else
        TalkEx("", szTalk);
    end;

end;