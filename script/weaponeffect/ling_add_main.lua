--½Å±¾Ãû³Æ£ºÁéÆÇºÍÁéÄÜ¸½×Å¹«¹²½Å±¾
--½Å±¾¹¦ÄÜ£ºÁéÆÇºÍÁéÄÜ¹«¹²±äÁ¿ºÍº¯Êı¼¯ºÏ
--²ß»®ÈË£ºÍõÇ¿
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2008-1-12
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
	--×ÊÖÊÏà¹ØĞÅÏ¢
	Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı

	Sever_diff = 2		--1ÎªÊÕ·ÑÇø£¬2ÎªÃâ·ÑÇø
	Break_sky_get_sec_seq_TaskID = 1417
	Consume_get_sec_seq_TaskID = 1421
	Aptitue_cent_TasktempID = 196
	Aptitue_seq_save_1_TasktempID = 197
	Aptitue_seq_save_10_TasktempID = 198
	Weapon_index_save_TasktempID = 199
	--IBÏà¹ØĞÅÏ¢
	IB_cost_month_seq = 1418
	IB_cost_num = 1419
	Tb_aptitude_num = {{7},{250},{},{15000},{3},{15000},{0,79},{80,100},{},{10},{},{2000,200000},{101,150},}
	Tb_aptitude_info = {
		{"§é c­êng hãa vò khİ ®¹t "..Tb_aptitude_num[1][1],																"return weapon_level_chk()",		"ThiÕt Cèt, hµo quang xanh nh¹t (Linh ph¸ch cÊp 1)",	1,1,"§é c­êng hãa vò khİ ®¹t <color=yellow>"..Tb_aptitude_num[1][1].."<color>","ThiÕt Cèt",30},
		{"§¹i héi tû vâ H¹ng 2-10 l­u ph¸i",																													"return bw_seq_chk(2)",				"B¸ch chiÕn, s­¬ng mï ®á (Linh ph¸ch cÊp 2)",6,2,"§¹i héi tû vâ H¹ng <color=yellow>2-10<color>","B¸ch ChiÕn",7},
		{"å! Vò khİ Hoµng Kim lÊp l¸nh!",																															"return golden_weapon_chk()",	"Ch­íc NhËt, s­¬ng mï vµng (Linh ph¸ch cÊp 2)",	2,2," ®· trang bŞ <color=yellow>trang bŞ Hoµng Kim<color>","Ch­íc NhËt",30},
		{"§é cèng hiÕn ®¹t "..Tb_aptitude_num[4][1],													"return tech_offer_num_chk()",	"TuÊn DËt, s­¬ng mï lam (Linh ph¸ch cÊp 2)",	2,2,"§iÓm cèng hiÕn s­ m«n ®¹t ®Õn <color=yellow>"..Tb_aptitude_num[4][1].."<color>","TuÊn DËt",30},
		{"§¼ng cÊp s­ ®øc ta ®· ®¹t (v­ît) cÊp "..Tb_aptitude_num[5][1]..", ®Ó ta d¹y!",								"return teah_prentice_chk()",		"§µo Lı, s­¬ng mï lôc (Linh ph¸ch cÊp 2)",	2,2,"§¼ng cÊp s­ ®øc ®¹t cÊp <color=yellow>"..Tb_aptitude_num[5][1].."<color>","§µo Lı",30},
		{"Ta lµ danh nh©n, danh väng ®¹t ®Õn (v­ît) "..Tb_aptitude_num[6][1],																	"return repute_num_chk()",			"Danh Tóc, s­¬ng mï n©u (Linh ph¸ch cÊp 2)",	2,2,"Danh väng ®¹t ®Õn <color=yellow>"..Tb_aptitude_num[6][1].."<color> ®iÓm","Danh Tóc",30},
		{"Ta bËn lµ bé b¸t qu¸i Linh Khİ §o¹n thÊp ("..Tb_aptitude_num[7][1].."-"..Tb_aptitude_num[7][2]..")",			"return equipment_lin_chk(7) ",	"L¹c Hµ, s­¬ng mï tİm vµ hµo quang lam (Linh ph¸ch cÊp 2)",	2,1,"§· trang bŞ bé b¸t qu¸i Linh Khİ §o¹n thÊp","L¹c Hµ",30},
		{"Xem bé b¸t qu¸i Linh Khİ §o¹n trung ("..Tb_aptitude_num[8][1].."-"..Tb_aptitude_num[8][2]..")! Dïng rÊt tèt!","return equipment_lin_chk(8) ",	"L¨ng Tiªu, s­¬ng mï tİm vµ tia s¸ng lôc (Linh ph¸ch cÊp 2)",	2,2,"§· trang bŞ bé b¸t qu¸i Linh Khİ §o¹n trung (80-100)","L¨ng Tiªu",30},
		{"§¹i T­íng Qu©n ®­¬ng triÒu lµ t¹i h¹!",																															"return general_chk()",					"§o¹n Giao, ¸nh s¸ng ph¸t t¸n ®á (Linh ph¸ch cÊp 3)",	3,6,"Qu©n hµm chiÕn tr­êng lµ: <color=yellow>T­íng Qu©n<color> (gåm T­íng Qu©n vÜnh viÔn)","§o¹n Giao",30},
		{"Ta kinh nghiÖm ®Çy m×nh, b¶ng xÕp h¹ng thÕ giíi h¹ng "..Tb_aptitude_num[10][1].."!!",															"return player_rank_chk() ",			"C¸i ThÕ, ¸nh s¸ng ph¸t t¸n lam (Linh ph¸ch cÊp 3)",	3,4,"B¶ng xÕp h¹ng thÕ giíi h¹ng <color=yellow>"..Tb_aptitude_num[10][1].."<color>","C¸i ThÕ",30},
		{"To gan! ThÊy bæn Nguyªn So¸i cßn kh«ng quú xuèng?",																												"return marshal_chk()",					"Ph¸ Qu©n, ¸nh s¸ng tô héi tİm (Linh ph¸ch cÊp 4)",	4,8,"Qu©n hµm chiÕn tr­êng lµ: <color=yellow>Nguyªn So¸i<color> (gåm Nguyªn So¸i vÜnh viÔn)","Ph¸ Qu©n",30},
		{"§¹i héi tû vâ h¹ng 1 l­u ph¸i",																													"return bw_seq_chk(1)",				"Tinh Di, ¸ng s¸ng ph¸t t¸n tİm (Linh ph¸ch cÊp 3)",7,3,"§¹i héi tû vâ h¹ng <color=yellow>1<color> l­u ph¸i","Tinh Di",7},
		{"§¹o tr­ëng cã thÓ ch¹m nhÑ vµo bé b¸t qu¸i Linh Khİ §o¹n cao ("..Tb_aptitude_num[13][1].." trë lªn) cña ta",							"return equipment_lin_chk(13)",	"PhÇn V©n, s­¬ng mï tİm vµ tia s¸ng vµng (Linh ph¸ch cÊp 2)",2,3,"§· trang bŞ bé b¸t qu¸i Linh Khİ §o¹n (100) trë lªn","PhÇn V©n",30},
		{"",																																								"return consume_num_chk()",		"Hµo M«n, ¸nh s¸ng tô héi vµng (Linh ph¸ch cÊp 4)",	4,7,"","Hµo m«n",30},
	}
	if Sever_diff == 1 then
		Tb_aptitude_info[getn(Tb_aptitude_info)][1] = "§iÓm tİch lòy tiªu dïng cña ta ®· gãp rÊt nhiÒu!"
		Tb_aptitude_info[getn(Tb_aptitude_info)][6]  = "<color=yellow>2000<color> ®iÓm tİch lòy tiªu dïng"
	else
		Tb_aptitude_info[getn(Tb_aptitude_info)][1] = "§iÓm tİch lòy tiªu dïng cña ta ®· gãp rÊt nhiÒu!"
		Tb_aptitude_info[getn(Tb_aptitude_info)][6]  = "<color=yellow>20 v¹n<color> ®iÓm tİch lòy tiªu dïng"
	end
	Tb_ib_money = {"1 b¹c lÎ","1 Xu"}
	--º³ÌìĞÅÏ¢
	Break_sky_need_cent = 26
	--²ÄÁÏĞÅÏ¢
	Tb_add_mertiral = {
	{2,1,3330,"NhÊt ThiÓm Yªu Hoµng"},
	{2,1,3331,"Tam DiÖu Long Hi"},
	{2,1,3332,"§é NguyÖt ThÇn Sa"},
	{2,1,3333,"PhÇn Quang ThÇn Sa"},
	{2,1,3334,"Tr¶m Tinh ThÇn Sa"},
	{2,1,3204," Ngò Th¸i Lung Tóy"},
	{2,1,3205,"ThÊt HuyÒn TÒ V¨n"},
}
	--ÌØĞ§ÏûºÄĞÅÏ¢
	Tb_aptitude_cost_info = {
		{	--ÊÕ·Ñ
			{20,30,1},
			{50,35,1},
			{1000,30,2},
			{2000,50,6},
			{5000,20,7},
			{0,0,0},
			{0,0,0},
		},			
		{	--Ãâ·Ñ
			{30,30,1},
			{75,35,1},
			{1500,30,2},
			{3000,50,6},
			{7500,30,7},
			{0,0,0},
			{0,0,0},
		},			
	}
	--»Æ½ğÎäÆ÷ĞÅÏ¢
	Tb_golden_weapon_info = {
		{0,3,6001,"Ph¸ Yªn ®ao"},
		{0,5,6002,"Ph¸ Yªn c«n"},
		{0,8,6003,"Phï Yªn tr­îng"},
		{0,0,6004,"Hµm Yªn thñ"},
		{0,1,6005,"Tµng Yªn ch©m"},
		{0,2,6006,"Phi Yªn kiÕm"},
		{0,10,6007,"VËn Yªn cÇm"},
		{0,0,6008,"V©n Yªn thñ"},
		{0,5,6009,"L­u Yªn c«n"},
		{0,2,6010,"HuyÒn Yªn kiÕm"},
		{0,9,6011,"Vò Yªn bót"},
		{0,6,6012,"Hµ Tiªm Th­¬ng"},
		{0,4,6013,"Hµnh Yªn Cung"},
		{0,7,6014,"Träc Yªn nhÉn"},
		{0,11,6015,"Yªu Yªn tr¶o"},
		{0,3,8801,"Hiªn Viªn To¸i Vò §ao"},
		{0,5,8802,"Hiªn Viªn To¸i Vò C«n"},
		{0,8,8803,"Hiªn Viªn Cöu Nh­ Tr­îng"},
		{0,0,8804,"Hiªn Viªn H¹o Nhiªn Thñ"},
		{0,1,8805,"Hiªn Viªn ch©m v« h×nh"},
		{0,2,8806,"Hiªn Viªn Tö Tinh KiÕm"},
		{0,10,8807,"Hiªn Viªn Phông Hoµng CÇm"},
		{0,0,8808,"Hiªn Viªn Ngò Nh¹c Thñ"},
		{0,5,8809,"Hiªn Viªn Ph¸ Thiªn C«n"},
		{0,2,8810,"Hiªn Viªn Hång Qu©n KiÕm"},
		{0,9,8811,"Hiªn Viªn Sinh Tö Bót"},
		{0,6,8812,"Hiªn Viªn Ph¸ Qu©n Th­¬ng"},
		{0,4,8813,"Hiªn Viªn Khai Thiªn Cung"},
		{0,7,8814,"Hiªn Viªn ¢m D­¬ng NhÉn"},
		{0,11,8815,"Hiªn Viªn U Minh Tr¶o"},
		{0,3,2351,"Tö Quang B¸ V­¬ng §ao"},
		{0,5,2352,"Tö Quang B¸ V­¬ng C«n"},
		{0,8,2353,"Tö Quang Bå §Ò Tr­îng"},
		{0,0,2354,"Tö Quang Phôc Ma Thñ"},
		{0,1,2355,"Tö Quang L­u V©n Ch©m"},
		{0,2,2356,"Tö Quang HuyÒn Minh KiÕm"},
		{0,10,2357,"Tö Quang Tiªu T­¬ng CÇm"},
		{0,0,2358,"Tö Quang Gi¸ng Long Thñ"},
		{0,5,2359,"Tö Quang Hµnh V©n C«n"},
		{0,2,2360,"Tö Quang L­ìng Nghi KiÕm"},
		{0,9,2361,"Tö Quang §o¹n V¨n Bót"},
		{0,6,2362,"Tö Quang TrÊn Qu©n Th­¬ng"},
		{0,4,2363,"Tö Quang Xuyªn D­¬ng Cung"},
		{0,7,2364,"Tö Quan O¸n Linh NhÉn"},
		{0,11,2365,"Tö Quang V¹n §éc Tr¶o"},
    {0,3,241,"§¹t Ma Thñ Täa §Õ Thİch §ao"},
    {0,3,242,"§¹t Ma Thñ Täa §Õ Thİch §ao"},
    {0,5,241,"§¹t Ma Thñ Täa §Õ Thİch C«n"},
    {0,5,242,"§¹t Ma Thñ Täa §Õ Thİch C«n"},
    {0,8,341,"Tµng Kinh Thñ To¹ HuyÒn Tr­îng"},
    {0,8,342,"Tµng Kinh Thñ To¹ HuyÒn Tr­îng"},
    {0,0,441,"La H¸n Thñ To¹ Chİnh Gi¸c Thñ"},
    {0,0,442,"La H¸n Thñ To¹ Chİnh Gi¸c Thñ"},
    {0,1,641,"Thiªn Thñ ThÇn VÖ TiÒm Èn Ch©m"},
    {0,1,642,"Thiªn Thñ ThÇn VÖ TiÒm Èn Ch©m"},
    {0,1,643,"Thiªn Thñ ThÇn VÖ TiÒm Èn Ch©m"},
    {0,1,644,"Thiªn Thñ ThÇn VÖ TiÒm Èn Ch©m"},
    {0,2,841,"Kim Quang Th¸nh N÷ PhËt LÖ KiÕm"},
    {0,2,842,"Kim Quang Th¸nh N÷ PhËt LÖ KiÕm"},
    {0,10,941,"Thiªn ¢m Th¸nh N÷ PhËt VËn CÇm"},
    {0,10,942,"Thiªn ¢m Th¸nh N÷ PhËt VËn CÇm"},
    {0,0,1141,"ChÊp Ph¸p Phï T«n Thñ"},
    {0,0,1142,"ChÊp Ph¸p Phï T«n Thñ"},
    {0,0,1143,"ChÊp Ph¸p Phï T«n Thñ"},
    {0,0,1144,"ChÊp Ph¸p Phï T«n Thñ"},
    {0,5,1241,"Ch­ëng Bæng Long Chóng C«n"},
    {0,5,1242,"Ch­ëng Bæng Long Chóng C«n"},
    {0,5,1243,"Ch­ëng Bæng Long Chóng C«n"},
    {0,5,1244,"Ch­ëng Bæng Long Chóng C«n"},
    {0,2,1441,"Th­îng Thanh ThÇn Kh«ng KiÕm"},
    {0,2,1442,"Th­îng Thanh ThÇn Kh«ng KiÕm"},
    {0,2,1443,"Th­îng Thanh ThÇn Kh«ng KiÕm"},
    {0,2,1444,"Th­îng Thanh ThÇn Kh«ng KiÕm"},
    {0,9,1541,"Tö Tiªu Ngù Kh«ng Bót"},
    {0,9,1542,"Tö Tiªu Ngù Kh«ng Bót"},
    {0,9,1543,"Tö Tiªu Ngù Kh«ng Bót"},
    {0,9,1544,"Tö Tiªu Ngù Kh«ng Bót"},
    {0,6,1741,"TrÊn Qu©n V« Song Th­¬ng"},
    {0,6,1742,"TrÊn Qu©n V« Song Th­¬ng"},
    {0,6,1743,"TrÊn Qu©n V« Song Th­¬ng"},
    {0,6,1744,"TrÊn Qu©n V« Song Th­¬ng"},
    {0,4,1841,"Chinh Lç B¸ Gi¶ Cung"},
    {0,4,1842,"Chinh Lç B¸ Gi¶ Cung"},
    {0,4,1843,"Chinh Lç B¸ Gi¶ Cung"},
    {0,4,1844,"Chinh Lç B¸ Gi¶ Cung"},
    {0,7,2041,"Diªm La T«n Gi¶ Ma Hån NhÉn"},
    {0,7,2042,"Diªm La T«n Gi¶ Ma Hån NhÉn"},
    {0,7,2043,"Diªm La T«n Gi¶ Ma Hån NhÉn"},
    {0,7,2044,"Diªm La T«n Gi¶ Ma Hån NhÉn"},
    {0,11,2141,"Cæ §éc T«n Gi¶ PhÖ Thiªn Tr¶o"},	
    {0,11,2142,"Cæ §éc T«n Gi¶ PhÖ Thiªn Tr¶o"},	
    {0,11,2143,"Cæ §éc T«n Gi¶ PhÖ Thiªn Tr¶o"},	
    {0,11,2144,"Cæ §éc T«n Gi¶ PhÖ Thiªn Tr¶o"},			
		{0,3,8851,"Tö Quang To¸i Vò §ao"},
		{0,5,8852,"Tö Quang To¸i Vò C«n"},
		{0,8,8853,"Tö Quang Cöu Nh­ Tr­îng"},
		{0,0,8854,"Tö Quang H¹o Nhiªn Thñ"},
		{0,1,8855,"Tö Quang V« H×nh Ch©m"},
		{0,2,8856,"Tö Quang Tö Tinh KiÕm"},
		{0,10,8857,"Tö Quang Phông Hoµng CÇm"},	
		{0,0,8858,"Tö Quang Ngò Nh¹c Thñ"},
		{0,5,8859,"Tö Quang Ph¸ Thiªn C«n"},
		{0,2,8860,"Tö Quang Hång Qu©n KiÕm"},
		{0,9,8861,"Tö Quang Sinh Tö Bót"},
		{0,6,8862,"Tö Quang Ph¸ Qu©n Th­¬ng"},
		{0,4,8863,"Tö Quang Khai Thiªn Cung"},
		{0,7,8864,"Tö Quang ¢m D­¬ng NhÉn"},
		{0,11,8865,"Tö Quang U Minh Tr¶o"}	
	}
	
	Npc_name = "<color=green>Long Quang Ch©n Nh©n<color>: "
--Á÷ÅÉÓëÁéÄÜµÄ¶ÔÓ¦ĞÅÏ¢
	Tb_route_point_info = {}
	Tb_route_point_info[2]={3,2}
	Tb_route_point_info[3]={6,2}
	Tb_route_point_info[4]={6,4}
	Tb_route_point_info[14]={6,5}
	Tb_route_point_info[15]={5,4}
	Tb_route_point_info[8]={2,6}
	Tb_route_point_info[9]={6,4}
	Tb_route_point_info[12]={4,5}
	Tb_route_point_info[11]={3,2}
	Tb_route_point_info[17]={3,2}
	Tb_route_point_info[18]={4,3}
	Tb_route_point_info[20]={4,3}
	Tb_route_point_info[21]={5,6}
	Tb_route_point_info[6]={4,3}
	Tb_point_name = {"","G©n cèt","Søc m¹nh","Th©n ph¸p","Linh ho¹t","Néi c«ng ",}
--ÁéÄÜÏûºÄ±í
	Tb_blity_cost_name =  {
			{	
				{"Xu"},
				{"Tinh luyÖn B¨ng Th¹ch",2,1,533},
				{"V« NgÊn Thñy",2,1,503},
				{"N÷ Oa Tinh Th¹ch",2,1,504},
			},
			{	
				{"Bµn Long bİch",2,1,1000},
				{"ThÕ Th©n phï",2,0,556},
				{"V« NgÊn Thñy",2,1,503},
				{"Hßa ThŞ Bİch",2,1,1001},
			},
	}
	Tb_ability_cost_num = {
		{
			{20,30,50},
			{100,150,150},
			{300,450,300},
			{450,650,500},
			{700,1000,600},
			{35,20,50},
			{150,150,100},
		},
		{
			{20,30,50},
			{100,150,150},
			{300,450,300},
			{450,650,500},
			{700,1000,600},
			{35,60,60},
			{150,150,100},
		}
	}
	--¸½×ÅÄ§·¨ÊôĞÔµÄÏûºÄ
	Tb_ability_magic_goods_cost_num = {
	{	{},{},
		{9,18,27,36,45,0,0},
		{4,8,12,16,20,0,0},
		{4,8,12,16,20,0,0},
	}, 
	{	{},{},
		{9,18,27,36,45,0,0},
		{5,10,15,20,25,0,0},
		{4,8,12,16,20,0,0}, 
	}
	}
--ÁéÄÜÊıÖµĞÅÏ¢
Tb_lin_ability_info = {
	{"T¨ng ®iÓm sinh lùc",500,500},
	{"T¨ng ®iÓm toµn thuéc tİnh",3,3},
	{"T¨ng ®iÓm thuéc tİnh l­u ph¸i",6,6},
}
------------------------------------------×ÊÖÊÅĞ¶Ïº¯Êı¼¯ºÏ-------------------------------------
--ÎäÆ÷Ç¿»¯7
function weapon_level_chk()
	--ÎäÆ÷Ç¿»¯µÈ¼¶ÅĞ¶Ï
	local weapon_index = GetPlayerEquipIndex(2)
	local equip_level = GetEquipAttr(weapon_index,2)
	if equip_level >= Tb_aptitude_num[1][1] then
		return 1
	else
		return 0
	end
end
--ÇĞ´è»ı·Ö(µ±Ç°Ã»ÓĞ¿ª£¬ÔİÊ±ÏĞÖÃ)
function bw_seq_chk(chk_flag)
	local week_seq,bw_seq_diff,bw_seq = GetPlayerBwRank()
	if chk_flag == 1 and bw_seq == 1 then
		return 1
	elseif chk_flag == 2 and (bw_seq >=2 and bw_seq <= 10) then
		return 1
	else
		return 0
	end		
end
--»Æ½ğÎäÆ÷
function golden_weapon_chk()
	--ÎäÆ÷ID»ñÈ¡
	local weapon_id_1st,weapon_id_2nd,weapon_3rd = GetPlayerEquipInfo(2)
	local golden_weapon_chk_flag = 0
	for i = 1, getn(Tb_golden_weapon_info) do
		if Tb_golden_weapon_info[i][1] == weapon_id_1st and Tb_golden_weapon_info[i][2] == weapon_id_2nd and Tb_golden_weapon_info[i][3] == weapon_3rd then
			golden_weapon_chk_flag = 1
		end
	end
	if golden_weapon_chk_flag == 0 then
		return 0
	else
		return 1
	end
end
--Ê¦ÃÅ¹±Ï×¶È
function tech_offer_num_chk()
	local tech_num = GetTask(336)
	if tech_num >= Tb_aptitude_num[4][1] then
		return 1
	else
		return 0
	end
end
--Ê¦µÂµÈ¼¶
function teah_prentice_chk()
	local table_temp = GetMPBaseInfo()
	if table_temp["moral"] >= (Tb_aptitude_num[5][1] * 100)then
		return 1
	else
		return 0
	end
end
--ÉùÍû
function repute_num_chk()
	if GetReputation() >= Tb_aptitude_num[6][1] then
		return 1
	else
		return 0
	end
end
--°ËØÔÌ×
function equipment_lin_chk(aptitue_seq)
	local weapon_index = GetPlayerEquipIndex(2)
	--ÊÇ·ñÊÇ°ËØÔÌ×
	if IsSlaveItem(weapon_index) ~= 1 then
		return 0
	end
	--ÁéÆøÖµ(Æ½¾ùÖµ)ÊÇ·ñ´ïµ½ÒªÇó
	local lin_num_cout = 0
	for i = 0,3 do
		lin_num_cout = lin_num_cout + GetItemMaxLingQi(GetPlayerEquipIndex(i))
	end
	local lin_num_average = lin_num_cout/4
	if lin_num_average >= Tb_aptitude_num[aptitue_seq][1] and lin_num_average <= Tb_aptitude_num[aptitue_seq][2] then
		return 1
	else
		return 0
	end
end
--½«¾üÅĞ¶Ï
function general_chk()
	if abs(GetTask(704)) == 5 or (GetTask(766) +GetTask(765)) >= 10 then
		return 1
	else
		return 0
	end
end
--ÔªË§ÅĞ¶Ï
function marshal_chk()
	if abs(GetTask(704)) == 6 or GetTask(765) >= 15 then
		return 1
	else
		return 0
	end
end
--µÈ¼¶ÅÅÃûÅĞ¶Ï
function player_rank_chk()
	local player_rank_seq = GetPlayerWorldRank(PlayerIndex)
	if player_rank_seq == nil then
		return 0
	end
	if player_rank_seq >= 1 and player_rank_seq <= Tb_aptitude_num[10][1] then
		return 1
	else
		return 0
	end
end
--Ïû·Ñ»ı·Ö£¨Ã÷Ìì×ö£©
function consume_num_chk()
	--local month_seq_saved = GetTask(IB_cost_month_seq)
	--local month_seq_now = tonumber(date("%Y%m"))
	--if month_seq_now > month_seq_saved then
	--	SetTask(month_seq_saved,month_seq_now)
	--	SetTask(IB_cost_num,0)
	--	return 0
	--elseif month_seq_now < month_seq_saved then
	--	return 0
	--else
		if GetTask(IB_cost_num) >= Tb_aptitude_num[12][Sever_diff] then
			return 1
		end
	--end
end
--ÎäÆ÷¸ü»»¼ì²â
function weapon_cha_chk()
	local weapon_index = GetPlayerEquipIndex(2)
	local weapon_index_saved = GetTaskTemp(Weapon_index_save_TasktempID)
	--ÎäÆ÷×°±¸ÅĞ¶Ï
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H·y trang bŞ vò khİ tr­íc råi ®Õn t×m ta!")
		return 0
	end
	--ÎäÆ÷Åä¶Ô¼ì²â
	if weapon_index_saved ~= weapon_index then
		Talk(1,"",Npc_name..Zgc_pub_sex_name().."§éng t¸c ®æi vò khİ nhanh l¾m, nh­ng kh«ng qua ®­îc m¾t l·o phu!")
		return 0
	end
	return 1
end
