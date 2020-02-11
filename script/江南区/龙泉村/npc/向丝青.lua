--ÔÚÑïÖÝÈÎÎñÏÄºîÁ«
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep >= 6 then
        local szTalk = {
            "Qu¶ lµ mô ®µn bµ ®éc ¸c!",
            "§éc ¸c µ? Kh«ng lµm vËy cã ai nhí ®Õn ta kh«ng?"
        };
        TalkEx("", szTalk);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 15 then
        task_15_00();
        return
    elseif nStep == 16 then
        task_16_00();
        return
    elseif nStep == 17 then
        Talk(1,"","Ng­¬i mau ®i lÊy <color=yellow>cao Thiªn ThiÒm Hãa §éc<color> cho TrÇn MÉn ®¹i phu nghiÖm chøng råi mang ®Õn cho <color=yellow>H¹ HÇu Liªn<color>!");
        return
    elseif nStep >= 20 and nStep < 22 then
        local szTalk = {
            "Sao c« n­¬ng l¹i cøu H¹ HÇu Liªn?",
            "Sau nµy ng­¬i kh¾c biÕt."
        };
        TalkEx("", szTalk);
        return
    elseif nStep >= 22 then
        local szTalk = {
            "Cã ph¶i c« n­¬ng ®· giÕt L«i Th¾ng!",
            "Kh«ng ph¶i ta, liÔu yÕu ®µo t¬ nh­ ta sao cã thÓ giÕt ®­îc chø?",
            "VËy c« n­¬ng mua nhiÒu binh khÝ ®Ó lµm g×?",
            "Ta còng cã ý ®ã, nh­ng l¹i sî vµo ®¹i lao. Ng­¬i…ng­¬i ®õng ®i b¸o quan…ta sî l¾m!"
        };
        TalkEx("", szTalk);
        return
    else
        if GetSex() == 1 then --male
            Talk(1,"","Tr¸nh xa ta ra! Muèn chÕt µ?");
        elseif GetSex() == 2 then --female
            Talk(1,"","TiÓu muéi s¾c ®Ñp tuyÖt trÇn! ThËt khiÕn ta nhí vÒ thêi son trÎ!");
        end;
    end;
end;