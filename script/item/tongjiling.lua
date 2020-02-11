-- ====================== Œƒº˛–≈œ¢ ====================== 
                                                          
-- Ω£œ¿«È‘µonlineII Õ®º©¡ÓΩ≈±æ                  
-- Edited by starry night                                 
-- 2005/10/24 PM 17:02                                    
                                                          
-- ======================================================
--“˝”√Õ®º©»ŒŒÒÕ∑Œƒº˛
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse()

local nState = GetTask(TASK_KILLER_STATE_ID)

	if nState == 1 then
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
		local nAcceptTime = GetTask(TASK_ACCEPT_TIME);
		local nNowTime = GetTime();
		local nTime = 1800 - (nNowTime - nAcceptTime);
			
			if nTime < 0 then 
				nTime = 0; 
				Say("Hi÷n bπn ch≠a nhÀn b t c¯ nhi÷m vÙ truy s∏t nµo!",0);
				return
			end;

			nTime = TurnTime(nTime);
			Say("ß’n <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>! (ThÍi gian cﬂn:"..nTime..")",0);
			
	elseif nState == 2 then
		
		Talk(1,"","Hoµn thµnh nhi÷m vÙ. Mau v“ g∆p <color=yellow>BÈ Æ«u<color> l∑nh ph«n th≠Îng!");
	
	else
		
		Say("Hi÷n bπn ch≠a nhÀn b t c¯ nhi÷m vÙ truy s∏t nµo!",0);
		
	end;

end