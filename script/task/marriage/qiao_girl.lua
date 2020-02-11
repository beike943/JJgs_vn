--½Å±¾Ãû³Æ:ÇÉÅ®¶Ô»°½Å±¾
--½Å±¾¹¦ÄÜ:½á»é¶şÆÚNPC"ÇÉÅ®"¶Ô»°½Å±¾,ÓÃÓÚËæ»úÔö¼ÓÈÎÎñ¾íÖá
--²ß»®ÈË:ÌúÑò
--´úÂë¿ª·¢ÈË:´å³¤
--´úÂë¿ª·¢Ê±¼ä:2007Äê5ÔÂ15ÈÕ
--´úÂëĞŞ¸Ä¼ÇÂ¼
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
CALLBACK_FILE = "\\script\\task\\marriage\\qiao_girl.lua";
--================================¹«¹²±äÁ¿¶¨ÒåÇø================================
	Frag_att_num_TaskID = 1220
	goods_id_chg_use_id = 168
	goods_id_chg_id = 169
	get_task_reel_TaskID = 1216

	Tb_frag = {}
	Tb_frag[568] = "Gi¸p Méc d­¬ng"
	Tb_frag[569] = "Êt Méc ©m"
	Tb_frag[570] = "Bİnh háa d­¬ng"
	Tb_frag[571] = "§inh Háa ©m"

	Tb_ring_up_info = {
	{104,105,"NhÉn kim c­¬ng th­êng"},
	{106,107,"NhÉn kim c­¬ng"}
	}

	Tb_ring_attr = {
		{115,20,40,60,80,100},
		{421,20,40,60,80,100}
	}
function main()
	local mate_name = GetMateName()
	if mate_name == "" or mate_name == nil then
		Say("<color=green> <color>: Ng­êi nµy <color=yellow>"..Zgc_pub_sex_name().."<color> cã ı trung nh©n ch­a? §Õn t×m ta khi ®· thµnh h«n!",
		3,
		"T«i muèn dem theo khi chÕt/kill_follower",
		"Ta muèn söa vÊn ®Ò kÕt h«n/repair_marriage",
		"Rêi khái/end_dialog")
	else
		if BigGetItemCount(2,1,583) == 0 then
			if Zgc_pub_goods_add_chk(1,1) ~= 1 then
				return
			else
				AddItem(2,1,583,1)
			end
		end
		Say("<color=green> <color>: Ta lµ X¶o N÷ trªn trêi, thİch gióp mäi ng­êi cã t×nh nh©n. Thêi gian nµy cã nhiÒu L­u tinh r¬i xuèng, chØ cÇn ng­¬i vµ t×nh nh©n <color=yellow>mçi tuÇn <color> 1 lÇn ®Õn nhËn <color=yellow>NhiÖm vô Phu thª<color>, sÏ t×m ®­îc m¶nh vì L­u tinh, dïng nã hîp thµnh vËt quİ hiÕm, ®Ó t×nh c¶m vî chång thªm sau ®Ëm, cã thÓ häc ®­îc søc m¹nh ®Æc biÖt trong H«n Nh©n. Sau khi nhËn <color=yellow>Khiªn V©n Phi Tinh Phæ<color> th× nhËn <color=yellow>NhiÖm vô Phu thª<color> tuÇn nµy.",
		8,
		"T«i muèn nhËn NhiÖm vô Phu thª tuÇn nµy/get_task_dtm",
		"T«i muèn trao ®æi m¶nh vë phİa trªn/ma_frag_chg",
		"T«i muèn ®æi thuéc tİnh nhÉn/up_diamand_ring",
		"ThuyÕt minh NhiÖm vô Phu thª/get_att_info",
		"ThuyÕt minh kü n¨ng Phu thª/ma_skill_info",
		"T«i muèn dem theo khi chÕt/kill_follower",
		"Ta muèn söa vÊn ®Ò kÕt h«n/repair_marriage",
		"Rêi khái/end_dialog"
	)
	end
end

function kill_follower()
	local selTab = {
				"§ång ı/kill_follower_confirm",
				"Hñy bá/end_dialog",
				}
	Say("<color=green> <color>: NÕu b¹n cho r»ng qu¶ XuÊt Hån cã vÊn ®Ò, chän 'X¸c ®Şnh' hñy bá vËt ®i theo, nÕu kh«ng cã th× ®õng chän.",getn(selTab),selTab);
end;

function kill_follower_confirm()
	KillFollower();
end;
--×ê½äÉı¼¶
function up_diamand_ring()
	Say("<color=yellow> nµy"..Zgc_pub_sex_name().."<color>, c¸c ng­¬i cßn yªu nhau kh«ng? H·y mang <color=yellow>nhÉn kim c­¬ng<color> t­îng tr­ng cho lêi thÒ t×nh yªu ®Õn, ta sÏ dïng tiªn thuËt lµm t¨ng t×nh yªu cña c¸c ng­¬i. Nh­ng <color=yellow>nhÉn kim c­¬ng<color> sau khi th¨ng cÊp sÏ theo ng­¬i suèt ®êi, <color=red>kh«ng ®­îc giao dŞch n÷a<color>. SÏ tiªu hao <color=yellow>10<color> viªn <color=yellow>L­u tinh chi sa<color> vµ <color=yellow>5<color> viªn <color=yellow>Bµn long bİch<color>. Cã muèn thªm thuéc tİnh cho nhÉn kim c­¬ng kh«ng?",
	3,
	"§ång ı/ring_up_way",
	"Lµm sao cã ®­îc l­u tinh chi sa/star_ash_inf",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--ÔõÑùµÃµ½Á÷ĞÇÖ®É³
function star_ash_inf()
	Talk(1,"","Ta nghe nãi lóc nµy cã mét ng­êi tªn “<color=green>TrÇn c«ng tö<color>” ho¹t ®éng kh¾p n¬i, trong qu¸ tr×nh t×m <color=yellow>m¶nh L­u tinh<color>, cã khi sÏ gÆp h¾n hoÆc thñ h¹, hä sÏ chñ ®éng c«ng kİch. Nh­ng c¸c ng­¬i kh«ng ph¶i sî, bän ng­êi nµy n¨ng lùc kh«ng m¹nh, sau khi ®¸nh b¹i bän hä, sÏ cã ®­îc <color=yellow>L­u tinh chi sa<color>.")
end
--Éı¼¶·½Ê½Ñ¡Ôñ
function ring_up_way()
	Say("NhÉn kim c­¬ng cã <color=yellow>hai<color> thuéc tİnh. Mét lµ ®¸nh qu¸i cã ®­îc kinh nghiÖm t¨ng thªm; hai lµ t¨ng tÊt c¶ ®iÓm sè. Mçi lÇn thªm thuéc tİnh ph¶i tiªu hao <color=yellow>5<color> viªn <color=yellow>Bµn long bİch<color>. H·y thªm thuéc tİnh cho nhÉn kim c­¬ng Phæ th«ng, hay kh«ng hµi hµi lßng vÒ thuéc tİnh cña <color=yellow>nhÉn kim c­¬ng<color> ®· cã, cã muèn <color=yellow>thªm l¹i thuéc tİnh<color>? Nh¾c lÇn n÷a, <color=yellow>nhÉn kim c­¬ng<color> thªm thuéc tİnh kh«ng ®­îc giao dŞch.",
	3,
	"Ta muèn thªm thuéc tİnh cho nhÉn kim c­¬ng Phæ th«ng/#ring_up(1)",
	"Ta kh«ng hµi lßng víi thuéc tİnh nhÉn kim c­¬ng hiÖn nay, muèn thªm thuéc tİnh/ring_reup_dtm",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--ÖØĞÂÉı¼¶½äÖ¸È·ÈÏ¶Ô»°
function ring_reup_dtm()
	Say("Tuy ta cã thÓ <color=yellow>ban<color> thuéc tİnh, nh­ng do thuéc tİnh céng thªm xuÊt hiÖn ngÉu nhiªn, ta kh«ng thÓ b¶o ®¶m thuéc tİnh lÇn nµy sÏ tèt h¬n lÇn tr­íc. Ng­¬i cßn muèn <color=yellow>thªm l¹i thuéc tİnh<color> kh«ng?",
		2,
		"§ång ı/#ring_up(2)",
		"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--×ê½äÉı¼¶
function ring_up(up_diff)
	--½äÖ¸Ğ¯´ø¼ì²â
	local player_sex = GetSex()
	local ring_num = GetItemCount(0,102,Tb_ring_up_info[up_diff][player_sex])
	if ring_num == 0 then
		Talk(1,"","<color=yellow> nµy"..Zgc_pub_sex_name().."<color>, ta ch­a thÊy <color=yellow>nhÉn kim c­¬ng<color> cña ng­¬i.")
		return
	end
	if up_diff == 2 and ring_num ~= 1 then
		Talk(1,"","<color=yellow> nµy"..Zgc_pub_sex_name().."<color> ®· mang <color=red>"..ring_num.."<color> chiÕc <color=yellow>nhÉn kim c­¬ng<color>, ta biÕt chän c¸i nµo? H·y s¾p xÕp l¹i.")
		return
	end
	--ÅÍÁúèµĞ¯´ø¼ì²â
	if GetItemCount(2,1,1000) < 5 then
		Talk(1,"","<color=yellow>Thuéc tİnh<color> kim c­¬ng cÇn luyÖn ngäc, nªn kh«ng thÓ thiÕu <color=yellow>Bµn Long bİch<color>, ng­¬i h·y mang <color=yellow>5<color> viªn <color=yellow>Bµn Long bİch<color> ®Õn ®Ó thªm thuéc tİnh cho nhÉn kim c­¬ng. <color=yellow>Bµn Long bİch<color> cã b¸n <color=yellow>t¹i<color>Ngù C¸c Th­êng L¹c Hiªn.")
		return
	end
	--Á÷ĞÇÖ®É³Ğ¯´ø¼ì²â
	if GetItemCount(2,1,584) < 10 then
		Talk(1,"","Thuéc tİnh <color=yellow>nhÉn kim c­¬ng<color> ph¶i bao hµm nguyªn tè L­u tinh, nªn cÇn ®Õn <color=yellow>10<color> m¶nh <color=yellow>L­u tinh chi sa<color>, nÕu kh«ng ta còng bã tay. H·y thu thËp <color=yellow>10<color> viªn <color=yellow>L­u tinh chi sa<color> råi h·y ®Õn.")
		return
	end
	--¸ºÖØ¿Õ¼ä¼ì²â
	if Zgc_pub_goods_add_chk(1,20) ~= 1 then
		return
	end
	--Á÷ĞÇÖ®É³É¾³ı¼ì²â
	if DelItem(2,1,584,10) ~= 1 then
		Talk(1,"","Thuéc tİnh <color=yellow>nhÉn kim c­¬ng<color> ph¶i bao hµm nguyªn tè L­u tinh, nªn cÇn ®Õn <color=yellow>10<color> m¶nh <color=yellow>L­u tinh chi sa<color>, nÕu kh«ng ta còng bã tay. H·y thu thËp <color=yellow>10<color> viªn <color=yellow>L­u tinh chi sa<color> råi h·y ®Õn.")
		return
	end
	--ÅÍÁúèµÉ¾³ı¼ì²â
	if DelItem(2,1,1000,5) ~= 1 then
		Talk(1,"","<color=yellow>Thuéc tİnh<color> kim c­¬ng cÇn luyÖn ngäc, nªn kh«ng thÓ thiÕu <color=yellow>Bµn Long bİch<color>, ng­¬i h·y mang <color=yellow>5<color> viªn <color=yellow>Bµn Long bİch<color> ®Õn ®Ó thªm thuéc tİnh cho nhÉn kim c­¬ng. <color=yellow>Bµn Long bİch<color> cã b¸n <color=yellow>t¹i<color>Ngù C¸c Th­êng L¹c Hiªn.")
		return
	end
	--½äÖ¸É¾³ı¼ì²â
	if DelItem(0,102,Tb_ring_up_info[up_diff][player_sex],1) ~= 1 then
		Talk(1,"","<color=yellow> nµy"..Zgc_pub_sex_name().."<color>, ta ch­a thÊy <color=yellow>nhÉn kim c­¬ng<color> cña ng­¬i.")
		return
	end
	--½äÖ¸Ôö¼Ó
		--½äÖ¸ÊôĞÔÉú³É
		local ran_num_1 = random(1,Tb_ring_attr[1][6])
		local ran_num_2 = random(1,Tb_ring_attr[2][6])
		local attr_level_1 = 1
		local attr_level_2 = 1
		for i = 2,6 do
			if ran_num_1 <= Tb_ring_attr[1][i] then
				attr_level_1 = i - 1
				break
			end
		end
		for i = 2,6 do
			if ran_num_2 <= Tb_ring_attr[2][i] then
				attr_level_2 = i - 1
				break
			end
		end
		--½äÖ¸Ôö¼Ó
		local add_flag = AddItem(0,102,Tb_ring_up_info[2][player_sex],1,1,attr_level_1,Tb_ring_attr[1][1],attr_level_2,Tb_ring_attr[2][1],-1,-1)
		if add_flag == 1 then
			Talk(1,"","Ta ®· nh×n thÊy biÓu hiÖn t×nh yªu cña c¸c ng­¬i, ®©y lµ phÇn th­ëng cho sù chung thñy cña c¸c ng­¬i, chóc c¸c ng­¬i sèng ®Õn ®Çu b¹c r¨ng long, lóc nµo còng gi÷ chÆt lêi thÒ s¾c son trªn chiÕc nhÉn nµy. NÕu kh«ng hµi lßng vÒ thuéc tİnh cña <color=yellow>nhÉn kim c­¬ng<color>, cã thÓ thu thËp thªm <color=yellow>10<color> m¶nh <color=yellow>L­u tinh chi sa<color> råi ®Õn t×m ta, ta cã thÓ <color=yellow>thªm<color> thuéc tİnh gióp ng­¬i.")
			return
		else
			WriteLog("KÕt h«n kú hai-Ng­êi ch¬i:"..GetName().."Th¨ng cÊp nhÉn bŞ lçi, log lµ:"..add_flag)
		end
end
--*******************************ËéÆ¬½»»»**************************
function ma_frag_chg()
	Say("Ta cã thÓ ®æi gióp ng­¬i <color=yellow>m¶nh ®ang cã<color> thµnh m¶nh <color=yellow>kh¸c<color>. Nh­ng c¸ch nµy tiªu hao nhiÒu nguyªn khİ, nªn chØ cã thÓ dïng <color=red>3 m¶nh gièng nhau ®æi lÊy 1 m¶nh<color>. Ng­¬i muèn ®æi <color=yellow>m¶nh<color> nµo?",
	5,
	"Ta muèn ®æi Gi¸p Méc D­¬ng/#ma_frag_chg_use(568)",
	"Ta muèn ®æi Êt Méc ¢m/#ma_frag_chg_use(569)",
	"Ta muèn ®æi Bİnh Háa D­¬ng/#ma_frag_chg_use(570)",
	"Ta muèn ®æi §inh Háa ¢m/#ma_frag_chg_use(571)",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function ma_frag_chg_use(use_goods_id)
	--ÊıÁ¿ÅĞ¶Ï
	if GetItemCount(2,1,use_goods_id) < 3 then
		Talk(1,"","<color=yellow>Ng­¬i kh«ng cã ®ñ -"..Tb_frag[use_goods_id].."<color> <color=red>3<color> viªn, kh«ng thÓ ®æi!")
		return
	end
	--¶Ô»°
	local dia_chg = {}
	for i = 568, 571 do
		if i ~= use_goods_id then
			tinsert(dia_chg,"Ta muèn ®æi "..Tb_frag[i].."/#chg_num_in("..use_goods_id..","..i..")")
		end
	end
	tinsert(dia_chg,"§Ó ta suy nghÜ l¹i/end_dialog")
	Say("Ng­¬i cã thÓ ®æi <color=red>3<color> viªn"..Tb_frag[use_goods_id].." ®Ó ®æi <color=yellow>1<color> m¶nh <color=red>L­u tinh<color> kh¸c <color=yellow>tïy ı<color>, ng­¬i muèn ®æi m¶nh nµo?",
		getn(dia_chg),
		dia_chg
	)
end
--½»»»µÄÊıÁ¿ÊäÈë
function chg_num_in(use_goods_ID,goods_ID)
	SetTaskTemp(goods_id_chg_use_id,use_goods_ID)
	SetTaskTemp(goods_id_chg_id,goods_ID)
	local goods_num_max = floor(GetItemCount(2,1,use_goods_ID)/3)
	AskClientForNumber("ma_chg_deal",1,goods_num_max,"H·y nhËp sè l­îng ®æi")
end
--½»»»µÄ²Ù×÷
function ma_chg_deal(chg_num)
	if chg_num == 0 then
		return
	end
	--Êı¾İÈ¡³ö
	local use_goods_ID = GetTaskTemp(goods_id_chg_use_id)
	local goods_Id = GetTaskTemp(goods_id_chg_id)
	SetTaskTemp(goods_id_chg_use_id,0)
	SetTaskTemp(goods_id_chg_id,0)
	--Êı¾İĞ£Ñé
	if use_goods_ID <568 or use_goods_ID > 571 or goods_Id <568 or goods_Id > 571 then
		return
	end
	if use_goods_ID == goods_Id then
		return
	end
	--ÎïÆ·ÊıÁ¿¼ì²â
	if GetItemCount(2,1,use_goods_ID) < (chg_num * 3) then
		Talk(1,"","<color=yellow>Ng­¬i kh«ng cã ®ñ -"..Tb_frag[use_goods_ID].."<color>, kh«ng thÓ ®æi!")
		return
	end
	--Íæ¼Ò°ü¹ü¿Õ¼äºÍ¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--²ÄÁÏÉ¾³ı¼ì²â
	if DelItem(2,1,use_goods_ID,(chg_num * 3)) ~= 1 then
		Talk(1,"","<color=yellow>Ng­¬i kh«ng cã ®ñ -"..Tb_frag[use_goods_ID].."<color>, kh«ng thÓ ®æi!")
		return
	else
		if AddItem(2,1,goods_Id,chg_num) == 1 then
			Msg2Player("Chóc mõng b¹n ®· ®æi ®­îc råi."..chg_num.."c¸i"..Tb_frag[goods_Id].."!")
		end
	end
end
--»ñµÃÔªËØ·½Î»¶Ô»°
function ma_skill_info()
	Talk(3,"ma_skill_info_1",
				"<color=yellow>Kü n¨ng phu thª<color> lµ kÕt qu¶ t×nh yªu gi÷a hai vî chång, muèn häc kü n¨ng phu thª ph¶i chia lµm <color=yellow>3 b­íc<color>.",
				"<color=red>B­íc thø nhÊt:<color> t×m <color=yellow>m¶nh L­u tinh<color>, ®­a m¶nh L­u tinh t×m ®­îc vµo <color=yellow>Khiªn V©n Phi Tinh phæ<color>.",
				"<color=red>B­íc thø hai:<color> dïng <color=yellow>Khiªn V©n Phi Tinh phæ<color> hîp thµnh <color=yellow>S¸ch kü n¨ng h«n nh©n<color>. Trong ®ã, <color=yellow>bæn quyÓn<color> ®­îc <color=yellow>sö dông<color> khi häc kü n¨ng, <color=yellow>tµn quyÓn<color> ®­îc <color=yellow>sö dông<color> khi n©ng cÊp kü n¨ng."
		)
end
function ma_skill_info_1()
	Talk(2,"",	"<color=red>B­íc thø ba:<color> lµ <color=yellow>nhÊp chuét ph¶i<color> sö dông quyÓn kü n¨ng h«n nh©n, sÏ häc ®­îc kü n¨ng t­¬ng øng.",
				"HiÖn t¹i cã <color=yellow>3<color> kü n¨ng. Mét lµ <color=yellow>t­¬ng t­<color>, cã t¸c dông <color=yellow>Phu thª truyÒn tèng lÉn nhau<color>; hai lµ <color=yellow>“Hãa ®iÖp”<color>, cã t¸c dông <color=yellow>håi sinh b¹n ®êi<color>; ba lµ <color=yellow>“§iÖp biÕn”<color>, cã t¸c dông <color=yellow>t¨ng c­êng n¨ng lùc cña b¹n ®êi trong mét thêi gian<color>."
	)
end
--*********************************»ñµÃÈÎÎñ************************
--»ñµÃÔªËØ·½Î»¶Ô»°
function get_task_dtm()
	Say("Nh©n gian kÕt duyªn, trêi ban ®iÒm lµnh. C¸c ng­¬i ®· se sîi chØ hång, kÕt thµnh phu thª, cã thÓ t×m dÊu vÕt L­u tinh r¬i xuèng ®Êt. ë ®©y tuÇn nµo ta còng ghi l¹i vŞ trİ L­u tinh r¬i vµo quyÓn Khiªn V©n Phi Tinh phæ. Ng­¬i cã ch¾c muèn ghi vŞ trİ <color=yellow>tuÇn nµy<color> vµo <color=yellow>Khiªn V©n Phi Tinh phæ<color>?",
	2,
	"§ång ı/get_task",
	"Hñy bá/end_dialog"
	)
end
function get_task()
	--±¾ÖÜÊÇ·ñÒÑ¾­ÁìÈ¡¹ı¼ì²â
	if GetTask(get_task_reel_TaskID) == Zgc_pub_week_seq() then
		Talk(1,"","TuÇn nµy ng­¬i ®· nhËn nhiÖm vô phu thª, muèn ghi thªm nhiÒu vŞ trİ th× tuÇn l¹i ®Õn!")
		return
	end
	--Ğ¯´øÏËÔÆ·ÉĞÇÆ×¼ì²â
	if GetItemCount(2,1,583) == 0 then
		Talk(1,"","Xin x¸c nhËn cã mang theo <color=yellow>Khiªn V©n Phi Tinh phæ<color>!")
		return
	end
	--¸øÓèÈÎÎñ
	local ran_num = random(1,100)
	local task_num = 14
	if ran_num <= 30 then
		task_num = 21
	elseif ran_num <= 20 then
		task_num = 42
	end
	SetTask(Frag_att_num_TaskID,(GetTask(Frag_att_num_TaskID)+task_num))
	SetTask(get_task_reel_TaskID,Zgc_pub_week_seq())
	Talk(1,"","Ng­¬i ®· cã ®­îc"..task_num.." vŞ trİ L­u tinh, ta ®· ghi nã vµo trong <color=yellow>Khiªn V©n Phi Tinh phæ<color> cña ng­¬i . NhÊp vµo vËt phÈm nµy sÏ cã ®­îc täa ®é L­u tinh!")
end
--**************************Á÷ĞÇ²É¼¯ËµÃ÷************************
function get_att_info()
	Talk(3,"OnUse",
					"<color=yellow>NhiÖm vô phu thª<color> cã t¸c dông nhËn <color=yellow>b¶o vËt phu thª<color>, cã <color=yellow>hai b­íc<color> cã ®­îc b¶o vËt. <color=yellow>B­íc thø nhÊt:<color> nhËn m¶nh <color=yellow>L­u tinh<color> khu vùc ngoµi thµnh; <color=yellow>B­íc thø hai:<color> sö dông nh÷ng m¶nh nµy ®Ó <color=yellow>hîp thµnh b¶o vËt phu thª<color>.",
					"<color=yellow>Ngoµi thµnh<color> lu«n cã L­u tinh r¬i xuèng, nªn ng­¬i cã thÓ <color=yellow>sö dông Khiªn V©n Phi Tinh phæ<color> tra xem chç nµo cã m¶nh L­u tinh. <color=yellow>M¶nh<color> t×m ®­îc <color=yellow>ë mçi b¶n ®å<color> ®Òu kh¸c nhau, th«ng th­êng <color=green>b¶n ®å ®¼ng cÊp cµng cao, cµng t×m ®­îc m¶nh cao cÊp<color>.",
					"NhiÖm vô phu thª cÇn cã <color=yellow>tæ ®éi phu thª<color>, kh«ng cho ng­êi kh¸c vµo. Sau khi tæ ®éi, ng­êi sö dông Khiªn V©n Phi Tinh phæ ph¸t nhiÖm vô phu thª, <color=yellow>hai vî chång cã thÓ nhËn mçi ng­êi nöa ®iÓm täa ®é L­u tinh<color>. <color=red>Nam nhËn täa ®é X, n÷ nhËn täa ®é Y<color>. <color=yellow>Ng­êi sö dông Khiªn V©n Phi Tinh phæ<color> thùc hiÖn mét <color=yellow>®éng t¸c t×nh tø<color> t¹i täa ®é chØ ®Şnh, sÏ nhËn ®­îc <color=yellow>m¶nh L­u tinh<color>. Chó ı, khi <color=yellow>nhËn täa ®é m¶nh, ph¶i tæ ®éi phu thª vµ trong cïng mét khu vùc<color>, kh«ng cho ng­êi kh¸c vµo."
	)
end

--=========================================================================
function repair_marriage()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()
	local selTab = {
				"Ta biÕt råi, ta muèn söa/repair_marriage_confirm",
				"\nTa kh«ng cã vÊn ®Ò g×, kh«ng cÇn söa/end_dialog",
				}
	Say("<color=green>X¶o n÷<color>: Ng­¬i x¸c nhËn muèn söa vÊn ®Ò kÕt h«n? NÕu ng­¬i trong qu¸ tr×nh t¹o h«n ­íc gÆp ®­îc bµ mai ®èi tho¹i kh«ng h­ëng øng hoÆc do nguyªn nh©n kh¸c dÉn ®Õn b¹n kh«ng thÓ kÕt h«n, ng­¬i cã thÓ thö söa ë chç ta.<color=red>Chó ı: Sau khi söa vÊn ®Ò ph¶i giao l¹i sİnh lÔ vµ ®Æt s©n<color>",getn(selTab),selTab);
end;

function repair_marriage_confirm()
	if GetMateName() ~= "" then
		Talk(1,"","<color=green>X¶o n÷<color>: B¹n ®ang trong tr¹ng th¸i kÕt h«n, h·y t×m <color=yellow>NguyÖt l·o (Thóy Yªn 205,162)<color> ®Ó ly h«n, sau ®ã ®Õn söa vÊn ®Ò kÕt h«n cña b¹n.");
		return 0;
	end;
	local selTab = {
				"X¸c nhËn söa/repair_marriage_confirm_1",
				"\n§Ó ta suy nghÜ l¹i/end_dialog",
				}
	Say("<color=green>X¶o n÷<color>: B¹n thËt sù muèn söa vÊn ®Ò kÕt h«n?",getn(selTab),selTab);
end;

function repair_marriage_confirm_1()
	local szTaskInfo = "";
	for i=2000,2010 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
		SetTask(i,0);
	end;
	for i=2013,2019 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
		SetTask(i,0);
	end;
	WriteLog("[Söa]:"..GetName().."Thay ®æi biÕn l­îng, th«ng tin biÕn l­îng nhiÖm vô kÕt h«n tr­íc khi thay ®æi:"..szTaskInfo);
	Msg2Player("VÊn ®Ò kÕt h«n cña b¹n ®· söa xong, h·y thö l¹i xem");
	Say("<color=green>X¶o n÷<color>: VÊn ®Ò kÕt h«n cña b¹n ®· söa xong. Xin c¸o lçi v× g©y nh÷ng phiÒn phøc víi b¹n tr­íc ®©y ®ång thêi c¶m ¬n sù ñng hé cña b¹n ®èi víi c«ng viÖc cña t«i.",0);
end;
