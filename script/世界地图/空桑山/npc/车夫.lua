
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ³éË¿£¬ÖÆÆ¤µØÍ¼³µ·ò½Å±¾
-- Edited by ÁõÓîÄş
-- 2005/08/26 

-- 2005/9/14£¬ÃÏ·²ĞŞ¸Ä ¿ÕÉ£

-- ======================================================
function main()
	local selTab = {
				"Giíi thiÖu khu vùc b¶n ®å/jieshao",
				"Rêi khái khu vùc thu thËp/leave",
				"§Õn Tö Tang S¬n (cao cÊp)/#NewWorld(722,1748,3420)",
				"§Õn C«n Ng« S¬n (trung cÊp)/#NewWorld(717,1736,2906)",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("Muèn kĞo t¬ hay thuéc da, chØ cÇn dïng ThÇn N«ng §¬n ®Õn khu vùc t­¬ng øng sau ®ã dïng c¸c kü n¨ng lµ ®­îc.",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Thµnh §«/#NewWorld(300, 1681 ,3464)",
				"BiÖn Kinh/#NewWorld(200, 1249 ,2732)",
				"TuyÒn Ch©u/#NewWorld(100,1377,3051)",
				"Thµnh §« §¹i Kho¸ng C«ng (®µo kho¸ng)/#NewWorld(300,1836,3430)",
				"TuyÒn Ch©u M¹c Qu©n §¹o tr­ëng (TËp linh)/#NewWorld(100,1393,2969)",
				"TuyÒn Ch©u L©m D­îc S­ (H¸i thuèc)/#NewWorld(100,1555,2961)",
				"TuyÒn Ch©u Lı Phong Thu (Canh t¸c)/#NewWorld(100,1603,2968)",
				"BiÖn Kinh L­u NhÊt Phñ (§èn gç)/#NewWorld(200,1220,2909)",
				"Kh«ng ®i ®©u c¶!/no",
				}
	Say("Hay l¾m! S¨n ®­îc nhiÒu tr©n cÇm dŞ thó thÕ, nhÊt ®Şnh sÏ b¸n ®­îc rÊt nhiÒu tiÒn!",getn(selTab),selTab)
end;


function jieshao()
	Say("Kh«ng Tang s¬n lµ khu vùc kĞo t¬ vµ thuéc da s¬ cÊp, bªn tr¸i trªn cã nhiÒu <color=yellow>Thè VÜ vµ Lang B× cÊp 1<color>, bªn ph¶i lµ <color=yellow>T¬ t»m vµ Hæ B× cÊp 2<color>. Bªn tr¸i d­íi cã nhiÒu <color=yellow>T¬ ngò s¾c vµ Da r¾n cÊp 3<color>, cßn bªn ph¶i lµ <color=yellow>T¬ Lang Chu vµ Hå B× cÊp 4<color>.",0)
end;


function no()
end;


