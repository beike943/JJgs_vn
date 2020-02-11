
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ²ÉÒ©µØÍ¼³µ·ò½Å±¾
-- Edited by ÁõÓîÄş
-- 2005/08/26 

-- 2005/9/14£¬ÃÏ·²ĞŞ¸Ä º¬ÓÄ

-- ======================================================
function main()
	local selTab = {
				"Giíi thiÖu khu vùc b¶n ®å/jieshao",
				"Rêi khái khu vùc thu thËp/leave",
				"§Õn Hiªn Viªn Cèc (cao cÊp)/#NewWorld(724,1721,3386)",
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
	Say("Hµm U cèc lµ khu vùc h¸i thuèc trung cÊp. N¬i ®©y tr¸i ph¶i phİa trªn cã nhiÒu <color=yellow> X¸c ve cÊp 5<color>. Bªn tr¸i phİa d­íi mäc ®Çy <color=yellow>§iÒn thÊt cÊp 6<color>, cßn bªn ph¶i lµ n¬i xuÊt hiÖn cña <color=yellow>Xuyªn s¬n gi¸p cÊp 7<color>.",0)
end;


function no()
end;


