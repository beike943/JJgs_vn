Include("\\script\\newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\mainbattle\\mission\\mission_head.lua");
function OnUse()
	local selTab = {
				". ThuyÕt minh chiÕn tr­êng/battle_introduce",
				". Tin tøc chiÕn tr­êng/battle_info",
				". T×m hiÓu thuéc tÝnh trang bÞ chiÕn tr­êng/know_equip",
				"§ãng/nothing",
				}
	Say("H­íng dÉn chiÕn tr­êng:",getn(selTab),selTab);
end;

function battle_info()
	local selTab = {
				". Th«n lµng chiÕn/village_info",
				". Th¶o cèc chiÕn/resource_info",
				". Ph¸o ®µi chiÕn/emplacement_info",
				". Nh¹n M«n Quan chiÕn/main_info",
				"Tr­íc/OnUse",
				"§ãng/nothing",
				}
	Say("Tin tøc chiÕn tr­êng:",getn(selTab),selTab);
end;

function battle_introduce()
	local selTab = {
				". C¸ch ch¬i/battle_intro_technique",
				". PhÇn th­ëng/battle_intro_award",
				". Qu©n hµm/battle_intro_rank",
				"Tr­íc/OnUse",
				"§ãng/nothing",
				}
	Say("ThuyÕt minh chiÕn tr­êng:",getn(selTab),selTab);
end;

function battle_intro_technique()
	local selTab = {
				". Nh¹n M«n Quan_L­¬ng Th¶o chiÕn/battle_intro_technique_res",
				". Nh¹n M«n Quan_Th«n Lµng chiÕn/battle_intro_technique_vill",
				". Nh¹n M«n Quan_Ph¸o §µi chiÕn/battle_intro_technique_empl",
				". Nh¹n M«n Quan_ChiÕn tr­êng chÝnh/battle_intro_technique_main",
				"Tr­íc/battle_introduce",
				"§ãng/nothing",
				}
	Say("C¸ch ch¬i ë chiÕn tr­êng míi:",getn(selTab),selTab);
end;

function battle_intro_technique_res()
	Talk(1,"battle_intro_technique_res_1","    Sau khi vµo chiÕn tr­êng ®Õn Qu©n Nhu quan nhËn {Cuèc} ®i t×m l­¬ng th¶o vÒ cho <color=yellow>Qu©n Nhu quan<color> hoÆc <color=yellow>N¹n d©n<color>. Giao <color=yellow>HuyÒn thiÕt kho¸ng th¹ch<color> cho {Qu©n Nhu quan} hoÆc <color=yellow>S¬n tÆc thñ lÜnh<color>. PhÇn th­ëng: <color=yellow>Binh kú vµ ChiÕn cæ<color>, ®ång thêi ®é h¶o h÷u víi S¬n tÆc sÏ t¨ng lªn. Bªn Ýt ®iÓm h¶o h÷u sÏ bÞ <color=yellow>S¬n tÆc l©u la<color> tÊn c«ng, kh«ng ®¸nh b¹i chóng ®iÓm tÝch lòy sÏ <color=yellow>gi¶m<color>! Trong thêi gian quy ®Þnh bªn nµo tÝch tr÷ l­¬ng thùc nhiÒu h¬n sÏ th¾ng.");
end;

function battle_intro_technique_res_1()
	Talk(1,"battle_intro_technique","Nh¾c nhë: \n1. Ph¶i biÕt tËn dông nguån <color=yellow>l­¬ng th¶o cao cÊp<color>. \n2. Sö dông binh kú gióp ®ång ®éi kh«ng bÞ ®èi ph­¬ng ®¸nh b¹i. \n3. <color=yellow>ChiÕn cæ<color> khiÕn phe ®Þch r¬i vµo tr¹ng th¸i hçn lo¹n, cho¸ng. \n4. CÇn t¨ng ®é h¶o h÷u ë s¬n tÆc thñ lÜnh.");
end;

function battle_intro_technique_vill()
	Talk(1,"battle_intro_technique_vill_1","    Sau khi vµo chiÕn tr­êng ®Õn gÆp <color=yellow>ChiÕn tr­êng h­íng ®¹o<color> nhËn nhiÖm vô. HÖ thèng ngÉu nhiªn chØ ®Þnh mçi bªn 3 ng­êi ®i t×m npc. Lóc nµy chiÕn tr­êng sÏ xuÊt hiÖn c¸c npc <color=yellow>B¸ch Sù Th«ng<color>, ®¸nh b¹i chóng sÏ biÕt täa ®é npc. NPC nhiÖm vô sÏ c¨n cø sè ng­êi hai bªn giÕt ®­îc B¸ch Sù Th«ng ®­a ra ph¶n øng kh¸c nhau. §¸nh b¹i NPC nhiÖm vô hÖ thèng b¾t ®Çu l¹i nhiÖm vô, ®Õn khi bªn nµo ®¹t ®­îc 99 lÇn xem nh­ chiÕn th¾ng!");
end;

function battle_intro_technique_vill_1()
	Talk(1,"battle_intro_technique","Nh¾c nhë: \n1. <color=yellow>§¸nh b¹i kÎ ®Þch kh«ng nhËn ®­îc ®iÓm tÝch lòy hoÆc qu©n c«ng<color>. \n2. {ChiÕn tr­êng chØ nam} ®Ó xem tin tøc nhiÖm vô. \n3. BÞ ®Þch ph­¬ng chÆn cöa cã thÓ dïng <color=yellow>Kú m«n trËn phï (Ngù C¸c)<color> di chuyÓn ®Õn n¬i kh¸c. \n4. <color=yellow>H¹n chÕ diÖt B¸ch Sù Th«ng bªn m×nh<color> ®Ó nhanh chãng hoµn thµnh nhiÖm vô!");
end;

function battle_intro_technique_empl()
	Talk(1,"battle_intro_technique","    Bªn nµo chiÕm gi÷ ph¸o ®µi l©u xem nh­ chiÕn th¾ng! \n Nh¾c nhë: \n1. Cã thÓ dïng <color=yellow>Kú m«n trËn phï (Ngù C¸c)<color> nhanh chãng ®Õn ph¸o ®µi. \n2. Cã 3 ®­êng lín cã thÓ ®Õn ph¸o ®µi. \n3. Do ph¸o ®µi nhiÒu n¨m kh«ng tu söa, kh«ng nªn ®øng gÇn tr¸nh tæn thÊt.. \n4. B¶o r­¬ng bªn ®­êng cã thÓ gióp ®­îc Ýt nhiÒu cho chóng ta.");
end;

function battle_intro_technique_main()
	Talk(1,"battle_intro_technique_main_1","    KÕt qu¶ 3 chiÕn tr­êng nhá sÏ ¶nh h­ëng trùc tiÕp ®Õn chiÕn tr­êng lín: Phe th¾ng L­¬ng Th¶o chiÕn nhËn ®­îc nhiÒu d­îc phÈm, phe th¾ng Th«n Lµng chiÕn ®­îc thæ d©n gióp ®ì, phe th¾ng Ph¸o §µi chiÕn ®­îc ®Þa ®iÓm tèt khèng chÕ ph¸o ®µi (®o¹t l¹i ®­îc). Thø tù ®¸nh b¹i <color=yellow>hiÖu óy, ®« thèng<color> xuÊt hiÖn <color=yellow>tiªn phong<color>, ®¸nh b¹i <color=yellow>tiªn phong, ®« thèng<color> xuÊt hiÖn <color=yellow>t­íng qu©n<color>, ®¸nh b¹i <color=yellow>t­íng qu©n, tiªn phong<color> xuÊt hiÖn <color=yellow>nguyªn so¸i<color>, giÕt ®­îc nguyªn so¸i xem nh­ chiÕn th¾ng nÕu hai bªn ch­a giÕt ®­îc sÏ c¨n cø ®iÓm tÝch lòy c«ng céng quyÕt ®Þnh.");
end;

function battle_intro_technique_main_1()
	Talk(1,"battle_intro_technique","Nh¾c nhë: \n1. <color=yellow>Dïng kú m«n trËn phï (Ngù C¸c)<color> ®Õn mét n¬i nµo ®ã. \n2. MÊt ®iÓm ghi nhí tõ hËu doanh ®Õn tiÒn doanh khi giµnh quyÒn chiÕm gi÷ ph¸o ®µi. \n3. GiÕt thæ d©n thñ lÜnh hay kú nh©n dÞ sÜ sÏ nhËn ®­îc bÊt ngê. \n4. LÊy ®iÓm tÝch lòy th«ng qua ®¸nh b¹i n¹n d©n. \n5. BÞ ®èi ph­¬ng ®¸nh b¹i hay ®¸nh b¹i ®èi ph­¬ng ®Òu cã c¬ héi ®èi kh¸ng.");
end;


function battle_intro_award()
	Talk(1,"battle_intro_award_1","    KÕt thóc trËn ®¸nh ng­êi ch¬i ®Õn NPC nhËn th­ëng míi cã thÓ tiÕp tôc b¸o danh trËn sau, phÇn th­ëng: qu©n c«ng, ®iÓm tÝch lòy vµ kinh nghiÖm, ta cã thÓ mua qu©n c«ng ch­¬ng, ®¹i qu©n c«ng ch­¬ng hoÆc huy hoµng ch­¬ng ë Ngù C¸c ®Ó t¨ng béi sè nhÊt ®Þnh, h¬n n÷a qu©n hµm cao, ®¼ng cÊp cao ®iÓm kinh nghiÖm nhËn ®­îc sÏ nhiÒu h¬n. \nNÕu ng­êi ch¬i ®¹t qu©n hµm tõ ®« thèng trë lªn cã thÓ ®Õn NPC mua trang bÞ.");
end;

function battle_intro_award_1()
	Talk(1,"battle_introduce","Nh¾c nhë: \n1. Sè ng­êi chªnh lÖch sÏ ¶nh h­ëng ®Õn qu©n c«ng, ®iÓm tÝch lòy, kinh nghiÖm, sè ng­êi bªn nµo nhiÒu h¬n phÇn th­ëng sÏ Ýt l¹i, nhiÒu nhÊt h¬n 6 lÇn. \n2. §æi <color=yellow>d­îc phÈm ®Æc biÖt<color> nÕu kh«ng ghi chiÕn tr­êng chuyªn dông cã thÓ <color=yellow>mang ra ngoµi sö dông<color> nhËn hiÖu qu¶ ®Æc biÖt nh­ <color=yellow>miÔn dÞch lo¹n, cho¸ng, v« ®Þch...<color>! \n3. ë hËu ph­¬ng cã thÓ ®æi d­îc phÈm chuyªn dïng cho chiÕn tr­êng.");
end;

function battle_intro_rank()
	Talk(1,"battle_intro_rank_1","    <color=yellow>21 giê thø 7 h»ng tuÇn<color> hÖ thèng sÏ trao qu©n hµm cho ng­êi ch¬i online. §Õn gÆp NPC b¸o danh nhËn qu©n hµm.")
end;

function battle_intro_rank_1()
	Talk(1,"battle_introduce","Nh¾c nhë: \n1. Kh«ng cã qu©n hµm kh«ng thÓ kho¸c trang bÞ chiÕn tr­êng. \n2. Ng­êi ch¬i cã qu©n c«ng h¬n <color=yellow>80000<color> mçi tuÇn sÏ bÞ trõ <color=yellow>1/8<color>. \n3. HiÖu óy: 15000; §« thèng: 50000; Tiªn phong: h¬n 80000 vµ ph¶i <color=yellow>®­îc xÕp h¹ng tõ 7-16<color>; T­íng qu©n: h¬n 120000 vµ ph¶i <color=yellow>®­îc xÕp h¹ng tõ 2-6<color>; Nguyªn so¸i: h¬n 250000 vµ ph¶i <color=yellow>®­îc xÕp h¹ng 1<color>. \n4. Ng­êi ch¬i mang qu©n hµm tiªn phong, t­íng qu©n hay nguyªn so¸i khi bÞ giÕt sÏ bÞ trõ ®iÓm qu©n c«ng: Tiªn phong: 40; T­íng qu©n: 80; Nguyªn so¸i: 150.");
end;

function village_info()
	if BT_GetData(PT_BATTLE_TYPE) == VILLAGE_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;	
		local nTargetNameSong = GetMissionS(MSTR_SONG_TARGETNAME);
		local nTargetNameLiao = GetMissionS(MSTR_LIAO_TARGETNAME);
		local _,nTargetSongPosX,nTargetSongPosY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_SONG));
		local _,nTargetLiaoPosX,nTargetLiaoPosY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_LIAO));
		Talk(1,"battle_info","§iÓm tÝch lòy c¸ nh©n trong ChiÕn tr­êng Th«n trang: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>TiÕn ®é phe Tèng: <color=yellow>"..GetMissionV(MV_SONG_TASKSTEP).."<color> TiÕn ®é phe Liªu: <color=yellow>"..GetMissionV(MV_LIAO_TASKSTEP).."<color><enter>Sè l­îng B¸ch Sù Th«ng bÞ chÝnh phe m×nh tiªu diÖt: <color=yellow>"..GetMissionV(MV_SONG_KILL_SONG+nCamp-1).."<color>Sè l­îng B¸ch Sù Th«ng cña phe ®Þch bÞ phe m×nh diÖt: <color=yellow>"..GetMissionV(MV_SONG_KILL_LIAO+nCamp-1).."<color>")
	else
		Talk(1,"battle_info"," hiÖn kh«ng trong ChiÕn tr­êng Th«n trang.");
	end;
end;

function resource_info()
	if BT_GetData(PT_BATTLE_TYPE) == RESOURCE_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;	
		Talk(1,"battle_info","§iÓm tÝch lòy c¸ nh©n: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>Sè l­¬ng th¶o phe m×nh: <color=yellow>"..GetMissionV(MV_RESOURCE_SONG+nCamp-1).."<color>Sè l­¬ng th¶o phe ®Þch: <color=yellow>"..GetMissionV(MV_RESOURCE_SONG+nEnemyCamp-1).."<color>");
	else
		Talk(1,"battle_info"," hiÖn kh«ng trong Th¶o Cèc chiÕn.");
	end;
end;

function emplacement_info()
	if BT_GetData(PT_BATTLE_TYPE) == EMPLACEMENT_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;
		local nOccupyTime = 0;
		local nOccupyTimeSong = 0;
		local nOccupyTimeLiao = 0;
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--Èç¹ûÄ¿Ç°»¹Õ¼Áì×ÅÅÚÌ¨
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime;
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime;
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);	
		end;
		Talk(1,"battle_info","§iÓm tÝch lòy c¸ nh©n trong chiÕn tr­êng ph¸o ®µi: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>§iÓm tÝch lòy phe m×nh: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1).."<color><enter>§iÓm tÝch lòy phe ®Þch: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nEnemyCamp-1).."<color><enter>Thêi gian phe Tèng chiÕm lÜnh ph¸o ®µi: <color=yellow>"..Get_Time_String(nOccupyTimeSong).."<color> Thêi gian phe Liªu chiÕm lÜnh ph¸o ®µi: <color=yellow>"..Get_Time_String(nOccupyTimeLiao).."<color>")
	else
		Talk(1,"battle_info"," hiÖn kh«ng trong chiÕn tr­êng ph¸o ®µi.");
	end;
end;

function main_info()
	local nCamp = BT_GetCamp();
	local nEnemyCamp = 3-nCamp;
	if BT_GetData(PT_BATTLE_TYPE) == MAINBATTLE_ID then
		Talk(1,"battle_info","§iÓm tÝch lòy c¸ nh©n: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>§iÓm tÝch lòy phe m×nh: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1).."<color><enter>§iÓm tÝch lòy phe ®Þch: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nEnemyCamp-1).."<color><enter>HiÖu óy phe ®Þch: <color=yellow>"..(12-GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)).."<color> §« thèng phe ®Þch: <color=yellow>"..(6-GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)).."<color> Tiªn phong phe ®Þch: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)).."<color> §¹i t­íng phe ®Þch: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)).."<color><enter>HiÖu óy phe m×nh: <color=yellow>"..(12-GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nCamp-1)).."<color> §« thèng phe m×nh: <color=yellow>"..(6-GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nCamp-1)).."<color> Tiªn phong phe m×nh: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nCamp-1)).."<color> §¹i t­íng phe m×nh: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nCamp-1)).."<color>")
	else
		Talk(1,"battle_info"," hiÖn kh«ng trong Nh¹n M«n Quan chiÕn tr­êng chÝnh.");
	end;
end;


function total_info()
	local selTab = {
				"§iÓm tÝch lòy/my_point_total",
				"Ho¹t ®éng chiÕn tr­êng/my_data_total",
				"trë l¹i/battle_info",
				"KÕt thóc/nothing"
				}
	Say("B¹n muèn xem sè liÖu nµo?",getn(selTab),selTab);
end;

function my_point_total()
	Talk(1,"total_info","Tæng ®iÓm tÝch lòy c¸ nh©n: <color=yellow>"..BT_GetData(PT_TOTALPOINT).."<color> C«ng tr¹ng phe Tèng: <color=yellow>"..BT_GetData(PT_RANKPOINT).."<color> C«ng tr¹ng phe Liªu: <color=yellow>"..(-BT_GetData(PT_RANKPOINT)).."<color> C«ng tr¹ng phe Tèng cao nhÊt: <color=yellow>"..BT_GetData(PT_MAX_RANKPOINT_SONG).."<color> C«ng tr¹ng phe Liªu cao nhÊt: <color=yellow>"..(-BT_GetData(PT_MAX_RANKPOINT_LIAO)).."<color><enter>§iÓm tÝch lòy Th«n trang chiÕn: <color=yellow>"..BT_GetData(PT_VILL_POINT).."<color> §iÓm tÝch lòy Tµi Nguyªn chiÕn: <color=yellow>"..BT_GetData(PT_RESO_POINT).."<color> §iÓm tÝch lòy Ph¸o ®µi chiÕn: <color=yellow>"..BT_GetData(PT_EMPL_POINT).."<color> §iÓm tÝch lòy ChiÕn tr­êng chÝnh: <color=yellow>"..BT_GetData(PT_MAIN_POINT).."<color>")
end;

function my_data_total()
	Talk(1,"total_info","T×nh h×nh ®¬n ®Êu: <color=yellow>"..BT_GetData(PT_SINGLE_WIN).."<color> th¾ng <color=yellow>"..BT_GetData(PT_SINGLE_DRAW).."<color> hßa <color=yellow>"..BT_GetData(PT_SINGLE_LOSE).."<color> thua, sè lÇn vua ban th­ëng: <color=yellow>"..BT_GetData(PT_EMPEROR_AWARD_COUNT).."<color> Sè lÇn ng«i sao chiÕn ®Þa: <color=yellow>"..BT_GetData(PT_BATTLE_STAR_COUNT).."<color><enter>T­íng sÜ phe Tèng bÞ giÕt: <color=yellow>"..BT_GetData(PT_KILL_SONG_PLAYER).."<color> Sè lÇn bÞ phe Tèng giÕt: <color=yellow>"..BT_GetData(PT_KILL_BY_SONG).."<color><enter>T­íng sÜ phe Liªu bÞ giÕt: <color=yellow>"..BT_GetData(PT_KILL_LIAO_PLAYER).."<color> Sè lÇn bÞ phe Liªu giÕt: <color=yellow>"..BT_GetData(PT_KILL_BY_LIAO).."<color><enter>Sè lÇn t×m thÊy thñ lÜnh: <color=yellow>"..BT_GetData(PT_FIND_HEADER).."<color> Sè lÇn giao nép l­¬ng th¶o: <color=yellow>"..BT_GetData(PT_HANDIN_RESOURCE).."<color> Sè lÇn ®o¹t ph¸o ®µi: <color=yellow>"..BT_GetData(PT_KILL_EMPLACEMENT).."<color><enter>Sè lÇn tham gia Th«n trang chiÕn: <color=yellow>"..BT_GetData(PT_ATTEND_VILLAGE).."<color> Sè lÇn tham gia Tµi Nguyªn chiÕn: <color=yellow>"..BT_GetData(PT_ATTEND_RESOURCE).."<color> Sè lÇn tham gia Ph¸o ®µi chiÕn: <color=yellow>"..BT_GetData(PT_ATTEND_EMPLACEMENT).."<color> Sè lÇn tham gia ChiÕn tr­êng chÝnh: <color=yellow>"..BT_GetData(PT_ATTEND_MAIN).."<color><enter>Sè lÇn chiÕn th¾ng Th«n trang chiÕn: <color=yellow>"..BT_GetData(PT_VILLAGE_WIN).."<color> Sè lÇn chiÕn th¾ng Tµi Nguyªn chiÕn: <color=yellow>"..BT_GetData(PT_RESOURCE_WIN).."<color> Sè lÇn chiÕn th¾ng Ph¸o ®µi chiÕn: <color=yellow>"..BT_GetData(PT_EMPLACEMENT_WIN).."<color> Sè lÇn chiÕn th¾ng ChiÕn tr­êng chÝnh: <color=yellow>"..BT_GetData(PT_MAIN_WIN).."<color>");
end;

function other_info()
	if BT_GetData(PT_BATTLE_TYPE) == 0 then
		Talk(1,"battle_info"," hiÖn kh«ng trong chiÕn tr­êng.");
		return 0;
	end;
	local selTab = {
				"Xem sè ng­êi cña c¸c m«n ph¸i trong chiÕn tr­êng/see_faction_player_count",
				--"²é¿´×Ô¼ºµÄÒþ²ØÊý¾Ý/see_secret",
				"Quay l¹i néi dung tr­íc./OnUse",
				"§ãng/nothing",
				}
	Say("Xem tin tøc nµo?",getn(selTab),selTab);
end;

function see_faction_player_count()
	local sContent = "";
	for i=1,7 do
		sContent = sContent..tFaction[i]..": <color=yellow>"..BT_GetFactionPlayerCount(i).."<color> ng­êi ";
		if mod(i,2) == 0 or i == 0 then
			sContent = sContent.."\n";
		end;
	end;
	Talk(1,"other_info",sContent);
end;

function see_secret()
	Talk(1,"other_info","HÖ sè ho¹t ®éng hiÖn t¹i:"..BT_GetData(PTNC_ACTIVITY).." Tin tøc b¸o danh:"..BT_GetData(PT_SIGN_UP).." Thêi gian b¸o danh:"..BT_GetData(PT_BATTLE_DATE).."<enter>HiÖn ë chiÕn tr­êng:"..BT_GetData(PT_BATTLE_TYPE).." Tr¹ng th¸i chiÕn tr­êng hiÖn t¹i:"..GetMissionV(MV_BATTLE_STATE).." TÝch lòy:"..BT_GetData(PTNC_BATTLEPOINT).."");
end;

function know_equip()
	local selTab = {
	    ". Xem thuéc tÝnh trang bÞ ®« thèng /equip_info_dutong",
    	". Xem thuéc tÝnh trang bÞ tiªn phong /equip_info_xianfeng",
    	". Xem thuéc tÝnh trang bÞ Tèng t­íng qu©n/equip_info_jiangjun_song",
    	". Xem thuéc tÝnh trang bÞ Liªu t­íng qu©n/equip_info_jiangjun_liao",
   	 	". Xem thuéc tÝnh trang bÞ Tèng nguyªn so¸i/equip_info_yuanshuai_song",
    	". Xem thuéc tÝnh trang bÞ Liªu nguyªn so¸i/equip_info_yuanshuai_liao",
		"Tr­íc/OnUse",
		"§ãng/nothing",
    	}
    Say("Ng­¬i muèn xem thuéc tÝnh trang bÞ nµo?",getn(selTab),selTab);
end;

function equip_info_dutong()
	Talk(1,"know_equip","Tèng/Liªu §« thèng ChiÕn kh«i: Tèc ®é thi triÓn 12%. Sinh lùc + 5%. TÊt c¶ thuéc tÝnh 6 \nTèng/Liªu §« thèng ChiÕn bµo: Néi, ngo¹i c«ng 8%. Sinh lùc + 5%  TÊt c¶ thuéc tÝnh 6 \nTèng/Liªu §« thèng ChiÕn trang: Tû lÖ gi¶m nöa S¸t th­¬ng 10%. Sinh lùc + 5% . TÊt c¶ thuéc tÝnh 6 \n Thuéc tÝnh trän bé 1: §é bÒn nãn, ¸o, quÇn 600 gi©y håi 2 ®iÓm \nThuéc tÝnh trän bé 2: Mäi tr¹ng th¸i phô x¸c suÊt tr¸nh 10%");
end;

function equip_info_xianfeng()
	Talk(1,"know_equip","Tèng/Liªu tiªn Phong hiÖu kú: Sinh lùc + 15%. Néi, ngo¹i c«ng 5%  \nTèng/Liªu Tiªn phong HiÖu phï: Sinh lùc + 15%. T¨ng 40 ®iÓm s¸t th­¬ng \nThuéc tÝnh trän bé: Tèc ®é di chuyÓn + 15%");
end;

function equip_info_jiangjun_song()
	Talk(1,"know_equip","Tèng t­íng qu©n ChiÕn kh«i: Tèc ®é thi triÓn 25%. Sinh lùc + 15%. Néi, ngo¹i phßng + 80\nTèng t­íng qu©n ChiÕn bµo: Néi, ngo¹i c«ng 15%. Sinh lùc + 15%. Néi, ngo¹i phßng + 80\n Tèng t­íng qu©n ChiÕn trang: Sinh lùc + 15%. Néi lùc + 15%. Néi, ngo¹i phßng + 80\nTèng t­íng qu©n lÖnh bµi: X¸c suÊt xuÊt chiªu 3%. Sinh lùc + 15%. Néi, ngo¹i phßng + 80 \nTèng t­íng qu©n lÖnh kú: 255 tr¸nh lo¹n, ngñ, ng·. Sinh lùc + 15%. Néi, ngo¹i phßng + 80 \nTèng t­íng qu©n lÖnh phï: 25% tr¸nh ®Þnh, mª, kÝch. Sinh lùc + 15%. Néi, ngo¹i phßng + 80");
end;

function equip_info_jiangjun_liao()
	Talk(1,"know_equip","Liªu t­íng qu©n ChiÕn kh«i: Tèc ®é thi triÓn 25%. Sinh lùc + 15%. Néi, ngo¹i phßng + 80\n Liªu t­íng qu©n ChiÕn bµo: Néi ngo¹i c«ng 15%. Sinh lùc + 15%. Néi, ngo¹i phßng + 80\n Liªu t­íng qu©n ChiÕn trang: Sinh lùc + 15%. Néi lùc + 15%. Néi, ngo¹i phßng + 80\n Liªu t­íng qu©n lÖnh bµi: X¸c suÊt xuÊt chiªu 3%. Sinh lùc + 15%. Néi, ngo¹i phßng + 80\n Liªu t­íng qu©n lÖnh kú: 25% tr¸nh ®Þnh, mª, kÝch. Sinh lùc + 15%. Néi, ngo¹i phßng + 80\n Liªu t­íng qu©n lÖnh phï: 25% tr¸nh lo¹n, ngñ, ng·. Sinh lùc + 15%. Néi, ngo¹i phßng + 80");
end;

function equip_info_yuanshuai_song()
	Talk(1,"know_equip","Tèng nguyªn so¸i ChiÕn kh«i: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng Sinh lùc §ång ®éi 20% \nTèng nguyªn so¸i ChiÕn bµo: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng Sinh lùc §ång ®éi mçi nöa gi©y 1% \nTèng nguyªn so¸i chiÕn trang: Sinh lùc + 2000. Néi, ngo¹i phßng + 120  T¨ng Néi lùc §ång ®éi + 20% \nTèng nguyªn so¸i hæ phï: Sinh lùc + 2000. Néi, ngo¹i phßng + 120  T¨ng xuÊt chiªu §ång ®éi +5% \nTèng nguyªn so¸i lÖnh kú: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. Gióp §ång ®éi t¨ng 50% tr¸nh lo¹n, ngñ, ng· \n Tèng nguyªn so¸i hiÖu phï: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng néi, ngo¹i c«ng §ång ®éi+ 15% \nTèng nguyªn so¸i HiÖu kú: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. Gióp §ång ®éi t¨ng 50% tr¸nh ®Þnh, cho¸ng, lui");
end;

function equip_info_yuanshuai_liao()
	Talk(1,"know_equip","Liªu nguyªn so¸i ChiÕn kh«i: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng Sinh lùc §ång ®éi + 20% \nLiªu nguyªn so¸i ChiÕn bµo: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. Håi phôc sinh lùc §ång ®éi mçi nöa gi©y 1% \nLiªu nguyªn so¸i ChiÕn trang: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng Néi lùc §ång ®éi + 20% \nLiªu nguyªn so¸i hæ phï: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng néi, ngo¹i c«ng §ång ®éi + 15% \nLiªu nguyªn so¸i LÖnh kú: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. Gióp ®ång ®éi t¨ng 50% tr¸nh ®Þnh, cho¸ng, lui \nLiªu nguyªn so¸i HiÖu phï: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. T¨ng xuÊt chiªu §ång ®éi + 5% \nLiªu nguyªn so¸i HiÖu kú: Sinh lùc + 2000. Néi, ngo¹i phßng + 120. Gióp ®ång ®éi t¨ng 50% tr¸nh lo¹n, ngñ, ng·");
end;









