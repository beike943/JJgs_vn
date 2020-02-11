--=============================================
--create by yanjun 2005.12.12
--describe:ÈªÖİÊ¥µ®Ê÷(Ö°ÄÜNPC)½Å±¾
--=============================================
Include("\\script\\online\\Ê¥µ®½Ú»î¶¯\\christmas_head.lua")

function main()
	if GetTrigger(3000) == 0 then
		if GetCurMonth() == 12 and GetCurDate() > 28 then
			Say("Ho¹t ®éng Gi¸ng Sinh ®· kÕt thóc!",0)
			return 0
		end
		Say("Ho¹t ®éng Gi¸ng Sinh vÉn ch­a më. Thêi gian chİnh thøc lµ: <color=yellow>tõ 23/11 ®Õn 28/12<color>.",0)
		return 0
	end
	SelTab = {
		"Ta muèn nhËn quµ./get_present",
		"Ta chØ ®Õn xem th«i./no",
		}
	Say("Gi¸ng Sinh vui vÎ! Tr­íc khi nhËn quµ h·y kiÓm tra kho¶ng trèng trong hµnh trang, ®Ó tr¸nh nh÷ng tæn thÊt kh«ng ®¸ng cã!",2,SelTab);
end

function get_present()
	if CHRISTMAS_SWITCH == 0 then
		Say("C©y th«ng vÉn ch­a treo quµ, ho¹t ®éng Gi¸ng Sinh vÉn ch­a b¾t ®Çu!",0)
		return 0;
	end
	if GetLevel() < 10 then
		Say("Xin lçi! Quı kh¸ch ch­a ®¹t ®Õn cÊp <color=red>10<color> ch­a thÓ nhËn quµ.",0)
		return 0
	end
	if GetTask(TASK_GOT_DATE) ~= GetCurDate() then	--Èç¹û²»ÊÇÍ¬Ò»Ìì£¬ÔòÒÑÁìÈ¡±ê¼ÇÇå0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if(GetTask(TASK_GOT_PRESENT) == 0) then --Ö®Ç°Ã»ÓĞÁì¹ı
		local nHour,nMin = GetLocalTime()
		if (nHour == 21 and nMin >= 2) or (GetLocalTime() == 23) then --ÍíÉÏ¾Åµã»òÊ®Ò»µã
			give_present()
		else
			Say("H·y ®îi ®Õn <color=yellow>21h vµ 23h<color> míi cã thÓ nhËn quµ",0)
		end
	else
		Say("H«m nay b¹n ®· nhËn ®­îc quµ, kh«ng thÓ nhËn n÷a.",0)
	end
end

function no()

end

function give_present()
	local nPresentRemain = GetGlbValue(ID_PRESENT_NUMBER_QZ)
	local nEmpty = 0
	if(nPresentRemain > 0) then
		local nTemp = random(1,100)
		local nRetCode = 0
		local nBody = GetBody()
		if nTemp <= 10 then
			nRetCode = AddItem(2,2,8,5,1)	--ÔÉÌú5¸ö
		elseif nTemp > 10 and nTemp <= 20 then
			nRetCode = AddItem(2,2,7,10,1)--ÔÉÌúËéÆ¬10¸ö
		elseif nTemp > 20 and nTemp <= 30 then
			nRetCode = AddItem(2,1,148,5,1)	--Ğ¡¿é½ğÏ¬5¸ö
		elseif nTemp > 30 and nTemp <= 40 then
			nRetCode = AddItem(2,1,209,1,1)	--Ê¥µ®ÀñºĞ1¸ö
		elseif nTemp > 40 and nTemp <= 50 then
			nRetCode = AddItem(2,1,208,25,1)	--Ê¥µ®Íà×Ó25¸ö
		elseif nTemp > 50 and nTemp <= 60 then
			nRetCode = AddItem(2,1,210,1,1)	--"ºØ¿¨Ò» 1¸ö"
		elseif nTemp > 60 and nTemp <= 70 then
			nRetCode = AddItem(2,1,211,1,1)	--"ºØ¿¨¶ş 1¸ö"
		elseif nTemp > 70 and nTemp <= 75 then
			if nBody == 1 then
				nRetCode = AddItem(0,108,109,1,1)	--"Ê¥µ®Ã±×Ó1¸ö"
			elseif nBody == 2 then
				nRetCode = AddItem(0,108,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,108,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,108,111,1,1)
			end
		elseif nTemp > 75 and nTemp <= 80 then
			if nBody == 1 then
				nRetCode = AddItem(0,109,109,1,1)	--"Ê¥µ®ÉÏ×°1¸ö"
			elseif nBody == 2 then
				nRetCode = AddItem(0,109,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,109,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,109,111,1,1)
			end
		elseif nTemp > 80 and nTemp <= 90 then
			if nBody == 1 then
				nRetCode = AddItem(0,110,73,1,1)	--"Ê¥µ®ÏÂ×°1¸ö"
			elseif nBody == 2 then
				nRetCode = AddItem(0,110,74,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,110,76,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,110,75,1,1)
			end
		elseif nTemp > 90 and nTemp <= 100 then --5¸öËæ»úÑæ»ğ
			for i=1,5 do			
				local nIndex = random(189,194)
				nRetCode = AddItem(2,1,nIndex,1,1)
				if nRetCode == 0 then
					break
				end
			end
		end		
		if nRetCode == 0 then	--Ã»ÓĞ³É¹¦Ìí¼Ó
			--Say("±³°üÀïµÄ¿Õ¼ä²»¹»£¬ÇëÕûÀíÒ»ÏÂ±³°üÀïÃæµÄ¶«Î÷ÔÙÀ´ÁìÈ¡¡£",0)
			Say("NhËn vËt phÈm thÊt b¹i!",0)
			return 0
		else
			Say("B¹n ®· nhËn ®­îc 1 phÇn quµ! ThËt may m¾n!",0)
			SetGlbValue(ID_PRESENT_NUMBER_QZ,nPresentRemain-1)
			SetTask(TASK_GOT_PRESENT,1) 
			SetTask(TASK_GOT_DATE,GetCurDate())
			if GetGlbValue(ID_PRESENT_NUMBER_QZ) == 0 then
				nEmpty = 1;
			end
		end
	else
		Say("Xin lçi, quµ ®· bŞ lÊy hÕt, lÇn sau h·y quay l¹i!",0)
	end
	if nEmpty == 1 then
		AddGlobalNews("Quµ c©y th«ng Gi¸ng Sinh ë B¾c TuyÒn Ch©u ®· bŞ lÊy hÕt, ng­êi ch¬i nµo ch­a lÊy ®­îc h·y ®Õn lÇn sau.")
		Msg2SubWorld("Quµ c©y th«ng Gi¸ng Sinh ë B¾c TuyÒn Ch©u ®· bŞ lÊy hÕt, ng­êi ch¬i nµo ch­a lÊy ®­îc h·y ®Õn lÇn sau.")
	end
end




