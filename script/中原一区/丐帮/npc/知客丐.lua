
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_³É¶¼\\task_main.lua");

function main()
    local szTalk = {
        "Xin hái cã ph¶i lµ Hång ThÊt ®¹i ca kh«ng? T¹i h¹ phông mÖnh Ph¹m Träng Yªn ®Õn th¨m hái, ®©y lµ tÝn vËt xin xem qua!",
        "<sex> kh«ng cÇn ®a lÔ. <sex> ®Õn ®©y v× chuyÖn cña Ph¹m tiªn sinh ph¶i kh«ng?",
        "§óng vËy!",
        "Ta ®· cho ®Ö tö C¸i Bang ®Õn ph©n ®µ Thµnh §« dß la, hiÖn vÉn ch­a vÒ. Ng­¬i gióp ta khai th«ng con ®­êng ®Õn D· Tr­ l©m ®­îc kh«ng?"
    };
    local szTalk1 = {
        "H¾n ta vÒ ch­a? Theo lÞch tr×nh h«m qua lµ tíi.",
        "§Ó t¹i h¹ ®i xem sao"
    };
    local szBack = {
        "§Ö tö dß la tin tøc ®· vÒ. §a t¹ <sex> däc ®­êng gióp ®ì.",
        "Hång ®¹i ca ®õng qu¸ kh¸ch s¸o, kh«ng biÕt Thµnh §« cã tin tøc g× kh«ng?"
    };
    local szBack2 = {
        "<sex> chuÈn bÞ lªn ®­êng ch­a?",
        "Ta ®· s½n sµng. PhiÒn Hång ®¹i ca!/task_four_yes",
        "Ta cÇn chuÈn bÞ, sÏ quay l¹i sau!/task_exit"
    };
    
    local nStep = GetTask(TASK_CD_FOUR);
    
    if nStep == 1 then
        TalkEx("task_four_01", szTalk);
        return
    elseif nStep == 5 then
        SetTask(TASK_CD_FOUR, 6);
        AddItem(2,0,80,1);
        TalkEx("task_four_05", szBack);
        return
    elseif nStep == 6 then
        SelectSay(szBack2);
        return
    end;
    
    local nTaskValue = FN_GetTaskState(FN_GB);
    
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
	
		task_003();
		return
	else
		if	GetPlayerFaction() == 4 then
			Say("Cã cÇn ta ®­a xuèng nói kh«ng?",2,"Ta phông lÖnh bang chñ xuèng nói!/outgaibang","Ta ®Õn th¨m S­ huynh th«i mµ!/no_gaibang")
		else
			Say("Ng­¬i t×m tiÓu ¨n mµy ta cã chuyÖn chi?",2,"Cã viÖc gÊp! Xin ®­a ta xuèng nói!/outgaibang","Ta ®Õn xem qua tæng ®µ C¸i Bang th«i!/no_other")
		end
	end
	
end;

function outgaibang()	
	if(GetPKValue() >3 ) then
		Msg2Player("Ng­êi lµm viÖc ¸c cÊm ra vµo th«n trÊn.")	
	else
        	SetFightState(0)
		i=random(1,4)
        	if i==1 then
			NewWorld(150, 1724 ,3075)
		elseif i==2 then
			NewWorld(150, 1630 ,3050)
		elseif i==3 then
			NewWorld(150, 1615 ,3175)			
		else 
			NewWorld(150, 1757 ,3179)
		end
	end
end;

function no_gaibang()
	if GetSex() == 1  then
 		Say("§õng t­ëng ta kh«ng biÕt, muèn ®Õn c­íp ®ïi gµ cña ta µ? Cót ®i!",0)
 	else
 		Say("S­ muéi ®Õn ®óng lóc l¾m! Huynh míi xin ®­îc ®ïi gµ, cã muèn nÕm thö kh«ng?",0)
 	end
end;


function no_other()
	if GetSex() == 1  then
 		Say("Ng«i miÕu hoang nµy ch¼ng cã g× ®Æc biÖt! C«ng tö! Xin mêi vµo!",0)
 	else
 		Say("Nµo d¸m phiÒn lßng c« n­¬ng! Xin mêi vµo trong!",0)
 	end
end;
