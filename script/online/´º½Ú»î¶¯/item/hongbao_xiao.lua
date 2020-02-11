JIXIANG_COUNTER = 0
RUYI_COUNTER = 0

function OnUse()
	local selTab = {
		"§­îc! Ta muèn më tiÓu hång bao./open",
		"T¹m thêi ta ch­a muèn më./nothing"
		}
	Say("Tr­íc khi më tiÓu hång bao, h·y xem hµnh trang cã ®ñ « trèng vµ søc lùc hay kh«ng, nh»m tr¸nh nh÷ng tæn thÊt kh«ng ®¸ng. B¹n cã ®ång ý më nã kh«ng?",2,selTab)
end

function open()
	if DelItem(2,1,213,1) == 1 then
		WriteLog("[Ho¹t ®éng mïa xu©n (tiÓu hång bao)]:"..GetName().." ®· sö dông 1 tiÓu hång bao.")
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
		AddItem(1,0,32,1)	--¾Å×ª»¹»êµ¤1¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 30 then
			AddItem(2,2,8,1)	--ÔÉÌú1¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 10 then
			AddItem(2,1,148,5)	--Ð¡¿é½ðÏ¬5¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 5 then
			AddItem(2,1,149,5)	--½ðÏ¬5¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,21,10)	--ºÚ½õÒ»×é10¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,22,10)	--Ö¯½õÒ»×é10¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 30 then
			AddItem(2,2,23,10)	--»ðä½½õÒ»×é10¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,27,10)	--Á¬ºáÆ×Ò»×é10¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,57,10)	--ÐÞÂÞÆ×Ò»×é10¸ö
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 30 then
			AddItem(2,2,58,10)	--Éñ±øÆ×Ò»×é10¸ö
		end
		nRandomNum = random(1,200)
		if nRandomNum == 1 then
			if JIXIANG_COUNTER <= 90 then
				AddItem(0,102,22,1,1,-1,-1,-1,-1,-1,-1)	--ÐÂÄê×°±¸
				WriteLog("[Ho¹t ®éng mïa xu©n (®¹i hång bao)]:"..GetName().."B¹n nhËn ®­îc 1 c¸t t­êng bao.")
				JIXIANG_COUNTER = JIXIANG_COUNTER + 1
			end
		elseif nRandomNum == 2 then
			if RUYI_COUNTER <= 90 then
				AddItem(0,102,23,1,1,-1,-1,-1,-1,-1,-1)	--ÐÂÄê×°±¸
				WriteLog("[Ho¹t ®éng mïa xu©n (®¹i hång bao)]:"..GetName().."B¹n nhËn ®­îc 1 nh­ ý bao.")
				RUYI_COUNTER = RUYI_COUNTER + 1
			end
		end
		
		nRandomNum = random(1,100)
		if nRandomNum <= 10 then	--ÏàÓ¦ÌåÐÎÐÂÄê×°
			if GetBody() == 1 then
				AddItem(0,109,113,1)
			elseif GetBody() == 2 then
				AddItem(0,109,114,1)
			elseif GetBody() == 3 then
				AddItem(0,109,116,1)
			elseif GetBody() == 4 then
				AddItem(0,109,115,1)
			end
		elseif nRandomNum <= 30 then
			local CardNo = random(228,237)
			AddItem(2,1,CardNo,1)	--ÐÂÄêºØ¿¨
		elseif nRandomNum <= 50 then
			local NianGaoNo = random(266,269)
			AddItem(2,1,NianGaoNo,1)	--Äê¸â
		end	
	end
end

function nothing()

end


