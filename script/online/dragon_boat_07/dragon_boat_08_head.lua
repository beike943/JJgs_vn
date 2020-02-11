--ÎÄ¼şÃû³Æ£º2008¶ËÎç½ÚÍ·ÎÄ¼ş
--ÎÄ¼ş¹¦ÄÜ£º¶ËÎç½ÚµÄÏà¹Ø¹«¹²±äÁ¿ºÍº¯Êı
--¹¦ÄÜ²ß»®£º00
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2008-05-14
--ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")

-----------------¹«¹²±äÁ¿Çø
--·şÎñÆ÷Çø·Ö:1¡¢ÎªÊÕ·Ñ·ş£¬2¡¢ÎªÃâ·Ñ·ş
Sever_diff = 2
--»î¶¯¿ªÆô¡¢¹Ø±ÕÊ±¼ä
dragon_boat_08_start_time = 2008060423
dragon_boat_08_end_time = 2008061001
--ôÕ×ÓÊ¹ÓÃÏŞÖÆÏà¹ØµÄĞÅÏ¢
TaskID_aixiang_use_date_seq = 1294
TaskID_aixiang_use_num = 1295
Aixiang_use_num_day = 5
TaskID_baiyu_use_num = 1296
Baiyu_use_num_max = 15
TaskID_yupin_use_num = 1297
Yupin_use_num_max = 5
--ÖÆ×÷ÊıÁ¿µÄÁÙÊ±±äÁ¿
chg_mertiral_TaskTempID = 168
TaskID_suit_prize = 1400 --Íâ×°½±ÀøÁìÈ¡Çé¿ö
TaskID_exp_get_date_seq = 1298 --½±ÀøÁìÈ¡ÈÕÆÚĞòÊı
TaskID_exp_get_times = 1299 --½±ÀøÁìÈ¡´ÎÊı
Tb_zongzi_use_num = {
	{"B¸nh İt B¹ch Ngäc",TaskID_baiyu_use_num,Baiyu_use_num_max},
	{"B¸nh İt Ngù PhÈm",TaskID_yupin_use_num,Yupin_use_num_max},
}
--°¬ÏãôÕ×ÓĞÅÏ¢£¨ÊÕ·ÑºÍÃâ·Ñ²»Í¬£©
Tb_zongzi_08_aixiang = {"50 v¹n ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm",	"NhËn ®­îc 100000 ®iÓm kinh nghiÖm",}
Tb_zongzi_aixong_exp_num = {500000,100000}
Tb_zongzi_08_yupin = {"§æi 1 Viªm Hoµng ThiÕt Hån hoÆc 12 viªn Linh th¹ch cÊp 7","§æi 1 Viªm Hoµng ThiÕt Hån hoÆc 12 viªn Linh th¹ch cÊp 7 hoÆc B¸ch tèc h¾c b¹ch m·"}
--ôÕ×ÓĞÅÏ¢
Tb_zongzi_08 = {
	--Ãû³Æ-ID×îºóÒ»Î»-ºÏ³É³É¹¦ÂÊ-Íâ×°¼¸ÂÊ-ºÏ³É²ÄÁÏ-ôÕ×ÓÃèÊö-¶ÔÓ¦½±ÀøÃèÊö-Ê¹ÓÃ¶ÔÓ¦º¯Êı--ÊÇ·ñÖ±½ÓÊ¹ÓÃ--Ê¹ÓÃÀäÈ´Ê±¼ä
	{"B¸nh İt g¹o th¬m",3359,100,	5,		{{3370,1,"§Ëu ®á"},	{3371,1,"G¹o tr¾ng"},			{3369,1,"L¸ gãi b¸nh"},},"Trong vßng 3 phót ngo¹i c«ng t¨ng 5%, s¸t th­¬ng t¨ng 30",						"zongzi_xiangmi",	1,	(3*60*18)},
	{"b¸nh İt ng¶i h­¬ng",1123,100,	10,	{{3359,1,"B¸nh İt g¹o th¬m"},	{3372,1,"L¸ ng¶i"},			{3369,1,"L¸ gãi b¸nh"},},"PhÇn th­ëng 10 v¹n*b×nh ph­¬ng ®¼ng cÊp/6400 ®iÓm kinh nghiÖm",				"zongzi_aixiang",0,	0},
	{"B¸nh İt h¹t dÎ",3360,100,	20,	{{1123,1,"b¸nh İt ng¶i h­¬ng"},	{3374,1,"H¹t dÎ"},			{3369,1,"L¸ gãi b¸nh"},},"NgÉu nhiªn nhËn ®­îc 1 vĞ th¸m hiÓm T©y Vùc (4-6 ¶i)",	"zongzi_lizi",			0,	0},
	{"B¸nh İt ngò h­¬ng",3361,100,	30,	{{3360,1,"B¸nh İt h¹t dÎ"},	{3373,1,"J¨m b«ng"},			{3369,1,"L¸ gãi b¸nh"},},"Trong vßng 10 phót, sinh lùc t¨ng 30%",							"zongzi_wuxiang",	1,	(10*60*18)},
	{"B¸nh İt PhØ Thóy",3362,50,		50,	{{3361,1,"B¸nh İt ngò h­¬ng"},	{3365,1,"PhØ Thóy"},					{3369,1,"L¸ gãi b¸nh"},},"Trong vßng 3 phót, tÊt c¶ n¨ng lùc t¨ng 20%",					"zongzi_feicui",		1,	(3*60*18)},
	{"B¸nh İt PhØ Thóy",3362,100,	100,	{{3361,1,"B¸nh İt ngò h­¬ng"},	{3365,3,"PhØ Thóy"},					{3369,1,"L¸ gãi b¸nh"},},"Trong vßng 3 phót, tÊt c¶ n¨ng lùc t¨ng 20%",					"zongzi_feicui",		1,	(3*60*18)},
	{"B¸nh İt B¹ch Ngäc",3363,25,		100,	{{3362,1,"B¸nh İt PhØ Thóy"},	{3366,1,"B¹ch Ngäc"},					{3369,1,"L¸ gãi b¸nh"},},"NgÉu nhiªn ®æi 2 viªn Linh th¹ch cÊp 7 hoÆc 1 Tµng KiÕm Hoµng Kim trang",	"zongzi_baiyu",		0,	0},
	{"B¸nh İt B¹ch Ngäc",3363,100,	500,	{{3362,1,"B¸nh İt PhØ Thóy"},	{3366,5,"B¹ch Ngäc"},					{3369,1,"L¸ gãi b¸nh"},},"NgÉu nhiªn ®æi 2 viªn Linh th¹ch cÊp 7 hoÆc 1 Tµng KiÕm Hoµng Kim trang",	"zongzi_baiyu",		0,	0},
	{"B¸nh İt Ngù PhÈm",3364,26,		500,	{{3363,1,"B¸nh İt B¹ch Ngäc"},	{3367,1,"M¶nh bİ ph­¬ng ngù chÕ"},	{3369,1,"L¸ gãi b¸nh"},},Tb_zongzi_08_yupin[Sever_diff],						"zongzi_yupin",		0,	0},
	{"B¸nh İt Ngù PhÈm",3364,100,	1000,	{{3363,1,"B¸nh İt B¹ch Ngäc"},	{3367,9,"M¶nh bİ ph­¬ng ngù chÕ"},	{3369,1,"L¸ gãi b¸nh"},},Tb_zongzi_08_yupin[Sever_diff],					"zongzi_yupin",		0,	0},
}
--ÃÅÆ±ĞÅÏ¢
Tb_nw_tickets = {
	{40,2,0,1034,"Tİch D­¬ng Tinh Hoa"},
	{80,2,0,1035,"Ngò Hµnh Kú Phiªn"},
	{100,2,0,1036,"La bµn"},
}
--°×ÓñôÕ×Ó½±ÀøĞÅÏ¢
Tb_baiyu_prize = {
	{5,
		{
			{0,103,95},
			{0,103,96},
			{0,103,97},
			{0,103,98},   
		},
	"Tµng KiÕm Tö Kim m·o"
	},
	{10, 
		{
			{0,100,95},
			{0,100,96},
			{0,100,97},
			{0,100,98},
		},
	"Kim Lò Th­êng"
	},
	{15,
		{
			{0,101,95},
			{0,101,96},
			{0,101,97},
			{0,101,98},   
		},
	"Tµng KiÕm ¤ kim phôc"
	},
	{16,{0,102,38},"Tµng KiÕm B¶o Ch©u"},
	{17,{0,102,39},"Tµng KiÕm Kú Th¹ch"},
	{18,{0,102,40},"Tµng KiÕm Kim Ên"},
}
--ÓùÆ·ôÕ×Ó½±ÀøĞÅÏ¢
Tb_yupin_prize = {
	{2,1,1146,"Viªm Hoµng ThiÕt Hån"},
	{0,105,15,"Phiªn Vò (vÜnh viÔn)"},
	{0,105,19,"Siªu Quang (vÜnh viÔn)"},
	{"12 viªn Linh th¹ch cÊp 7"},
}
--Íâ×°ĞÅÏ¢
Tb_suit_prize = {
	{
		{"Nam B¸t B¸t ®Çu_tiªu chuÈn ",0,108,510},
		{"Nam B¸t B¸t ®Çu_kh«i ng«",0,108,511},
		{"N÷ B¸t B¸t ®Çu_gîi c¶m",0,108,513},
		{"N÷ B¸t B¸t ®Çu_kiÒu n÷",0,108,512},
	},
	{
		{"Nam B¸t B¸t y_tiªu chuÈn",0,109,510},
		{"Nam B¸t B¸t y_kh«i ng«",0,109,511},
		{"N÷ B¸t B¸t y_gîi c¶m",0,109,513},
		{"N÷ B¸t B¸t y_kiÒu n÷",0,109,512},
	},
	{
		{"Nam B¸t B¸t khè_tiªu chuÈn ",0,110,510},
		{"Nam B¸t B¸t khè_kh«i ng«",0,110,511},
		{"N÷ B¸t B¸t khè_gîi c¶m",0,110,513},
		{"N÷ B¸t B¸t khè_kiÒu n÷",0,110,512},
	},
}
----------------¹«¹²º¯ÊıÇø
function dragon_boat_08_time_chk()
	local date_time = tonumber(date("%Y%m%d%H"))
	if date_time < dragon_boat_08_start_time then
		return 0
	elseif date_time >= dragon_boat_08_start_time and date_time <= dragon_boat_08_end_time then
		return 1
	else
		return 2
	end
end
--ôÕ×ÓÊ¹ÓÃ
function OnUse(goods_index)
	--»ñÈ¡ôÕ×Ó¶ÔÓ¦ĞòºÅ
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i = 1,getn(Tb_zongzi_08) do
		if Tb_zongzi_08[i][2] == goods_id then
			goods_diff = i
			break
		end
	end
	--ĞòºÅºÏÀíĞÔ¼ì²â
	if goods_diff == 0 then
		return
	end
	--ÊÇ·ñÖ±½ÓÊ¹ÓÃ
	if Tb_zongzi_08[goods_diff][8] == 1 then
		SetItemUseLapse(goods_index,Tb_zongzi_08[goods_diff][9])
		dostring(Tb_zongzi_08[goods_diff][7].."("..goods_diff..")")
		return
	end
	--Ê¹ÓÃÈ·ÈÏ¶Ô»°Õ¹¿ª
	Say("<color=green>"..Tb_zongzi_08[goods_diff][1].."<color>: HiÖu qu¶ sö dông <color=yellow>"..Tb_zongzi_08[goods_diff][6].."<color>, b¹n x¸c nhËn muèn sö dông chø?",
	2,
	"§æi/#"..Tb_zongzi_08[goods_diff][7].."("..goods_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--ÏãÃ×ôÕ×ÓÊ¹ÓÃ
function zongzi_xiangmi(goods_diff)
	--Ğ¯´øÉ¾³ı¼à²â
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--Ğ§¹ûÔö¼Ó
	CastState("state_p_attack_percent_add",5,180*18,1,19801279)
	CastState("state_m_attack_percent_add",5,180*18,1,19801280)
	CastState("state_damage_point",30,180*18,1,19801281)
	Msg2Player("Chóc mõng b¹n sö dông ' "..Tb_zongzi_08[goods_diff][1]..", hiÖu qu¶ nhËn ®­îc:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--°¬ÏãôÕ×Ó
function zongzi_aixiang(goods_diff)
	--ôÕ×ÓĞ¯´ø¼à²â
	if zongzi_use_dtm(1,goods_diff) ~= 1 then
		return 0
	end
	--Ê¹ÓÃÊıÁ¿ÏŞÖÆ´¦Àí
	local date_seq_save = GetTask(TaskID_aixiang_use_date_seq)
	local use_num_save = GetTask(TaskID_aixiang_use_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--TaskID³õÊ¼»¯
	if date_seq_save == nil or date_seq_save < date_seq_now then
		SetTask(TaskID_aixiang_use_date_seq,date_seq_now)
		SetTask(TaskID_aixiang_use_num,0)
	else
		if (date_seq_save == date_seq_now and use_num_save >= Aixiang_use_num_day) or date_seq_save > date_seq_now then
			Talk(1,"","<color=green>Nh¾c nhë<color>: H«m nay b¹n ®· sö dông <color=yellow>b¸nh İt ng¶i h­¬ng<color> tèi ®a <color=red>"..Aixiang_use_num_day.."<color> lÇn, ngµy mai míi cã thÓ sö dông tiÕp!")
			return
		end
	end
	--if GetLevel() == 99 then
	--	laborday08_baoshi_prob()
	--else
		--Ê¹ÓÃôÕ×Ó³É¹¦
		if Sever_diff == 2 then
			--ôÕ×ÓÉ¾³ı¼à²â
			if zongzi_use_dtm(2,goods_diff) ~= 1 then
				return 0
			end
			ModifyExp(Tb_zongzi_aixong_exp_num[Sever_diff])
			Msg2Player("Chóc mõng b¹n ®· dïng 1 'B¸nh İt ng¶i h­¬ng', nhËn ®­îc "..Tb_zongzi_aixong_exp_num[Sever_diff].." ®iÓm kinh nghiÖm!")
		else
			local golden_exp = GetGoldenExp()
			if  golden_exp <= 0 then
				Talk(1,"","<color=yellow>Nh¾c nhë<color>: §iÓm søc kháe hiÖn giê cña b¹n lµ <color=red>0<color>, kh«ng thÓ dïng <color=yellow>B¸nh İt ng¶i h­¬ng<color>!")
				return
			else	
				if golden_exp >= Tb_zongzi_aixong_exp_num[Sever_diff] then
					aixiang_exp_chg(goods_diff)
				else
					Say("<color=yellow>Nh¾c nhë<color>: <color=yellow>B¸nh İt ng¶i h­¬ng<color> cã thÓ chuyÓn <color=yellow>"..Tb_zongzi_aixong_exp_num[Sever_diff].."<color> ®iÓm søc kháe thµnh kinh nghiÖm, ®iÓm søc kháe hiÖn giê cña b¹n lµ <color=yellow>"..golden_exp.."<color>, b¹n x¸c nhËn muèn sö dông chø?",
						2,
						"§æi/#aixiang_exp_chg("..goods_diff..")",
						"§Ó ta suy nghÜ l¹i/end_dialog"
					)
				end
			end
		end
--	end
end
--Àõ×ÓôÕ×Ó
function zongzi_lizi(goods_diff)
	--¿Õ¼ä¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--Ğ¯´øÉ¾³ı¼à²â
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	local ran_num = random(1,100)
	for i = 1,getn(Tb_nw_tickets) do
		if ran_num <= Tb_nw_tickets[i][1] then
			local add_flag = AddItem(Tb_nw_tickets[i][2],Tb_nw_tickets[i][3],Tb_nw_tickets[i][4],1)
			if add_flag == 1 then
				Msg2Player("Chóc mõng b¹n ®· dïng 'B¸nh İt h¹t dÎ' ®æi 1 vĞ vµo 'Cöa ¶i T©y B¾c' sè"..(i+3).." : "..Tb_nw_tickets[i][5].."!")
			else
				WriteLog("[TÕt §oan Ngä 08] ng­êi ch¬i	"..GetName().."	T¨ng"..Tb_nw_tickets[i][5].." thÊt b¹i, kı hiÖu:"..add_flag)
			end
			break
		end
	end
end
--ÎåÏãôÕ×Ó
function zongzi_wuxiang(goods_diff)
	--Ğ¯´øÉ¾³ı¼à²â
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--Ğ§¹ûÔö¼Ó
	CastState("state_life_max_percent_add",30,600*18,1,9901,1)
	Msg2Player("Chóc mõng b¹n sö dông ' "..Tb_zongzi_08[goods_diff][1]..", hiÖu qu¶ nhËn ®­îc:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--ôä´äôÕ×Ó
function zongzi_feicui(goods_diff)
	--Ğ¯´øÉ¾³ı¼à²â
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--Ğ§¹ûÔö¼Ó
	CastState("state_strength_add_percent",20,300*18,1,9902,1)
	CastState("state_vitality_add_percent",20,300*18,1,9903,1)
	CastState("state_energy_add_percent",20,300*18,1,9904,1)
	CastState("state_observe_add_percent",20,300*18,1,9905,1)
	CastState("state_dexterity_add_percent",20,300*18,1,9906,1)
	Msg2Player("Chóc mõng b¹n sö dông ' "..Tb_zongzi_08[goods_diff][1]..", hiÖu qu¶ nhËn ®­îc:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--½¡¿µ¾­Ñé×ª¾­Ñé
function aixiang_exp_chg(goods_diff)
	--ôÕ×ÓÉ¾³ı¼à²â
	if zongzi_use_dtm(2,goods_diff) ~= 1 then
		return 0
	end
	local num_chg = min(GetGoldenExp(),Tb_zongzi_aixong_exp_num[Sever_diff])
	ModifyGoldenExp(-num_chg)
	ModifyExp(num_chg)
	local use_num_save = GetTask(TaskID_aixiang_use_num)
	SetTask(TaskID_aixiang_use_num,(use_num_save+1))
	Talk(1,"","<color=green>Nh¾c nhë<color>: Chóc mõng  b¹n ®· dïng 1 '<color=yellow>B¸nh İt ng¶i h­¬ng<color>', ®æi <color=yellow>"..num_chg.."<color> ®iÓm søc kháe thµnh kinh nghiÖm! §©y lµ lÇn thø <color=yellow>"..(use_num_save+1).."<color> dïng <color=yellow>B¸nh İt ng¶i h­¬ng<color>, h«m nay b¹n cßn cã thÓ sö dông <color=yellow>"..(Aixiang_use_num_day - (use_num_save+1)).."<color> lÇn!")
end
--±¦Ê¯¸ÅÂÊÔö¼ÓÁéÊ¯
function laborday08_baoshi_prob()
	local player_name = GetName()
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch CÊp 1, nã trong Tô linh ®Ønh.")
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 2, ®· nhËp vµo Tô linh ®Ønh.");
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc1 Linh Th¹ch cÊp 3, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 4, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 5, ®· nhËp vµo Tô linh ®Ønh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 6, ®· nhËp vµo Tô linh ®Ønh.");
		Msg2Global("Ng­êi ch¬i"..player_name.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 6 trong ho¹t ®éng TÕt §oan Ngä");
		WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..player_name.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 6 trong ho¹t ®éng TÕt §oan Ngä.");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh Th¹ch cÊp 7, ®· nhËp vµo Tô linh ®Ønh.");		
		Msg2Global("Ng­êi ch¬i"..player_name.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 7 trong ho¹t ®éng TÕt §oan Ngä");
		WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..player_name.."NhËn ®­îc 1 viªn Linh th¹ch cÊp 7 trong ho¹t ®éng TÕt §oan Ngä.");
	end
end

