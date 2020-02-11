-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Î´¿ª·æµÄÁÒÑæ½Å±¾ÎÄ¼ş                  
-- Edited by starry night                                 
-- 2006/05/11 AM 20:15                                    
                                                          
-- ======================================================

Include("\\script\\item\\weapon_kaifeng_head.lua");

function OnUse()

	Say("<color=yellow>LiÖt DiÖm<color> nµy hiÖn <color=yellow>ch­a gi¸m ®Şnh<color>, cã thÓ dïng vËt liÖu ®Æc thï ®Ó kİch ho¹t LiÖt DiÖm. B¹n muèn chän c¸ch kİch ho¹t nµo sau ®©y?",
	7,
	"Kİch ho¹t th«ng th­êng (cÇn 1 l­îng vµng, 1 Thiªn th¹ch vµ 3 tÊm Gi¸m §Şnh phï cÊp 7)/#Weapon_Kaifeng(1,1,2)",
	"Kİch ho¹t kü (cÇn 20 l­îng vµng, 5 Thiªn th¹ch vµ 5 tÊm Gi¸m §Şnh phï cÊp 7)/#Weapon_Kaifeng(2,1,2)",
	"Kİch Ho¹t cao cÊp? (cÇn 200 l­îng vµng, 10 thiªn th¹ch, 10 gi¸m ®Şnh phï cÊp 7, 1 tê mËt tŞch)/#Weapon_Kaifeng(3,1,2)",
	"Kİch ho¹t th«ng th­êng? (cÇn 2 Bµn Long Bİch)/#Weapon_Kaifeng_Ex(1,1,2)",
	"Kİch ho¹t kü? (cÇn 4 Bµn Long Bİch)/#Weapon_Kaifeng_Ex(2,1,2)",
	"Kİch ho¹t cao cÊ? (cÇn 1 TÈy Tñy §¬n)/#Weapon_Kaifeng_Ex(3,1,2)",
	"T¹m thêi kh«ng kİch ho¹t/nothing"
	)

end

function nothing()

end