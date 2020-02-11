--filename:ÏåÑôÑ©ÕÌ´«ËÍÈËin.lua
--create date:2006-01-12
--author:yanjun
--describe:ÏåÑôÑ©ÕÌ´«ËÍÈË£¨½ø³¡£©½Å±¾

Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

function main()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "C« n­¬ng"
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060120 then
		Say("MÊy h«m nay tuyÕt ch­a r¬i nªn khu nĞm tuyÕt ch­a thÓ më, mêi"..strSex.."lÇn sau quay l¹i nhĞ!",0)
		return 0
	end
	if nDate > 20060205 then
		Say("Xu©n ®Õn hoa në, tuyÕt b¾t ®Çu tan, e r»ng kh«ng thùc hiÖn ®­îc kÕ ho¹ch råi."..strSex.."N¨m tíi c¸c vŞ nhí ®Õn ®©y ch¬i tiÕp nhĞ!",0)
		return 0
	end
	if NEWYEAR_SWITCH == 1 then
		local selTab = {
					"H·y mau ®­a ta ®Õn ®ã!/go",
					"T×m hiÓu ho¹t ®éng./know_detail",
					"Ta ®· qua tuæi nµy råi ­!/nothing"
					}
		Say("VŞ "..strSex.."lÏ nµo kh«ng muèn nh©n c¬ héi ch¬i ®ïa tháa thİch mét lÇn hay sao?",3,selTab)
	else
		Say("MÊy h«m nay tuyÕt ch­a r¬i nªn khu nĞm tuyÕt ch­a thÓ më, mêi"..strSex.."lÇn sau quay l¹i nhĞ!",0)
	end
		
end

function go()
	if GetPlayerRoute() == 0 then
		Say("Xin lçi, ng­êi ch¬i ®· gia nhËp m«n ph¸i míi cã thÓ tham gia ho¹t ®éng NĞm tuyÕt ®o¹t b¶o vËt.",0)
		return 0
	end
	--½øÈëÑ©ÕÌµØÍ¼Ê±´´½¨Àë¿ªµØÍ¼´¥·¢Æ÷
	local id,idx = 0,0
	bCreateFailed = 0 
	for i=1,5 do	
		Tid = 1710 + i
		Tidx = 3100 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--´´½¨Àë¿ªµØÍ¼´¥·¢Æ÷
				bCreateFailed = 1
			end
		end
	end
	if bCreateFailed == 1 then	--´¥·¢Æ÷´´½¨Ê§°Ü¾Í²»¸ø½ø³¡
		Say("Vµo b¶n ®å thÊt b¹i, xin h·y thö l¹i!",0)
		WriteLog("[Ho¹t ®éng mïa xu©n -KÕt nèi thÊt b¹i]:"..GetName().."Vµo b¶n ®å, kÕt nèi m¸y chñ thÊt b¹i (3101~3105).")
		return 0
	end

	local Entry = {
				{964,1665,3582},
				{964,1665,3497},
				{964,1665,3425},
				{964,1665,3360},
				{964,1664,3291},
				{964,1695,3228},
				{964,1730,3221},
				{964,1763,3224},
				{964,1795,3226},
				{964,1826,3226},
				{964,1854,3292},
				{964,1856,3365},
				{964,1856,3422},
				{964,1858,3498},
				{964,1856,3582}
				}
	local EntryNo = random(1,15)
	NewWorld(Entry[EntryNo][1],Entry[EntryNo][2],Entry[EntryNo][3])	--Ëæ»úÈë¿Ú
	if GetWorldPos() == 964 then
		for SkillID=843,851 do
		LearnSkill(SkillID)	--Ñ§»á´òÑ©ÕÌ¼¼ÄÜ
		end
		if GetTask(TASK_GOT_SNOWBALL) ~= GetCurDate() then
			SetTask(TASK_GOT_SNOWBALL,0)
		end
		if GetTask(TASK_GOT_SNOWBALL) == 0 then
			AddItem(2,3,216,20)
			AddItem(2,3,219,20)
			SetTask(TASK_GOT_SNOWBALL,GetCurDate())
			Msg2Player("B¹n nhËn ®­îc 20 ®¹n TiÓu TuyÕt CÇu vµ 20 TiÓu TuyÕt CÇu")
		end
		local BornPoint = {
						{1859,3230},
						{1664,3654},
						{1664,3229},
						{1854,3654}
						}
		SetDeathPunish(0)
		SetFightState(1)
		EntryNo = random(1,4)
		SetTempRevPos(964,BornPoint[EntryNo][1]*32,BornPoint[EntryNo][2]*32)	--Ëæ»úÖØÉúµã
		SetDeathScript("\\script\\online\\´º½Ú»î¶¯\\playerdeath.lua")
		SetPKFlag(2,1)
		UseScrollEnable(0)
		Msg2Player("Hoan nghªnh c¸c b¹n vµo khu nĞm tuyÕt ®o¹t b¶o.")
	end
end

function know_detail()
	Talk(6,"","Vµo khu nĞm tuyÕt ng­¬i sÏ cã mét sè kü n¨ng trong « kü n¨ng bªn ph¶i (kh«ng ph¶i b¶ng kü n¨ng F5)","Kü n¨ng kh¸c nhau sÏ tiªu hao TuyÕt CÇu kh¸c nhau. Mçi ngµy vµo khu nĞm tuyÕt sÏ ®­îc ph¸t 20 ®¹n TiÓu TuyÕt CÇu vµ 20 TiÓu TuyÕt CÇu miÔn phİ, còng cã thÓ mua t¹i tiÖm t¹p hãa hoÆc TuyÕt Gi¶.","5 thµnh thŞ mçi thµnh ®Òu cã 1 TuyÕt Gi¶, t­¬ng øng víi 5 khu nĞm tuyÕt kh¸c nhau.","Khu nĞm tuyÕt cã rÊt nhiÒu b¶o r­¬ng chøa nhiÒu ®å quı chê ng­¬i ®Õn më.","Mçi ngµy 12h, 18h, 21h t¹i 5 khu nĞm tuyÕt sÏ ph¸t 100 phÇn quµ n¨m míi. Mäi ng­êi h·y nhanh ch©n ®Õn lÊy!","Chó ı: Trong khu vùc nĞm tuyÕt kh«ng thÓ sö dông Håi Thµnh phï hay MËt Hµm cña s­ phô.")
end

function nothing()

end
