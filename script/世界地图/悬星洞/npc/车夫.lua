
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÍÚ¿óµØÍ¼³µ·ò½Å±¾
-- Edited by ÁõÓîÄş
-- 2005/08/26 

-- 2005/9/14£¬ÃÏ·²ĞŞ¸Ä ĞüĞÇ

-- ======================================================


function main()
	local selTab = {
				"Giíi thiÖu khu vùc b¶n ®å/jieshao",
				"Rêi khái khu vùc thu thËp/leave",
				"§Õn Linh Nham §éng (trung cÊp)/#NewWorld(716,1694,3032)",
				"§Õn Th¹ch M«n §éng (s¬ cÊp)/#NewWorld(711,1728,3383)",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("Muèn ®µo kho¸ng ­? ChØ cÇn dïng ThÇn N«ng §¬n ®­a ®Õn khu vùc t­¬ng øng sau ®ã dïng kü n¨ng ®µo kho¸ng",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Thµnh §«/#NewWorld(300, 1681 ,3464)",
				"BiÖn Kinh/#NewWorld(200, 1249 ,2732)",
				"TuyÒn Ch©u/#NewWorld(100,1377,3051)",
				"Thµnh §« Hoµng §¹i ThÈm (KĞo t¬)/#NewWorld(300,1848,3493)",
				"BiÖn Kinh thî s¨n Tr­¬ng (Thuéc da)/#NewWorld(200,1347,3029)",
				"TuyÒn Ch©u M¹c Qu©n §¹o tr­ëng (TËp linh)/#NewWorld(100,1393,2969)",
				"TuyÒn Ch©u L©m D­îc S­ (H¸i thuèc)/#NewWorld(100,1555,2961)",
				"TuyÒn Ch©u Lı Phong Thu (Canh t¸c)/#NewWorld(100,1603,2968)",
				"BiÖn Kinh L­u NhÊt Phñ (§èn gç)/#NewWorld(200,1220,2909)",
				"Kh«ng ®i ®©u c¶!/no",
				}
	Say("Muèn trë vÒ sao? B¾t ®­îc nhiÒu má quı, ph¸t tµi nhí ®õng quªn ta!",getn(selTab),selTab)
end;



function jieshao()
	Say("HuyÒn Tinh ®éng lµ khu vùc kho¸ng th¹ch cao cÊp. Tr¸i ph¶i phİa trªn cã nhiÒu <color=yellow>H¾c « th¹ch cÊp 8<color>. Bªn tr¸i phİa d­íi <color=yellow>Xİch thiÕt cÊp 9<color>, bªn ph¶i lµ <color=yellow>V©n mÉu cÊp 10<color>.",0)
end;


function no()
end;


