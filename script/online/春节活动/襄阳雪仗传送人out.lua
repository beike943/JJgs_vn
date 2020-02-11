--filename:ÏåÑôÑ©ÕÌ´«ËÍÈËout.lua
--create date:2006-01-12
--author:yanjun
--describe:ÏåÑôÑ©ÕÌ´«ËÍÈË£¨Àë³¡£©½Å±¾
function main()
	local selTab = {
			"Ta muèn quay vÒ./gohome",
			"Ta muèn mua tuyÕt cÇu./buysnowball",
			"Ta quªn c¸ch ch¬i råi, h·y nãi l¹i lÇn n÷a./know_detail",
			"ThËt vÊt v¶ cho ng­¬i!/nothing"
			}
	Say("Ch¬i vui kh«ng? Ta cã thÓ gióp g×?",4,selTab)
end

function gohome()
	NewWorld(350,1575,2970)
	if GetWorldPos() == 350 then
		SetDeathPunish(1)
		SetFightState(0)
		UseScrollEnable(1)
		SetTempRevPos(0,0,0)
		for SkillID=843,851 do
			RemoveSkill(SkillID)	--Íü¼Ç´òÑ©ÕÌ¼¼ÄÜ
		end
		SetDeathScript("")
	end
end

function buysnowball()
	Sale(52)
end

function know_detail()
	Talk(6,"","Vµo khu nĞm tuyÕt ng­¬i sÏ cã mét sè kü n¨ng trong « kü n¨ng bªn ph¶i (kh«ng ph¶i b¶ng kü n¨ng F5)","Kü n¨ng kh¸c nhau sÏ tiªu hao TuyÕt CÇu kh¸c nhau. Mçi ngµy vµo khu nĞm tuyÕt sÏ ®­îc ph¸t 20 ®¹n TiÓu TuyÕt CÇu vµ 20 TiÓu TuyÕt CÇu miÔn phİ, còng cã thÓ mua t¹i tiÖm t¹p hãa hoÆc TuyÕt Gi¶.","5 thµnh thŞ mçi thµnh ®Òu cã 1 TuyÕt Gi¶, t­¬ng øng víi 5 khu nĞm tuyÕt kh¸c nhau.","Khu nĞm tuyÕt cã rÊt nhiÒu b¶o r­¬ng chøa nhiÒu ®å quı chê ng­¬i ®Õn më.","Mçi ngµy 12h, 18h, 21h t¹i 5 khu nĞm tuyÕt sÏ ph¸t 100 phÇn quµ n¨m míi. Mäi ng­êi h·y nhanh ch©n ®Õn lÊy!","Chó ı: Trong khu vùc nĞm tuyÕt kh«ng thÓ sö dông Håi Thµnh phï hay MËt Hµm cña s­ phô.")
end

function nothing()

end