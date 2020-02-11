--filename:±¦Ïä.lua
--create date:2006-01-08
--author:yanjun
--describe:Ñ©Õ½µØÍ¼ÖÐµÄ±¦Ïä½Å±¾
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20091218
		Say("Xem ra ho¹t ®éng ®· kÕt thóc",0)
		return 0
	end
	local MapID = GetWorldPos()
	local MapName
	if MapID == 961 then
		MapName = "B¶n ®å tuyÕt Thµnh §«"
	elseif MapID == 962 then
		MapName = "B¶n ®å tuyÕt BiÖn Kinh"
	elseif MapID == 963 then
		MapName = "B¶n ®å tuyÕt TuyÒn Ch©u"	
	elseif MapID == 964 then
		MapName = "B¶n ®å tuyÕt T­¬ng D­¬ng"	
	elseif MapID == 965 then
		MapName = "B¶n ®å tuyÕt D­¬ng Ch©u"	
	end		
	if tonumber(date("%H")) ~= 12 and tonumber(date("%H")) ~= 18 and tonumber(date("%H")) ~= 21 then
		SetMapTaskTemp(MapID,1,0)
	end
	if (GetTask(TASK_GOT_BOX) == 0) or (GetTime() - GetTask(TASK_GOT_BOX) >= 60) or (GetTime() - GetTask(TASK_GOT_BOX) < 0) then
		local npcIndex = GetTriggeringUnit()
		SetNpcLifeTime(npcIndex,0)
		local nRandomNum
		local nPreBoxLeft
		if (tonumber(date("%H")) == 12 or tonumber(date("%H")) == 18 or tonumber(date("%H")) == 21) and GetMapTaskTemp(MapID,1) < 100 then
			nRandomNum = random(1,100)
			if nRandomNum <= 21 then
				if GetBody() == 1 then
				AddItem(0,109,113,1)
				elseif GetBody() == 2 then
					AddItem(0,109,114,1)
				elseif GetBody() == 3 then
					AddItem(0,109,116,1)
				elseif GetBody() == 4 then
					AddItem(0,109,115,1)
				end
				WriteLog("[Ho¹t ®éng mïa xu©n (më b¶o r­¬ng)]:"..GetName().."NhËn ®­îc 1 bé trang bÞ.")
				SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
				nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
				if nPreBoxLeft == 0 then
					Msg2SubWorld("Ho¹t ®éng"..MapName.."®o¹t b¶o lÇn nµy ®· kÕt thóc, xin c¸c b¹n nhí tham gia ho¹t ®éng lÇn sau!")
				elseif mod(nPreBoxLeft,10) == 0 then	--Ö»¹«¸æ10´Î
					Msg2SubWorld(MapName.."Ho¹t ®éng ®o¹t b¶o cßn"..nPreBoxLeft.." b¶o r­¬ng, trong cã nhiÒu quµ bÊt ngê!")
				end
			elseif nRandomNum <= 41 then
				local CardNo = random(228,237)
				if AddItem(2,1,CardNo,1) == 1 then
					Say("Chóc mõng b¹n nhËn ®­îc 1 thiÖp chóc n¨m míi.",0)
					WriteLog("[Ho¹t ®éng mïa xu©n (më b¶o r­¬ng)]:"..GetName().."NhËn ®­îc 1 thiÖp chóc n¨m míi.")
					SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
					nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
					if nPreBoxLeft == 0 then
						Msg2SubWorld("Ho¹t ®éng"..MapName.."®o¹t b¶o lÇn nµy ®· kÕt thóc, xin c¸c b¹n nhí tham gia ho¹t ®éng lÇn sau!")
					elseif mod(nPreBoxLeft,10) == 0 then	--Ö»¹«¸æ10´Î
						Msg2SubWorld(MapName.."Ho¹t ®éng ®o¹t b¶o cßn"..nPreBoxLeft.." b¶o r­¬ng, trong cã nhiÒu quµ bÊt ngê!")
					end
				end
			elseif nRandomNum <= 61 then
				local NianGaoNo = random(266,269)
				if AddItem(2,1,NianGaoNo,1) == 1 then
					Say("Chóc mõng b¹n nhËn ®­îc 1 c¸i b¸nh tæ.",0)
					WriteLog("[Ho¹t ®éng mïa xu©n (më b¶o r­¬ng)]:"..GetName().."NhËn ®­îc 1 c¸i b¸nh tæ ("..NianGaoNo..").")
					SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
					nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
					if nPreBoxLeft == 0 then
						Msg2SubWorld("Ho¹t ®éng"..MapName.."®o¹t b¶o lÇn nµy ®· kÕt thóc, xin c¸c b¹n nhí tham gia ho¹t ®éng lÇn sau!")
					elseif mod(nPreBoxLeft,10) == 0 then	--Ö»¹«¸æ10´Î
						Msg2SubWorld(MapName.."Ho¹t ®éng ®o¹t b¶o cßn"..nPreBoxLeft.." b¶o r­¬ng, trong cã nhiÒu quµ bÊt ngê!")
					end
				end
			elseif nRandomNum <= 71 then
				if AddItem(2,3,217,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc ®¹n trung tuyÕt cÇu.")
				end
			elseif nRandomNum <= 81 then
				if AddItem(2,3,220,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc trung tuyÕt cÇu.")
				end
			elseif nRandomNum <= 86 then
				if AddItem(2,3,218,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc ®¹n ®¹i tuyÕt cÇu.")
				end
			elseif nRandomNum <= 90 then
				if AddItem(2,3,221,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc ®¹i tuyÕt cÇu.")
				end
			elseif nRandomNum <= 100 then
				CastState("state_move_speed_percent_add",20,60*2*18,1,1)	--µ¥Î»ÎªÖ¡¡£18Ö¡1Ãë¡£²»ÄÜµþ¼Ó¡£
				Msg2Player("Tèc ®é di chuyÓn cña b¹n t¨ng 20% trong vßng 2 phót.")														
			end
		else
			nRandomNum = random(1,100)
			if nRandomNum <= 30 then
				if AddItem(2,3,220,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc trung tuyÕt cÇu.")
				end
			elseif nRandomNum <= 60 then
				if AddItem(2,3,217,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc ®¹n trung tuyÕt cÇu.")
				end
			elseif nRandomNum <= 70 then
				if AddItem(2,3,221,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc ®¹i tuyÕt cÇu.")
				end
			elseif nRandomNum <= 80 then
				if AddItem(2,3,218,1) == 1 then
					Msg2Player("B¹n nhËn ®­îc ®¹n ®¹i tuyÕt cÇu.")
				end
			else
				CastState("state_move_speed_percent_add",20,60*2*18,1,1)	--µ¥Î»ÎªÖ¡¡£18Ö¡1Ãë¡£²»ÄÜµþ¼Ó¡£
				Msg2Player("Tèc ®é di chuyÓn cña b¹n t¨ng 20% trong vßng 2 phót.")
			end
		end
		SetTask(TASK_GOT_BOX,GetTime())
		CreateBox()
	else
		local time_left = 60 - (GetTime() - GetTask(TASK_GOT_BOX))
		Say("cßn <color=yellow>"..time_left.."<color> gi©y b¹n míi cã thÓ më b¶o r­¬ng!",0)
	end
end

BoxPos = {
	{1692,3289},
	{1727,3289},
	{1762,3289},
	{1795,3288},
	{1826,3289},
	{1827,3359},
	{1794,3361},
	{1762,3361},
	{1729,3359},
	{1692,3359},
	{1692,3424},
	{1730,3423},
	{1763,3424},
	{1795,3423},
	{1827,3423},
	{1826,3496},
	{1794,3497},
	{1763,3496},
	{1729,3496},
	{1693,3496},
	{1693,3582},
	{1730,3581},
	{1763,3581},
	{1795,3581},
	{1825,3581},
	{1826,3652},
	{1794,3654},
	{1762,3653},
	{1728,3651},
	{1693,3653}
	}
function CreateBox()
	local i = random(1,30)
	local MapID = GetWorldPos()
	local npcBox = CreateNpc("R­¬ng tiÒn","B¶o r­¬ng",MapID,BoxPos[i][1]+random(-5,5),BoxPos[i][2]+random(-5,5))
	SetNpcScript(npcBox,"\\script\\online\\´º½Ú»î¶¯\\±¦Ïä.lua")
end
