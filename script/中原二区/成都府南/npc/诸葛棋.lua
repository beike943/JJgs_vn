--Öî¸ğÆå
--created by lizhi
--2005-8-24 19:09
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_½­½ò´å\\task_main.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function main()
	if GetTask(126) == 1 then	--ÕÔÑÓÄêÍ¨Öª
    	talk_one();
    	return
   	end;
   	
   	if GetTask(128) == 1 then		--ÏÄºîÇÙÍ¨Öª
   		talk_five();
   		return
   	end;
   	
    local nStep = GetTask(TASK_JJC);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 8 then
        task_08_00();
        return
    elseif nStep == 9 then
        task_09_00();
        return
    elseif nStep == 13 then
        task_13_00();
        return
    elseif nStep == 14 then
        task_14_00();
        return
    elseif nStep == 15 or nStep == 16 then
        task_15_00();
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 23 then
        task_23_00();
        return
    elseif nStep == 32 then
        task_32_zgq();
        return
    elseif nStep >= 33 then
        task_33_00();
        return
    end;
   	
    local szTalk = {
        "Tung hoµnh bèn ph­¬ng, rèt cuéc còng chØ v× mét ch÷ “§¹O” mµ ra! HÇy!..."
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szMsg = {
        "V·n bèi phông mÖnh TriÖu Diªn Niªn tiÒn bèi th«ng b¸o tiÒn bèi cÇn ®Ò phßng bän dŞ téc vâ sÜ .",
        "Haha! §a t¹ <sex>, kh«ng biÕt tµi ch¬i cê cña hä thÕ nµo?"
    };
    
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--ÊÂÌ¬½ô¼±2
    SetTask(126, 2);
    if GetTask(125) == 2 and GetTask(124) == 2 then
        SetTask(111, 111);
    end;
    TalkEx("", szMsg);
end;

function talk_five()

    local szMsg = {
        "H¹ HÇu CÇm nhê v·n bèi ®Õn th«ng b¸o vÒ m¶nh S¬n Hµ X· T¾c cã kh¶ n¨ng r¬i vµo tay Xi Háa gi¸o, xin tiÒn bèi xem qua th­ nµy!",
        "§a t¹ anh hïng!",
        "Cßn nhiÒu ng­êi cÇn ph¶i th«ng b¸o n÷a, v·n bèi ®i ®©y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(128,2);
        DelItem(2,0,41,1);
        TalkEx("", szMsg);
        return
    end;
end;
