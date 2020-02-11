Include("\\script\\lib\\globalfunctions.lua")

--function OnUse(itemIndex)
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if (nDate > 2011022024) then
--		DelItemByIndex(itemIndex, -1);
--		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông!")
--		return
--	end
--	
--	if (DelItemByIndex(itemIndex, 1) == 1) then
--		gf_EventGiveCustomAward(1, 200000, 1, "Hoat dong thang 1 nam 2011", "Sö dông bao l× x×");
--		gf_AddItemEx2({2, 1, 30277, 10}, "Hoa Mai", "Hoat dong thang 1 nam 2011", "Sö dông bao l× x×")
--	end
--end

szLogTitle = "Hoat dong thang 1 nam 2011"

YANHUO_TABLE = {
--	{"XÝch M¹c Háa DiÖm", 801, 10, 2, 1, 191},
--	{"Tranh M¹c Háa DiÖm", 802, 10, 2, 1, 193},
--	{"Lam M¹c Háa DiÖm", 805, 10, 2, 1, 192},
	{"Tranh S¾c Yªn Hoa", 820, 3, 2, 1, 189},
	{"Lam S¾c Yªn Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--ÉñÃØÑÌ»¨
	{""		   , 811, 5, 2, 1, 194},
--	{""		   , 813, 10, 2, 1, 194},
--	{""		   , 814, 10, 2, 1, 194},
--	{""		   , 817, 10, 2, 1, 194},
	{""		   , 832, 3, 2, 1, 194},
	{""		   , 835, 3, 2, 1, 194},
	{""		   , 838, 1, 2, 1, 194},
	{""        , 841, 1, 2, 1, 194}
};

function OnUse(itemIndex)
	local nDate = tonumber( date( "%y%m%d" ) )
	if nDate > 110421 then
		DelItemByIndex(itemIndex, -1);
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông!")
		return
	end
	
	local nCurDate = floor ( GetTask( TSK_DAHONGBAO_201101 ) / 1000 ) -- lÊy 6 sè ®Çu tiªn	
		-- thùc hiÖn reset sè lÇn sö dông trong ngµy vµ thêi gian gi·n c¸ch sö dông . nÕu kh«ng ph¶i lµ ngµy hiÖn t¹i
	if nCurDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	if GetLevel () < 77 then
		Talk ( 1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ nhËn bao l× x×!" )
		return
	end
	
	-- kiÓm tra nh©n vËt cã gia nhËp m«n ph¸i ch­a
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "ThiÕu hiÖp ch­a vµo m«n ph¸i nªn kh«ng thÓ sö dông bao l× x×" )
		return
	end
	
	--if check_skill_55() == 0 then
	--	Talk(1, "", "Ch­a häc kü n¨ng cÊp 55 cña m«n ph¸i nªn kh«ng thÓ ®èt ph¸o hoa!")
	--	return
	--end
	
	-- Vuît qu¸ sè lÇn sö dông --> tho¸t 	
	local nCount = mod ( GetTask(TSK_DAHONGBAO_201101), 100 ) 
	if nCount >= 40 then
		Talk(1, "", "H«m nay thiÕu hiÖp ®· dïng qu¸ nhiÒu bao l× x× råi. H·y quay l¹i vµo ngµy mai!")
		return
	end
	
	-- Thêi gian gi·n c¸ch ®èt ph¸o hoa 30 gi©y
	local nDif = 30 - ( GetTime() - GetTask ( TSK_DAHONGBAO_201101_TIME ) )
	
	if nDif > 0 then
		Talk(1, "", "ThiÕu hiÖp ph¶i chê "..nDif.." gi©y n÷a míi cã thÓ tiÕp tôc sö dông bao l× x×!")
		return
	end
	
	if gf_JudgeRoomWeight(3, 50) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i tr­íc!");
		return 0
	end
	
	local nHour = tonumber(date("%H%M"))
	if nHour < 0800 or ( nHour > 1000 and nHour < 1530 ) or ( nHour > 1730  and nHour < 2000 ) or ( nHour > 2200 )  then
		Talk ( 1, "", "Ho¹t ®éng sö dông bao l× x× diÔn ra ba ®ît trong ngµy: §ît mét tõ 8 giê ®Õn 10 giê, ®ît hai tõ 15 giê 30 ®Õn 17 giê 30 vµ ®ît ba tõ 20 giê ®Õn 22 giê!" )
		return
	end
	local nWeek = tonumber(date("%w")) -- tr¶ vÒ ngµy trong tuÇn
	if (DelItemByIndex(itemIndex, 1) == 1) then				
		--if nHour < 0900 or (nHour > 1000 and nHour < 1530) or (nHour > 1630 and nHour < 2030) or nHour > 2130 then
			
		-- Giíi h¹n ph¸o hoa sö dông ë mét sè map
		-- local nPos = GetWorldPos()
		-- if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
		--	Talk ( 1, "", "ChØ cã thÓ sö dông ph¸o hoa t¹i TuyÒn Ch©u, D­¬ng Ch©u, chiÕn tr­êng Nh¹n M«n Quan, S¸t Thñ §­êng vµ trong Tµi Nguyªn ChiÕn!" )
		--	return
		-- end
		
		local nExp = 200000
		
		-- ChØ tÆng 400.000 exp khi vµo c¸c ngµy thø 6,7, CN
		if nWeek == 0 or nWeek == 5 or nWeek == 6 then -- thø s¸u + thø b¶y + chñ nhËt
			nExp = 400000
		end
		
		if nDate >= 110203 and nDate <= 110205 then
			nExp = 600000
		end
		
		ModifyExp(nExp)
		Msg2Player("NhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
		WriteLogEx(szLogTitle, "Sö dông bao l× x× thµnh c«ng")
		AddMonthlyEventFireworkAward(10)
		SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 1)
		
		SetTask(TSK_DAHONGBAO_201101_TIME, GetTime())
			
		local nIndex = random ( 1, getn(YANHUO_TABLE) )	
		DoFireworks ( YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3] )
		
		StartTimeGuage ("Hång Bao", 30,0,1 )
	end
end

function AddMonthlyEventFireworkAward(nCount)
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110225 and nDate <= 110327 then
		gf_AddItemEx2({2, 1, 30287, nCount}, "Nguyªn liÖu ", "Hoat dong thang 3 nam 2011", "sö dông bao l× x×")
	end
end