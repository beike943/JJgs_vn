--Ê¹ÓÃ»ðÒ©Ö®ºóÖ´ÐÐµÄ½Å±¾
--created by lizhi
--2005-8-30 11:12

--¶«É½ÉÚ¸Ú  1542 3049
--Î÷É½ÉÚ¸Ú  1354 2856
--Á¸²Ý      1544 2686
--ê¢ÖØ      1544 2686

Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    local nMapId, nX, nY = GetWorldPos();
    local flagEast = 0;
    local flagWest = 0;
    local nDistEast = 0;
    local nDistWest = 0;

--ÉÕ»ÙÉÚ¸ÚµÄÈÎÎñ
    if GetTask(TASK_XY_ONE) == 2 then
    
        if GetTask(TASK_XY_ONE_ONE) ~= 1 then
            nDistEast = DistanceBetweenPoints(nMapId, nX, nY, 311, 1542, 3049);   --µ½¶«É½ÉÚ¸ÛµÄ¾àÀë    
            if nDistEast >= 0 and nDistEast <= 10 then
                flagEast = 1;
            end;
        end;
        
        if GetTask(TASK_XY_ONE_TWO) ~= 1 then  
            nDistWest = DistanceBetweenPoints(nMapId, nX, nY, 311, 1354, 2856);   --µ½Î÷É½ÉÚ¸ÛµÄ¾àÀë
            if nDistWest >= 0 and nDistWest <= 10 then
                flagWest = 1;
            end;
        end;
        --Msg2Player(flagWest);
        if flagEast ~= 1 and flagWest ~= 1 then
            Talk(1,"","Thuèc næ nµy dïng ®Ó ®èt {LÇu canh} cña Liªu qu©n ë Phôc Ng­u s¬n.");
            return
        end;
        
        if flagEast == 1 then
            Death("LÇu canh §«ng S¬n");
            DelItem(2,0,70,1);
            SetTask(TASK_XY_ONE_ONE, 1);   --Ö¤Ã÷ÉÕ»ÙµÄÊÇ¶«É½
        else
            Death("LÇu canh T©y S¬n");
            DelItem(2,0,70,1);
            SetTask(TASK_XY_ONE_TWO, 1);   --ÉÕ»ÙµÄÊÇÎ÷É½
        end;
        
        if GetTask(TASK_XY_ONE_ONE) == 1 and GetTask(TASK_XY_ONE_TWO) == 1 then
            SetTask(TASK_XY_ONE, 3);
            Msg2Player("VÒ b¸o cho Tæng binh T­¬ng D­¬ng");
            TaskTip("VÒ b¸o cho Tæng binh T­¬ng D­¬ng");
            SetTask(TASK_XY_ONE_ONE, 0);
            SetTask(TASK_XY_ONE_TWO, 0);
        end;
    end;
    
--ÉÕ»ÙÁ¸²ÝºÍê¢ÖØµÄÈÎÎñ 
    if GetTask(TASK_XY_ONE) == 4 then
        nDistEast = DistanceBetweenPoints(nMapId, nX, nY, 311, 1544, 2686);   --µ½Á¸²ÝºÍê¢ÖØµÄ¾àÀë
        if nDistEast >= 0 and nDistEast <= 10 then
            Death("L­¬ng th¶o");
            Death("Qu©n nhu");
            SetTask(TASK_XY_ONE, 5);
            AddItem(2,0,71,1);
            DelItem(2,0,70,1);
            if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --Èç¹ûÏåÑôÖ§ÏßÈÎÎñ¶¼Íê³ÉÁË£¬Ôò¼û¹«ËïÊé
                SetTask(TASK_XYTY, 56);
                Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
                TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
            end;
        else
            Talk(1,"","Thuèc næ nµy dïng ®Ó ®èt l­¬ng th¶o vµ qu©n nhu.");
        end;
    end;
end;