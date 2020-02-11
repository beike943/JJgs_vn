Include("\\script\\½á»é\\marriage_head.lua");
function OnUse()
	local selTab = {
			"Thêi gian b¾t ®Çu/about_begin_time",
			"Thêi gian kÕt thóc/about_end_time",
			"Hû N­¬ng/about_xiniang",
			"Y phôc vµ nhÉn c­íi/about_equip",
			"LÔ phÈm h«n lÔ/about_marriage_thing",
			"§ãng CÈm nang/nothing",
			}
	Say("Ta cã thÓ gióp g×?",getn(selTab),selTab)
end;

function about_begin_time()
	local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE))
	local nPeriod,nFieldType = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if nPeriod == 0 or nFieldType == 0 then
		Talk(1,"HiÖn ng­¬i vÉn ch­a ®Æt s©n khÊu")
		return 0
	end;
	local sPeriod = map_period[nPeriod][5];
	local sFieldName = map_fieldinfo[nFieldType][1]
	Talk(1,"OnUse",format("B¹n ®· ®Æt khu vùc<color=yellow> n¨m %d th¸ng %d ngµy%d %s<color> - <color=yellow>%s<color>,  hiÖn t¹i vµo <color=yellow>n¨m %d th¸ng %d ngµy %d %d<color>,  cã thÓ vµo khu vùc nµy ®Ó chuÈn bŞ. thêi gian chuÈn bŞ lµ <color=yellow>30<color> phót,  sau khi chuÈn bŞ,  kh¸ch mêi cã thÓ b­íc vµo héi tr­êng.",
						nYear,
						nMonth,
						nDay,
						sPeriod,
						sFieldName,
						nYear,
						nMonth,
						nDay,
						map_period[nPeriod][1]));
end;

function about_end_time()
	local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE))
	local nPeriod,nFieldType = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if nPeriod == 0 or nFieldType == 0 then
		Talk(1,"HiÖn ng­¬i vÉn ch­a ®Æt s©n khÊu")
		return 0
	end;
	Talk(1,"OnUse",format("S©n khÊu b¹n dù ®Şnh sÏ kÕt thóc <color=yellow>n¨m %d th¸ng %d ngµy %d %d giê 30 phót<color>. Xin rêi khái s©n khÊu tr­íc thêi gian trªn",
						nYear,
						nMonth,
						nDay,
						map_period[nPeriod][3]));
end;

function about_xiniang()
	Talk(2,"OnUse","Hû N­¬ng sÏ gióp ng­¬i: <enter><color=yellow>Cö hµnh h«n lÔ<color><enter> ng­¬i cã thÓ theo sù h­íng dÉn cña Hû n­¬ng mµ lµm theo. <enter><color=yellow>Bµy tiÖc r­îu<color><enter>, Hû N­¬ng sÏ gióp ng­¬i bµy c¸c mãn ¨n lªn bµn tiÖc. Cã rÊt nhiÒu mãn ¨n thùc kh¸ch tïy ı th­ëng thøc.","<color=yellow>ChuyÓn tr¹ng th¸i<color><enter> T¹i s©n khÊu h«n lÔ b¹n vµ t©n n­¬ng cã thÓ tïy ı chuyÓn tõ tr¹ng th¸i kÕt h«n sang tr¹ng th¸i chiÕn ®Êu, dï ë tr¹ng th¸i nµo còng ®¶m bµo an toµn. <enter><color=yellow>NhËn thÕ Hång bao<color><enter> B»ng h÷u tÆng cho b¹n rÊt nhiÒu hång bao, lµm sao b¹n cã thÓ cÇm hÕt? Hû n­¬ng sÏ nhËn thay, sau ®ã b¹n ®Õn gÆp Hû n­¬ng ®Ó nhËn l¹i. <enter><color=yellow>Chóc mõng h«n lÔ<color><enter> Hû N­¬ng sÏ chuyÓn nh÷ng lêi chóc mõng cña b¹n bÌ ®Õn cho b¹n, nh÷ng ng­êi tham gia h«n lÔ ®Òu cã thÓ nh×n thÊy.");
end;

function about_equip()
	Talk(1,"OnUse","LÔ phôc b¹n cã thÓ mua ë Ngù c¸c, nÕu kh«ng cã thÓ ®Õn chç bµ mai thuª trang phôc vµ nhÉn c­íi. Thêi gian thuª lµ 24 giê<enter>.");
end;

function about_marriage_thing()
	Talk(1,"OnUse","§Ó cho kh«ng khİ buæi lÔ ®­îc t­ng bõng n¸o nhiÖt b¹n cã thÓ thªm nh÷ng vËt phÈm nh­: LÔ hoa, ph¸o, kÑo mõng…Nh÷ng vËt phÈm nµy cã thÓ mua chç Ngù c¸c hoÆc dŞch vô h«n nh©n.");
end;

function nothing()

end;