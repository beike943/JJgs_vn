--=============================================
-- Event Héi Ngé Cao Thñ
-- Created by TuanNA5
--=============================================

TSK_FACTION_GET_ITEM = 1534
TSK_FACTION_GET_TIME = 1535

Include("\\script\\online\\viet_event\\factionboss\\head_factionboss.lua");

function main()
	local nSelfIndex = GetTargetNpc()
	if GetLevel() < 10 then
		Say("§¼ng cÊp ph¶i lín h¬n 10 míi nhÆt ®­îc vËt phÈm.",0)
		return 0
	end	
	local nCheck, nRoute = gf_CheckPlayerRoute()	
	if nCheck == 0 then
		Say("Ph¶i gia nhËp hÖ ph¸i míi nhÆt ®­îc vËt phÈm.",0)
		return 0
	end
	if GetUnitCurStates(nSelfIndex,0) ~= GetPlayerFaction() then
		Say("Tói nµy kh«ng dµnh cho hÖ ph¸i cña c¸c h¹.",0)
		return 0
	end
	if gf_Judge_Room_Weight(1, 100, "") == 0 then
		return
	end
	local nDate = tonumber(date("%d"));
	local nTaskVal = GetTask(TSK_FACTION_GET_ITEM)	
	if GetByte(nTaskVal,1) ~= nDate then
		nTaskVal  = SetByte(nTaskVal,1,nDate)
		SetTask(TSK_FACTION_GET_ITEM, SetByte(nTaskVal,2,0))		
	end
	
	nTaskVal = GetTask(TSK_FACTION_GET_ITEM)	
	if GetByte(nTaskVal,2) >= 2 then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhÆt ®­îc 2 tói.")
		return 0
	end	
	if GetTime() - GetTask(TSK_FACTION_GET_TIME) < 3600 then
		Talk(1,"","B¹n cßn "..GetTask(TSK_FACTION_GET_TIME) + 3600 - GetTime().." gi©y míi cã thÓ tiÕp tôc nhÆt tói.")
		return 0
	end	
	SetNpcLifeTime(nSelfIndex, 0)
	SetTask(TSK_FACTION_GET_ITEM, SetByte(nTaskVal,2,GetByte(nTaskVal,2) + 1))
	SetTask(TSK_FACTION_GET_TIME,GetTime())	
	
	local nRand = random(1,10000)
	if nRand <= 6990 then
		ModifyExp(GetLevel() * 5000)
		WriteLogEx("Hoi Ngo Cao Thu","nhËn",GetLevel() * 5000,"®iÓm kinh nghiÖm")
	elseif nRand <= 9990 then
		local nRet, nItemIdx = gf_AddItemEx({2,1,1147,1,1}, "R­¬ng Vò KhÝ B¹c")
		if nRet == 1 then
			SetItemExpireTime(nItemIdx,15*24*60*60)
			WriteLogEx("Hoi Ngo Cao Thu","nhËn",1,"R­¬ng Vò KhÝ B¹c")
		end
	elseif nRand <= 9995 then
		local nRet, nItemIdx = gf_AddItemEx({0,102, nRoute*100 + 20 + GetBody, 1,1,-1,-1,-1,-1,-1,-1},"Trang søc S­ M«n" )
		if nRet == 1 then
			WriteLogEx("Hoi Ngo Cao Thu","nhËn",1,"Trang søc S­ M«n")
		end
	else
		local nRet, nItemIdx = gf_AddItemEx({0,103, nRoute*100 + 20 + GetBody, 1,1,-1,-1,-1,-1,-1,-1},"M·o S­ M«n" )		
		if nRet == 1 then
			WriteLogEx("Hoi Ngo Cao Thu","nhËn",1,"M·o S­ M«n")
		end
	end	
end