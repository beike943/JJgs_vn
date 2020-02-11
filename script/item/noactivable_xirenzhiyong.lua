-- ====================== ÎÄ¼þÐÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Î´¿ª·æµÄÏ£ÈÊÖ®Óµ½Å±¾ÎÄ¼þ                  
-- Edited by starry night                                 
-- 2006/05/11 AM 20:15                                    
                                                          
-- ======================================================

Include("\\script\\item\\weapon_kaifeng_head.lua");

function OnUse()

	Say("<color=yellow>Hi Nh©n CÇm<color> nµy hiÖn <color=yellow>ch­a gi¸m ®Þnh<color>, cã thÓ dïng vËt liÖu ®Æc thï ®Ó kÝch ho¹t nã. B¹n muèn chän c¸ch kÝch ho¹t nµo sau ®©y?",
	7,
	"KÝch ho¹t th«ng th­êng (cÇn 1 l­îng vµng, 1 Thiªn th¹ch vµ 3 tÊm Gi¸m §Þnh phï cÊp 7)/#Weapon_Kaifeng(1,2,10)",
	"KÝch ho¹t kü (cÇn 20 l­îng vµng, 5 Thiªn th¹ch vµ 5 tÊm Gi¸m §Þnh phï cÊp 7)/#Weapon_Kaifeng(2,2,10)",
	"KÝch Ho¹t cao cÊp? (cÇn 200 l­îng vµng, 10 thiªn th¹ch, 10 gi¸m ®Þnh phï cÊp 7, 1 tê mËt tÞch)/#Weapon_Kaifeng(3,2,10)",
	"KÝch ho¹t th«ng th­êng? (cÇn 2 Bµn Long BÝch)/#Weapon_Kaifeng_Ex(1,2,10)",
	"KÝch ho¹t kü? (cÇn 4 Bµn Long BÝch)/#Weapon_Kaifeng_Ex(2,2,10)",
	"KÝch ho¹t cao cÊ? (cÇn 1 TÈy Tñy §¬n)/#Weapon_Kaifeng_Ex(3,2,10)",
	"T¹m thêi kh«ng kÝch ho¹t/nothing"
	)

end

function nothing()

end