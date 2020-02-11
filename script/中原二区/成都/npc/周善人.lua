--½Å±¾Ãû³Æ£ºÖÜÉÆÈË.lua
--½Å±¾¹¦ÄÜ£ºÖÜÉÆÈË¶Ô»°½Å±¾¡£ÒÔÇ°°üº¬êâÔÖÈÎÎñµÄ¹¦ÄÜ£¬ÏÖÔÚ¼ÓÉÏ°ï»á¹¥³ÇÕ½_ÍÆ¼öĞÅÈÎÎñµÄ¹¦ÄÜ
--²ß»®ÈË£ººî¶Ü
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007Äê3ÔÂ30ºÅ
--´úÂëĞŞ¸Ä¼ÇÂ¼£º

Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\online\\abluemoon\\abluemoon_item2exp.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\lib\\writelog.lua");
temp_taskID_merterial_count = 166
temp_taskID_merterial_count_conf = 167
File_name = "\\script\\ÖĞÔ­¶şÇø\\³É¶¼\\npc\\ÖÜÉÆÈË.lua"

function main ()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==1) then

		task_003();
		return

	elseif (nTaskValue==2) then

		if (GetTask(EM_MANTALK_01)==1) and (GetTask(EM_MANTALK_02)==1) and (GetTask(EM_MANTALK_03)==1) and (GetTask(EM_MANTALK_04)==1) then
			task_008();
			return
		else
			Talk(1,"","Ta muèn ph¸t tiÒn ®Ó cøu tÕ nh­ng bän gia nh©n th× bËn gióp nÊu ch¸o. PhiÒn c« n­¬ng ®Õn th«ng b¸o cho N¹n d©n biÕt, b¶o hä ®Õn nhËn cøu tÕ.");
			return
		end
	elseif (nTaskValue==4) then

		task_011();
		return

	end


	UWorld1506 = GetTask(1506)
	if ( UWorld1506 == 0 and  GetLevel() > 1 )  then
		Say("GÇn ®©y Thµnh §« phñ sao l¹i cã nhiÒu n¹n d©n, nh×n hä thËt ®¸ng th­¬ng! Ta quyÕt ®Şnh ph¸t tiÒn cøu tÕ, kh«ng biÕt b»ng h÷u cã thÓ gióp ®ì?",2,"§ång ı/yes1506","Ta cßn chót viÖc/no1506")
	elseif ( UWorld1506  == 5 )  then
		Talk(1,"","Nhê b»ng h÷u chuyÓn tin gÊp, cøu ng­êi nh­ cøu háa.")
	elseif ( UWorld1506  == 9 )  then
		Talk(1,"","Ta thay mÆt n¹n d©n ®a t¹ b»ng h÷u! §©y lµ mét chót lÔ män.")
		SetTask(1506,10)
		--AddItem(2,1,1,1)
		Earn(200)
		ModifyExp(150)
		ModifyReputation(3,0)
		--AddNote("°ïÖÜÉÆÈË¾È¼ÃÄÑÃñµÄÈÎÎñÍê³É")
		TaskTip("Hoµn thµnh nhiÖm vô gióp Chu ThiÖn Nh©n cøu tÕ n¹n d©n")
	else
--		Talk(1,"","<color=green>ÖÜÉÆÈË<color>£ºÎãÒÔ¶ñĞ¡¶øÎªÖ®£¬ÎãÒÔÉÆĞ¡¶ø²»Îª¡£")
--		item_to_exp()  --ÓÃÁ¸Ê³»»¾­Ñé
		confwar_task_goods_main()		-- ´óËÎĞèÒªÄã
	end
end;

function yes1506()
	Talk(1,"","Ta muèn ph¸t tiÒn ®Ó cøu tÕ nh­ng bän gia nh©n th× bËn gióp nÊu ch¸o. PhiÒn b»ng h÷u ®Õn th«ng b¸o cho N¹n d©n ë cæng thµnh biÕt, b¶o hä ®Õn nhËn cøu tÕ.")
	Talk(1,"","T¹i h¹ nghÜ nªn gãp chót søc män.")
	SetTask(1506,5)
	--AddNote("½Óµ½°ïÖÜÉÆÈËêâ¼ÃÄÑÃñµÄÈÎÎñ¡£")
	TaskTip("NhËn nhiÖm vô gióp Chu ThiÖn Nh©n cøu tÕ n¹n d©n")
end;
function no1506()
	Talk(1,"","NÕu b»ng h÷u ®· thÊy khã th× còng kh«ng nªn lµm khã ng­êi kh¸c! ")
--	item_to_exp()  --ÓÃÁ¸Ê³»»¾­Ñé
end;
--============================´å³¤2007Äê3ÔÂ30ÈÕ¼ÓÈë°ï»á¹¥³ÇÕ½_ÍÆ¼öĞÅÈÎÎñÏà¹Ø=====================
tb_life_merterial = {}		--¿ÉÒÔÉÏ½»µÄ²ÄÁÏÁĞ±í
tb_life_merterial[1] = {
	{"X¹ h­¬ng",	1,	2,	4,	1.0},
	{"Xuyªn s¬n gi¸p",	1,	2,	11,	0.9},
	{"§iÒn thÊt",	1,	2,	10,	0.8},
	{"X¸c ve",	1,	2,	9,	0.8},
	{"Hoµng liªn",	1,	2,	3,	0.5},
	{"C¸t C¸nh",	1,	2,	2,	0.5},
	{"Tµng Hång Hoa",	1,	2,	1,	0.5},
	{"Ba ®Ëu",	1,	2,	8,	0.5}
}
tb_life_merterial[2] = {
	{"Du long tóc",	1,	3,	16,	1.5},
	{"ThuÇn hßa m¹ch",	1,	3,	15,	1.3},
	{"Diªn Tinh m¹ch",	1,	3,	14,	1.2},
	{"Mİa",	1,	3,	13,	1.2},
	{"Hå tiªu",	1,	3,	22,	0.8},
	{"Dung tr¹ch cèc",	1,	3,	12,	0.8},
	{"M¨ng",	1,	3,	21,	0.8},
	{"NhiÔu minh ®Ëu",	1,	3,	11,	0.8},
	{"Th¹ch khuÈn",	1,	3,	20,	0.8},
	{"Khuynh ly ®Ëu",	1,	3,	10,	0.8},
	{"Méc nhÜ",	1,	3,	19,	0.8},
	{"Quang Th«ng Ma",	1,	3,	9,	0.8}
}
tb_life_merterial[3] = {
	{"H¾c « th¹ch",	2,	2,	37,	1.3},
	{"Thiªn thanh th¹ch",	2,	2,	36,	1.3},
	{"HuyÒn thiÕt",	2,	2,	6,	1.2},
	{"Th¸i b¹ch tinh kim",2,	2,	5,	1},
	{"Hµn thiÕt",	2,	2,	4,	1},
	{"¤ kim th¹ch",	2,	8,	5,	1},
	{"B¸ch LuyÖn C­¬ng",	2,	2,	2,	1},
	{"Tinh ThiÕt",	2,	2,	1,	1}
}
tb_life_merterial[4] = {
	{"ThiÕt TuyÕn Méc",	2,	2,	11,	1.3},
	{"ThiÕt Ch­¬ng Méc",	2,	2,	10,	1.3},
	{"Trïng Méc",	2,	2,	9,	1.2},
	{"Ng« ®ång",	2,	2,	45,	1},
	{"ThiÕt Méc",	2,	2,	44,	1},
	{"Sam méc",	2,	2,	43,	1},
	{"D­¬ng Méc",	2,	2,	42,	1},
	{"Tïng Méc",	2,	2,	41,	1}
}
tb_life_merterial[5] = {
	{"Da S­ tö",2,	2,	47,	1.3},
	{"Loan ®iÓu vò",2,	10,	7,	1.3},
	{"Da gÊu",	2,	2,	20,	1.2},
	{"Da hæ tr¾ng",2,	2,	46,	1},
	{"Da r¾n",	2,	2,	18,	1},
	{"Da c¸o",	2,	2,	17,	1},
	{"Da hæ",	2,	2,	16,	1},
	{"Da sãi",	2,	2,	15,	1}
}
tb_life_merterial[6] = {
	{"L·nh trïng t¬",	2,	9,	4,	1.3},
	{"Kim tµm t¬",	2,	2,	55,	1.3},
	{"Linh Chu t¬",	2,	2,	54,	1.2},
	{"Hång t¬",	2,	2,	53,	1},
	{"Lang chu t¬",	2,	2,	52,	1},
	{"T¬ Ngò S¾c",	2,	9,	3,	1},
	{"Tµm t¬",	2,	9,	2,	1},
	{"L«ng thá",	2,	9,	1,	1}
}
tb_cent_and_letter = {
	{15000,1},
	{28000,2},
	{40000,3}
}
--********************¶Ô»°Ö÷º¯Êı*******************************************************************
function confwar_task_goods_main()
	Say("",8,
	"Giíi thiÖu nhiÖm vô/task_intro",
	"Quyªn gãp nguyªn liÖu/goods_hand_in_main",
	"Xem t×nh h×nh quyªn gãp cña bang héi hiÖn t¹i/goods_hand_in_inf",
	"Th­ tiÕn cö/commend_letter_main",
	"§æi khiªu chiÕn lÖnh/exchange_tiaozhanling",
	"§æi 8 Dòng SÜ LÖnh (cÇn 1 Th­ tiÕn cö)/exchange_warriorling",
	"§æi 6 C«ng thµnh Tiªn Phong LÖnh (cÇn 1 Th­ tiÕn cö)/exchange_citywarling",
	"Trë l¹i/end_dialog"
)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"",Zgc_pub_sex_name().." h×nh nh­ kh«ng mang Th­ tiÕn cö trªn ng­êi?")
		return
	end
	
	if GetFreeItemRoom() < 8 then
		Talk(1,"",Zgc_pub_sex_name().." kh«ng ®ñ 8 « trèng trong hµnh trang.")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B¹n nhËn ®­îc 8 Dòng SÜ LÖnh.")
		WriteLogEx("Cong Thanh Chien","nhËn",8,"Dòng SÜ LÖnh","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"",Zgc_pub_sex_name().." h×nh nh­ kh«ng mang Th­ tiÕn cö trªn ng­êi?")
		return
	end
	
	if GetFreeItemRoom() < 6 then
		Talk(1,"",Zgc_pub_sex_name().." kh«ng ®ñ 6 « trèng trong hµnh trang.")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B¹n nhËn ®­îc 6 C«ng thµnh Tiªn Phong LÖnh.")
		WriteLogEx("Cong Thanh Chien","nhËn",6,"C«ng thµnh Tiªn Phong LÖnh","",GetTongName())
	end
end

--$$$$$$$$$$$$$$$$$$$$ÌôÕ½Áî$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


--********************ÈÎÎñ½éÉÜ****************************************************
function task_intro()
	Talk(2,"confwar_task_goods_main","TriÒu ®×nh vµ giÆc Liªu t¸c chiÕn nhiÒu n¨m, quèc khè ®· hÕt, khã kĞo dµi ®­îc. Anh hïng n÷ hiÖp v× n­íc v× d©n, ta ®Ò nghŞ ng­êi cã tiÒn gãp tiÒn, ng­êi cã søc gãp søc, cèng hiÕn v× an nguy quèc gia, §¹i Tèng ta míi thiªn h¹ th¸i b×nh. V× thÕ b©y giê ta kh«ng chØ quyªn gãp cho vïng bŞ n¹n, mµ cßn quyªn gãp <color=yellow>qu©n l­¬ng<color> cho §¹i Tèng. Hy väng triÒu ®×nh sím thu håi ®Êt ®ai bŞ mÊt, chóng ta sÏ ®­îc an h­ëng th¸i b×nh.",
		"Do sè nguyªn liÖu lín nªn ta sÏ dïng bang héi cña <color=yellow>c¸c vŞ<color> lµm ®¬n vŞ ghi chĞp, sau nµy sÏ tuyªn truyÒn ®iÓm tèt cña c¸c vŞ ®Õn mäi ng­êi. <color=yellow>Gi¸ trŞ qu©n l­¬ng <color>tõ<color=yellow> 0.3 <color>®Õn<color=yellow> 1.5 <color>kh«ng ®Òu, nguyªn liÖu cã cÊp cµng cao th× gi¸ trŞ cµng cao. Mçi tuÇn ta sÏ viÕt 1 lÇn <color=yellow>cho<color> quı bang (nhiÒu nhÊt <color=yellow>3<color> th­ tiÕn cö). NhËn th­ tiÕn cö, ghi chĞp qu©n l­¬ng sÏ ®­îc trõ t­¬ng øng, phÇn cßn l¹i sÏ tİch lòy ®Õn tuÇn sau."
	)
end

--*********************¾èÔù*********************************************************
function goods_hand_in_main()
	if istongmember_chk() == 0 then
		return
	end
	local tb_hand_in_mert_diff_dia = {
	"Ta muèn quyªn gãp nguyªn liÖu h¸i thuèc/#goods_hand_in(1,1)",
	"Ta muèn quyªn gãp nguyªn liÖu canh t¸c/#goods_hand_in(2,1)",
	"Ta muèn quyªn gãp nguyªn liÖu ®µo kho¸ng/#goods_hand_in(3,1)",
	"Ta muèn quyªn gãp nguyªn liÖu ®èn c©y/#goods_hand_in(4,1)",
	"Ta muèn quyªn gãp nguyªn liÖu thuéc da/#goods_hand_in(5,1)",
	"Ta muèn quyªn gãp nguyªn liÖu kĞo t¬/#goods_hand_in(6,1)",
	"Cø hái/end_dialog"
	}
	Say("Ng­¬i muèn quyªn gãp lo¹i nguyªn liÖu nµo?",
	getn(tb_hand_in_mert_diff_dia),tb_hand_in_mert_diff_dia)
end
--*******************Éú»î²ÄÁÏÏêÏ¸ÁĞ±í******************
function goods_hand_in(merterial_diff,page)
	local tb_hand_in_merterial_dia = {}
	local mertrial_num = 0
	for i = 1,8 do
		if tb_life_merterial[merterial_diff][i+((page-1)*8)] ~= nil then
			mertrial_num = mertrial_num + 1
			tb_hand_in_merterial_dia[i] = "Ta muèn quyªn gãp toµn bé"..tb_life_merterial[merterial_diff][((page-1)*8+i)][1].."(mçi "..strsub(tostring(tb_life_merterial[merterial_diff][((page-1)*8+i)][5]),1,4).."®iÓm tİch lòy)/#mert_han_in("..merterial_diff..","..((page-1)*8+i)..")"
		else
			break
		end
	end
	if getn(tb_life_merterial[merterial_diff]) > 8 and page == 1 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "Trang kÕ/#goods_hand_in("..merterial_diff..",2)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "Tho¸t/end_dialog"
	elseif page == 2 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "Trang tr­íc/#goods_hand_in("..merterial_diff..",1)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "Tho¸t/end_dialog"
	else
		tb_hand_in_merterial_dia[mertrial_num+1] = "Tho¸t/end_dialog"
	end
	Say("Ng­¬i muèn quyªn gãp nguyªn liÖu nµo?",
		getn(tb_hand_in_merterial_dia),
		tb_hand_in_merterial_dia
		)
end
--****************************²ÄÁÏ¾èÏ×************************
function mert_han_in(merterial_diff,merterial_seq)
	local cent_count = 0
	local merterial_num = GetItemCount(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4])
	local cent_count = merterial_num * tb_life_merterial[merterial_diff][merterial_seq][5]

	if merterial_num == 0  then
		Say("…"..Zgc_pub_sex_name().."Trong hµnh trang kh«ng cã <color=yellow>"..tb_life_merterial[merterial_diff][merterial_seq][1].."<color>, quªn mang råi ph¶i kh«ng?",
		2,
		"Ta muèn quyªn gãp nguyªn liÖu kh¸c/goods_hand_in_main",
		"Ta vÉn ch­a chuÈn bŞ/end_dialog"
		)
		return
	elseif cent_count < 1 then
		Talk(1,"","NÕu "..Zgc_pub_sex_name().." cã ı muèn quyªn gãp, mang İt nguyªn liÖu vËy còng keo qu¸ råi, ta kh«ng r¶nh ®Ó gi¶i quyÕt nh÷ng mãn ®å nµy cña ng­¬i.")
		return
	end
	cent_count = floor(cent_count)
	if DelItem(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4],merterial_num) ~= 1 then
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,cent_count)
	Zgc_pub_getconftask(3,1)
end
--************************°ï»á»ı·ÖÊı¾İÈ¡µÃ»Øµ÷*********************
function ConfDataGetReturn_1(cent_save)
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	SetTaskTemp(temp_taskID_merterial_count_conf,(cent_save+cent_the_turn))
	Zgc_pub_setconftask(3,(cent_save+cent_the_turn),1)
end
--**************************°ï»á»ı·Ö´æ´¢»Øµ÷***********************
function ConfDataSetReturn_1()
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	local cent_conf_save = GetTaskTemp(temp_taskID_merterial_count_conf)
	Talk(1,"","V× quı bang ®· quyªn gãp qu©n l­¬ng "..cent_the_turn.."®iÓm tİch lòy!")
	SendTongMessage(GetName().."  quyªn gãp cho §¹i Tèng "..cent_the_turn.."hiÖn nay quı bang ®· tİch lòy "..cent_conf_save.." ®iÓm qu©n l­¬ng.")
end
--************************************²é¿´***********************************
function goods_hand_in_inf()
	Zgc_pub_getconftask(3,2)
end
function ConfDataGetReturn_2(cent_save)
	Talk(1,"","Quı bang ®· quyªn gãp <color=yellow>"..cent_save.."<color> ®iÓm qu©n l­¬ng, hy väng tiÕp tôc!")
	return
end
--**********************************ÍÆ¼öĞÅ***********************************
function commend_letter_main()
	Say("GÇn ®©y nghe nãi triÒu ®×nh triÖu tËp c¸c anh hïng thiªn h¹ trÊn gi÷ <color=yellow>Thµnh §«<color>, nh­ng ph¶i tû vâ L«i ®µi nhËn t­ c¸ch, c¸c bang ph¸i quyªn gãp qu©n l­¬ng tİch cùc nh­ vËy sÏ rÊt chén rén, hay lµ ta sÏ viÕt 1 bøc <color=yellow>th­ tiÕn cö<color> gëi cho §¹i sø c«ng thµnh <color=yellow>ë Thµnh §«<color>, xem nh­ lµ giíi thiÖu cho quı bang.\n Quyªn gãp <color=yellow>"..tb_cent_and_letter[1][1].."<color> qu©n l­¬ng cã <color=yellow>"..tb_cent_and_letter[1][2].."<color> th­ tiÕn cö\n Quyªn gãp <color=yellow>"..tb_cent_and_letter[2][1].."<color> qu©n l­¬ng cã <color=yellow>"..tb_cent_and_letter[2][2].."<color> th­ tiÕn cö\n Quyªn gãp <color=yellow>"..tb_cent_and_letter[3][1].."<color> qu©n l­¬ng cã <color=yellow>"..tb_cent_and_letter[3][2].."<color> th­ tiÕn cö",
		2,
		"H·y gióp ta viÕt th­ tiÕn cö/commend_letter_prize",
		"Cø hái/end_dialog")
end
function commend_letter_prize()
	if IsTongMaster() ~= 1 then						--È¨ÏŞ¼ì²â
		Talk(1,"","Mêi bang chñ <color=yellow>quı bang<color> ®Õn nhËn <color=yellow>th­ tiÕn cö<color>.")
		return
	end
	Zgc_pub_getconftask(4,3)						--»ñÈ¡ÉÏ´ÎÁìÈ¡ÖÜÊı
end
function ConfDataGetReturn_3(week_seq_save)			--ÖÜĞòÊı»ñµÃ»Øµ÷
	if week_seq_save >= zgc_pub_day_turn(7) then	--±¾ÖÜ¿ÉÒÔÁìÈ¡Óë·ñ¼ì²â
		Talk(1,"","GÇn ®©y ta rÊt bËn, th­ tiÕn cö cña <color=yellow>mçi bang ph¸i<color> ta chØ viÕt <color=yellow>1 tuÇn<color> mét lÇn. "..Zgc_pub_sex_name().."TuÇn sau ®Õn nhĞ!")
		return
	end
	Zgc_pub_getconftask(3,4)						--µ±Ç°»ı·Ö»ñÈ¡
end
function ConfDataGetReturn_4(cent_save)				--µ±Ç°»ı·Ö»ñÈ¡»Øµ÷
	if cent_save < tb_cent_and_letter[1][1] then	--»ı·Ö²»×ãÏÂÏŞÌáÊ¾
		Talk(1,"","Nguyªn liÖu quı bang quyªn gãp kh«ng ®ñ <color=yellow>15000<color> ®iÓm, quyªn gãp ®ñ råi ®Õn nhËn <color=yellow>th­ tiÕn cö<color>!")
		return
	end
	local letter_able_get = 0
	for i = 1, 3 do
		if cent_save >= tb_cent_and_letter[i][1] then
			letter_able_get = i
		else
			break
		end
	end
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then		--¿Õ¼äºÍ¸ºÖØÅĞ¶Ï
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,letter_able_get)
	Say("Tæng nguyªn liÖu hiÖn nay quı bang ®· quyªn gãp <color=yellow>"..cent_save.."<color> ta gióp ng­¬i viÕt <color=yellow>"..letter_able_get.."<color> th­ tiÕn cö.",
	2,
	"Ta muèn nhËn th­ tiÕn cö cña bang ta/#letter_get_dtm("..cent_save..","..letter_able_get..")",		--¼õÉÙ»ı·Ö
	"§Ó ta suy nghÜ l¹i/end_dialog")
end
--********************ÁìÈ¡ĞÅ¼şÈ·ÈÏ¶Ô»°********************
function letter_get_dtm(cent_save,letter_num)
	local cent_remain = (cent_save-(tb_cent_and_letter[letter_num][1]))
	SetTaskTemp(temp_taskID_merterial_count_conf,cent_remain)
	Say("<color=red>Chó ı<color>: Mét tuÇn chØ cã thÓ nhËn <color=red>1 lÇn <color>th­ tiÕn cö, ng­¬i muèn nhËn b©y giê kh«ng?",
	2,
	"Ta muèn nhËn/#Zgc_pub_setconftask(3,"..cent_remain..",2)",		--¼õÉÙ»ı·Ö
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function ConfDataSetReturn_2()					--»ı·Ö¼õÉÙ»Øµ÷£¨³É¹¦£©
	local letter_num = GetTaskTemp(temp_taskID_merterial_count)
	local conf_cent_remain = GetTaskTemp(temp_taskID_merterial_count_conf)
	if AddItem(2,1,1200,letter_num) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn th­ tiÕn cö tuÇn nµy "..letter_num.." th­!")
		SendTongMessage(GetName().." NhËn th­ tiÕn cö "..letter_num.." th­, hiÖn nay quı bang cßn d­ "..conf_cent_remain.." ®iÓm qu©n l­¬ng!")
		WriteLogEx("Cong Thanh Chien","nhËn",letter_num,"Th­ tiÕn cö","",GetTongName())
	end
	Zgc_pub_setconftask(4,zgc_pub_day_turn(7),3)--ÖÜĞòÊı´æÈë
end
function ConfDataSetReturn_3()					--ÖÜĞòÊı´æÈë»Øµ÷
end
--*********************¾èÔù×Ê¸ñ¼ì²â***********************************************
function istongmember_chk()
	if IsTongMember() == 0 then
		Talk(1,"","Ng­¬i gia nhËp bang ph¸i råi h·y ®Õn ®©y quyªn gãp.")
		return 0
	else
		return 1
	end
end


--¶Ò»»ÌôÕ½Áî
function exchange_tiaozhanling()
	Say("<color=green>Ch©u ThiÖn Nh©n<color>: Khiªu chiÕn lÖnh dïng ®Ó khiªu chiÕn bang héi thñ thµnh. Nép cho chñ lçi ®µi cã thÓ thu ®­îc t­ c¸ch tham chiÕn. Bang héi nép nhiÒu khiªu chiÕn lÖnh nhÊt sÏ cã t­ c¸ch c«ng thanh. Th«ng qua ®iÓm qu©n l­¬ng vµ b¹c ®Ó ®æi lÊy khiªu chiÕn lÖnh.",
		2,
		"§æi khiªu chiÕn lÖnh (cÇn 88 ®iÓm qu©n l­¬ng vµ 88 b¹c)/confirm_exchange_tiaozhanling",
		"Xem th«ng tin kh¸c/end_dialog"
	);
end

function confirm_exchange_tiaozhanling()
	-- ÊÇ·ñÊÇ°ïÖ÷£¬¸±°ïÖ÷»ò³¤ÀÏ
	if IsTongMember() ~= 1 and IsTongMember() ~= 2 and IsTongMember() ~= 3 then
		Talk(1,"","<color=green>Chu ThiÖn Nh©n<color>: ChØ cã bang chñ/phã bang chñ/tr­ëng l·o míi cã thÓ ®æi khiªu chiÕn lÖnh")
		return 0
	end
	
	-- °ïÖ÷±ØĞëÔÚÎ»7ÌìÒÔÉÏ
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green>Chu ThiÖn Nh©n<color>: C¸c h¹ t¹i vŞ kh«ng ®ñ 7 ngµy, kh«ng thÓ ®æi khiªu chiÕn lÖnh")
		return 0
	end
	
	-- 80¼¶ÒÔÉÏ
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green>Chu ThiÖn Nh©n<color>: CÊp bËc c¸c h¹ kh«ng ®ñ 80, kh«ng thÓ ®æi khiªu chiÕn lÖnh")
		return 0
	end
	
	--ÓÃ°ï»á»ı·ÖÀ´»»ÌôÕ½Áî
	
	--ÏÈÈ¡µÃ°ï»áÏÖÓĞµÄ»ı·Ö£¬¿´¿´
	---
	Zgc_pub_getconftask(3,5)
	
	--ApplyRelayShareData(GetTongName(),0,0,File_name,"call_back_tiaozhanling")
end

function ConfDataGetReturn_5(cent_save)
	local nCount = floor(cent_save / 88);
	Say("<color=green>Chu ThiÖn Nh©n<color>: §¹i hiÖp muèn dïng 88 ®iÓm qu©n l­¬ng vµ 88 b¹c ®Ó ®æi khiªu chiÕn lÖnh?",
			2,
			"§óng, ta muèn ®æi./#confirm_tiaozhanling("..cent_save..")",
			"§Ó ta nghÜ l¹i/end_dialog"
	);
end

function confirm_tiaozhanling(nPoint)
	if Zgc_pub_goods_add_chk(2, 10) == 0 then
		return 0;
	end
	local nRemainPoint = nPoint - 88;
        if nRemainPoint < 0 then
            Say("<color=green>Chu ThiÖn Nh©n<color>:  §iÓm tİch lòy bang héi cña ®¹i hiÖp kh«ng ®ñ!", 0);
            return 0;
        end
	if Pay(88 * 100) == 0 then
		Say("<color=green>Chu ThiÖn Nh©n<color>: Hµnh trang kh«ng ®ñ ng©n l­îng!", 0);
		return 0;
	end
	Zgc_pub_setconftask(3, nRemainPoint, 5);
	local nCount = 0;
	local nRand = random(1, 1000);
	if nRand == 1 then
		nCount = 3;
	elseif nRand <= 10 then
		nCount = 2;
	else
		nCount = 1;
	end
	AddItem(2, 1, 30117, nCount);
	Talk(1, "exchange_tiaozhanling", "<color=green>Chu ThiÖn Nh©n<color>: §¹i hiÖp dïng ®iÓm tİch lòy bang héi ®æi "..nCount.." khiªu chiÕn lÖnh.");
	WriteLog("[§æi khiªu chiÕn lÖnh]: "..GetName().." lµ bang héi "..GetTongName().."®æi "..nCount.." khiªu chiÕn lÖnh.");
end

function ConfDataSetReturn_5()
end
