
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·¥Ä¾µØÍ¼³µ·ò½Å±¾
-- Edited by ÁõÓîÄş
-- 2005/08/26 

-- 2005/9/14£¬ÃÏ·²ĞŞ¸Ä ²ÔÁú

-- ======================================================
function main()
	local selTab = {
				"Giíi thiÖu khu vùc b¶n ®å/jieshao",
				"Rêi khái khu vùc thu thËp/leave",
				"§Õn Héi Tiªn LÜnh (trung cÊp)/#NewWorld(715,1496,2998)",
				"§Õn H­ng An LÜnh (s¬ cÊp)/#NewWorld(710,1707,3385)",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("Muèn ®èn c©y ­? ChØ cÇn dïng ThÇn N«ng §¬n ®Õn n¬i quy ®Şnh sau ®ã sö dông Kü n¨ng ®èn c©y. T­¬ng tù nh­ vËy cho TËp Linh",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"Thµnh §«/#NewWorld(300, 1681 ,3464)",
				"BiÖn Kinh/#NewWorld(200, 1249 ,2732)",
				"TuyÒn Ch©u/#NewWorld(100,1377,3051)",
				"Thµnh §« §¹i Kho¸ng C«ng (®µo kho¸ng)/#NewWorld(300,1836,3430)",
				"Thµnh §« Hoµng §¹i ThÈm (KĞo t¬)/#NewWorld(300,1848,3493)",
				"BiÖn Kinh thî s¨n Tr­¬ng (Thuéc da)/#NewWorld(200,1347,3029)",
				"TuyÒn Ch©u L©m D­îc S­ (H¸i thuèc)/#NewWorld(100,1555,2961)",
				"TuyÒn Ch©u Lı Phong Thu (Canh t¸c)/#NewWorld(100,1603,2968)",
				"Ta muèn ®èn İt cñi!/no",
				}
	Say("N¨m nay kÎ trång c©y İt mµ chÆt ph¸ c©y th× nhiÒu, thËt ®au lßng…Xem bé d¹ng mi cã vÎ ®¾c chİ! Muèn ®i ®©u? Nãi ®i!",getn(selTab),selTab)
end;


function jieshao()
    Say("Th­¬ng Long LÖnh lµ khu vùc §èn c©y vµ TËp Linh cao cÊp. Phİa trªn cã thÓ thu thËp <color=yellow>ThiÕt TuyÕn Méc vµ HuyÒn H¹c Linh HuyÕt cÊp 8<color>, yªu cÇu Kü n¨ng §èn c©y vµ TËp Linh <color=yellow>cÊp 70<color>. Phİa d­íi bªn tr¸i lµ <color=yellow>Ba La méc cÊp 9<color>, yªu cÇu Kü n¨ng §èn c©y <color=yellow>cÊp 80<color>. Phİa d­íi bªn ph¶i lµ <color=yellow>§µn Méc cÊp 10<color>, yªu cÇu Kü n¨ng §èn c©y <color=yellow>cÊp 90<color> míi cã thÓ thu thËp.",0)
end;
function no()
end;


