function OnUse()
	local nTemp = random(1,100)
	local nRetCode =  0
	local nBody = GetBody()
	if DelItem(2,1,209,1) == 1 then 
		if nTemp <= 5 then
			nRetCode = AddItem(2,1,210,1,1)
		elseif nTemp > 5 and nTemp <= 10 then
			nRetCode = AddItem(2,1,211,1,1)
		elseif nTemp > 10 and nTemp <= 20 then
			if nBody == 1 then
				nRetCode = AddItem(0,108,109,1,1)	--Ê¥µ®Ã±×Ó
			elseif nBody == 2 then
				nRetCode = AddItem(0,108,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,108,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,108,111,1,1)
			end
		elseif nTemp > 20 and nTemp <= 30 then
			if nBody == 1 then
				nRetCode = AddItem(0,109,109,1,1)	--Ê¥µ®ÉÏ×°
			elseif nBody == 2 then
				nRetCode = AddItem(0,109,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,109,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,109,111,1,1)
			end
		elseif nTemp > 30 and nTemp <= 40 then
			if nBody == 1 then
				nRetCode = AddItem(0,110,73,1,1)	--Ê¥µ®ÏÂ×°
			elseif nBody == 2 then
				nRetCode = AddItem(0,110,74,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,110,76,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,110,75,1,1)
			end
		elseif nTemp > 40 and nTemp <= 60 then	--3¸öËæ»úÑæ»ð
			local nIndex = random(189,194)
			for i=1,3 do
				nRetCode = AddItem(2,1,nIndex,1,1)
			end
		elseif nTemp > 60 and nTemp <= 80 then	--8¸öÊ¥µ®Íà×Ó
			nRetCode = AddItem(2,1,208,8,1)
		elseif nTemp > 80 and nTemp <= 100 then	--15¸öÊ¥µ®Íà×Ó
			nRetCode = AddItem(2,1,208,15,1)
		end
		if nRetCode == 0 then
			--Say("Äã±³°üÀïµÄ¿Õ¼ä²»¹»£¬ÇëÏÈÕûÀíÒ»ÏÂ±³°üÀïÃæµÄ¶«Î÷¡£")
			Say("Thªm vËt phÈm thÊt b¹i!",0)
		else
			Msg2Player("B¹n nhËn ®­îc mét hép quµ gi¸ng sinh.")
		end
	end
end