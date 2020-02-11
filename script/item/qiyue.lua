Include("\\script\\task\\plant_tuoguan\\head.lua");
-- ÕÙ»½¹ÍÓ¶²É¼¯¶ÓµÄ¶«¶«

USE_SHENNONG_NUMBER = 100

GOLD_PER_8_HOUR = 4

function GetPlayerSex()
	if GetSex() == 1 then
		return "ThiÕu hiÖp"
	else
		return "N÷ hiÖp "
	end
end

function OnUse()

	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("BiÓn ng­êi ®«ng nghÞt, biÕt t×m ë ®©u ®©y"..GetPlayerSex().."§Õn n¬i kh¸c thu thËp nhÐ!", 0)
		return
	end

	Say("Ngoµi viÖc dïng ThÇn N«ng §¬n ®Ó ñy th¸c thu thËp, ThiÕu hiÖp cßn cã thÓ ñy th¸c trång c©y B¸t Nh· lín t¹i ®©y. Xem thªm th«ng tin bªn d­íi",
		3,
		"ñy th¸c thu thËp b»ng ThÇn N«ng §¬n/use_shennong",
		"ñy th¸c trång c©y B¸t Nh· lín/tuoguan_zhongshu",
		"KÕt thóc ®èi tho¹i/end_say");
end

function use_shennong()
	Say("Xin hái "..GetPlayerSex().."cÇn dïng mÊy viªn ThÇn N«ng ®¬n ®Ó ñy th¸c thu thËp?",
		4,
		"Dïng 1 ThÇn N«ng ®¬n--nhËn ®­îc 8 giê ñy th¸c thu thËp (thu phÝ "..GOLD_PER_8_HOUR.." vµng)/#yes_use(1)",
		"Dïng 2 ThÇn N«ng ®¬n--nhËn ®­îc 16 giê ñy th¸c thu thËp (thu phÝ "..(GOLD_PER_8_HOUR * 2).." vµng)/#yes_use(2)",
		"Dïng 3 ThÇn N«ng ®¬n--nhËn ®­îc 24 giê ñy th¸c thu thËp (thu phÝ "..(GOLD_PER_8_HOUR * 3).." vµng)/#yes_use(3)",
		"Kh«ng sö dông ñy th¸c thu thËp/end_say")
end

function tuoguan_zhongshu()
	Say("Xin hái "..GetPlayerSex().."Lµm thÕ nµo trång ®­îc c©y b¸t nh· lín?",
		6,
		"T¹i h¹ cÇn ñy th¸c ng­êi ë < côm TP Hå ChÝ Minh 1> trång c©y gióp (tiÒn c«ng 20 vµng vµ 7 lé thñy)/#plant_tuoguan(1, 20, 1)",
		"T¹i h¹ cÇn ñy th¸c ng­êi ë < côm TP Hå ChÝ Minh 2> trång c©y gióp (tiÒn c«ng 20 vµng vµ 7 lé thñy)/#plant_tuoguan(1, 20, 2)",
		"T¹i h¹ cÇn ñy th¸c ng­êi ë < côm TP Hå ChÝ Minh 3> trång c©y gióp (tiÒn c«ng 18 vµng vµ 7 lé thñy)/#plant_tuoguan(1, 18, 3)",
		"T¹i h¹ cÇn ñy th¸c ng­êi ë < côm Hµ Néi 1> trång c©y gióp (tiÒn c«ng 20 vµng vµ 7 lé thñy)/#plant_tuoguan(1, 20, 4)",
		"T¹i h¹ cÇn ñy th¸c ng­êi ë < côm Hµ Néi 2> trång c©y gióp (tiÒn c«ng 18 vµng vµ 7 lé thñy)/#plant_tuoguan(1, 18, 5)",
		"Ch­a muèn ñy th¸c trång c©y B¸t Nh·./end_say")
end

function yes_use(nCount)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh«ng ®ñ ThÇn N«ng ®¬n, kh«ng thÓ ñy th¸c thu thËp.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh«ng ®ñ tiÒn thuª ®éi nh©n c«ng thu thËp.", 0)
		return
	end
	
	SetTaskTemp(USE_SHENNONG_NUMBER, nCount)
	
	local tSkillList = GetUseableGatherSkillList()
	if tSkillList == nil then
		Say("Kh«ng thÓ thuª nh©n c«ng ñy th¸c thu thËp trong khu vùc nµy.", 0)
		return
	end
	
	local tSay = {}
	if getn(tSkillList) == 0 then
		Say("B¹n kh«ng thÓ dïng kü n¨ng thu thËp trong khu vùc nµy.", 0)
		return
	end
	
	if getn(tSkillList) > 1 then
		for index, value in tSkillList do
			tSay[index] = value[2].."/#sel_skill("..value[1]..")"
		end
		Say("Trªn nói nµy s¶n vËt phong phó, ch¼ng hay"..GetPlayerSex().."Kh¸c quan cÇn g×?", getn(tSay), tSay)
	elseif getn(tSkillList) == 1 then
		sel_skill(tSkillList[1][1])
	end
end

function sel_skill(nSkillID)
	local nFreeCount, nSameTypeFreeCount = GetFreeTishenGather(nSkillID)
	
	if nFreeCount == 0 then
		Say("Ch¼ng ph¶i kh«ng muèn lÊy tiÒn cña chñ nh©n, thùc ra lµ kh«ng cã ng­êi lµm!\n<color=red>(§éi ngò nh©n c«ng b¹n thuª ®· ®¹t møc tèi ®a: 6 ®éi.)<color>", 0)
		return
	elseif nSameTypeFreeCount == 0 then
		Say("Ch¼ng ph¶i kh«ng muèn lÊy tiÒn cña chñ nh©n, thùc ra lµ kh«ng cã ng­êi lµm!\n<color=red>(B¹n ®· thuª hai ®éi cïng tiÕn hµnh thu thËp lo¹i nµy.)<color>", 0)
		return
	end
	
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("Kü n¨ng thu thËp cña b¹n qu¸ thÊp, kh«ng thÓ thu thËp ë khu vùc nµy!", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "Trang kÕ/#next_page("..nSkillID..")"
			break
		end
		-- ÌØÀý´¦Àí°¡,À´²»¼°ÁË!
		local nSss = strfind(t[i][1], "Vâ §ang phï th¹ch")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."Phï th¹ch cña c¸c m«n ph¸i"
		else
			nSss = strfind(t[i][1], "BiÖn Kinh phï th¹ch")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."Phï th¹ch c¸c thµnh thÞ"
			else
				s123 = t[i][1]
			end
		end
				
		tSay[i] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
	end
	
	if getn(tSay) == 0 then
		Say("C¸i g× còng kh«ng cã vËy!", 0)
		return
	end
	
	tSay[getn(tSay)+1] = "Ta ch­a muèn thu thËp/end_say"
	
	Say("!!"..GetPlayerSex().." cÇn thu thËp lo¹i vËt phÈm nµo?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("Kü n¨ng thu thËp cña b¹n qu¸ thÊp, kh«ng thÓ thu thËp ë khu vùc nµy!", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		-- ÌØÀý´¦Àí°¡,À´²»¼°ÁË!
		local nSss = strfind(t[i][1], "Vâ §ang phï th¹ch")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."Phï th¹ch cña c¸c m«n ph¸i"
		else
			nSss = strfind(t[i][1], "BiÖn Kinh phï th¹ch")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."Phï th¹ch c¸c thµnh thÞ"
			else
				s123 = t[i][1]
			end
		end

		tSay[nIndex] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	if getn(tSay) == 0 then
		Say("C¸i g× còng kh«ng cã vËy!", 0)
		return
	end
	
	tSay[nIndex] = "Trang tr­íc/#sel_skill("..nSkillID..")"
	tSay[nIndex+1] = "Ta ch­a muèn thu thËp/end_say"
	
	Say("!!"..GetPlayerSex().." cÇn thu thËp lo¹i vËt phÈm nµo?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)
	
	Say("!!"..GetPlayerSex().."X¸c nhËn muèn thu thËp <color=yellow>"..szItem.."<color> chø?",
		2,
		"§óng/#start_gather("..nMapLevel..","..nSkillID..")",
		"Sai/end_say")
end

function start_gather(nMapLevel, nSkillID)
	local nCount = GetTaskTemp(USE_SHENNONG_NUMBER)
	
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh«ng ®ñ ThÇn N«ng ®¬n, kh«ng thÓ ñy th¸c thu thËp.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh«ng ®ñ tiÒn thuª ®éi nh©n c«ng thu thËp.", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,509,1) == 1 and DelItem(2,1,343,nCount) == 1 then
		--Msg2Player(nGerne, nDetail, nParticular)
		local nMaxTime = 8 * 3600
		StartTishenGather(nMapLevel, nSkillID, nMaxTime * nCount)
		
		local szSkillName = GetGatherSkillName(nSkillID)
		local szNpcName = GetName().."-"..szSkillName.."tiÓu ®éi"
		local szNpcMode = szSkillName
		if szNpcMode == "Canh t¸c" then
			szNpcMode = "Thu ho¹ch"
		end
		-- createnpc
		local nMapID, nX, nY = GetWorldPos()
		local nIndex = CreateNpc(szNpcMode, szNpcName, nMapID, nX, nY, 7, 1, 1)
		SetNpcDir(nIndex, random(63))
		SetNpcLifeTime(nIndex, nMaxTime * nCount)
	else
		Say(GetPlayerSex().."Kh«ng cã KhÕ ­íc th­, kh«ng thÓ ñy th¸c thu thËp.", 0)
	end
end

function end_say()

end
