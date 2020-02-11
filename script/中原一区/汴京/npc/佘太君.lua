--ÈÎÎñ
--µØµã£ºãê¾©¸®  ÈÎÎñ£ºÌìÃÅÕóÈÎÎñ½áµã6
--²ß»®£º·®ÍòËÉ  2004.03.
--append by lizhi
--2005-8-8 11:26

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ãê¾©\\task_main.lua");

function main()

    local nBjStep = GetTask(TASK_BJ_ID);    --ãê¾©ÈÎÎñ
    local UWorld1401 = GetTask(1401);
    
    if nBjStep >= 1 and nBjStep<=6 and UWorld1401 ~= 0 then
        local szSay = {
            "<sex> t×m ta cã viÖc g× kh«ng?",
            "NhiÖm vô BiÖn Kinh/bj_question",
            "NhiÖm vô Thiªn M«n trËn/tmz_question"
        }
        SelectSay(szSay);
        return
    end;
    
    if nBjStep >= 1 and nBjStep<=6 then
        bj_question();
        return
    end;
    
    if UWorld1401 ~= 0 then
        tmz_question();
        return
    end;
    Talk(1,"","GiÆc KhiÕt §an tù cao tù ®¹i nh­ng kh«ng dÔ x©m ph¹m c­¬ng thæ §¹i Tèng ta!");
end;


function bj_question()
    local nBjStep = 0;
    nBjStep = GetTask(TASK_BJ_ID);  --ãê¾©ÏµÁÐÈÎÎñµÄÈÎÎñ±äÁ¿
    
    if (nBjStep == 1) then
        task_001_00();
        return
    elseif (nBjStep == 2) then
        task_002_00();
        return
    elseif (nBjStep == 3) then
        task_003_00();
        return
    elseif (nBjStep == 4) then
        task_004_01();
        return
    elseif (nBjStep == 5) then
        task_005_00();
        return
    elseif (nBjStep == 6) then
        task_006_00();
        return
    else
    	Talk(1,"","GiÆc KhiÕt §an tù cao tù ®¹i nh­ng kh«ng dÔ x©m ph¹m c­¬ng thæ §¹i Tèng ta!")
    end;
end;

function tmz_question() --ÌìÃÅÕóÈÎÎñ
    local UWorld1401 = GetTask(1401);
    if ( UWorld1401 == 40 )  then
    	Talk(6,"","T¹i h¹ vÊn an Xa L·o Th¸i Qu©n!","Khµ! Khµ! §a t¹! Xin hái anh hïng cã g× chØ gi¸o!","Tõ nhá t¹i h¹ vèn sïng kÝnh D­¬ng t­íng qu©n, nay muèn b¸o danh gia nhËp D­¬ng Gia qu©n giÕt giÆc KhiÕt §an. Nµo ngê bÞ biÖt ph¸i ®Õn L­¬ng S¬n B¹c, xin L·o Th¸i Qu©n ph¸i t¹i h¹ ®Õn Nh¹n M«n quan tiÒn tuyÕn!","Hõ! ChuyÖn nµy dÔ th«i! ChuyÖn cña D­¬ng Gia qu©n, l·o ®©y cã thÓ tù quyÕt! Cø nãi lµ ta ph¸i ng­¬i ®i sÏ dÔ dµng ®Çu qu©n!","TiÖn thÓ ng­¬i chuyÓn lêi cho phu qu©n <color=red>D­¬ng NghiÖp<color> cña ta ë <color=red>Nh¹n M«n quan<color> r»ng: TiÓu nh©n léng quyÒn, hµ tÊt ph¶i ph« tµi.","§a t¹ L·o Th¸i Qu©n chiÕu cè! TiÓu nh©n nhÊt ®Þnh chuyÓn lêi!")
        SetTask(1401,45)
        ----AddItem(0,0,0)
        Earn(1000)
        ModifyExp(1500)
        ModifyReputation(12,0)
        AddNote("§Õn Nh¹n M«n quan t×m D­¬ng NghiÖp chuyÓn lêi cña Xa Th¸i Qu©n, ®ång thêi hái th¨m tin tøc vÒ B¶n ®å S¬n Hµ X· T¾c!")
        TaskTip("§Õn Nh¹n M«n quan t×m D­¬ng NghiÖp chuyÓn lêi cña Xa Th¸i Qu©n, ®ång thêi hái th¨m tin tøc vÒ B¶n ®å S¬n Hµ X· T¾c!")
    	
    elseif ( UWorld1401  == 45  ) then
    		Talk(1,"","Gióp ta chuyÓn lêi cho phu qu©n <color=red>D­¬ng NghiÖp<color> ë <color=red>Nh¹n M«n quan<color>!")	
    elseif ( UWorld1401  > 45  ) then
    	Talk(1,"","§a t¹ b»ng h÷u!")
    else
    	Talk(1,"","GiÆc KhiÕt §an tù cao tù ®¹i nh­ng kh«ng dÔ x©m ph¹m c­¬ng thæ §¹i Tèng ta!")
    end
end;