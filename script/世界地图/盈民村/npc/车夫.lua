
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÊÕ¸ûµØÍ¼³µ·ò½Å±¾
-- Edited by ÁõÓîÄş
-- 2005/08/26 

-- 2005/9/14£¬ÃÏ·²ĞŞ¸Ä Ó¯Ãñ

-- ======================================================


function main()
	local selTab = {
				"Giíi thiÖu khu vùc b¶n ®å/jieshao",
				"Rêi khái khu vùc thu thËp/leave",
				"§Õn L©m Nh¹c Th«n (cao cÊp)/#NewWorld(723,1700,3448)",
				"§Õn Thanh Thñy Th«n (s¬ cÊp)/#NewWorld(713,1477,2948)",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("Muèn canh t¸c ­? ChØ cÇn dïng ThÇn N«ng §¬n ®­a ®Õn khu vùc t­¬ng øng sau ®ã dïng kü n¨ng canh t¸c",getn(selTab),selTab)
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
				"TuyÒn Ch©u L©m D­îc S­ (H¸i thuèc)/#NewWorld(100,1555,2961)",
				"BiÖn Kinh L­u NhÊt Phñ (§èn gç)/#NewWorld(200,1220,2909)",
				"Kh«ng ®i ®©u c¶!/no",
				}
	Say("GÇn ®©y lµng ta m­a thuËn giã hßa, thu ho¹ch ngµy cµng ®­îc mïa. Ng­êi ®Õn canh t¸c lò l­ît, xa phu ta còng ph¶i tÊt bËt ngµy ®ªm! Kh¸ch quan muèn ®Õn n¬i nµo?",getn(selTab),selTab)	
end;


function jieshao()
	Say("Doanh D©n th«n lµ khu vùc canh t¸c trung cÊp. Tr¸i ph¶i phİa trªn cã nhiÒu <color=yellow>Mİa cÊp 5<color>. Bªn tr¸i phİa d­íi mäc ®Çy <color=yellow>Diªn Tinh M¹ch cÊp 6<color>, bªn ph¶i lµ <color=yellow>ThuÇn hßa m¹ch cÊp 7<color>.",0)
end;


function no()
end;


