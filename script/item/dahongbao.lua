Include("\\script\\lib\\globalfunctions.lua")

--function OnUse(itemIndex)
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if (nDate > 2011022024) then
--		DelItemByIndex(itemIndex, -1);
--		Talk(1,"","V藅 ph萴  qu? h筺 s? d鬾g!")
--		return
--	end
--	
--	if (DelItemByIndex(itemIndex, 1) == 1) then
--		gf_EventGiveCustomAward(1, 200000, 1, "Hoat dong thang 1 nam 2011", "S? d鬾g bao l? x?");
--		gf_AddItemEx2({2, 1, 30277, 10}, "Hoa Mai", "Hoat dong thang 1 nam 2011", "S? d鬾g bao l? x?")
--	end
--end

szLogTitle = "2011年1月1日起"

YANHUO_TABLE = {
--	{"X輈h M筩 H醓 Di謒", 801, 10, 2, 1, 191},
--	{"Tranh M筩 H醓 Di謒", 802, 10, 2, 1, 193},
--	{"Lam M筩 H醓 Di謒", 805, 10, 2, 1, 192},
	{"Tranh S綾 Y猲 Hoa", 820, 3, 2, 1, 189},
	{"Lam S綾 Y猲 Hoa", 823, 3, 2, 1, 190},
	{""		   , 808, 5, 2, 1, 194},	--神秘烟花
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
		Talk(1,"","物品过期了！")
		return
	end
	
	local nCurDate = floor ( GetTask( TSK_DAHONGBAO_201101 ) / 1000 ) -- l蕐 6 s? u ti猲	
		-- th鵦 hi謓 reset s? l莕 s? d鬾g trong ng祔 v? th阨 gian gi穘 c竎h s? d鬾g . n誹 kh玭g ph秈 l? ng祔 hi謓 t筰
	if nCurDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	if GetLevel () < 77 then
		Talk ( 1, "", "77级或以上的人可以得到一个红包。" )
		return
	end
	
	-- ki觤 tra nh﹏ v藅 c? gia nh藀 m玭 ph竔 ch璦
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "少侠还没阵营，所以不能用这个红包。" )
		return
	end
	
	--if check_skill_55() == 0 then
	--	Talk(1, "", "Ch璦 h鋍 k? n╪g c蕄 55 c馻 m玭 ph竔 n猲 kh玭g th? t ph竜 hoa!")
	--	return
	--end
	
	-- Vu顃 qu? s? l莕 s? d鬾g --> tho竧 	
	local nCount = mod ( GetTask(TSK_DAHONGBAO_201101), 100 ) 
	if nCount >= 40 then
		Talk(1, "", "你今天用得太多了，明天再来吧！")
		return
	end
	
	-- Th阨 gian gi穘 c竎h t ph竜 hoa 30 gi﹜
	local nDif = 30 - ( GetTime() - GetTask ( TSK_DAHONGBAO_201101_TIME ) )
	
	if nDif > 0 then
		Talk(1, "", "少侠必须等待"..nDif.."秒钟后才能继续使用红包")
		return
	end
	
	if gf_JudgeRoomWeight(3, 50) == 0 then
		Talk(1,"","背包或负重不足，请先检查!");
		return 0
	end
	
	local nHour = tonumber(date("%H%M"))
	if nHour < 0800 or ( nHour > 1000 and nHour < 1530 ) or ( nHour > 1730  and nHour < 2000 ) or ( nHour > 2200 )  then
		Talk ( 1, "", "每天使用时间:第一波8点到10点,第二波从15点30分到17点30分，第三波从20点到22点!" )
		return
	end
	local nWeek = tonumber(date("%w")) -- tr? v? ng祔 trong tu莕
	if (DelItemByIndex(itemIndex, 1) == 1) then				
		--if nHour < 0900 or (nHour > 1000 and nHour < 1530) or (nHour > 1630 and nHour < 2030) or nHour > 2130 then
			
		-- Gi韎 h筺 ph竜 hoa s? d鬾g ? m閠 s? map
		-- local nPos = GetWorldPos()
		-- if nPos ~= 100 and nPos ~= 150 and nPos ~= 606 and nPos ~= 885 and nPos ~= 884 then
		--	Talk ( 1, "", "Ch? c? th? s? d鬾g ph竜 hoa t筰 Tuy襫 Ch﹗, Dng Ch﹗, chi課 trng Nh筺 M玭 Quan, S竧 Th? Л阯g v? trong T礽 Nguy猲 Chi課!" )
		--	return
		-- end
		
		local nExp = 200000
		
		-- Ch? t苙g 400.000 exp khi v祇 c竎 ng祔 th? 6,7, CN
		if nWeek == 0 or nWeek == 5 or nWeek == 6 then -- th? s竨 + th? b秠 + ch? nh藅
			nExp = 400000
		end
		
		if nDate >= 110203 and nDate <= 110205 then
			nExp = 600000
		end
		
		ModifyExp(nExp)
		Msg2Player("获得"..nExp.."经验值")
		WriteLogEx(szLogTitle, "使用红包成功")
		AddMonthlyEventFireworkAward(10)
		SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 1)
		
		SetTask(TSK_DAHONGBAO_201101_TIME, GetTime())
			
		local nIndex = random ( 1, getn(YANHUO_TABLE) )	
		DoFireworks ( YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3] )
		
		StartTimeGuage ("H錸g Bao", 30,0,1 )
	end
end

function AddMonthlyEventFireworkAward(nCount)
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 110225 and nDate <= 110327 then
		gf_AddItemEx2({2, 1, 30287, nCount}, "材料包", "2011年3月", "使用红包")
	end
end
