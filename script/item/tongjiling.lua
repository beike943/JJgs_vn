-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉令脚本                  
-- Edited by starry night                                 
-- 2005/10/24 PM 17:02                                    
                                                          
-- ======================================================
--引用通缉任务头文件
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
				Say("目前您没有通缉任务!",0);
				return
			end;

			nTime = TurnTime(nTime);
			Say("到<color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>! (剩余时间:"..nTime..")",0);
			
	elseif nState == 2 then
		
		Talk(1,"","任务完成。 快去找 <color=yellow>捕头<color> 领赏!");
	
	else
		
		Say("H目前您没有通缉任务!",0);
		
	end;

end