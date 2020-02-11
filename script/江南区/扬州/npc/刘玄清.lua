--ÁõÐþÇå
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 6 then
        task_06_00();
    elseif nStep == 7 then
        task_07_00();
    elseif nStep == 8 then
        task_08_00();
    elseif nStep == 9 then
        task_09_00();
    elseif nStep == 10 then
        local szTalk = {
            "LÇn tr­íc ta ®i ngang qua Tóy Xu©n LÇu d­êng nh­ tr«ng thÊy Thu Dung c« n­¬ng ®ang næi nãng víi mÊy g· Xi Háa gi¸o ®å. H·y t×m c« n­¬ng ®ã hái cí sù!"
        };
        TalkEx("",szTalk);
    elseif nStep > 10 then
        local szTalk = {
            "HiÒn thª ®· kh«ng cßn bªn ta n÷a! Dï cã luyÖn BÊt L·o tiªn ®¬n còng kh«ng gi÷ næi ng­êi th­¬ng yªu nhÊt bªn c¹nh ta, cïng ta sèng ®Õn r¨ng long ®Çu b¹c!"
        };
        TalkEx("", szTalk);
    else
        Talk(1,"","ThÞ ®¹o g× chø! Ban ngµy ban mÆt nãi kh«ng cho vµo ®éng lµ kh«ng vµo sao? V­¬ng ph¸p g× chø!");
    end;
end;