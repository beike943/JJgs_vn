--½Å±¾Ãû³Æ£º2007¶ËÎç»î¶¯NPC½Å±¾
--½Å±¾¹¦ÄÜ£º»î¶¯NPC½Å±¾
--»î¶¯²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-05-24
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--=====================================È«¾Ö±äÁ¿¶¨ÒåÇø============================
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")

	flower_goods_id = 1140
	frag_sao_goods_id = 1139
	keepsake_num_TaskID = 1227
	zong_zi_date_seq = 1228
	zong_zi_num_restrict_TaskID = 1230
	zong_zi_start_TaskID = 1231
	chg_mertiral_TaskTempID = 168
	keepsake_date_TaskID = 1241
	dragon_boat_07_join_TaskID = 1242
	Tb_keepsake_chg_way = {
		{"L¸ gãi b¸nh",800,1130},
		{"Tóc MÔ",320,1129},
		{"Tróc ®ång",320,1131},
		{"Hµm Thñy",200,1132},
		{"İch Trİ Nh©n",160,1133},
		{"§Ëu ®á",96,1134},
		{"g¹o tr¾ng",64,1135},
		{"Ng·i diÖp",32,1136},
		{"§ïi n­íng",16,1137},
		{"Tóc tö",8,1138},
	}
	Tb_zong_zi_info = {}
	Tb_zong_zi_info[1118] = {{"§ång tèng","Nguyªn liÖu hîp thµnh c¬ b¶n v« hiÖu","",70,1000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"Tóc MÔ",1129,1,1},{"Tróc ®ång",1131,1,2}}
	Tb_zong_zi_info[1119] = {{"Bµnh İt Hµm Thñy","Nguyªn liÖu hîp thµnh c¬ b¶n v« hiÖu","",70,1000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"Hµm Thñy",1132,1,3},{"§ång tèng",1118,1}}
	Tb_zong_zi_info[1120] = {{"İch Trİ Tèng","Lo¹i b¸nh nµy kh«ng cã g× ®Æc biÖt","",70,1500,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"İch Trİ Nh©n",1133,1,4},{"Bµnh İt Hµm Thñy",1119,1}}
	Tb_zong_zi_info[1121] = {{"B¸nh İt §Ëu ®á","Lo¹i b¸nh nµy kh«ng cã g× ®Æc biÖt","",60,2000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"§Ëu ®á",1134,1,5},{"İch Trİ Tèng",1120,1}}
	Tb_zong_zi_info[1122] = {{"b¸nh İt g¹o tr¾ng","Lo¹i b¸nh nµy kh«ng cã g× ®Æc biÖt","",50,4000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"g¹o tr¾ng",1135,1,6},{"B¸nh İt §Ëu ®á",1121,1}}
	Tb_zong_zi_info[1123] = {{"B¸nh İt Ng·i h­¬ng","Sau khi sö dông cã thÓ ®æi <color=yellow>50 v¹n*®¼ng cÊp*®¼ng cÊp/6400<color> ®iÓm søc kháe thµnh kinh nghiÖm","returngolden_exp_chg(500000)",50,6000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"Ng·i diÖp",1136,1,7},{"b¸nh İt g¹o tr¾ng",1122,1}}
	Tb_zong_zi_info[1124] = {{"b¸nh İt ch©n gµ","Néi <color=yellow>10<color> phót sau khi sö dông, Sinh lùc t¨ng thªm <color=yellow>30##<color>","returnlife_improve()",50,10000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"§ïi n­íng",1137,1,8},{"B¸nh İt Ng·i h­¬ng",1123,1}}
	Tb_zong_zi_info[1125] = {{"b¸nh İt B¸c B¶o","Néi <color=yellow>3<color> phót sau khi sö dông, toµn bé n¨ng lùc t¨ng thªm <color=yellow>60<color> ®iÓm","returnability_improve()",33,40000,"delete_all","toµn bé nguyªn liÖu sÏ biÕn mÊt"},{"L¸ gãi b¸nh",1130,1,0},{"Tóc tö",1138,1,9},{"b¸nh İt ch©n gµ",1124,1}}
	Tb_zong_zi_info[1126] = {{"b¸nh İt vui vÎ","Cã thÓ ®æi 1 quyÓn <color=yellow>S­ M«n lÖnh th­<color> ë ®©y hoÆc nhËn <color=yellow>100-200<color> ®iÓm danh väng ngÉu nhiªn","returnbook_renation_add()",33,80000,"1125","Tæn thÊt 1 c¸i B¸nh İt b¸t b¶o"},{"b¸nh İt B¸c B¶o",1125,3}}
	Tb_zong_zi_info[1127] = {{"b¸nh İt may m¾n","Cã thÓ ®Õn gÆp ta ®Ó ®æi 1 quyÓn <color=yellow>MËt TŞch S­ m«n<color>","returniron_stone_add()",33,100000,"1126"," sÏ tæn thÊt 1 B¸nh İt Vui vÎ"},{"b¸nh İt vui vÎ",1126,3}}
	Tb_zong_zi_info[1128] = {{"b¸nh İt th¹ch anh","Cã thÓ ®æi 1 quyÓn mËt tŞch <color=red>L¨ng Ba Vi Bé<color>","returnsecret_book_add()",20,400000,"1127"," sÏ tæn thÊt 1 B¸nh İt May m¾n"},{"b¸nh İt may m¾n",1127,3}}
	Tb_zong_zi_num_restrict = {}
	Tb_zong_zi_num_restrict[1126] = {1,3,5,7}
	Tb_zong_zi_num_restrict[1127] = {2,3,6,7}
	Tb_zong_zi_num_restrict[1128] = {4,5,6,7}
	Tb_zong_zi_chg_dia = {}
	Tb_zong_zi_chg_dia[1126]= 	{"Ta muèn ®æi 1 quyÓn S­ M«n lÖnh th­/#prize_get(1126,1,1016)",
								"Ta muèn t¨ng danh väng/#repute_add(1126,100,200)",
								"Ta t­ëng t­îng xem nµo!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1126].say = "<color=green>TruyÒn nh©n n­íc Së<color>: Qu¶ nhiªn lµ lo¹i <color=yellow>B¸nh İt vui vÎ<color> hiÕm thÊy, ë ®©y cã quyÓn <color=yellow>S­ m«n lÖnh th­<color> cã thÓ gióp ®iÓm cèng hiÕn s­ m«n trong ngµy cña ng­¬i nh©n ®«i, hay ng­¬i muèn danh väng giang hå t¨ng <color=yellow>100-200 ®iÓm<color>, suy nghÜ kü råi h·y b¸i tÕ?"
	Tb_zong_zi_chg_dia[1127]= 	{"Ta x¸c nhËn tÕ b¸i!/tech_book_add",
								"Ta t­ëng t­îng xem nµo!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1127].say = "Th× ra lµ <color=yellow>B¸nh İt May m¾n<color>, l·o phu ta cã c¸c <color=yellow>Bİ kiÕp<color> mËt truyÒn cña c¸c m«n ph¸i. NÕu ng­¬i gia nhËp m«n ph¸i ta sÏ tÆng ng­¬i 1 quyÓn. NÕu ch­a gia nhËp th× cßn ph¶i xem vËn khİ cña ng­¬i ®·. Muèn b¸i tæ kh«ng?"
	Tb_zongzi_teach_book = {}
	Tb_zongzi_teach_book[21]={"Kim Cang Phôc Ma kinh",0,107,1}
	Tb_zongzi_teach_book[22]={"Kim Cang Phôc Ma T©m Ph¸p",0,107,2}
	Tb_zongzi_teach_book[41]={"TiÒm Long MËt tŞch",0,107,3}
	Tb_zongzi_teach_book[42]={"TiÒm Long T©m Ph¸p",0,107,4}
	Tb_zongzi_teach_book[31]={"V« TrÇn MËt tŞch",0,107,5}
	Tb_zongzi_teach_book[32]={"V« TrÇn T©m Ph¸p",0,107,6}
	Tb_zongzi_teach_book[61]={"Thiªn La MËt TŞch",0,107,7}
	Tb_zongzi_teach_book[62]={"Thiªn La T©m Ph¸p",0,107,8}
	Tb_zongzi_teach_book[81]={"Nh­ ı MËt TŞch",0,107,9}
	Tb_zongzi_teach_book[82]={"Nh­ ı T©m Ph¸p",0,107,10}
	Tb_zongzi_teach_book[91]={"Bİch H¶i Phæ",0,107,11}
	Tb_zongzi_teach_book[92]={"Bİch H¶i T©m Ph¸p",0,107,12}
	Tb_zongzi_teach_book[111]={"Hçn §én MËt tŞch",0,107,13}
	Tb_zongzi_teach_book[112]={"Hçn §én T©m Ph¸p",0,107,14}
	Tb_zongzi_teach_book[121]={"Quı Thiªn MËt tŞch",0,107,15}
	Tb_zongzi_teach_book[122]={"Quı Thiªn T©m Ph¸p",0,107,16}
	Tb_zongzi_teach_book[141]={"HuyÒn ¶nh MËt tŞch",0,107,17}
	Tb_zongzi_teach_book[142]={"HuyÒn ¶nh T©m Ph¸p",0,107,18}
	Tb_zongzi_teach_book[151]={"Qu©n Tö MËt tŞch",0,107,19}
	Tb_zongzi_teach_book[152]={"Qu©n Tö T©m Ph¸p",0,107,20}
	Tb_zongzi_teach_book[171]={"TrÊn Qu©n MËt tŞch",0,107,21}
	Tb_zongzi_teach_book[172]={"TrÊn Qu©n T©m Ph¸p",0,107,22}
	Tb_zongzi_teach_book[181]={"Xuyªn V©n MËt tŞch",0,107,23}
	Tb_zongzi_teach_book[182]={"Xuyªn V©n T©m Ph¸p",0,107,24}
	Tb_zongzi_teach_book[201]={"U Minh Quû Lôc",0,107,25}
	Tb_zongzi_teach_book[202]={"U Minh T©m Ph¸p",0,107,26}
	Tb_zongzi_teach_book[211]={"Linh Cæ MËt tŞch",0,107,27}
	Tb_zongzi_teach_book[212]={"Linh Cæ T©m Ph¸p",0,107,28}
	Tb_player_route = {2,3,4,6,8,9,11,12,14,15,17,18,20,21}
	Tb_zong_zi_chg_dia[1128] = {"Ta x¸c nhËn tÕ b¸i!/#prize_get(1128,112,78)",
								"Ta t­ëng t­îng xem nµo!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1128].say= "Th× ra lµ <color=yellow>B¸nh İt Thñy tinh<color>…§©y lµ Bİ kiÕp <color=yellow>'L¨ng Ba Vi Bé'<color>. Xem ra ng­¬i cãp duyªn víi nã...Muèn b¸i tæ kh«ng?"
--linshi
--2008¶ËÎç
Tb_dialog_main = {
	"Ta muèn lµm b¸nh İt ®Õn b¸i KhuÊt Nguyªn ®¹i phu/zongzi_cook",
	"Ta cÇn dïng lo¹i b¸nh İt hiÕm thÊy ®Ó cóng tÕ KhuÊt Nguyªn ®¹i phu/zongzi_chg",
	"Ta muèn t×m hiÓu c¸ch lµm b¸nh İt/zongzi_info",
	"Ta chØ ®Õn xem thö/end_dialog"
}
--======================================º¯ÊıÖ÷Âß¼­Çø=============================
function main()
	if GetLevel() < 10 then
		Talk(1,"","<color=green>Di téc Së quèc<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> n¨ng lùc cßn yÕu, hay lµ quay l¹i sau vËy!")
		return
	end
	if dragon_boat_08_time_chk() == 0 then
		Talk(1,"","<color=green>Di téc Së quèc<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> ®õng nãng véi, ®îi ®Õn tr­íc ®ªm §oan Ngä (<color=yellow>mïng 5 th¸ng 5<color>) chóng ta sÏ më ho¹t ®éng §oan Ngä hoµn toµn míi, mäi ng­êi cïng nhau cóng tÕ KhuÊt Nguyªn ®¹i phu.")
		return
	else
		Say("<color=green>TruyÒn nh©n n­íc Së<color>: å, l¹i s¾p ®Õn <color=yellow>TÕt §oan Ngä<color> råi, mçi n¨m cø ®Õn ngµy nµy TruyÒn nh©n n­íc Së cña chóng ta rÊt th­¬ng t©m. TÊt c¶ con ch¸u cña ®¹i nh©n KhuÊt Nguyªn v× ®Ó t­ëng nhí ®Õn «ng ®· t¹o mét c¸i lÒu lµm b¸nh İt, ®Ó phôc vô gãi b¸nh cho mäi ng­êi, chØ cÇn b¹n mang nguyªn liÖu ®Õn lµ ®­îc.",
		getn(Tb_dialog_main),
		Tb_dialog_main
		)
	end
end
--ôÕ×ÓÖÆ×÷Ö÷º¯Êı
function zongzi_cook()
	 --ôÕ×ÓÖÆ×÷¶Ô»°
	local Tb_dialog_zongzi_cook ={}
	local zongzi_able_cook_num = 0
	if dragon_boat_08_time_chk() == 1 then
		zongzi_able_cook_num = getn(Tb_zongzi_08)
	else
		zongzi_able_cook_num = (getn(Tb_zongzi_08) - 4)
	end
	--¶Ô»°ºÏ³É
	for i = 1 ,zongzi_able_cook_num do
		tinsert(Tb_dialog_zongzi_cook,Tb_zongzi_08[i][1]..", c«ng dông: "..Tb_zongzi_08[i][6].."; tû lÖ thµnh c«ng: "..Tb_zongzi_08[i][3].."%/#zongzi_cook_chk("..i..")")
	end
	tinsert(Tb_dialog_zongzi_cook,"MÖt qu¸ ®i! Ta kh«ng lµm n÷a!/end_dialog")
	--¶Ô»°Õ¹¿ª
	Say("<color=green>TruyÒn nh©n n­íc Së<color>: Muèn lµm mét c¸i b¸nh ngon kh«ng ph¶i lµ viÖc dÔ, cÇn ph¶i ®ñ nguyªn liÖu. Ng­¬i muèn lµm mét c¸i b¸nh nh­ thÕ nµo?",
	getn(Tb_dialog_zongzi_cook),
	Tb_dialog_zongzi_cook
	)
end
--ÖÆ×÷ôÕ×ÓÈ·ÈÏ¶Ô»°
function zongzi_cook_chk(zongzi_diff)
	Say("<color=green>Di téc Së quèc<color>: <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color>, c«ng dông: <color=yellow>"..Tb_zongzi_08[zongzi_diff][6].."<color>; nguyªn liÖu: <color=yellow>"..Tb_zongzi_08[zongzi_diff][5][1][3].."("..Tb_zongzi_08[zongzi_diff][5][1][2].."),"..Tb_zongzi_08[zongzi_diff][5][2][3].."("..Tb_zongzi_08[zongzi_diff][5][2][2].."),"..Tb_zongzi_08[zongzi_diff][5][3][3].."("..Tb_zongzi_08[zongzi_diff][5][3][2]..")<color>, tû lÖ thµnh c«ng: <color=yellow>"..Tb_zongzi_08[zongzi_diff][3].."%<color>. Ng­¬i x¸c nhËn muèn lµm chø?",
	2,
	"Ta x¸c nhËn/#zongzi_cook_dtm("..zongzi_diff..")",
	"§Ó ta suy nghÜ l¹i/zongzi_cook"
	)	
end
--È·ÈÏÖÆ×÷ôÕ×Ó
function zongzi_cook_dtm(zongzi_diff)
	local zongzi_num_min = min(floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][1][1])/Tb_zongzi_08[zongzi_diff][5][1][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][2][1])/Tb_zongzi_08[zongzi_diff][5][2][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][3][1])/Tb_zongzi_08[zongzi_diff][5][3][2]))
	if zongzi_num_min == 0 then
		Talk(1,"","<color=green>Di téc Së quèc<color>: <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color> nguyªn liÖu gåm <color=yellow>"..Tb_zongzi_08[zongzi_diff][5][1][3].."("..Tb_zongzi_08[zongzi_diff][5][1][2].."),"..Tb_zongzi_08[zongzi_diff][5][2][3].."("..Tb_zongzi_08[zongzi_diff][5][2][2].."),"..Tb_zongzi_08[zongzi_diff][5][3][3].."("..Tb_zongzi_08[zongzi_diff][5][3][2]..")<color>, cã thÓ <color=yellow>"..Zgc_pub_sex_name().."<color> ngay c¶ nguyªn liÖu lµm 1 c¸i <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color> còng kh«ng ®ñ, cã ph¶i ®Ó quªn trong r­¬ng kh«ng?")
		return
	end
	SetTaskTemp(chg_mertiral_TaskTempID,zongzi_diff)
	AskClientForNumber("zongzi_get",1,zongzi_num_min,"Xi nhËp sè l­îng b¹n muèn lµm "..Tb_zongzi_08[zongzi_diff][1].."!")
end
--¿ªÊ¼ÖÆ×÷ôÕ×Ó
function zongzi_get(zongzi_num)
	local zongzi_diff = GetTaskTemp(chg_mertiral_TaskTempID)
	--ÊäÈëÊıÁ¿Îª0Ê±²»´¦Àí
	if zongzi_num == 0 then
		return
	end
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(4,(50 + zongzi_num)) ~= 1 then
		return
	end
	--²ÄÁÏĞ¯´ø¼ì²â
	if mertiral_chk(1,zongzi_diff,zongzi_num) ~= 1 then
		Talk(1,"","<color=green>TruyÒn nh©n n­íc Së<color>: Nguyªn liÖu ng­¬i ®em kh«ng ®ñ, cã ph¶i ®Ó quªn trong r­¬ng kh«ng?")
		return
	end
	--²ÄÁÏÉ¾³ı¼ì²â
	if mertiral_chk(2,zongzi_diff,zongzi_num) ~= 1 then
		Talk(1,"","<color=green>TruyÒn nh©n n­íc Së<color>: Nguyªn liÖu ng­¬i ®em kh«ng ®ñ, cã ph¶i ®Ó quªn trong r­¬ng kh«ng?")
		return
	end
	--ÖÆ×÷¸ÅÂÊ¼ÆËã
	if Tb_zongzi_08[zongzi_diff][3] ~= 100 then
		local ran_num = 0
		for i = 1,zongzi_num do
			ran_num = random(1,100)
			if ran_num > Tb_zongzi_08[zongzi_diff][3]  then
				zongzi_num = zongzi_num - 1
			end
		end
	end
	if zongzi_num == 0 then
		Talk(1,"","<color=green>TruyÒn nh©n n­íc Së<color>: ThËt ®¸ng tiÕc, "..Tb_zongzi_08[zongzi_diff][1].."ThÊt b¹i råi!")
		return
	end
	--ôÕ×ÓÔö¼Ó
	local add_flag = AddItem(2,1,Tb_zongzi_08[zongzi_diff][2],zongzi_num)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n ®· chÕ t¹o thµnh c«ng"..zongzi_num.."c¸i"..Tb_zongzi_08[zongzi_diff][1].."!")
	else
		WriteLog("[TÕt §oan Ngä 08] ng­êi ch¬i	"..GetName().."	T¨ng"..zongzi_num.."c¸i"..Tb_zongzi_08[zongzi_diff][1].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
	--ÆäËü½±ÀøÔö¼Ó
	--Íâ×°ºÍÍâ×°Ôö¼Ó
	if dragon_boat_08_time_chk() == 1 then
		for i = 1,zongzi_num do
			suit_add(zongzi_diff)
			exp_add()
		end
	end
end
--²ÄÁÏ¼ì²â,´¦Àí±êÖ¾£º1£º²ÄÁÏĞ¯´ø¼ì²â£¬2£º²ÄÁÏÉ¾³ı
function mertiral_chk(deal_flag,zongzi_diff,zongzi_num)
	if deal_flag == 1 then
		if zongzi_num > min(floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][1][1])/Tb_zongzi_08[zongzi_diff][5][1][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][2][1])/Tb_zongzi_08[zongzi_diff][5][2][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][3][1])/Tb_zongzi_08[zongzi_diff][5][3][2])) then
			return 0
		else
			return 1
		end
	else
		if DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][1][1],(Tb_zongzi_08[zongzi_diff][5][1][2] * zongzi_num)) == 1 and 
		DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][2][1],(Tb_zongzi_08[zongzi_diff][5][2][2] * zongzi_num)) == 1 and 
		DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][3][1],(Tb_zongzi_08[zongzi_diff][5][3][2] * zongzi_num)) == 1 then
			return 1
		else
			return 0
		end
	end
end
--Íâ×°Ôö¼Ó
function suit_add(zongzi_diff)
	--Èç¹ûÒÑ¾­ÁìÁËÒ»Ì×£¬Ôò·µ»Ø
	local suit_got = GetTask(TaskID_suit_prize)
	if strlen(tostring(suit_got)) >= 3 then
		return
	end
	local ran_num = random(1,1000)
	if ran_num > Tb_zongzi_08[zongzi_diff][4] then
		return
	else
		local player_body = GetBody()
		local ran_seq_num = random(1,3) --Ë³Ğò´òÂÒÖĞ¼äÊı
		for i = 1,3 do
			local add_seq = (mod((i +ran_seq_num),3) +1)
			if strfind(tostring(suit_got),tostring(add_seq))  == nil then
				local add_flag = AddItem(Tb_suit_prize[add_seq][player_body][2],Tb_suit_prize[add_seq][player_body][3],Tb_suit_prize[add_seq][player_body][4],1)
				if add_flag == 1 then
					Msg2Player("Chøc mõng! B¹n nhËn ®­îc 1 "..Tb_suit_prize[add_seq][player_body][1].."!")
				else
					WriteLog("[TÕt §oan Ngä 08] ng­êi ch¬i	"..GetName().."	T¨ng"..Tb_suit_prize[add_seq][player_body][1].." thÊt b¹i, kı hiÖu:"..add_flag)
				end
				--¼ÇÂ¼Êı¾İ
				SetTask(TaskID_suit_prize,(suit_got * 10 + add_seq))
				suit_got = GetTask(TaskID_suit_prize)
				--ÊÇ·ñÊÇÔö¼ÓÒ»Ì×µÄ´¦Àí
				if Tb_zongzi_08[zongzi_diff][4] < 50 then
					break
				end
			end
		end
	end
end
--¾­ÑéÔö¼Ó
function exp_add()
	local date_seq_save = GetTask(TaskID_exp_get_date_seq)
	local chg_num_save = GetTask(TaskID_exp_get_times)
	local date_seq_now = zgc_pub_day_turn(1)
	if date_seq_save < date_seq_now then
		SetTask(TaskID_exp_get_date_seq,date_seq_now)
		SetTask(TaskID_exp_get_times,1)
		chg_num_save = 0
	elseif date_seq_save == date_seq_now then
		SetTask(TaskID_exp_get_times,(chg_num_save + 1))
	else
		return
	end
	--10´ÎÒÔÉÏ²»ÓèÔËËã
	if chg_num_save > 20 then
		return
	end
	if 	 GetLevel() == 99 then
		laborday08_baoshi_prob()
	else
		local player_level = GetLevel()
		local exp_add_num = floor(player_level*player_level*player_level*player_level * cifang_caculate(0.5 , chg_num_save)/6)
		if Sever_diff == 2 then
			exp_add_num = floor(exp_add_num * 0.75)
		end
		if exp_add_num > 0 then
			ModifyExp(exp_add_num)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_add_num.." ®iÓm kinh nghiÖm!")
		end	
	end
end
--´Î·½ÔËËã
function cifang_caculate(a,b)
	local num_rtn = 1
	if b == 0 then
		return 1
	else
		for i = 1 , b do
			num_rtn = (num_rtn * a)
		end
		return num_rtn
	end
end
--ôÕ×Ó¶Ò»»½±Àø
function zongzi_chg()
	Say("TruyÒn nh©n n­íc Së: Ng­¬i muèn dïng b¸nh İt g× b¸i tÕ KhuÊt Nguyªn ®¹i phu, nÕu lo¹i th«ng th­êng th× kh«ng cÇn, bän ta cã nhiÒu råi.",
		6,
		"Ng­¬i xem thö B¸nh İt B¹ch Ngäc th× nh­ thÕ nµo?/zongzi_baiyu",
		"Ng­¬i xem thö B¸nh İt Ngù PhÈm th× nh­ thÕ nµo?/zongzi_yupin",
		"H·y xem thö B¸nh İt Vui vÎ thÕ nµo?/#zong_zi_up(1126)",
		"H·y xem thö B¸nh İt May m¾n thÕ nµo?/#zong_zi_up(1127)",
		"H·y xem thö B¸nh İt Thñy tinh thÕ nµo?/#zong_zi_up(1128)",
		"Ta ë ®©y chØ cã b¸nh İt th­êng, ®Ó ta thö lµm l¹i xem "
	)
end
--ĞÂÔöôÕ×Ó´¦Àí
--°×ÓñôÕ×Ó
function zongzi_baiyu()
	if zongzi_chg_astrict(1,1) ~= 1 then
		return
	end
	Say("<color=green>TruyÒn nh©n n­íc Së<color>: Qu¶ nhiªn lµ <color=yellow>B¸nh İt B¹ch Ngäc<color>, l·o phu cã mét İt trang bŞ kh«ng tåi, tÆng ng­¬i 1 mãn, ng­¬i x¸c nhËn muèn tÕ b¸i råi chø?",
	3,
	"¤ng cã nh÷ng trang bŞ nµo/baiyu_prize_info",
	"Ta x¸c nhËn tÕ b¸i!/baiyu_use_dtm",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--°×ÓñôÕ×Ó½±Àø½éÉÜ
function baiyu_prize_info()
	Talk(1,"zongzi_baiyu","<color=green>TruyÒn nh©n n­íc Së<color>: <color=red>Linh th¹ch cÊp 7 (2 viªn), Tµng KiÕm Tö Kim M·o, Tµng KiÕm Kim Lò Th­êng, Tµng KiÕm ¤ Kim Trang, Tµng KiÕm B¶o Ch©u, Tµng KiÕm Kú Th¹ch, Tµng KiÕm Kim Ên<color>, ®Òu lµ nh÷ng vËt quİ c¶.")
end
--°×ÓñôÕ×ÓÈ·ÈÏÊ¹ÓÃ
function baiyu_use_dtm()
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,100	) ~= 1 then
		return
	end
	--Ğ¯´øÉ¾³ı¼à²â
	for i = 1,2 do
		if zongzi_use_dtm(i,7) ~= 1 then
			return
		end
	end
	--½±ÀøÔö¼Ó
	local ran_num = random(1,100)
	if ran_num <= Tb_baiyu_prize[getn(Tb_baiyu_prize)][1] then	--Ôö¼Ó²Ø½£×°±¸
		local add_flag = 0
		for i = 1,getn(Tb_baiyu_prize) do
			if ran_num <= Tb_baiyu_prize[i][1] then
				if type(Tb_baiyu_prize[i][2][1]) == "table" then
					local player_body = GetBody()
					add_flag = AddItem(Tb_baiyu_prize[i][2][player_body][1],Tb_baiyu_prize[i][2][player_body][2],Tb_baiyu_prize[i][2][player_body][3],1,1,-1,-1,-1,-1,-1,-1)
				else
					add_flag = AddItem(Tb_baiyu_prize[i][2][1],Tb_baiyu_prize[i][2][2],Tb_baiyu_prize[i][2][3],1,1,-1,-1,-1,-1,-1,-1)
				end
				if add_flag == 1 then
					Msg2Player("Chóng mõng b¹n ®· dïng 'B¸nh İt B¹ch Ngäc' ®æi ®­îc 1 '"..Tb_baiyu_prize[i][3].."!")
					Msg2SubWorld("Ng­êi ch¬i:"..GetName().." dïng B¸nh İt B¹ch Ngäc' ®æi thµnh c«ng 1 '"..Tb_baiyu_prize[i][3].."!")
				else
					WriteLog("[TÕt §oan Ngä 08] ng­êi ch¬i	"..GetName().."	T¨ng"..Tb_baiyu_prize[i][3].." thÊt b¹i, kı hiÖu:"..add_flag)
				end
				break
			end
		end
	else	--Ôö¼ÓÁéÊ¯
		lspf_AddLingShiInBottle(7,2)
		Msg2Player("B¹n nhËn ®­îc 2 viªn Linh th¹ch cÊp 7, ®· cho vµo Tô Linh ®Ønh!")
	end
	zongzi_chg_astrict(1,2)
end
--ÓùÆ·ôÕ×Ó
Tb_dialog_yupin = {
	"Ta cÇn Viªm Hoµng ThiÕt Hån/#yupin_use_dtm(1)",
	"Ta cÇn 12 viªn Linh th¹ch cÊp 7/#yupin_use_dtm(4)",
}
if Sever_diff == 2 then
	tinsert(Tb_dialog_yupin,"Ta cÇn Phiªn Vò/#yupin_use_dtm(2)")
	tinsert(Tb_dialog_yupin,"Ta cÇn Siªu Quang/#yupin_use_dtm(3)")
end
tinsert(Tb_dialog_yupin,"§Ó ta suy nghÜ l¹i/end_dialog")
function zongzi_yupin()
	if zongzi_chg_astrict(2,1) ~= 1 then
		return
	end
	Say("<color=green>TruyÒn nh©n n­íc Së<color>: Qu¶ nhiªn lµ <color=red>B¸nh İt Ngù PhÈm<color>, l·o phu kh«ng giÊu g× ng­¬i, ®İch thùc tæ tiªn nhµ ta lµ thŞ vÖ cña n­íc Së, ®©y lµ <color=red>Viªm Hoµng ThiÕt Hån<color> do tæ tiªn truyÒn l¹i, dïng ®Ó t¹o binh khİ thÇn th«ng, hoÆc <color=red>12 viªn Linh th¹ch cÊp 7<color>, hoÆc <color=red>B¸ch Tèc ThÇn C©u (thó c­ìi vÜnh viÔn)<color>, ng­¬i chän 1 thø ®i, ng­¬i ®· suy nghÜ kü muèn b¸i tÕ råi chø?",
	getn(Tb_dialog_yupin),
	Tb_dialog_yupin
	)
end
--ôÕ×ÓÊ¹ÓÃÈ·ÈÏĞÅÏ¢
function yupin_use_dtm(prize_diff)
	Say("<color=green>TruyÒn nh©n n­íc Së<color>: Ta còng biÕt <color=red>B¸nh İt Ngù PhÈm<color>"..Zgc_pub_sex_name().."Kh«ng dÔ cã, x¸c nhËn dïng vËt nµy ®æi <color=red>"..Tb_yupin_prize[prize_diff][getn(Tb_yupin_prize[prize_diff])].."<color>!",
	2,
	"Ta x¸c nhËn ®æi /#yupin_chg("..prize_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--ÓùÆ·½±Àø¶Ò»»
function yupin_chg(prize_diff)
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--Ğ¯´øÉ¾³ı¼à²â
	for i = 1,2 do
		if zongzi_use_dtm(i,9) ~= 1 then
			return
		end
	end
	--½±ÀøÔö¼Ó
	local add_flag = 0
	if prize_diff == 1 then
		add_flag = AddItem(Tb_yupin_prize[prize_diff][1],Tb_yupin_prize[prize_diff][2],Tb_yupin_prize[prize_diff][3],1)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1"..Tb_yupin_prize[prize_diff][4].."!")
		Msg2Player("Ng­êi ch¬i '"..GetName().." t¹i TruyÒn nh©n n­íc Së' dïng 1 B¸nh İt Ngù PhÈm ®æi 1 "..Tb_yupin_prize[prize_diff][4].."!")
	elseif prize_diff == 2 or prize_diff == 3 then
		add_flag = AddItem(Tb_yupin_prize[prize_diff][1],Tb_yupin_prize[prize_diff][2],Tb_yupin_prize[prize_diff][3],1,1,-1,-1,-1,-1,-1,-1)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 "..Tb_yupin_prize[prize_diff][4].."!")
		Msg2Player("Ng­êi ch¬i '"..GetName().." t¹i TruyÒn nh©n n­íc Së' dïng 1 B¸nh İt Ngù PhÈm ®æi 1 "..Tb_yupin_prize[prize_diff][4].."!")
	else
		lspf_AddLingShiInBottle(7,12)
		Msg2Player("Ng­êi ch¬i '"..GetName().." t¹i TruyÒn nh©n n­íc Së' dïng 1 B¸nh İt Ngù PhÈm ®æi "..Tb_yupin_prize[prize_diff][1].."!")
		add_flag = 1
	end
	if add_flag ~= 1 then
		WriteLog("[TÕt §oan Ngä 08] ng­êi ch¬i	"..GetName().."	T¨ng"..Tb_yupin_prize[prize_diff][4].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
	zongzi_chg_astrict(2,2)
end
--ôÕ×Ó¶Ò»»´ÎÊıÍ³Ò»´¦Àí
function zongzi_chg_astrict(zongzi_diff,deal_diff)
	if deal_diff == 1 then
		if GetTask(Tb_zongzi_use_num[zongzi_diff][2]) >= Tb_zongzi_use_num[zongzi_diff][3] then
			Talk(1,"","<color=green>TruyÒn nh©n n­íc Së<color>: PhÇn th­ëng cña l·o phu cã h¹n, mçi ng­êi ch¬i chØ cã thÓ ®æi <color=yellow>"..Tb_zongzi_use_num[zongzi_diff][1]..Tb_zongzi_use_num[zongzi_diff][3].."<color> lÇn!")
			return 0
		end
	else
		local zongzi_chg_times = GetTask(Tb_zongzi_use_num[zongzi_diff][2])
		SetTask(Tb_zongzi_use_num[zongzi_diff][2],(zongzi_chg_times+1))
		Talk(1,"","<color=green>TruyÒn nh©n n­íc Së<color>: Ng­¬i ®· ®æi <color=yellow>"..(zongzi_chg_times+1).."<color> lÇn <color=yellow>"..Tb_zongzi_use_num[zongzi_diff][1].."<color>, cßn cã thÓ ®æi <color=red>"..(Tb_zongzi_use_num[zongzi_diff][3] - (zongzi_chg_times+1)).."<color> lÇn!")
	end
	return 1
end
--ôÕ×ÓĞ¯´ø\É¾³ı¼ì²â
function zongzi_use_dtm(chk_flag,goods_diff)
	if chk_flag == 1 then
		if GetItemCount(2,1,Tb_zongzi_08[goods_diff][2]) == 0 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: Ng­¬i kh«ng mang theo <color=yellow>"..Tb_zongzi_08[goods_diff][1].."<color>!")
			return 0
		end
	elseif chk_flag == 2 then
		if DelItem(2,1,Tb_zongzi_08[goods_diff][2],1) ~= 1 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: Ng­¬i kh«ng mang theo <color=yellow>"..Tb_zongzi_08[goods_diff][1].."<color>!")
			return 0
		end
	end
	return 1
end
--Ô­ÓĞôÕ×Ó´¦Àí
	--ôÕ×Ó¼ÀµìÈ·ÈÏ¶Ô»°
	function zong_zi_up(zong_zi_id)
		Say(Tb_zong_zi_chg_dia[zong_zi_id].say,
			getn(Tb_zong_zi_chg_dia[zong_zi_id]),
			Tb_zong_zi_chg_dia[zong_zi_id]
		)
	end
	--ÎïÆ·¶Ò»»
	function prize_get(zong_zi_id,prize_type,prize_id)
		--Í¨ÓÃ¼ì²â
		if zong_zi_cond_chk(zong_zi_id) ~= 1 then
			return
		end
		--prizeÔö¼Ó
		if prize_type == 1 then
			if AddItem(2,1,prize_id,1) == 1 then
				Msg2Player("Chóc mõng b¹n sö dông ' "..Tb_zong_zi_info[zong_zi_id][1][1].." ®æi phÇn th­ëng thµnh c«ng")
			end
		else
			if AddItem(0,prize_type,prize_id,1) == 1 then
				Msg2Player("Chóc mõng b¹n sö dông ' "..Tb_zong_zi_info[zong_zi_id][1][1].." ®æi phÇn th­ëng thµnh c«ng")
			end
		end
		WriteLog("07 ®oan ngä- "..GetName().."Sö dông "..Tb_zong_zi_info[zong_zi_id][1][1].." ®æi phÇn th­ëng thµnh c«ng")
	end
	--¿ìÀÖôÕ×ÓÏà¹Ø
	function happy_zongzi_prize(prize_diff)
		--ÊıÁ¿ÅĞ¶Ï
		local date_save = GetTask(happy_zong_zi_date_TaskID)
		local num_save = GetTask(happy_zong_zi_num_TaskID)
		local date_now = zgc_pub_day_turn(1)
		if date_save >= date_now and num_save >= happy_zong_zi_restrict_num then
			Talk(1,"","<color=green>Di téc Së quèc<color>: <color=yellow>B¸nh İt Vui vÎ<color mçi ngµy ®Õn gÆp ta ®Ó ®æi <color=red>"..happy_zong_zi_restrict_num.."<color> lÇn!")
			return
		end
		--¿ªÊ¼¶Ô»°
		local prize_dia = "<color=green>Di téc Së quèc<color>: <color=yellow>B¸nh İt Vui vÎ<color> ®æi <color=yellow>"..Tb_happy_zong_zi_prize_name[prize_diff].."<color> tû lÖ vµ trŞ sè nh­ sau!"
		for i = 1,5 do		--Îå¼¶½±Àø
			prize_dia = prize_dia.."\n Tû lÖ: <color=yellow>"..Tb_happy_zong_zi_probility[1][i].."  <color> nhËn ®­îc :"
			if prize_diff == 4 then
				prize_dia = prize_dia.."<color=yellow>"..Zgc_pub_money_name_change(Tb_happy_zong_zi_prize[4][i][1]).." ®Õn "..Zgc_pub_money_name_change(Tb_happy_zong_zi_prize[4][i][2]).."<color>"
			else
				prize_dia = prize_dia.."<color=yellow>"..Tb_happy_zong_zi_prize[prize_diff][i][1].." ®Õn "..Tb_happy_zong_zi_prize[prize_diff][i][2].."<color> ®iÓm"
			end
		end
		Say(prize_dia,
			2,
			"Ta x¸c nhËn ®æi /#prize_get_dtm("..prize_diff..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
	end
	--¿ìÀÖôÕ×Ó½±Àø¸øÓÚ
	function prize_get_dtm(prize_diff)
		if GetPlayerFaction() == 0 and prize_diff == 3 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> nÕu muèn t¨ng ®é cèng hiÕn S­ m«n, tèt nhÊt nªn gia nhËp m«n ph¸i råi quay l¹i ®©y!")
			return
		end
		if GetItemCount(2,1,1126) == 0 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: Ng­¬i mang ®Õn c¸i qu¸i g× thÕ! Muèn ®ïa víi ta µ?")
			return
		end
		if DelItem(2,1,1126,1) ~= 1 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: Ng­¬i mang ®Õn c¸i qu¸i g× thÕ! Muèn ®ïa víi ta µ?")
			return
		end
		local prize_step = random(1,1000)
		for i = 1, getn(Tb_happy_zong_zi_probility[2]) do
			if prize_step <= Tb_happy_zong_zi_probility[2][i] then
				prize_step = i
				break
			end
		end
		local prize_num = random(Tb_happy_zong_zi_prize[prize_diff][prize_step][1],Tb_happy_zong_zi_prize[prize_diff][prize_step][2])
		if prize_diff == 1 then
			ModifyExp(prize_num)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..prize_num.." ®iÓm kinh nghiÖm!")
		elseif prize_diff == 2 then
			ModifyReputation(prize_num,0)
		elseif prize_diff == 3 then
			SetTask(336,(GetTask(336) + prize_num))
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..prize_num.."®iÓm cèng hiÕn s­ m«n!")
		else
			Earn(prize_num)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..Zgc_pub_money_name_change(prize_num).."!")
		end
		--¿ìÀÖôÕ×Ó´ÎÊı¸üĞÂ
		local date_save = GetTask(happy_zong_zi_date_TaskID)
		local num_save = GetTask(happy_zong_zi_num_TaskID)
		local date_now = zgc_pub_day_turn(1)
		if date_save < date_now then
			SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
			SetTask(happy_zong_zi_num_TaskID,1)
			SetTask(aixiang_eat_num_TaskID,0)
			num_save = 0
		else
			SetTask(happy_zong_zi_num_TaskID,(num_save + 1))
		end
		Talk(1,"","<color=green>Di téc Së quèc<color>: <color=yellow>B¸nh İt Vui vÎ<color> mçi ngµy chØ cã thÓ ®æi <color=yellow>"..happy_zong_zi_restrict_num.."<color> lÇn, ®©y lµ lÇn ®æi thø <color=yellow>"..(num_save+1).."<color> trong h«m nay!")
		WriteLog("Ho¹t ®éng §oan Ngä: Ng­êi ch¬i sö dông 'B¸nh İt Vui vÎ' ®æi "..Tb_happy_zong_zi_prize_name[prize_diff].."("..prize_num..")")
	end
	--ÉùÍû¶Ò»»
	function repute_add(zong_zi_id,add_num_min,add_num_max)
		--Í¨ÓÃ¼ì²â
		if zong_zi_cond_chk(zong_zi_id) ~= 1 then
			return
		end
		local ran_num = random(add_num_min,add_num_max)
		ModifyReputation(ran_num,0)
	end
	--Ãâ·ÑÇøµÄĞÒÔËôÕ×Ó
	function tech_book_add()
		--ôÕ×ÓĞ¯´ø¼ì²â
		if GetItemCount(2,1,1127) == 0 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: Ng­¬i mang ®Õn c¸i qu¸i g× thÕ! Muèn ®ïa víi ta µ?")
			return 0
		end
		--¿Õ¼ä¸ºÖØ¼ì²â
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return 0
		end
		--ôÕ×ÓÉ¾³ı¼ì²â
		if DelItem(2,1,1127,1) ~= 1 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: Ng­¬i mang ®Õn c¸i qu¸i g× thÕ! Muèn ®ïa víi ta µ?")
			return 0
		end
		--ÃØ¼®Ôö¼Ó
		local player_route = GetPlayerRoute() 
		local ran_num = random(1,2)
		if player_route ~= 0 then
			ran_num = (player_route * 10) + ran_num
		else
			ran_num = (Tb_player_route[random(1,getn(Tb_player_route))] *10) + ran_num
		end
		if AddItem(Tb_zongzi_teach_book[ran_num][2],Tb_zongzi_teach_book[ran_num][3],Tb_zongzi_teach_book[ran_num][4],1) == 1 then
			Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn ' "..Tb_zongzi_teach_book[ran_num][1].."!")
		end
	end
	--ôÕ×Ó¼ì²âÍ¨ÓÃº¯Êı
	function zong_zi_cond_chk(zong_zi_id)
			--ÎïÆ·Ğ¯´ø¼ì²â
		if GetItemCount(2,1,zong_zi_id) == 0 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: Ng­¬i mang ®Õn c¸i qu¸i g× thÕ! Muèn ®ïa víi ta µ?")
			return 0
		end
		--¿Õ¼ä¸ºÖØ¼ì²â
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return 0
		end
		--ÎïÆ·É¾³ı¼ì²â
		if DelItem(2,1,zong_zi_id,1) ~= 1 then
			Talk(1,"","<color=green>Di téc Së quèc<color>: Ng­¬i mang ®Õn c¸i qu¸i g× thÕ! Muèn ®ïa víi ta µ?")
			return 0
		end
		return 1
	end
--ôÕ×ÓÖÆ×÷ËµÃ÷
function zongzi_info()
	Say("<color=green>TruyÒn nh©n n­íc Së<color>: Kh«ng biÕt ng­¬i muèn hái c¸i nµo?",
		4,
		"Ta ph¶i lµm sao míi cã thÓ b¸i tÕ cïng c¸c ng­êi/how_2_cook",
		"Ta cã thÓ dïng b¸nh İt g× ®Ó b¸i tÕ/which_2_use",
		"Ta muèn t×m hiÓu c¸ch lµm b¸nh İt/cook_info",
		"Ta ®· hiÓu/end_dialog"
	)
end
--ÈçºÎ¼À°İ
function how_2_cook()
	Talk(1,"zongzi_info","<color=green>TruyÒn nh©n n­íc Së<color>: T×m <color=green>chñ töu lÇu<color>, chç «ng ta cã nguyªn liÖu b¸nh İt, gi¸ c¶ rÊt hîp lı; ®em nguyªn liÖu vÒ ®©y, thî lµm b¸nh ë ®©y sÏ gióp ng­¬i lµm <color=yellow>miÔn phİ<color>.")
end
--ÓÃÊ²Ã´¼À°İ
function which_2_use()
	Talk(3,"zongzi_info","<color=green>TruyÒn nh©n n­íc Së<color>: NÕu lµ b¸nh İt th­êng th× kh«ng cÇn, nh÷ng c¸i b¸nh hiÕm ng­¬i còng cã thÓ tù dïng. NÕu ng­¬i ®em nh÷ng c¸i b¸nh quİ d­íi ®©y ®Õn b¸i tÕ, bän ta sÏ kh«ng b¹c ®·i ng­¬i ®©u, cho ng­¬i mét sè vËt quİ hiÕm.",
					"<color=green>TruyÒn nh©n n­íc Së<color>: Sau khi b¸i tÕ <color=yellow>B¸nh İt B¹ch Ngäc<color> cã thÓ ngÉu nhiªn nhËn ®­îc mét trong nh÷ng thø sau <color=red>2 viªn Linh th¹ch cÊp 7, Tµng KiÕm Tö Kim M·o, Tµng KiÕm Kim Lò Th­êng, Tµng KiÕm ¤ Kim Trang, Tµng KiÕm B¶o Ch©u, Tµng KiÕm Kú Th¹ch, Tµng KiÕm Kim Ên<color>.",
					"<color=green>TruyÒn nh©n n­íc Së<color>: <color=yellow>B¸nh İt Ngù PhÈm<color> sau khi b¸i tÕ cã thÓ chän <color=red>"..Tb_zongzi_08_yupin[Sever_diff].."<color> ."
			)
end
--²Ù×÷ËµÃ÷
function cook_info()
	Talk(2,"zongzi_info","<color=green>TruyÒn nh©n n­íc Së<color>: TÕt §oan Ngä<color=yellow>[5/6 ®Õn 9/6]<color> cã thÓ hîp <color=yellow>B¸nh İt g¹o th¬m, B¸nh İt ng¶i h­¬ng, B¸nh İt h¹t dÎ, B¸nh İt ngò h­¬ng, B¸nh İt PhØ Thóy, B¸nh İt B¹ch Ngäc, B¸nh İt Ngù PhÈm<color>. Trong thêi gian ho¹t ®éng ng­êi ch¬i cÊp <color=yellow>10-98<color> hîp b¸nh th× sÏ cã ®iÓm kinh nghiÖm dùa theo ®¼ng cÊp, tïy theo sè lÇn mµ ®iÓm kinh nghiÖm sÏ gi¶m dÇn, cho ®Õn khi ®iÓm kinh nghiÖm thÊp h¬n 10 th× sÏ kh«ng cßn nhËn ®­îc n÷a; ng­êi ch¬i cÊp <color=yellow>99<color> mçi lÇn hîp sÏ nhËn ®­îc 1 viªn Linh th¹ch ngÉu nhiªn tõ cÊp 1-7, mçi ngµy nhiÒu nhÊt cã thÓ nhËn ®­îc <color=yellow>20<color> viªn. Mçi lÇn hîp 1 c¸i b¸nh ®Òu cã c¬ héi nhËn ®­îc <color=yellow>Trang phôc B¸t B¸t<color>, mçi ng­êi nhiÒu nhÊt cã thÓ nhËn ®­îc 1 bé. Cã thÓ ®æi phÇn th­ëng nhiÒu nhÊt lµ <color=yellow>15 lÇn B¸nh İt B¹ch Ngäc, 5 lÇn B¸nh İt Ngù PhÈm<color>. (<color=red>B¸nh İt B¹ch Ngäc vµ B¸nh İt Ngù PhÈm chØ lµm trong thêi gian nµy<color>)",
		" <color=green>TruyÒn nh©n n­íc Së<color>: Sau TÕt §oan Ngä, cã thÓ tiÕp tôc lµm <color=yellow>B¸nh İt g¹o th¬m, B¸nh İt ng¶i h­¬ng, B¸nh İt h¹t dÎ, B¸nh İt ngò h­¬ng, B¸nh İt PhØ Thóy<color>.")
end