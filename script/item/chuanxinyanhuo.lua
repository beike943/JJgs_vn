-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñ´«ĞÅÑÌ»ğÎÄ¼ş                 
-- Edited by starry night                                 
-- 2005/11/28 PM 17:40                                    
                                                          
-- ======================================================

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse() 

	local nMapID = GetWorldPos();
	
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," ë tr¹ng th¸i so tµi kh«ng cho phĞp dïng vËt phÈm nµy!")
		return
	end	

	if GetFightState() == 1 and nMapID < 700 then
		Say("B¹n x¸c nhËn muèn gäi 1 NhÊt PhÈm §­êng s¸t thñ ra gióp søc cho b¹n?",
				2,
				"§­îc/yes",
				"Kh«ng cÇn/no")
	else
		Talk(1,"","B¹n chØ cã thÓ sö dông vËt phÈm nµy ë ngoµi thµnh!");
	
	end;
end;

function yes()
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," ë tr¹ng th¸i so tµi kh«ng cho phĞp dïng vËt phÈm nµy!")
		return
	end	
	if GetFightState() ~= 1 then
		Talk(1,"","B¹n chØ cã thÓ sö dông vËt phÈm nµy ë ngoµi thµnh!");
		return
	end

	local nLastUseTime = GetTask(TASK_USEYANHUO_TIME);
	local nNowTime = GetTime();
	local nTime = nNowTime - nLastUseTime;
	local nRemainTime = nTime;
	local strTime = "";
		
		nTime = 900 - nTime;
		
		if nTime < 0 then
			nTime = 0;
		end;
		
		strTime = TurnTime(nTime);
		
		if nRemainTime < 900 then
			Say("Kh«ng thÓ liªn tôc sö dông vËt phÈm nµy trong <color=yellow>15<color> phót. (Thêi gian sö dông cßn"..strTime..")",0);
			return
		end;
	
	local nDelOk = DelItem(2,1,203,1,1);
	
		if nDelOk ~=1 then 
			return
		end;
		
		DoFireworks(808,1);--ÑÌ»¨Ğ§¹û
	
	local nTopKillerName,nTopKillerMode = GetTopKillerData();
	local nMapID,nWx,nWy = GetWorldPos(); 
	local nTopKillerIndex = CreateNpc(nTopKillerMode,nTopKillerName,nMapID,nWx,nWy,-1,1,1,100);
	
		SetTask(TASK_USEYANHUO_TIME,nNowTime);
		
		--ÉèÖÃÔÚ¸ÃµØÍ¼Éú³ÉÉ±ÊÖÉú´æÊ±¼äÎªÒ»Ğ¡Ê±	
		SetNpcLifeTime(nTopKillerIndex,3600);  

		--ÉèÖÃ¶¥¼¶É±ÊÖ½Å±¾
		SetNpcScript(nTopKillerIndex,"\\script\\task\\killer\\killer_talk_top.lua");
		
		TaskTip("Ph¶i h¹ gôc tªn s¸t thñ ®Çu môc nµy trong vßng 60 phót!"); 
	
end;

function no()

end;