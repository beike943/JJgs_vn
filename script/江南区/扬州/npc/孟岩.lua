--ÔÚÑïÖİÈÎÎñÃÏÑÒ
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖİ\\task_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 13 then
        task_13_00();
    elseif nStep == 14 then
        task_14_00();
    elseif nStep >= 15 then
        local szTalk = {"<sex>, muèn mua binh khİ µ? TiÕc r»ng ta ®· b¸n hÕt råi!"};
        TalkEx("", szTalk);
    else
        Talk(1,"","ThËt xui xÎo! §Çu n¨m ®Çu th¸ng ch¶ mua ®­îc tı ph«i thĞp nµo!");
    end;
end;