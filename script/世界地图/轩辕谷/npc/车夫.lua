
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ²ÉÒ©µØÍ¼³µ·ò½Å±¾
-- Edited by ÁõÓîÄş
-- 2005/08/26 

-- 2005/9/14£¬ÃÏ·²ĞŞ¸Ä ĞùÔ¯

-- ======================================================


function main()
	local selTab = {
				"Giíi thiÖu khu vùc b¶n ®å/jieshao",
				"Rêi khái khu vùc thu thËp/leave",
				"§Õn Hµm U Cèc (trung cÊp)/#NewWorld(719,1708,3396)",
				"§Õn Nam Hße Cèc (s¬ cÊp)/#NewWorld(714,1511,3004)",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("Muèn h¸i thuèc ­? ChØ cÇn sö dông ThÇn N«ng §¬n ®­a ®Õn khu vùc t­¬ng øng sau ®ã dïng Kü n¨ng h¸i thuèc",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Thµnh §«/#NewWorld(300, 1681 ,3464)",
				"BiÖn Kinh/#NewWorld(200, 1249 ,2732)",
				"TuyÒn Ch©u/#NewWorld(100,1377,3051)",
				"Thµnh §« §¹i Kho¸ng C«ng (®µo kho¸ng)/#NewWorld(300,1836,3430)",
				"Thµnh §« Hoµng §¹i ThÈm (KĞo t¬)/#NewWorld(300,1848,3493)",
				"BiÖn Kinh thî s¨n Tr­¬ng (Thuéc da)/#NewWorld(200,1347,3029)",
				"TuyÒn Ch©u M¹c Qu©n §¹o tr­ëng (TËp linh)/#NewWorld(100,1393,2969)",
				"TuyÒn Ch©u Lı Phong Thu (Canh t¸c)/#NewWorld(100,1603,2968)",
				"BiÖn Kinh L­u NhÊt Phñ (§èn gç)/#NewWorld(200,1220,2909)",
				"N¸n l¹i trß chuyÖn cïng ta!/no",
				}
	Say("Muèn trë vÒ sao? Sao kh«ng n¸n l¹i cïng l·o phu trß chuyÖn? Ph¶i ch¨ng ®· h¸i ®­îc thuèc quı nªn véi v· ®i b¸n?",getn(selTab),selTab)
end;

function jieshao()
	Say("Hiªn Viªn cèc lµ khu vùc h¸i thuèc cao cÊp. Tr¸i ph¶i phİa trªn cã nhiÒu <color=yellow>X¹ h­¬ng cÊp 8<color>. Bªn tr¸i phİa d­íi <color=yellow>MËt gÊu cÊp 9<color>, bªn ph¶i lµ <color=yellow>Nh©n s©m cÊp 10<color>.",0)

end;


function no()
end;


