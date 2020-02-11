function sdlw_killed()
	local nRetCode = 1
    local nTemp = random(1,1000)
    local nBody = GetBody()
    if nTemp <= 20 then	-- 1/50机率掉落袜子
        nRetCode = AddItem(2,1,208,1,1);
    elseif nTemp == 21 then	-- 1/1000机率掉落礼物箱
    	nRetCode = AddItem(2,1,209,1,1);
    elseif nTemp == 22 then	-- 1/1000机率掉落圣诞帽	
		if nBody == 1 then
			nRetCode = AddItem(0,108,109,1,1)	
		elseif nBody == 2 then
			nRetCode = AddItem(0,108,110,1,1)
		elseif nBody == 3 then
			nRetCode = AddItem(0,108,112,1,1)
		elseif nBody == 4 then
			nRetCode = AddItem(0,108,111,1,1)
		end
    end;
    if nRetCode == 0 then 
    	Say("Th猰 v藅 ph萴 th蕋 b筰!",0)
    end
end
