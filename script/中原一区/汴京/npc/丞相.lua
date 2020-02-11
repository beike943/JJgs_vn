Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

THIS_RELAY_CALLBACK_SCRIPT = "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\Ø©Ïà.lua";
g_szInfoHeader = "<color=green>TriÖu Phæ<color>:";
g_nBuChangBeginDate = 2008080100;	--²¹³¥¿ªÊ¼Ê±¼ä
g_nBuChangEndDate = 2008080920;	--²¹³¥½áÊøÊ±¼ä¡£Èç¹ûÎª0Ôò±íÊ¾²»¿ª·Å²¹³¥
if IB_VERSION == 0 then
	g_nMaxBuChangTimes = 1;			--ÊÕ·ÑÇø±¾´Î±¾´Î²¹³¥Õ½³¡½±Àø´ÎÊý
else
	g_nMaxBuChangTimes = 1;			--Ãâ·ÑÇø±¾´Î±¾´Î²¹³¥Õ½³¡½±Àø´ÎÊý
end;
g_nReputation = 500;		--²¹³¥µÄÉùÍû
g_nContribute = 300;		--²¹³¥µÄÊ¦ÃÅ¹±Ï×¶È
--=====================================================================
TSK_BATTLEBUCHANG = 815;	--¼ÇÂ¼ÊÇ·ñ²ÎÓë¹ý±¾´Î²¹³¥£¬¼ÇÂ¼µÄÖµÓ¦Îªg_nBuChangEndDate
TSK_BUCHANG_TIMES = 808;	--¼ÇÂ¼±¾´ÎÁìÈ¡ÁË¶àÉÙ´ÎÕ½³¡²¹³¥
TSK_NORMAL_BUCHANG = 809	--¼ÇÂ¼±¾´ÎÊÇ·ñÁìÈ¡ÁËÆÕÍ¨²¹³¥

-- VNG chøc n¨ng Nguyªn So¸i TiÕn Cö, T­íng Qu©n TiÕn Cö
TSK_NGUYENSOAI = 2541
BYTE_TIENPHONG = 1
BYTE_TUONGQUAN = 2
BYTE_WEEK = 3
BYTE_DAY = 4

-- VNG chøc n¨ng b¶o vÖ c«ng tr¹ng chuyÓn server
TSK_TRANS_POINT = 2150
TSK_TRANS_DATE  = 2151

tbJUNGONGZHANG = 
{
	[1] = {"Qu©n C«ng Ch­¬ng",2,1,9999,2},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,5},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,10},
}

TB_BATTLE_EQUIP = 
{
	[1] = 
	{
		[SONG_ID] = 
				{
					{"Tèng tiªn phong hiÖu kú",0,102,2261,-1},
					{"Tèng tiªn phong hiÖu phï",0,102,2265,-1},
				},                         
		[LIAO_ID] = 
				{                          
					{"Liªu tiªn phong hiÖu kú",0,102,2271,-1},
					{"Liªu tiªn phong hiÖu phï",0,102,2275,-1},
				}
	},
	[2] = 
	{
		[SONG_ID] = 
				{
					{"Tèng t­íng qu©n ®Çu kh«i",0,103,2241,0},
					{"Tèng t­íng qu©n chiÕn bµo",0,100,2241,1},
					{"Tèng t­íng qu©n chiÕn phôc",0,101,2241,3},
					{"Tèng t­íng qu©n lÖnh bµi",0,102,2281,-1},
					{"Tèng lÖnh phï",0,102,2521,-1},
					{"Tèng t­íng qu©n cê lÖnh",0,102,2285,-1},				
	         	},
       	[LIAO_ID] = 
	       		{                
					{"Liªu t­íng qu©n ®Çu kh«i",0,103,2245,0},
					{"Liªu t­íng qu©n chiÕn bµo",0,100,2245,1},
					{"Liªu t­íng qu©n chiÕn phôc",0,101,2245,3},
					{"Liªu t­íng qu©n lÖnh bµi",0,102,2291,-1},
					{"Liªu t­íng qu©n cê lÖnh",0,102,2295,-1},
					{"Liªu lÖnh phï",0,102,2531,-1},
				}
	},
	[3] = 
	{
		[SONG_ID] = 
				{
					{"Tèng nguyªn so¸i ®Çu kh«i",0,103,2251,0},
					{"Tèng nguyªn so¸i chiÕn bµo",0,100,2251,1},
					{"Tèng nguyªn so¸i chiÕn phôc",0,101,2251,3},
					{"Tèng so¸i kú",0,102,2505,-1},  
					{"Tèng so¸i phï",0,102,2501,-1},
					{"Tèng nguyªn so¸i lÖnh kú",0,102,2305,-1}, 
					{"Tèng nguyªn so¸i hæ phï",0,102,2301,-1},										          
				},
		[LIAO_ID] = 
				{                          
					{"Liªu nguyªn so¸i ®Çu kh«i",0,103,2255,0},
					{"Liªu nguyªn so¸i chiÕn bµo",0,100,2255,1},
					{"Liªu nguyªn so¸i chiÕn phôc",0,101,2255,3},
					{"Liªu nguyªn so¸i lÖnh kú",0,102,2315,-1},
					{"Liªu nguyªn so¸i hæ phï",0,102,2311,-1},
					{"Liªu so¸i kú",0,102,2515,-1},
					{"Liªu so¸i phï",0,102,2511,-1},														
				}
	},
	[4] =
	{
		[SONG_ID] = {
					{"Tèng-VÜnh ViÔn Nguyªn So¸i §Çu Kh«i",0,103,3000,0},
					{"Tèng-VÜnh ViÔn Nguyªn So¸i ChiÕn Gi¸p ",0,100,3000,1},
					{"Tèng-VÜnh ViÔn Nguyªn So¸i ChiÕn phôc",0,101,3000,3},
					{"Tèng-VÜnh ViÔn Nguyªn So¸i Hæ phï",0,102,3000,-1},
					{"Tèng-VÜnh ViÔn Nguyªn So¸i LÖnh kú",0,102,3004,-1},
					{"Tèng-VÜnh ViÔn Nguyªn So¸i HiÖu phï",0,102,3008,-1},
					{"Tèng-VÜnh ViÔn Nguyªn So¸i HiÖu kú",0,102,3012,-1},
					},
		[LIAO_ID] = {
					{"Liªu-VÜnh ViÔn Nguyªn So¸i §Çu Kh«i",0,103,3004,0},
					{"Liªu-VÜnh ViÔn Nguyªn So¸i ChiÕn Gi¸p ",0,100,3004,1},
					{"Liªu-VÜnh ViÔn Nguyªn So¸i ChiÕn phôc",0,101,3004,3},
					{"Liªu-VÜnh ViÔn Nguyªn So¸i HiÖu phï",0,102,3024,-1},
					{"Liªu-VÜnh ViÔn Nguyªn So¸i HiÖu kú",0,102,3028,-1},
					{"Liªu-VÜnh ViÔn Nguyªn So¸i Hæ phï",0,102,3016,-1},
					{"Liªu-VÜnh ViÔn Nguyªn So¸i LÖnh kú",0,102,3020,-1},					
					},
	},
	[5] =
	{
		[SONG_ID] = {
					{"Tèng T­íng Qu©n ChiÕn Kh«i",0,103,3016,0},
					{"Tèng T­íng Qu©n ChiÕn Bµo",0,100,3016,1},
					{"Tèng T­íng Qu©n ChiÕn Trang",0,101,3016,3},
					{"Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi",0,102,3032,-1},
					{"Thiªn Chi Tèng T­íng Qu©n LÖnh Kú",0,102,3036,-1},
					{"Thiªn Chi Tèng T­íng Qu©n LÖnhPhï",0,102,3040,-1},
					},
		[LIAO_ID] = {
					{"Liªu T­íng Qu©n ChiÕn Kh«i",0,103,3020,0},
					{"Liªu T­íng Qu©n ChiÕn Bµo",0,100,3020,1},
					{"Liªu T­íng Qu©n ChiÕn Trang",0,101,3020,3},
					{"Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi",0,102,3044,-1},
					{"Thiªn Chi Liªu T­íng Qu©n LÖnh Phï",0,102,3052,-1},
					{"Thiªn Chi Liªu T­íng Qu©n LÖnh Kú",0,102,3048,-1},		
					},
	},	
	[6] =
	{
		[SONG_ID] = {
					{"§¹i Tèng Nguyªn So¸i ChiÕn Kh«i",0,103,3024,0},
					{"§¹i Tèng Nguyªn So¸i ChiÕn Bµo",0,100,3024,1},
					{"§¹i Tèng Nguyªn So¸i ChiÕn Trang",0,101,3024,3},
					{"§¹i Tèng Nguyªn So¸i Hæ Phï",0,102,3056,-1},
					{"§¹i Tèng Nguyªn So¸i LÖnh Kú",0,102,3060,-1},
					{"§¹i Tèng Nguyªn So¸i HiÖu Phï",0,102,3064,-1},
					{"§¹i Tèng Nguyªn So¸i HiÖu Kú",0,102,3068,-1},
					},
		[LIAO_ID] = {
					{"§¹i Liªu Nguyªn So¸i ChiÕn Kh«i",0,103,3028,0},
					{"§¹i Liªu Nguyªn So¸i ChiÕn Bµo",0,100,3028,1},
					{"§¹i Liªu Nguyªn So¸i ChiÕn Trang",0,101,3028,3},
					{"§¹i Liªu Nguyªn So¸i HiÖu Phï",0,102,3080,-1},
					{"§¹i Liªu Nguyªn So¸i HiÖu Kú",0,102,3084,-1},	
					{"§¹i Liªu Nguyªn So¸i Hæ Phï",0,102,3072,-1},
					{"§¹i Liªu Nguyªn So¸i LÖnh Kú",0,102,3076,-1},
		
					},
	},
	[7] =
	{
		[SONG_ID] = {
					{"Ngù Long Nguyªn So¸i ChiÕn Kh«i",0,103,3008,0},
					{"Ngù Long Nguyªn So¸i ChiÕn Gi¸p",0,100,3008,1},
					{"Ngù Long Nguyªn So¸i ChiÕn Trang",0,101,3008,3},
					{"Ngù Long Nguyªn So¸i Hæ Phï",0,102,3088,-1},
					{"Ngù Long Nguyªn So¸i LÖnh Kú",0,102,3092,-1},
					{"Ngù Long Nguyªn So¸i HiÖu Phï",0,102,3096,-1},
					{"Ngù Long Nguyªn So¸i HiÖu Kú",0,102,3100,-1},
					},
		[LIAO_ID] = {
					{"Chiªu Th¸nh Nguyªn So¸i Kh«i",0,103,3012,0},
					{"Chiªu Th¸nh Nguyªn So¸i ChiÕn Gi¸p",0,100,3012,1},
					{"Chiªu Th¸nh Nguyªn So¸i ChiÕnTrang",0,101,3012,3},
					{"Chiªu Th¸nh Nguyªn So¸i HiÖu Phï",0,102,3112,-1},
					{"Chiªu Th¸nh Nguyªn So¸i HiÖu Kú",0,102,3116,-1},	
					{"Chiªu Th¸nh Nguyªn So¸i Hæ Phï",0,102,3104,-1},					
					{"Chiªu Th¸nh Nguyªn So¸i LÖnh Kú",0,102,3108,-1},
					},
	},		
}

function main()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nDate = tonumber(date("%Y%m%d"));
	local selTab = {}
--	tinsert("V·n bèi ®Õn ®Ó nhËn l¹i nh÷ng mãn ®å bÞ mÊt/apply_indemnitor")
	tinsert(selTab, "V·n bèi nhê ngµi t©u víi Hoµng Th­îng cho gia nhËp b¶n quèc/change_nationality")
	tinsert(selTab, "V·n bèi muèn s¾p xÕp mét sè viÖc cña nhiÖm vô s­ m«n/main_sub")
--	tinsert(selTab, "Ta muèn ®æi trang bÞ phe "..tCampNameZ[nEnemyCamp].." sang trang bÞ phe "..tCampNameZ[nCurCamp].."/change_battle_equip")
	tinsert(selTab, "Ta muèn tiÕn cö anh hïng cho phe "..tCampNameZ[nCurCamp].."/introduce_rank")
	if nDate > 20131004 then --t¹m ®ãng ®Ó ®¨ng ký thi ®Êu BHTA 10
		tinsert(selTab, "Ta muèn ®æi qu©n c«ng cña ®èi ph­¬ng/apply_jungong_change")
	end
	tinsert(selTab, "Ta muèn b¶o toµn qu©n c«ng khi chuyÓn server/apply_jungong_save")	
	--tinsert(selTab, "Hñy bá kÝch ho¹t sö dông §Çu Thµnh TÝn, §Çu Thµnh Th­, §Çu Thµnh BiÓu/turn_off")

	
	--local nYear,nMonth,nDay,nHour = get_date(g_nBuChangEndDate);
	--if g_nBuChangEndDate ~= 0 and nDate >= g_nBuChangBeginDate and nDate <= g_nBuChangEndDate then
	--	tinsert(selTab,format("Ta muèn nhËn båi th­êng (KÕt thóc: N¨m %d Th¸ng %d Ngµy %d %d giê)/get_compensation",nYear,nMonth,nDay,nHour));
	--end;
	tinsert(selTab,"Kh«ng cã g×/nothing");
	Say("L·o phu lµ thõa t­íng cña triÒu ®×nh, t×m ta cã viÖc g× kh«ng?",getn(selTab),selTab);
end

function turn_off()
	SetTask(2154,0)
	Say("Hñy bá kÝch ho¹t sö dông vËt phÈm thµnh c«ng.",0)
	WriteLogEx("Chuyen doi cong trang","hñy bá kÝch ho¹t",tonumber(date("%Y%m%d%H%M")))
end

function get_date(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear,nMonth,nDay,nHour;
end;

function apply_indemnitor()
	local nRet = ApplyIndemnitor()
	if (nRet == 0) then
		Talk(1, "", "L·o phu ch¼ng gi÷ mãn ®å nµo cña ng­¬i c¶")
	else
		Talk(1, "", "Xin nhËn lÊy!")
	end
end;

function main_sub()
	local nTaskValuem = FN_GetTaskState(FN_YMM)
	if (nTaskValuem == 2) then
		task_005()
		return
	elseif (nTaskValuem == 3) then
		Say("Cöa chÝnh cña Hoµng cung cã rÊt nhiÒu cÊm qu©n.", 0)
		return
	elseif (nTaskValuem == 4) then
		task_009()
		return
	end

	UWorld1503 = GetTask(1503)
	if(GetLevel() > 1 and UWorld1503 < 15) then
		if(UWorld1503 == 0) then
			Say("Th¸i tæ b¨ng hµ, hoµng ®Õ míi lªn ng«i, trong triÒu cßn nhiÒu chuyÖn ch­a gi¶i quyÕt. Cã thÓ gióp ta kh«ng?",
				2,
				"§ång ý/W1503_yes",
				"Kh«ng gióp/W1503_no")
		end
		if(UWorld1503 == 5 ) then
			Talk(1, "", "Mau ®Õn t×m vÖ binh thµnh m«n!")
      	end
		if(UWorld1503 == 10) then
			Talk(1, "", "Nhanh vËy sao? §©y cã chót lÔ vËt tÆng ng­¬i.")
			SetTask(1503,15)
			ModifyExp(150)
			Earn(250)
			ModifyReputation(2, 0)
			TaskTip("Hoµn thµnh nhiÖm vô gióp thõa t­íng t×m vÖ binh thµnh m«n.")
		end		
	else
		i = random(1, 4)
		if (i == 1) then
			Talk(1, "", "Khã kh¨n l¾m míi dÑp ®­îc B¾c H¸n nay ph¶i ®èi ®Êu víi Liªu Quèc, xem ra ph¶i nghÜ c¸ch kh¸c æn ®Þnh d©n chóng th«i!")
		elseif (i == 2) then
			Talk(1, "", "Lóc tiªn ®Õ cßn sèng tõng nãi BiÖn L­¬ng lµ n¬i chiÕn tranh liªn miªn kh«ng thÝch hîp lËp n­íc, xem ra còng ®óng!")
		elseif (i == 3) then
			Talk(1, "", "Giê lµm thõa t­íng míi biÕt ®­îc c¸ch trÞ quèc kh«ng dÔ chót nµo! Nãng n¶y lµ háng hÕt.")
		else
			Talk(1, "", "NhÊt thèng thiªn h¹, cÇn chiªu n¹p hiÒn tµi!")
		end
	end
end;

function W1503_yes()
	Talk(1,"","Nha m«n kh«ng ®ñ ng­êi, mau gióp ta t×m vÖ binh thµnh m«n d¸n c¸o thÞ th«ng b¸o cho mäi ng­êi biÕt tin th¸i tæ b¨ng hµ, hoµng ®Õ míi lªn vua.")
	Talk(1,"","T¹i h¹ ®i ngay!")
	SetTask(1503,5)
	--AddNote("½Óµ½ÈÎÎñ£º°ïÖúÔ×ÏàÕÔÆÕÈ¥ÕÒ³ÇÃÅÎÀ±ø¡£")
	TaskTip("NhËn nhiÖm vô: Gióp thõa t­íng TriÖu Phæ t×m vÖ binh thµnh m«n.")
end;

function W1503_no()
end;

tb_introduce_rank = {
	[1] = {"Tiªn Phong", BYTE_TIENPHONG, 3, 2, 1, 0, 120000, 4},
	[2] = {"T­íng Qu©n", BYTE_TUONGQUAN, 4, 3, 1, 1, 250000, 5},
}

function introduce_rank()
	if abs(GetTask(704)) < 5 then
		Talk(1,"",g_szInfoHeader.."ChØ cã <color=yellow>Nguyªn So¸i<color> vµ <color=yellow>T­íng Qu©n<color> míi cã thÓ tiÕn cö ng­êi tµi!")
		return 0
	end
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local tSay = {"Ta muèn tiÕn cö "..tCampNameZ[nCurCamp].." Tiªn phong/#offer_rank(1,"..nCurCamp..")",}
	if abs(GetTask(704)) == 6 then
		tinsert(tSay, "Ta muèn tiÕn cö "..tCampNameZ[nCurCamp].." T­íng qu©n/#offer_rank(2,"..nCurCamp..")")
	end
	tinsert(tSay, "Kh«ng cã g×/nothing")	
	Say(g_szInfoHeader.."<color=yellow>Nguyªn So¸i<color> cã thÓ tiÕn cö <color=yellow>3 Tiªn Phong<color> vµ <color=yellow>4 T­íng Qu©n<color> cïng phe, <color=yellow>T­íng Qu©n<color> cã thÓ tiÕn cö 2 Tiªn Phong cïng phe. Tiªn Phong tiÕn cö <color=yellow>cÇn 120000 ®iÓm qu©n c«ng, 2 N÷ Oa Tinh Th¹ch <color>. T­íng Qu©n tiÕn cö <color=yellow>cÇn 2500000 ®iÓm qu©n c«ng, 3 N÷ Oa Tinh Th¹ch<color>. <color=red>Chó ý: qu©n hµm tiÕn cö chØ cã hiÖu lùc trong tuÇn. §Õn 21 giê thø 7 h»ng tuÇn sÏ xÐt l¹i qu©n hµm.<color>",getn(tSay),tSay);
end

function offer_rank(nType,nCurCamp)	
	if tonumber(date("%w")) ~= 0 then
		Talk(1,"",g_szInfoHeader.."HiÖn t¹i ®¹i qu©n ®· xuÊt ph¸t, kh«ng thÓ bæ sung qu©n lùc! ChØ cã thÓ tiÕn cö vµo ngµy Chñ NhËt!")
		return 0
	end
	if GetTeamSize() < 2 then
		Talk(1,"",g_szInfoHeader.."Ta kh«ng thÊy ng­¬i dÉn theo ng­êi muèn tiÕn cö. H·y tæ ®éi víi ng­êi ®ã ®Õn ®©y gÆp ta!")
		return 0
	elseif GetTeamSize() > 2 then
		Talk(1,"",g_szInfoHeader.."Mçi lÇn chØ cã thÓ tiÕn cö 1 ng­êi. H·y ®iÒu chØnh l¹i tæ ®éi!")
		return 0
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"",g_szInfoHeader.."H·y th«ng b¸o ®éi tr­ëng ®Õn gÆp ta!")
		return 0	
	end
	
	local nCurWeek = tonumber(date("%W"))
	local nCurDay = tonumber(date("%d"))
	local nTaskVal = GetTask(TSK_NGUYENSOAI)
	local nWeek =GetByte(nTaskVal,BYTE_WEEK)
	local nDay =GetByte(nTaskVal,BYTE_DAY)
	
	if nWeek ~= nCurWeek and nCurDay ~= nDay then
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[1][2],0)
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[2][2],0)
		nTaskVal = SetByte(nTaskVal,BYTE_WEEK,nCurWeek)
		nTaskVal = SetByte(nTaskVal,BYTE_DAY,nCurDay)
		SetTask(TSK_NGUYENSOAI, nTaskVal)
	end
	
	nTaskVal = GetTask(TSK_NGUYENSOAI)
	if GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= tb_introduce_rank[nType][3] then
		Talk(1,"",g_szInfoHeader.."TuÇn nµy <color=yellow>Nguyªn So¸i<color> ®· tiÕn cö  "..tb_introduce_rank[nType][3].." "..tb_introduce_rank[nType][1].." cho triÒu ®×nh råi. Qu¶ lµ may m¾n cho triÒu ®×nh!")
		return 0
	end
	if abs(GetTask(704)) == 5 and GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= 2 then
		Talk(1,"",g_szInfoHeader.."TuÇn nµy <color=yellow>T­íng Qu©n<color> ®· tiÕn cö  2 "..tb_introduce_rank[nType][1].." cho triÒu ®×nh råi. Qu¶ lµ may m¾n cho triÒu ®×nh!")
		return 0
	end
			
	local szOfferName = ""
	local nOfferCamp = 0;
	local nOfferPoint = 0;
	local nOfferRank = 0;
	
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
				nOfferRank = GetTask(704)	
				nOfferPoint = GetTask(701)				
				if nOfferRank >= 0 then
					nOfferCamp = SONG_ID;
				else
					nOfferCamp = LIAO_ID;
				end;	
				break;
			end
		end
	end
	PlayerIndex = OldPlayer;
	
	if nCurCamp ~= nOfferCamp then
		if abs(GetTask(704)) == 6 then
			Talk(1,"",g_szInfoHeader.."§Ó ®Ò phßng gian tÕ, <color=yellow>Nguyªn So¸i<color> kh«ng nªn tiÕn cö ng­êi cña phe ®Þch!")
		else
			Talk(1,"",g_szInfoHeader.."§Ó ®Ò phßng gian tÕ, <color=yellow>T­íng Qu©n<color> kh«ng nªn tiÕn cö ng­êi cña phe ®Þch!")
		end
		return 0
	end
	
	if abs(nOfferRank) >= tb_introduce_rank[nType][8] then
		Talk(1,"",g_szInfoHeader.."Ng­êi ®­îc tiÕn cö ®· cã qu©n hµm "..tb_introduce_rank[nType][1].."  råi! Kh«ng cÇn tiÕn cö n÷a!")
		return 0
	end
	
	if abs(nOfferPoint) < tb_introduce_rank[nType][7] then
		Say(g_szInfoHeader.."HiÖn nay triÒu ®×nh ®ang tuyÓn mé nh©n tµi ®Ó trÊn ¶i biªn c­¬ng, b¶o vÖ ®Êt n­íc. Ta nhËn thÊy n¨ng lùc cña <color=yellow>"..szOfferName.."<color> ch­a ®ñ ®Ó tiÕn cö. <color=yellow>Nguyªn So¸i<color> h·y t×m ng­êi cã kh¶ n¨ng h¬n!",1,"ThËt ng¹i qu¸! Ta sÏ quay l¹i sau!/nothing")
		return 0
	else
		if abs(GetTask(704)) == 6 then
			Say(g_szInfoHeader.."HiÖn nay triÒu ®×nh ®ang tuyÓn mé nh©n tµi ®Ó trÊn ¶i biªn c­¬ng, b¶o vÖ ®Êt n­íc. Ta nhËn thÊy <color=yellow>"..szOfferName.."<color> v¨n vâ song toµn. <color=yellow>Nguyªn So¸i<color> muèn tiÕn cö ng­êi nµy ph¶i kh«ng?",2,"§óng vËy! H·y t©u víi hoµng th­îng gióp ta!/#confirm_offer_rank("..nType..","..nCurCamp..")","Ta ch­a muèn tiÕn cö ng­êi nµy!/nothing")
		else
			Say(g_szInfoHeader.."HiÖn nay triÒu ®×nh ®ang tuyÓn mé nh©n tµi ®Ó trÊn ¶i biªn c­¬ng, b¶o vÖ ®Êt n­íc. Ta nhËn thÊy <color=yellow>"..szOfferName.."<color> v¨n vâ song toµn. <color=yellow>T­íng Qu©n<color> muèn tiÕn cö ng­êi nµy ph¶i kh«ng?",2,"§óng vËy! H·y t©u víi hoµng th­îng gióp ta!/#confirm_offer_rank("..nType..","..nCurCamp..")","Ta ch­a muèn tiÕn cö ng­êi nµy!/nothing")
		end
	end
end

function confirm_offer_rank(nType,nCurCamp)
	local szOfferName = ""
	local szPlayerName = GetName()
	local nOK = 1
	local nForce = 1
	if nCurCamp == LIAO_ID then
		nForce = -1
	end
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
								
				if GetItemCount(2,1,504) < tb_introduce_rank[nType][4] then
					nOK = 0
					Say(g_szInfoHeader.."N÷ Oa Tinh Th¹ch trªn ng­êi cña c¸c h¹ kh«ng ®ñ!",0)
					Say2SomeOne(OldPlayer,g_szInfoHeader.."N÷ Oa Tinh Th¹ch trªn ng­êi cña "..szOfferName.." kh«ng ®ñ!",0)
					PlayerIndex = OldPlayer
					return 0
				end
				
--				if GetItemCount(2,1,537) < tb_introduce_rank[nType][5] then
--					nOK = 0
--					Say(g_szInfoHeader.."C¸c h¹ ch­a cã ®ñ Tö Kim Hång Bao!",0)
--					Say2SomeOne(OldPlayer,g_szInfoHeader.."Tö Kim Hång Bao trªn ng­êi cña "..szOfferName.." kh«ng ®ñ!",0)
--					PlayerIndex = OldPlayer
--					return 0
--				end
--				
--				if GetItemCount(2,1,539) < tb_introduce_rank[nType][6] then
--					nOK = 0
--					Say(g_szInfoHeader.."C¸c h¹ ch­a cã ®ñ Hoµng Kim §¹i Hång Bao!",0)
--					Say2SomeOne(OldPlayer,g_szInfoHeader.."Hoµng Kim §¹i Hång Bao trªn ng­êi cña "..szOfferName.." kh«ng ®ñ!",0)
--					PlayerIndex = OldPlayer
--					return 0
--				end
				
				if DelItem(2,1,504,tb_introduce_rank[nType][4]) == 1 then	--and DelItem(2,1,537,tb_introduce_rank[nType][5]) == 1 and DelItem(2,1,539,tb_introduce_rank[nType][6]) == 1
					SetTask(704,nForce * tb_introduce_rank[nType][8])
					Say(g_szInfoHeader.."TriÒu ®×nh nghe danh c¸c h¹ ®· l©u. Nay phong cho c¸c h¹ chøc <color=green>"..tb_introduce_rank[nType][1].."<color>! H·y dèc søc v× triÒu ®×nh!",0)				
				end				
			end
		end		
	end
	PlayerIndex = OldPlayer
	
	if nOK == 0 then
		return 0
	end
	
	local nVal = GetByte(GetTask(TSK_NGUYENSOAI),tb_introduce_rank[nType][2])
	nVal = SetByte(GetTask(TSK_NGUYENSOAI), tb_introduce_rank[nType][2], nVal +1)
	SetTask(TSK_NGUYENSOAI,nVal)
	if abs(GetTask(704)) == 6 then
		WriteLogEx("Nguyen Soai tien cu ",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[Hoµng ®Õ ban chiÕu]: nhËn ®­îc tiÕn cö cña <color=green>"..tCampNameZ[nCurCamp].." Nguyªn So¸i<color> <color=yellow>"..GetName().."<color>, nay phong cho <color=yellow>"..szOfferName.."<color> lµm <color=green>"..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1].."<color>! ThËt lµ tin mõng cho §¹i "..tCampNameZ[nCurCamp].."!" )
		Say(g_szInfoHeader.."TiÕn cö hoµn tÊt, <color=yellow>"..szOfferName.."<color> ®· trë thµnh "..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1]..". Chóc mõng Nguyªn So¸i!",1,"Xin ®a t¹!/nothing")
	else
		WriteLogEx("Tuong Quan tien cu ",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[Hoµng ®Õ ban chiÕu]: nhËn ®­îc tiÕn cö cña <color=green>"..tCampNameZ[nCurCamp].." T­íng Qu©n<color> <color=yellow>"..GetName().."<color>, nay phong cho <color=yellow>"..szOfferName.."<color> lµm <color=green>"..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1].."<color>! ThËt lµ tin mõng cho §¹i "..tCampNameZ[nCurCamp].."!" )
		Say(g_szInfoHeader.."TiÕn cö hoµn tÊt, <color=yellow>"..szOfferName.."<color> ®· trë thµnh "..tCampNameZ[nCurCamp].." "..tb_introduce_rank[nType][1]..". Chóc mõng T­íng Qu©n!",1,"Xin ®a t¹!/nothing")
	end
end

function change_battle_equip()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {
				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ Tiªn phong/#select_equip_type(1,"..nCurCamp..")",
				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ T­íng qu©n/#select_equip_type(2,"..nCurCamp..")",
--				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ Nguyªn so¸i/#select_equip_type(3,"..nCurCamp..")",
--				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ VÜnh ViÔn Nguyªn So¸i /#select_equip_type(4,"..nCurCamp..")",
--				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ Thiªn Chi T­íng Qu©n/#select_equip_type(5,"..nCurCamp..")",
--				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ Thiªn Chi Nguyªn So¸i/#select_equip_type(6,"..nCurCamp..")",
--				"Ta muèn ®æi "..tCampNameZ[nCurCamp].."Trang bÞ Thiªn Chi Nguyªn So¸i vÜnh viÔn/#select_equip_type(7,"..nCurCamp..")",
				"Kh«ng cã g×/nothing",
				}
	local szString = "";
	if IB_VERSION == 1 then
		szString = "vµ hiÖu qu¶ ®Þnh hån";
	end;
	Say(g_szInfoHeader.."Ng­¬i muèn ®æi trang bÞ? <color=red>Chó ý: §¼ng cÊp c­êng hãa kh«ng thay ®æi, "..szString.." biÕn mÊt. Sau khi chuyÓn qu©n c«ng, nÕu kh«ng thÓ ®æi, cã thÓ lµ do qu©n hµm ch­a ®­îc cËp nhËt kÞp thêi, vui lßng sau khi xÕp h¹ng lóc 9h tèi vµo thø 7 míi ®Õn t×m ta.<color>",getn(selTab),selTab);
end;

function select_equip_type(nType,nCurCamp)
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {};
	local szCurCampEquipName = "";
	local szEnemyCampEquipName = "";
	for i=1,getn(TB_BATTLE_EQUIP[nType][nEnemyCamp]) do
		szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][i][1];
		szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][i][1];
		selTab[i] = "Ta muèn ®æi "..szCurCampEquipName.." (cÇn 250 vµng vµ "..szEnemyCampEquipName..")/#get_battle_equip_confirm("..nType..","..nCurCamp..","..i..")";
	end;
	tinsert(selTab,"§Ó ta nghÜ l¹i/nothing");
	local szString = "";
	if IB_VERSION == 1 then
		szString = " hiÖu qu¶ ®Þnh hån biÕn mÊt";
	end;
	Say(g_szInfoHeader.."Ng­¬i muèn ®æi trang bÞ nµo trong ®©y? <color=red>Chó ý: Trang bÞ sau khi ®æi ®¼ng cÊp c­êng hãa kh«ng thay ®æi, "..szString..".<color>",getn(selTab),selTab);
end;

function get_battle_equip_confirm(nType,nCurCamp,nEquipIdx)
	local selTab = {
				"§ång ý/#get_battle_equip("..nType..","..nCurCamp..","..nEquipIdx..")",
				"Hñy bá/nothing",
				}
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	local szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	Say(g_szInfoHeader.."Ng­¬i x¸c nhËn muèn ®æi <color=yellow>"..szCurCampEquipName.." (cÇn 250 vµng vµ "..szEnemyCampEquipName..")<color> chø? <color=yellow>Chó ý: NÕu ®æi M·o, Th­îng y, H¹ y th× ng­¬i ph¶i mÆc trang bÞ vµo ng­êi.<color>",getn(selTab),selTab);
end;

function get_battle_equip(nType,nCurCamp,nEquipIdx)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return 0;
	end
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nBody = GetBody();
	local nDelID1,nDelID2,nDelID3,nTypeID = 0,0,0,-1;
	local nID1,nID2,nID3 = 0,0,0;
	local nUpgrade = 0;
	local szDelItemName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	nDelID1 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][2];
	nDelID2 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][3];
	nDelID3 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][4];
	nTypeID = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][5];
	local szItemName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	nID1 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][2];
	nID2 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][3];
	nID3 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][4];		
	if nTypeID ~= -1 then
		local nG,nD,nP = GetPlayerEquipInfo(nTypeID)
		if ((nG ~= nDelID1) or (nD ~= nDelID2) or (nP ~= nDelID3+nBody-1)) then
			Talk(1,"change_battle_equip",g_szInfoHeader.."Ph¶i cã <color=yellow>"..szDelItemName.."<color> míi cã thÓ ®æi thµnh <color=yellow>"..szItemName.."<color>.");
			return 0;
		end		
		local nItemIdx = GetPlayerEquipIndex(nTypeID)		
		nUpgrade = GetEquipAttr(nItemIdx,2) or 0
		UnEquipAtPosition(nTypeID)
	end	
	local nDelItemCount = GetItemCount(nDelID1,nDelID2,nDelID3+nBody-1);
	if nDelItemCount > 1 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."Ng­¬i mang theo qu¸ nhiÒu <color=yellow>"..szDelItemName.."<color>, muèn ta ®æi cho ng­¬i c¸i nµo? Ng­¬i nªn s¾p xÕp l¹i hµnh trang, <color=yellow> ®em c¸i ng­¬i muèn ®æi ®Ó l¹i ®©y. <color>");
		return 0;
	end;
	if nDelItemCount <= 0 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."Ph¶i cã <color=yellow>"..szDelItemName.."<color> míi cã thÓ ®æi thµnh <color=yellow>"..szItemName.."<color>.");
		return 0;
	end;
	if GetCash() < 2500000 then
		Talk(1,"",g_szInfoHeader.."Vµng trªn ng­êi ng­¬i kh«ng ®ñ, ®ñ <color=yellow>100 l­îng<color> míi cã thÓ ®æi trang bÞ nµy.");
		return 0;
	end;
	if DelItem(nDelID1,nDelID2,nDelID3+nBody-1,1) == 1 then
		Pay(2500000);
		local nRetCode = AddItem(nID1,nID2,nID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,nUpgrade);
		if nRetCode == 1 then
			Msg2Player("B¹n ®· nhËn ®­îc 1 "..szItemName);
			WriteLog("[Trang bÞ chiÕn tr­êng ®æi]:"..GetName().."§· ®æi 1"..szDelItemName);
		else
			WriteLog("[Trang bÞ chiÕn tr­êng ®æi bÞ lçi]:"..GetName().."§æi"..szDelItemName.."AddItem gÆp lçi, nRetCode:"..nRetCode);
		end;
	end;
end;

function apply_jungong_save()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanBaoLuuCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanBaoLuuCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"",g_szInfoHeader .. "HiÖn t¹i ch­a ®Õn lóc më tÝnh n¨ng nµy, ng­¬i h·y quay l¹i sau nhÐ.")
			return 0
		end
	end
		
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ph­¬ng ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H·y ®Õn gÆp TiÓu Ngäc ®Ó tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta.");
			return 0;	
		end	
	end

	local selTab = 	{
								"H·y gióp ta b¶o l­u ®iÓm qu©n c«ng/apply_jungong_confirm",
								"Ta muèn nhËn l¹i ®iÓm qu©n c«ng/receive_jungong_save",
								"§Ó ta suy nghÜ ®·/nothing",
							}
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then
		if GetTask(TSK_TRANS_DATE) >= tonumber(date("%Y%m%d")) then			
			tremove(selTab,1)			
		else
			SetTask(TSK_TRANS_POINT,0)
			SetTask(TSK_TRANS_DATE,0)
			tremove(selTab,2)
		end
	else
		tremove(selTab,2)
	end
	Say(g_szInfoHeader.."L·o phu cã thÓ gióp ng­¬i b¶o toµn ®iÓm qu©n c«ng sau khi chuyÓn server. <color=yellow>Thø 5 h»ng tuÇn h·y ®Õn gÆp l·o phu b¶o l­u qu©n c«ng<color>. PhÝ b¶o l­u lµ <color=green>500 vµng<color>. <color=yellow>Thêi gian nhËn l¹i ®iÓm qu©n c«ng tõ 10:00 - 24:00 thø 6<color>, sau thêi gian nµy ta kh«ng chÞu tr¸ch nhiÖm b¶o l­u ®iÓm cña ng­¬i. <color=red>L­u ý: §iÓm qu©n c«ng tèi ®a nhËn ®­îc sau khi chuyÓn server lµ 110% cña ng­êi cao nhÊt cïng phe.<color>.",getn(selTab),selTab);
end

function apply_jungong_confirm()
--	if tonumber(date("%y%m%d")) >= 110105 then
--		Talk(1, "", "Chøc n¨ng nµy ®ang t¹m ®ãng!")
--		return
--	end
	local nDay = tonumber(date("%w"))	
	local nJungGong = GetTask(701)
	local nType = 0
	if nDay ~= 4 then
		Talk(1,"",g_szInfoHeader.."Thø 5 h»ng tuÇn h·y ®Õn ®©y gÆp l·o phu!")
		return
	end
	if GetLevel() <80 then
		Talk(1,"",g_szInfoHeader.."L·o phu chØ nhËn ®iÓm cña cao thñ ®¼ng cÊp 80 trë lªn!")
		return	
	end
	if abs(nJungGong) <= 80000 then
		Talk(1,"",g_szInfoHeader.."§iÓm qu©n c«ng cña ng­¬i nhá h¬n 80000, kh«ng cÇn ph¶i b¶o l­u!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then		
		Talk(1,"",g_szInfoHeader.."Ng­¬i ch­a nhËn l¹i ®iÓm qu©n c«ng ®· b¶o l­u!")
		return
	end
	local strCharge =  "500 vµng"	
	local strSay = {
							format("Ta ®ång ý!/#apply_jungong_confirm_confirm(%d)",nType),
							"§Ó ta suy nghÜ ®·/nothing"	
						}	
	Say("§iÓm qu©n c«ng hiÖn t¹i cña ng­¬i lµ <color=yellow>"..abs(nJungGong).."<color>, phÝ b¶o l­u lµ <color=yellow>"..strCharge.."<color>. Sau khi b¶o l­u ®iÓm qu©n c«ng t¹m thêi cña ng­¬i lµ 80000. X¸c nhËn muèn b¶o l­u ®iÓm?",getn(strSay),strSay)
end

function apply_jungong_confirm_confirm(nType)
	local nDay = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d"))
	local nNextDate = tf_GetResultDate(nDate,1)
	local nJungGong = GetTask(701)
	if nDay ~= 4 then
		Talk(1,"",g_szInfoHeader.."Thø 5 h»ng tuÇn h·y ®Õn ®©y gÆp l·o phu!")
		return
	end
	if abs(nJungGong) <= 80000 then
		Talk(1,"",g_szInfoHeader.."§iÓm qu©n c«ng cña ng­¬i nhá h¬n 80000, kh«ng cÇn ph¶i b¶o l­u!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) > 0 then
		Talk(1,"",g_szInfoHeader.."Ng­¬i ch­a nhËn l¹i ®iÓm qu©n c«ng ®· b¶o l­u!")
		return
	end		
	if GetCash() < 5000000 then
		Talk(1,"",g_szInfoHeader.."Ng­¬i kh«ng mang ®ñ 500 vµng!")
		return
	end
	CalcBattleRank()
	UpdateBattleMaxRank()
	if Pay(5000000)  == 1 then
		SetTask(TSK_TRANS_DATE,nNextDate)
		SetTask(TSK_TRANS_POINT,GetTask(701))
		--SetTask(TSK_TRANS_POINT_ALLOW,1)
		gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,GetGlbValue(GLB_TSK_SERVER_ID))
		if nJungGong >= 0 then		
			SetTask(701,80000)
		else
			SetTask(701,-80000)
		end
		Say(g_szInfoHeader.."L·o phu ®· b¶o l­u ®iÓm thµnh c«ng cho ng­¬i. Ngµy mai ®Õn ®©y nhËn l¹i nhÐ!",0)
		WriteLogEx("Bao luu quan cong","göi ®iÓm thµnh c«ng",nJungGong,"®iÓm qu©n c«ng")
	else
		WriteLogEx("Bao luu quan cong","göi ®iÓm thÊt b¹i",nJungGong,"®iÓm qu©n c«ng")
	end
end

function receive_jungong_save()
	local nDay = tonumber(date("%w%H"))
	local nDate = tonumber(date("%Y%m%d"))	
	if nDay < 510 or nDay >= 524 then
		Talk(1,"",g_szInfoHeader.."Thø 6 h»ng tuÇn tõ 10:00 - 24:00 h·y ®Õn ®©y gÆp l·o phu nhËn l¹i ®iÓm!")
		return
	end
	if GetLevel() <80 then
		Talk(1,"",g_szInfoHeader.."L·o phu chØ nhËn ®iÓm cña cao thñ ®¼ng cÊp 80 trë lªn!")
		return	
	end
	if abs(GetTask(TSK_TRANS_POINT)) <= 0 then
		Talk(1,"",g_szInfoHeader.."L·o phu kh«ng gi÷ ®iÓm g× cña ng­¬i c¶!")
		return
	end
	if GetTask(TSK_TRANS_DATE) <  nDate then
		SetTask(TSK_TRANS_POINT,0)
		SetTask(TSK_TRANS_DATE,0)
		gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,0)
		Talk(1,"",g_szInfoHeader.."ThËt ®¸ng tiÕc, thêi h¹n nhËn l¹i ®iÓm ®· qua!")
		return
	end
	local nCurCamp = BT_GetCurCamp();	
	local nSaveJunGong = abs(GetTask(TSK_TRANS_POINT))	
	local nCurRank = abs(GetTask(704))
	local nMaxJunGong = 0;
	local nAlterantJunGong = 0;	
	if gf_GetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG) == GetGlbValue(GLB_TSK_SERVER_ID) then
		nAlterantJunGong = nSaveJunGong
	else
		if nCurCamp == SONG_ID then
			nMaxJunGong = GetRankByIndex(1,0);
		else
			nMaxJunGong = GetRankByIndex(-1,0);
		end;
		if not nMaxJunGong then
			nMaxJunGong = 1;
		end;
		nAlterantJunGong = ceil(nMaxJunGong*1.1);
		nAlterantJunGong = min(nAlterantJunGong,nSaveJunGong);
	end
	local selTab = {
				"An t©m ®i, ta ®· biÕt råi/#receive_jungong_save_confirm("..nAlterantJunGong..")",
				"§Ó ta suy nghÜ ®·/nothing",
				}
	Say(g_szInfoHeader.."§iÓm qu©n c«ng b¶o l­u hiÖn giê cña ng­¬i ("..tCampNameZ[nCurCamp]..") lµ <color=yellow>"..nSaveJunGong.."<color>, cã thÓ nhËn nhiÒu nhÊt <color=yellow>"..nAlterantJunGong.."<color> ®iÓm qu©n c«ng. §ång ý chø?",getn(selTab),selTab);	
end


function receive_jungong_save_confirm(nAlterantJunGong)
	local nDay = tonumber(date("%w%H"))
	local nDate = tonumber(date("%Y%m%d"))	
	if nDay < 510 or nDay >= 524 then
		Talk(1,"",g_szInfoHeader.."Thø 6 h»ng tuÇn tõ 10:00 - 24:00 h·y ®Õn ®©y gÆp l·o phu nhËn l¹i ®iÓm!")
		return
	end
	if nAlterantJunGong <= 0 then
		Talk(1,"",g_szInfoHeader.."L·o phu kh«ng gi÷ ®iÓm g× cña ng­¬i c¶!")
		return
	end
	if GetTask(TSK_TRANS_POINT) < 0 then
		nAlterantJunGong = - nAlterantJunGong
	end
	SetRankPoint(5, 701, 1)
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(701,nAlterantJunGong)
	SetTask(TSK_TRANS_POINT,0)
	SetTask(TSK_TRANS_DATE,0)
	gf_SetTaskByte(TSK_SERVER_ID,TSK_SERVER_ID_JUNGONG,0)
	CalcBattleRank()
	UpdateBattleMaxRank()
	--SetTask(TSK_TRANS_POINT_ALLOW,0)
	Say(g_szInfoHeader.."L·o phu ®· phôc håi ®iÓm cho ng­¬i thµnh c«ng!",0)
	WriteLogEx("Bao luu quan cong","nhËn ®iÓm thµnh c«ng",nAlterantJunGong,"®iÓm qu©n c«ng")
end

function apply_jungong_change()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","HiÖn t¹i ch­a cho phÐp chuyÓn ®æi c«ng tr¹ng, ng­¬i h·y quay l¹i sau nhÐ.")
			return
		end
	end
	
	local selTab = {
				"Ta ®· quyÕt ®Þnh, kh«ng cÇn khuyªn n÷a/jungong_change_confirm",
				"§Ó ta suy nghÜ ®·/nothing",
				}
	Say(g_szInfoHeader.."Ng­¬i thËt sù muèn chuyÓn ®Õn doanh tr¹i ®èi ph­¬ng chø? ViÖc nµy rÊt tèn kÐm, hay lµ suy nghÜ kü råi h½n quyÕt ®Þnh! NÕu ng­¬i ®· ®¨ng ký tham gia chiÕn tr­êng, <color=red>sau khi chuyÓn thµnh c«ng, ph¶i ®¨ng ký l¹i<color>, Ng­¬i ®· quyÕt ®Þnh råi chø? <color=red>Chó ý: Ng­êi ch¬i cã qu©n c«ng thÊp h¬n hoÆc b»ng 120000 kh«ng thÓ sö dông tÝnh n¨ng nµy, h·y mua §Çu thµnh tÝn, §Çu thµnh th­ hoÆc §Çu thµnh biÓu ë Ngù C¸c dïng ®Ó tiÕn hµnh chuyÓn ®æi.<color>",getn(selTab),selTab);
end;

function jungong_change_confirm()
	local nCurCamp = BT_GetCurCamp();
	local nOppCamp = SONGLIAO_ID - nCurCamp;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--×Ô¼ºµ±Ç°µÄ¾ü¹¦
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."§iÓm qu©n c«ng hiÖn giê cña ng­¬i nhá h¬n hoÆc b»ng 120000, kh«ng cÇn ®æi qu©n c«ng ë ®©y, h·y mua §Çu thµnh tÝn, §Çu thµnh th­ hoÆc §Çu thµnh biÓu ë Ngù C¸c ®Ó tiÕn hµnh chuyÓn ®æi.");
		return 0;
	end;
	local nOppMaxJunGong = 0;
	if nOppCamp == SONG_ID then
		nOppMaxJunGong = GetRankByIndex(1,0);	--»ñµÃµÐ·½µÚÒ»ÃûµÄ¾ü¹¦
	else
		nOppMaxJunGong = GetRankByIndex(-1,0);	--»ñµÃµÐ·½µÚÒ»ÃûµÄ¾ü¹¦
	end;
	if not nOppMaxJunGong then
		nOppMaxJunGong = 1;
	end;
	local nAlterantJunGong = 0;	--¿É×ª»»¾ü¹¦
	local nAlterantMaxJunGong = 360000;	--×î´ó¿É×ª»»¾ü¹¦
	nAlterantJunGong = ceil(nOppMaxJunGong*0.85);	--×î¶à¿É×ªµÐ·½×î¶à¾ü¹¦µÄ85%
	nAlterantJunGong = min(nAlterantJunGong,nCurJunGong);	--²»ÄÜ³¬¹ý×Ô¼ºµ±Ç°µÄ¾ü¹¦
	nAlterantJunGong = min(nAlterantJunGong,nAlterantMaxJunGong)	--²»ÄÜ³¬¹ýÄ³¸ö×î´óÖµ
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local selTab = {
				"An t©m ®i, ta ®· chuÈn bÞ råi/#jungong_change_confirm_final("..nAlterantJunGong..")",
				"§Ó ta suy nghÜ ®·/nothing",
				}
	Say(g_szInfoHeader.."§iÓm qu©n c«ng hiÖn giê cña ng­¬i ("..tCampNameZ[nCurCamp]..") lµ <color=yellow>"..nCurJunGong.."<color>, chuyÓn ®Õn ®èi ph­¬ng ("..tCampNameZ[nOppCamp]..") cã thÓ chuyÓn nhiÒu nhÊt <color=yellow>"..nAlterantJunGong.."<color> ®iÓm qu©n c«ng, cÇn dïng <color=yellow>"..nNeedItemNum.." §Çu thµnh biÓu vµ 1000 vµng<color>, ng­¬i ch¾c ch¾n muèn chuyÓn chø? <color=red>Chó ý: ChuyÓn qu©n c«ng cã nh÷ng quy t¾c sau: 1. Cã thÓ chuyÓn nhiÒu nhÊt 360000 qu©n c«ng; 2. NÕu 85%®iÓm qu©n c«ng cña ng­êi xÕp ®Çu trong b¶ng xÕp h¹ng qu©n c«ng cña ®èi ph­¬ng nhá h¬n 360000, th× ng­¬i chØ cã thÓ ®æi nhiÒu nhÊt (85% ®iÓm qu©n c«ng cña ng­êi xÕp ®Çu trong b¶ng xÕp h¹ng qu©n c«ng ®èi ph­¬ng).<color>",getn(selTab),selTab);
end;

function jungong_change_confirm_final(nAlterantJunGong)
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--×Ô¼ºµ±Ç°µÄ¾ü¹¦
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."§iÓm qu©n c«ng hiÖn giê cña ng­¬i nhá h¬n hoÆc b»ng 120000, kh«ng cÇn ®æi qu©n c«ng ë ®©y, h·y mua §Çu thµnh tÝn, §Çu thµnh th­ hoÆc §Çu thµnh biÓu ë Ngù C¸c ®Ó tiÕn hµnh chuyÓn ®æi.");
		return 0;
	end;
	if  GetCash() < 10000000 then
		Talk(1,"",g_szInfoHeader.."H×nh nh­ ng­¬i kh«ng cã ®ñ 1000 vµng!");
		return 0;
	end
	if DelItem(2,1,9978,nNeedItemNum) == 1 and Pay(10000000) == 1 then
		local nCurCamp = BT_GetCurCamp();
		local nOppCamp = SONGLIAO_ID - nCurCamp;
		if nOppCamp == SONG_ID then
			BT_SetData(PT_RANKPOINT,nAlterantJunGong);
		else
			BT_SetData(PT_RANKPOINT,-nAlterantJunGong);
		end;
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		Say(g_szInfoHeader.."B¹n ®Æt thµnh c«ng "..tCampNameZ[nCurCamp].."Ph­¬ng "..nCurJunGong.." ®iÓm c«ng tr¹ng ®æi thµnh"..tCampNameZ[nOppCamp].."Ph­¬ng "..nAlterantJunGong.." ®iÓm qu©n c«ng.",0);
		Msg2Player("B¹n ®Æt thµnh c«ng "..tCampNameZ[nCurCamp].."Ph­¬ng "..nCurJunGong.." ®iÓm c«ng tr¹ng ®æi thµnh"..tCampNameZ[nOppCamp].."Ph­¬ng "..nAlterantJunGong.." ®iÓm c«ng tr¹ng");
		SetRankPoint(5,701,1);	--¼ÓÈë¾ü¹¦ÅÅÐÐ°ñ
		WriteLog("[TriÖu Phæ chuyÓn qu©n c«ng]:"..GetName().."Dïng thÎ"..nNeedItemNum.." §Çu thµnh biÓu thµnh c«ng ®em "..tCampNameZ[nCurCamp].."Ph­¬ng "..nCurJunGong.." ®iÓm c«ng tr¹ng ®æi thµnh"..tCampNameZ[nOppCamp].."Ph­¬ng "..nAlterantJunGong.." ®iÓm c«ng tr¹ng");
	else
		Talk(1,"",g_szInfoHeader.."§æi"..nAlterantJunGong.." ®iÓm qu©n c«ng cÇn "..nNeedItemNum.." §Çu thµnh biÓu.");
	end;
end;

function get_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	if nGotBuChangDate ~= g_nBuChangEndDate then
		SetTask(TSK_BUCHANG_TIMES,0);
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local selTab = {
				--"ÎÒÒªÁìÈ¡ÆÕÍ¨²¹³¥£¨ÐèÒªµÈ¼¶10¼¶£©/give_added_comp",
				"Ta muèn nhËn båi th­êng chiÕn tr­êng (yªu cÇu cÊp 60)/get_battle_compensation",
				"T¹m thêi kh«ng nhËn/nothing",
				}
	Say(g_szInfoHeader.."Ng­¬i muèn nhËn båi th­êng nµo?",getn(selTab),selTab);
end;

function get_battle_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nRoute == 0 then
		Talk(1,"",g_szInfoHeader.."Ng­¬i ph¶i gia nhËp m«n ph¸i míi cã thÓ nhËn båi th­êng chiÕn tr­êng.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"",g_szInfoHeader.."§¼ng cÊp cña ng­¬i qu¸ thÊp, ph¶i ®¹t ®Õn cÊp 60 míi cã thÓ nhËn båi th­êng chiÕn tr­êng.");
		return 0;
	end;
	if nGotBuChangTimes >= g_nMaxBuChangTimes then
		Talk(1,"",g_szInfoHeader.."Ng­¬i ®· nhËn tÊt c¶ båi th­êng.");
		return 0;
	end;
	if nCurDate > g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."L·o phu kh«ng hÒ nhËn ®­îc th«ng b¸o lµ ng­¬i ch­a nhËn ®å.");
		return 0;
	end;
	local selTab = {
				"Ta muèn dïng Qu©n C«ng Ch­¬ng (qu©n c«ng x2, kinh nghiÖm x1.5)/#give_battle_compen_confirm(1)",
				"Ta muèn dïng §¹i Qu©n C«ng Ch­¬ng (qu©n c«ng x5, kinh nghiÖm x2)/#give_battle_compen_confirm(2)",
				"Ta muèn dïng Huy hoµng ch­¬ng (qu©n c«ng x10, kinh nghiÖm x2.5)/#give_battle_compen_confirm(3)",
				"Kh«ng dïng/#give_battle_compen_confirm(0)",
				"T¹m thêi ta ch­a muèn nhËn båi th­êng/nothing",
				}
	local tbExpX = {1,1,1.5,2,2,3};	--Óë¾üÏÎ¶ÔÓ¦µÄ¾­ÑéÏµÊý
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--Èç¹ûÃ»ÓÐ¾üÏÎ»ò¾üÏÎ³ö´í
		nCurRank = 1;	--ÖÃÎª1
	end;
	local nLevelX = 0;
	local nCurGoldenExp = 0;
	local szAddedCompensation = "";
	if IB_VERSION == 0 then
		nLevelX = 75;
		nCurGoldenExp = GetGoldenExp();
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*£¨Íæ¼ÒµÈ¼¶Æ½·½/75£©*¾üÏÎµ÷½ÚÏµÊý
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "Søc kháe ®æi kinh nghiÖm <color=yellow>"..nGoldenExpAward.."<color> ®iÓm (®iÓm søc kháe cña ng­¬i hiÖn giê lµ: <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHeader.."HiÖn giê b¹n cã thÓ nhËn båi th­êng chiÕn tr­êng ®iÓm qu©n c«ng <color=yellow>"..nJunGong.."<color> ®iÓm, ®iÓm kinh nghiÖm <color=yellow>"..nExpAward.." ®iÓm<color>,"..szGoldenExp.."Mçi ng­êi cã thÓ nhËn <color=yellow>"..g_nMaxBuChangTimes.."<color> lÇn, ®©y lµ lÇn thø <color=yellow>"..(nGotBuChangTimes+1).."<color> b¹n l·nh. B¹n muèn l·nh trùc tiÕp hay dïng Qu©n C«ng Ch­¬ng ®Ó l·nh?",getn(selTab),selTab);
end;

function give_battle_compen_confirm(nType)
	if nType == 0 then
		local selTab = {
					"Sö dông qu©n c«ng ch­¬ng/get_battle_compensation",
					"Kh«ng muèn dïng qu©n c«ng nµo hÕt/#give_battle_compensation(0)",
					}
		Say(g_szInfoHeader.."Ng­¬i x¸c nhËn kh«ng sö dông Qu©n C«ng Ch­¬ng chø?",getn(selTab),selTab);
	else
		local selTab = {
					format("§ång ý/#give_battle_compensation(%d)",nType),
					"§Ó ta suy nghÜ/nothing",
					}
		Say(g_szInfoHeader.."Ng­¬i x¸c nhËn muèn sö dông <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> chø?",getn(selTab),selTab);
	end;
end;

function give_battle_compensation(nType)
	local nLevel = GetLevel();
	local tbExpX = {1,1,1.5,2,2,3};	--Óë¾üÏÎ¶ÔÓ¦µÄ¾­ÑéÏµÊý
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--Èç¹ûÃ»ÓÐ¾üÏÎ»ò¾üÏÎ³ö´í
		nCurRank = 1;	--ÖÃÎª1
	end;
	local tbJZGJunGong = {2,5,10};
	local tbJGZExp = {1.5,2,2.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*£¨Íæ¼ÒµÈ¼¶Æ½·½/75£©*¾üÏÎµ÷½ÚÏµÊý
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
			Talk(1,"",g_szInfoHeader.."L·o phu tuy giµ, nh­ng m¾t vÉn s¸ng. Muèn qua mÆt l·o phu sao?");
			return 0;
		end;
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("Ng­¬i dïng 1 "..tbJUNGONGZHANG[nType][1]);
	end;
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	SetTask(TSK_BATTLEBUCHANG,g_nBuChangEndDate);
	SetTask(TSK_BUCHANG_TIMES,nGotBuChangTimes+1);
	nGotBuChangTimes = nGotBuChangTimes + 1;
	if nCurJunGong >= 0 then
		BT_SetData(PT_RANKPOINT,nCurJunGong+nJunGong);
		Msg2Player("Phe Tèng, b¹n nhËn ®­îc "..nJunGong.." ®iÓm c«ng tr¹ng");
	else
		BT_SetData(PT_RANKPOINT,nCurJunGong-nJunGong);
		Msg2Player("Phe Liªu, b¹n nhËn ®­îc "..nJunGong.." ®iÓm c«ng tr¹ng");
	end;
	ModifyExp(nExpAward);
	Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm båi th­êng chiÕn tr­êng");
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	Msg2Player("§©y lµ lÇn thø "..nGotBuChangTimes.." lÇn båi th­êng chiÕn tr­êng");
	WriteLog("[TriÖu Phæ båi th­êng"..g_nBuChangEndDate.."]"..GetName().."thø"..nGotBuChangTimes.." (cã thÓ l·nh nhiÒu nhÊt "..g_nMaxBuChangTimes.." lÇn) lÇn l·nh båi th­êng chiÕn tr­êng. §¼ng cÊp: "..nLevel..", lo¹i Qu©n C«ng Ch­¬ng:"..nType..", qu©n hµm:"..nCurRank..", qu©n c«ng: "..nJunGong);
end;

function give_added_comp()
	if GetTask(TSK_NORMAL_BUCHANG) == g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."Ng­¬i ®· nhËn båi th­êng råi.");
		return 0;
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local nLevel = GetLevel();
	if nLevel < 10 then
		Talk(1,"",g_szInfoHeader.."§¼ng cÊp cña ng­¬i qu¸ thÊp, ph¶i ®¹t ®Õn cÊp 10 míi cã thÓ nhËn båi th­êng.");
		return 0;
	end;
	local nExpAward = 0;
	if IB_VERSION == 0 then	--Èç¹ûÊÇÊÕ·ÑÇø
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	local nGoldenExpAward = floor((nLevel^4)/4);
	local nCurGoldenExp = GetGoldenExp();
	local selTab = {
				"NhËn /give_added_comp_confirm",
				"T¹m thêi kh«ng nhËn/nothing",
				}
	local szGoldenExp = "";
	if IB_VERSION == 0 then	--Èç¹ûÊÇÊÕ·ÑÇø
		szGoldenExp = "ChuyÓn <color=yellow>"..nGoldenExpAward.."<color> ®iÓm ®iÓm søc kháe (®iÓm søc kháe hiÖn giê cña ng­¬i lµ <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHeader.."Båi th­êng lÇn nµy ng­¬i cã thÓ nhËn <color=yellow>"..nExpAward.."<color>,"..szGoldenExp.."<color=yellow>"..g_nReputation.."<color> ®iÓm danh väng vµ <color=yellow>"..g_nContribute.."<color> ®iÓm cèng hiÕn S­ M«n (cÇn vµo m«n ph¸i). Ng­¬i muèn nhËn båi th­êng nµy chø?",getn(selTab),selTab);
end;
--¶îÍâµÄ²¹³¥
function give_added_comp_confirm()	
	SetTask(TSK_NORMAL_BUCHANG,g_nBuChangEndDate);
	local nRoute = GetPlayerRoute();
	local nLevel = GetLevel();
	local nExpAward = 0;
	if IB_VERSION == 0 then	--Èç¹ûÊÇÊÕ·ÑÇø
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	ModifyExp(nExpAward);
	Msg2Player("B¹n nhËn ®­îc "..nExpAward.."Båi th­êng ®iÓm kinh nghiÖm");
	local nGoldenExpAward = floor((nLevel^4)/4);
	if IB_VERSION == 0 then	--Èç¹ûÊÇÊÕ·ÑÇø
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	ModifyReputation(g_nReputation,0);
	if nRoute ~= 0 then
		SetTask(336,GetTask(336)+g_nContribute);
		Msg2Player("B¹n nhËn ®­îc "..g_nContribute.."Båi th­êng ®iÓm cèng hiÕn S­ M«n");
	end;
	WriteLog("[TriÖu Phæ båi th­êng"..g_nBuChangEndDate.."]:"..GetName().."NhËn båi th­êng");
end;

function nothing()

end;

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
		Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
		return 0
	else 
		return 1
	end
end