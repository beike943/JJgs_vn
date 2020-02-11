-- filename£ºs2map_ask.lua
-- By:Xsjcs
-- °ïÖúÍæ¼Ò²éÑ¯Á·¼¶µØµã
---------------------------------------------
lv_str = {	"T©n thñ"," trªn cÊp 5","võa qua cÊp 10","h¬n cÊp 10","võa qua cÊp 20","h¬n cÊp 20","võa qua cÊp 30","h¬n cÊp 30","võa qua cÊp 40","h¬n cÊp 40","Cao thñ cÊp 50","TuyÖt h¶o cao thñ"}
dangernpc = {	"Thá tr¾ng, Thá x¸m","L­u manh, C«n ®å","Sãi x¸m, Sãi xanh, ThiÕt Gi¸p trïng","Heo rõng, Ong vµng, B¸ch NhËt tiÔn","Trém vÆt, D¬i, M· hÇu, KiÕm kh¸ch","Phi tÆc, §ao hiÖp, Hæ","N÷ KiÕm kh¸ch, TuyÕt qu¸i","Sãi ®iªn, Ng­êi lïn, Qu¹, NhÖn, N÷ HiÖp Kh¸ch, B¸t Phô Hµ §«ng s­, Méc Nh©n, Quan sø","Yªu Hå, S¬n tÆc, Danh Th­¬ng HiÖp, KiÕm s¸t, D¬i Hót m¸u, Nh·n Kİnh xµ, §ao tuyÖt, Thiªn Lı Tiªu, KiÕm cuång, §ång Nh©n, KiÕm tuyÖt, §ao Kh¸ch","§Şa s¸t, HuyÒn Vâ §ao, Cung LiÖp, N÷ KiÕm hµo, Liªu TiÔn binh, Bé kho¸i, Liªu §ao binh, Tèng TiÔn binh, Tèng §ao binh","Thiªn s¸t, Tèng Th­¬ng qu©n, B¨ng qu¸i, C¬ quan Méc Nh©n, MËt th¸m, Th­¬ng qu©n Liªu, Hæ Y Nh©n, §·ng §ao Kh¸ch, HuyÒn Vâ KiÕm, §ao Kh¸ch hoang m¹c","C¸c NPc cÊp 100, nh­ KiÕm Tµ, Th­¬ng cuång"}
helpmap = {	"Khu vùc xung quanh Thµnh ®«, Khu vùc xung quanh BiÖn Kinh",
		"Khu vùc ven Thµnh ®«, Khu vùc ven BiÖn Kinh",
		"Khu vùc ven Nam m«n Thµnh §«, Khu vùc ven §«ng m«n BiÖn Kinh, H¹nh Hoa th«n, xung quanh C¸i Bang, xung quanh Nga My ph¸i",
		"Xung quanh ThiÕu L©m, xung quanh Nga My, xung quanh Vâ §ang, ch©n Phôc Ng­u s¬n, bªn ngoµi H¹nh Hoa th«n",
		"Xung quanh c¸c ®¹i m«n ph¸i",
		"Xung quanh c¸c ®¹i m«n ph¸i",
		"Xung quanh c¸c ®¹i m«n ph¸i, B¨ng T©m ®éng tÇng 1",
		"T­êng V©n ®éng, D­¬ng Trung ®éng tÇng 2 tr¸i,Ch©n Thanh Thµnh s¬n, ThÊt Tinh ®éng tÇng 1, ThiÕu L©m MËt thÊt tÇng 1, B¨ng T©m ®éng tÇng 1",
		"T­êng V©n ®éng, D­¬ng Trung ®éng tÇng 1 vµ 2, ThÊt Tinh ®éng tÇng 1, ThiÕu L©m MËt thÊt tÇng 1, B¨ng T©m ®éng tÇng 1, Tróc Ty ®éng tÇng 1, L­¬ng S¬n B¹c",
		"D­¬ng Trung ®éng tÇng 3, ThÊt Tinh ®éng tÇng 2, ThiÕu L©m MËt thÊt tÇng 2, Kim Quang ®éng, KiÕm M«n quan, Nh¹n M«n quan",
		"Kim Quang ®éng, D­¬ng Trung ®éng, ThiÕu L©m MËt thÊt tÇng 2, Kim Quang ®éng, NhŞ Long S¬n, KiÕm M«n quan, Nh¹n M«n quan",
		"C¸c s¬n ®éng thÇn bİ, S¬n tr¹i, MËt ®¹o, HuyÖt cèc"
	}

function maphp()
	lvl = floor(GetLevel()/5 + 1)
	if (lvl>12) then 
		lvl=12;
	end;
	Talk(3,"","§èi víi <color=red>"..lv_str[lvl].."<color> nh­ ng­¬i, th× ®Şa ®iÓm luyÖn c«ng thİch hîp nhÊt lµ <color=red>"..helpmap[lvl].."<color>. <enter>T¹i nh÷ng n¬i ®ã, tèt nhÊt ng­¬i nªn ®¸nh <color=red>"..dangernpc[lvl].."<color>.","MÆc dï hiÖn t¹i ng­¬i ®· rÊt m¹nh, nh­ng ta vÉn ®Ò nghŞ ng­¬i <color=red>nªn tæ ®éi víi nhiÒu ng­êi kh¸c<color> ®Ó t¨ng thªm sù an toµn vµ hiÖu qu¶ luyÖn c«ng!","<color=red>Ph¶i hÕt søc chó ı<color>: Mçi khu vùc luyÖn c«ng ph©n bè <color=red>hçn t¹p<color> c¸c lo¹i qu¸i. V× vËy ®èi víi nh÷ng lo¹i cã tªn <color=red>mµu ®á<color>, <color=blue>mµu xanh<color> vµ <color=yellow>mµu vµng<color> th× kh«ng nªn ®¬n ®éc chiÕn ®Êu víi chóng! <enter>Sau khi <color=red>®· cã vò khİ ngò hµnh<color> + <color=red>®¼ng cÊp t­¬ng ®­¬ng 40<color> vµ hoµn thµnh nhiÖm vô t­¬ng ®­¬ng, ng­¬i cã thÓ ®Õn <color=green>Phong §«<color>, <color=green>Giang T©n th«n<color> ®Ó luyÖn c«ng víi c¸c qu¸i vËt <color=red>¢m tİnh<color>")
end;