-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 14, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");
Include("\\script\\ÖĞÔ­Ò»Çø\\ãê¾©\\npc\\ÎäÆ÷µêÀÏ°å.lua");

quest_giver = cf_ox_SetColor("Chñ TiÖm vò khİ", "green")..":"
quest_title = cf_ox_SetColor("Thuéc tİnh vò khİ", "yellow").."\n"
quest_detail = cf_ox_SetColor("B¹n nhËn ®­îc vò khİ t­¬ng kh¾c víi qu¸i thuéc tİnh ©m.", "gray").."\n\n"
quest_description_1 = quest_giver.."§óng lµ nh÷ng nguyªn liÖu nµy, ta sÏ gióp ng­¬i chÕ t¹o."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_004()
	local ws = random(1,5)
	if (GetItemCount(2, 2, 1) >= 20) and (GetItemCount(2, 2, 9) >= 10) and (GetItemCount(2, 0, 12) >= 1) then
		-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
		RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
		SetTask(101, 18)

	
		-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
		DelItem(2, 2, 1, 20)					-- É¾³ıÍæ¼ÒÈÎÎñµÀ¾ß
		DelItem(2, 2, 9, 10)					-- É¾³ıÍæ¼ÒÈÎÎñµÀ¾ß
		DelItem(2, 0, 12, 1)					-- É¾³ıÍæ¼ÒÈÎÎñµÀ¾ß
		ModifyExp(200)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
		if (GetPlayerRoute() == 2) then
			AddItem(0,5,31,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 3) then			
			AddItem(0,8,88,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 4) then
			AddItem(0,0,5,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 6) then
			AddItem(0,1,44,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 8) then
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 9) then
			AddItem(0,10,66,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 11) then
			AddItem(0,0,5,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 12) then
			AddItem(0,5,31,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 14) then
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 15) then
			AddItem(0,9,77,1,1,0,16383,0,16383,0,16383,ws)
		else
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		end

--Íæ¼ÒÂ·ÏßÓ³Éä±í
--0	ÎŞÂ·Ïß
--1	ÉÙÁÖÎŞÂ·Ïß
--2	ÉÙÁÖË×¼Ò
--3	ÉÙÁÖìøÉ®
--4	ÉÙÁÖÎäÉ®
--5	ÌÆÃÅÎŞÂ·Ïß
--6	ÌÆÃÅÆÕÍ¨
--7	¶ëáÒÎŞÂ·Ïß
--8	¶ëáÒ³ö¼Ò
--9	¶ëáÒË×¼Ò
--10	Ø¤°ïÎŞÂ·Ïß
--11	Ø¤°ï¾»ÒÂ
--12	Ø¤°ïÎÛÒÂ
--13	Îäµ±ÎŞÂ·Ïß
--14	Îäµ±µÀ¼Ò
--15	Îäµ±Ë×¼Ò
	
		-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
		TaskTip("B¹n nhËn ®­îc vò khİ t­¬ng kh¾c víi qu¸i thuéc tİnh ©m.")
		Say(quest_title..quest_detail..quest_description_1, 0)
	else
		main()
	end
end