--¾ÛÁé¶¦½Å±¾
--by vivi
--09/14/2007

Include("\\script\\lib\\lingshi_info.lua")
Include("\\script\\lib\\lingshipeifang_info.lua")
Include("\\script\\class\\ktabfile.lua")

lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
--ÁÙÊ±±äÁ¿
TT_LINGSHI_LV = 120; --¼ÇÂ¼Íæ¼ÒÑ¡ÔñÈ¡³öÁéÊ¯µÄµÈ¼¶
TT_LINGSHI_PF_LV = 121; --¼ÇÂ¼Íæ¼ÒÑ¡ÔñÈ¡³öÁéÊ¯Åä·½µÄµÈ¼¶
TT_LINGSHI_CHANGE_LV = 123; --¼ÇÂ¼Íæ¼ÒÑ¡Ôñ¶Ò»»¸ß¼¶ÁéÊ¯Ê±µÄÏûºÄµÄÁéÊ¯µÈ¼¶
TT_LSPF_CHANGE_LV = 124; --¼ÇÂ¼Íæ¼ÒÑ¡Ôñ¶Ò»»¸ß¼¶ÁéÊ¯Åä·½Ê±µÄÏûºÄµÄÁéÊ¯Åä·½µÈ¼¶

--ÈÎÎñ±äÁ¿
TASK_LINGSHI_QINGLING = 2335; --¶ÔÁéÊ¯¸ºÊýÇå0´¦Àí£¬Ö´ÐÐÒ»´Î
TASK_PF_QINGLING = 2336; --¶ÔÁéÊ¯Åä·½¸ºÊýÇå0´¦Àí£¬Ö´ÐÐÒ»´Î
--ÏûºÄËæ»ú´ÎÊýÈ¨Öµ±í
tRandNum ={--ÊôÐÔÃû	id	Î»ÖÃ	×îµÍµÈ¼¶	ÊÇ·ñËæ»ú	ÏûºÄËæ»ú´ÎÊý	µÈ¼¶1-7È¨Öµ
{"Tû lÖ mµi mßn vò khÝ gi¶m",9,2,1,0,1,1,1,1,1,2,2,2},
{"Søc lùc t¨ng",110,2,1,0,1,1,1,1,1,2,2,2},
{"Søc lùc t¨ng",110,0,1,0,1,1,1,1,1,2,2,2},
{"Søc lùc t¨ng",110,1,1,0,1,1,1,1,1,2,2,2},
{"Søc lùc t¨ng",110,3,1,0,1,1,1,1,1,2,2,2},
{"Sinh lùc +",11,0,1,0,3,1,1,1,1,2,2,2},
{"Sinh lùc +",11,1,1,0,3,1,1,1,1,2,2,2},
{"Sinh lùc +",11,3,1,0,3,1,1,1,1,2,2,2},
{"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc " ,333,2,1,0,2,1,1,1,1,2,2,2},
{"600 gi©y ®é bÒn vò khÝ håi phôc",43,2,1,1,2,1,1,1,1,2,2,2},
{"600 gi©y ®é bÒn th­îng y håi phôc ",112,1,1,1,2,1,1,1,1,2,2,2},
{"600 gi©y ®é bÒn nãn håi phôc ",113,0,1,1,2,1,1,1,1,2,2,2},
{"600 gi©y ®é bÒn h¹ y håi phôc ",114,3,1,1,2,1,1,1,1,2,2,2},
{"yªu cÇu ®¼ng cÊp gi¶m ",334,0,6,1,3,1,1,1,1,2,2,2},
{"yªu cÇu ®¼ng cÊp gi¶m "	,334,1,6,1,3,1,1,1,1,2,2,2},
{"yªu cÇu ®¼ng cÊp gi¶m "	,334,3,6,1,3,1,1,1,1,2,2,2},
{"Tû lÖ ®¸nh ph¹m vi",335,2,1,0,3,1,1,1,1,2,2,2},
{"Vò khÝ ®¸nh ngo¹i lín nhÊt t¨ng ",65,2,1,0,3,1,1,1,1,2,2,2},
{"Vò khÝ ®¸nh ngo¹i thÊp nhÊt t¨ng "	,66,2,1,0,3,1,1,1,1,2,2,2},
{"Vò khÝ ®¸nh néi lín nhÊt t¨ng"	,67,2,1,0,3,1,1,1,1,2,2,2},
{"Vò khÝ ®¸nh néi thÊp nhÊt t¨ng "	,68,2,1,0,3,1,1,1,1,2,2,2},
{"D­îc hiÖu kÐo dµi",39,0,1,0,2,1,1,2,2,3,3,4},
{"ThÓ lùc tèi ®a t¨ng",336,1,1,0,4,1,1,2,2,3,3,4},
{"TÊn c«ng t¨ng ",77,2,1,1,3,1,1,2,2,3,3,4},
{"ChÝnh x¸c t¨ng",337,2,1,0,4,1,1,2,2,3,3,4},
{"NÐ tr¸nh t¨ng",338,3,1,0,5,1,1,2,2,3,3,4},
{"Ph¶n ®ßn",339,1,1,0,5,1,1,2,2,3,3,4},
{"Mçi 10 gi©y néi lùc håi phôc",340,0,5,1,5,1,1,2,2,3,3,4},
{"Mçi 10 gi©y néi lùc håi phôc",340,1,5,1,5,1,1,2,2,3,3,4},
{"Mçi 10 gi©y néi lùc håi phôc",340,3,5,1,5,1,1,2,2,3,3,4},
{"Mçi 10 gi©y sinh lùc håi phôc",341,0,5,1,5,1,1,2,2,3,3,4},
{"Mçi 10 gi©y sinh lùc håi phôc",341,1,5,1,5,1,1,2,2,3,3,4},
{"Mçi 10 gi©y sinh lùc håi phôc",341,3,5,1,5,1,1,2,2,3,3,4},
{"§¸nh tËp trung t¨ng",342,2,1,0,4,1,1,2,2,3,3,4},
{"Néi phßng t¨ng ",343,0,1,0,4,1,1,2,2,3,3,4},
{"Néi phßng t¨ng ",343,1,1,0,4,1,1,2,2,3,3,4},
{"Néi phßng t¨ng ",343,3,1,0,4,1,1,2,2,3,3,4},
{"Phßng thñ ngo¹i c«ng t¨ng",344,0,1,0,4,1,1,2,2,3,3,4},
{"Phßng thñ ngo¹i c«ng t¨ng",344,1,1,0,4,1,1,2,2,3,3,4},
{"Phßng thñ ngo¹i c«ng t¨ng",344,3,1,0,4,1,1,2,2,3,3,4},
{"Vâ c«ng hao néi gi¶m",345,0,1,0,5,1,1,2,2,3,3,4},
{"Ph¸t huy c«ng kÝch lín nhÊt",346,2,1,0,5,1,1,2,2,3,3,4},
{"Tû lÖ nhÊt ®Þnh lµm ®èi ph­¬ng khÝ huyÕt hao tæn",53,2,4,0,5,1,1,2,2,3,3,4},
{"Tû lÖ nhÊt ®Þnh lµm ®èi ph­¬ng ch©n nguyªn hao tæn",54,2,4,0,5,1,1,2,2,3,3,4},
{"§éc s¸t gi¶m",347,0,1,0,4,1,1,2,2,3,3,4},
{"§éc s¸t gi¶m",347,1,1,0,4,1,1,2,2,3,3,4},
{"§éc s¸t gi¶m",347,3,1,0,4,1,1,2,2,3,3,4},
{"TÊn c«ng lµm søc m¹nh ®èi ph­¬ng gi¶m",348,2,1,0,5,1,1,2,2,3,3,4},
{"TÊn c«ng lµm g©n cèt ®èi ph­¬ng gi¶m",349,2,1,0,5,1,1,2,2,3,3,4},
{"TÊn c«ng lµm néi c«ng ®èi ph­¬ng gi¶m",350,2,1,0,5,1,1,2,2,3,3,4},
{"KhiÕn ®èi ph­¬ng gi¶m Linh ho¹t ",351,2,1,0,5,1,1,2,2,3,3,4},
{"TÊn c«ng lµm th©n ph¸p ®èi ph­¬ng gi¶m",352,2,1,0,5,1,1,2,2,3,3,4},
{"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",353,2,1,0,5,1,1,2,2,3,3,4}, 
{"TÊn c«ng lµm gi¶m néi phßng ®èi ph­¬ng",354,2,1,0,5,1,1,2,2,3,3,4},
{"Gi¶m thêi gian tróng th­¬ng	",355,1,1,0,5,1,1,2,2,3,3,4},
{"Tû lÖ ®¸nh chÆn xuÊt chiªu cña ®èi ph­¬ng	",356,1,3,0,6,1,1,2,2,3,3,4},
{"G©n cèt t¨ng",357,2,1,0,5,1,1,2,2,3,3,4},
{"G©n cèt t¨ng",357,0,1,0,5,1,1,2,2,3,3,4},
{"G©n cèt t¨ng",357,1,1,0,5,1,1,2,2,3,3,4},
{"G©n cèt t¨ng",357,3,1,0,5,1,1,2,2,3,3,4},
{"Søc m¹ng t¨ng",358,2,1,0,5,1,1,2,2,3,3,4},
{"Søc m¹ng t¨ng",358,0,1,0,5,1,1,2,2,3,3,4},
{"Søc m¹ng t¨ng",358,1,1,0,5,1,1,2,2,3,3,4},
{"Søc m¹ng t¨ng",358,3,1,0,5,1,1,2,2,3,3,4},
{"Th©n ph¸p t¨ng",359,2,1,0,5,1,1,2,2,3,3,4},
{"Th©n ph¸p t¨ng",359,0,1,0,5,1,1,2,2,3,3,4},
{"Th©n ph¸p t¨ng",359,1,1,0,5,1,1,2,2,3,3,4},
{"Th©n ph¸p t¨ng",359,3,1,0,5,1,1,2,2,3,3,4},
{"Linh ho¹t t¨ng",360,2,1,0,5,1,1,2,2,3,3,4},
{"Linh ho¹t t¨ng",360,0,1,0,5,1,1,2,2,3,3,4},
{"Linh ho¹t t¨ng",360,1,1,0,5,1,1,2,2,3,3,4},
{"Linh ho¹t t¨ng",360,3,1,0,5,1,1,2,2,3,3,4},
{"Néi c«ng t¨ng ",361,2,1,0,5,1,1,2,2,3,3,4},
{"Néi c«ng t¨ng ",361,0,1,0,5,1,1,2,2,3,3,4},
{"Néi c«ng t¨ng ",361,1,1,0,5,1,1,2,2,3,3,4},
{"Néi c«ng t¨ng ",361,3,1,0,5,1,1,2,2,3,3,4},
{"Kh¸ng ®éc",100,0,1,0,6,1,1,2,2,3,3,4},
{"Kh¸ng ®éc",100,1,1,0,6,1,1,2,2,3,3,4},
{"Kh¸ng ®éc",100,3,1,0,6,1,1,2,2,3,3,4},
{"ChuyÓn hãa s¸t th­¬ng thµnh néi lùc",46,0,5,1,6,1,1,2,2,3,3,4},
{"ChuyÓn hãa s¸t th­¬ng thµnh néi lùc",46,1,5,1,6,1,1,2,2,3,3,4},
{"TÊn c«ng lµm ®èi ph­¬ng hao tæn néi lùc",49,2,5,0,6,1,2,2,3,3,4,5},
{"Ph¸ phßng thñ ®èi ph­¬ng",362,2,5,0,7,1,2,2,3,3,4,5},
{"TÊn c«ng kÌm ®éc s¸t",363,2,1,0,7,1,2,2,3,3,4,5},
{"Sinh lùc tèi ®a t¨ng-%",79,2,1,0,7,1,2,2,3,3,4,5},
{"Sinh lùc tèi ®a t¨ng-%",79,0,1,0,7,1,2,2,3,3,4,5},
{"Sinh lùc tèi ®a t¨ng-%",79,1,1,0,7,1,2,2,3,3,4,5},
{"Sinh lùc tèi ®a t¨ng-%",79,3,1,0,7,1,2,2,3,3,4,5},
{"Néi lùc tèi ®a t¨ng-%",80,2,1,0,6,1,2,2,3,3,4,5},
{"Néi lùc tèi ®a t¨ng-%",80,0,1,0,6,1,2,2,3,3,4,5},
{"Néi lùc tèi ®a t¨ng-%",80,1,1,0,6,1,2,2,3,3,4,5},
{"Néi lùc tèi ®a t¨ng-%",80,3,1,0,6,1,2,2,3,3,4,5},
{"Kh¾c nÐ",364,1,3,0,6,1,2,2,3,3,4,5},
{"Hç trî tÊn c«ng  duy tr× ",41,0,1,0,7,1,2,2,3,3,4,5},
{"Hç trî tÊn c«ng  duy tr× ",41,2,1,0,7,1,2,2,3,3,4,5},
{"Hç trî tÊn c«ng  duy tr× ",41,1,1,0,7,1,2,2,3,3,4,5},
{"Hç trî tÊn c«ng  duy tr× ",41,3,1,0,7,1,2,2,3,3,4,5},
{"Hç trî phßng thñ duy tr× ",42,0,1,0,7,1,2,2,3,3,4,5},
{"Hç trî phßng thñ duy tr× ",42,2,1,0,7,1,2,2,3,3,4,5},
{"Hç trî phßng thñ duy tr× ",42,1,1,0,7,1,2,2,3,3,4,5},
{"Hç trî phßng thñ duy tr× ",42,3,1,0,7,1,2,2,3,3,4,5},
{"C«ng kÝch khiÕn ngo¹i phßng cña ®èi ph­¬ng gi¶m",382,2,1,0,7,1,2,2,3,3,4,5},
{"C«ng kÝch khiÕn néi lùc cña ®èi ph­¬ng gi¶m ",383,2,1,0,7,1,2,2,3,3,4,5},
{"Tû lÖ chÞu ®ßn gi¶m nöa	",365,0,5,0,7,1,2,2,3,3,4,5},
{"Tû lÖ chÞu ®ßn gi¶m nöa	",365,1,5,0,7,1,2,2,3,3,4,5},
{"Tû lÖ chÞu ®ßn gi¶m nöa	",365,3,5,0,7,1,2,2,3,3,4,5},
{"Kinh nghiÖm nhËn ®­îc t¨ng",366,2,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghiÖm nhËn ®­îc t¨ng",366,0,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghiÖm nhËn ®­îc t¨ng",366,1,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghiÖm nhËn ®­îc t¨ng",366,3,5,1,5,2,2,3,3,3,4,5},
{"Lµm gi¶m nÐ tr¸nh cña ®èi ph­¬ng",373,3,4,0,8,2,2,3,3,3,4,5},
{"Lµm chËm nÐ tr¸nh cña ®èi ph­¬ng",374,3,4,0,8,2,2,3,3,3,4,5},
{"Tû lÖ nÐ tr¸nh ®¸nh lui",375,3,4,0,8,2,2,3,3,3,4,5},
{"Tû lÖ nÐ tr¸nh ®¸nh ng·",376,3,4,0,8,2,2,3,3,3,4,5},
{"Bá qua nÐ tr¸nh ®èi ph­¬ng",377,0,4,0,8,2,2,3,3,3,4,5},
{"G©y mª",378,0,4,0,8,2,2,3,3,3,4,5},
{"G©y cho¸ng",379,0,4,0,8,2,2,3,3,3,4,5},
{"G©y hçn lo¹n nÐ tr¸nh",380,1,4,0,8,2,2,3,3,3,4,5},
{"G©y ngñ mª gi¶m nÐ tr¸nh",381,1,4,0,8,2,2,3,3,3,4,5},
{"Ngo¹i phßng gi¶m, ngo¹i kÝch t¨ng",18,1,1,0,8,2,2,3,3,3,4,5},
{"Néi phßng gi¶m, Néi c«ng t¨ng",19,1,1,0,8,2,2,3,3,3,4,5},
{"S¸t th­¬ng t¨ng ",372,2,3,0,7,2,2,3,3,3,4,5},
{"TÊt c¶ thuéc tÝnh t¨ng",367,2,3,0,8,2,2,3,3,3,4,5},
{"TÊt c¶ thuéc tÝnh t¨ng",367,0,3,0,8,2,2,3,3,3,4,5},
{"TÊt c¶ thuéc tÝnh t¨ng",367,1,3,0,8,2,2,3,3,3,4,5},
{"TÊt c¶ thuéc tÝnh t¨ng",367,3,3,0,8,2,2,3,3,3,4,5},
{"Ngo¹i kÝch + ",368,2,3,0,8,2,2,3,3,3,4,5},
{"Néi kÝch t¨ng ",369,2,3,0,8,2,2,3,3,3,4,5},
{"Tû lÖ xuÊt chiªu t¨ng",370,2,4,0,8,2,2,3,3,3,4,5},
{"Tèc ®é thi triÓn vâ c«ng t¨ng",371,0,3,0,8,2,2,3,3,4,5,6}
}
function OnUse()
	local strtab = {
		"T«i cã Linh th¹ch nµo /which_lingshi",
		"T«i cã Linh th¹ch phèi ph­¬ng nµo/which_lingshi_pf",
		"Chän Linh th¹ch phèi ph­¬ng ®Ó ®æi /zhiding_main",
		"C¸ch ®æi nh­ thÕ nµo /how_change",
		"Kh«ng cã g×/nothing"}
	Say("VËt tiªn c¶nh nµy hÊp thô linh khÝ trêi ®Êt, b¹n muèn biÕt ®iÒu g×? ",
		getn(strtab),
		strtab)
end

function which_lingshi()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","Më khãa r­¬ng tr­íc.");
		return 0;
	end;
	local strtab = {};
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	if GetTask(TASK_LINGSHI_QINGLING) == 0 then
		for j=1,getn(tLingshiTask) do
			if GetTask(tLingshiTask[j]) < 0 then
				SetTask(tLingshiTask[j],0);
			end
		end
		SetTask(TASK_LINGSHI_QINGLING,1);
	end
	for i=1,getn(tLingshiTask) do
		if GetTask(tLingshiTask[i]) > 0 then
			tinsert(strtab,i.." (cÊp) Linh th¹ch"..GetTask(tLingshiTask[i])..". /#quchu_lingshi("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","HiÖn t¹i ng­¬i kh«ng cã Linh th¹ch ®Ó ë chç ta. ");
	else
		tinsert(strtab,"trë l¹i/OnUse")
		Say("Xin chän lo¹i Linh th¹ch b¹n muèn t¸ch ra",
			getn(strtab),
			strtab)
	end
end

function quchu_lingshi(nLv)	
	Say("B¹n chÊp nhËn t¸ch linh th¹ch cÊp "..nLv.." ??",
		2,
		"Ph¶i, ta muèn t¸ch /#lingshi_num("..nLv..")",
		"Kh«ng, ta nhÇm!/which_lingshi")
end

function lingshi_num(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	local nNum = GetTask(tLingshiTask[nLv]);
	SetTaskTemp(TT_LINGSHI_LV,nLv);
	AskClientForNumber("confirm_give_lingshi", 1, tonumber(nNum), "T¸ch ra bao nhiªu "..nLv.." Linh th¹ch?");
end

function confirm_give_lingshi(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_LV);
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	if nCount > GetTask(tLingshiTask[nLv]) then
		return
	else
		for i=1,nCount do
			ls_AddRandomLingShi(SYS_TB_LINGSHI_MINLEVEL,nLv,nLv);
		end
		Msg2Player("B¹n lÊy ra "..nLv.." (cÊp) Linh Th¹ch"..nCount.." ");
		if nLv >= 6 then
			WriteLog("Ng­êi ch¬i"..GetName().."LÊy"..nLv.." (cÊp) Linh Th¹ch"..nCount.." ");
		end
		SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_LV,0);
	end		
end

function which_lingshi_pf()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","Më khãa r­¬ng tr­íc.");
		return 0;
	end;
	local strtab = {};
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(TASK_PF_QINGLING) == 0 then
		for i=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[i]) == -1 then
				SetTask(tPeifangTask[i],1);
				WriteLog("Tô Linh §Ünh bÞ lçi: Ng­êi ch¬i"..GetName().." -Sè l­îng 1"..i.." (cÊp) Linh th¹ch phèi ph­¬ng trë thµnh sè l­îng 1")
			end
		end		
		for j=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[j]) < 0 then
				SetTask(tPeifangTask[j],0);
			end
		end
		SetTask(TASK_PF_QINGLING,1);
	end 
	for i=1,getn(tPeifangTask) do
		if GetTask(tPeifangTask[i]) > 0 then
			tinsert(strtab,i.."(cÊp) Linh th¹ch phèi ph­¬ng"..GetTask(tPeifangTask[i]).." ./#quchu_peifang("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>Tô Linh §Ønh<color>: HiÖn t¹i ng­¬i kh«ng cã Linh th¹ch ®Ó ë chç ta. ");
	else
		tinsert(strtab,"trë l¹i/OnUse")
		Say("<color=green>Tô Linh §Ønh<color>: Xin chän lo¹i Linh th¹ch phèi ph­¬ng b¹n muèn t¸ch ra",
			getn(strtab),
			strtab)
	end
end

function quchu_peifang(nLv)
	Say("B¹n chÊp nhËn t¸ch linh th¹ch cÊp "..nLv.." (cÊp) Linh th¹ch phèi ph­¬ng?",
		2,
		"Ph¶i, ta muèn t¸ch /#peifang_num("..nLv..")",
		"Kh«ng, ta nhÇm!/which_lingshi_pf")	
end

function peifang_num(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local nNum = GetTask(tPeifangTask[nLv]);
	SetTaskTemp(TT_LINGSHI_PF_LV,nLv);
	AskClientForNumber("confirm_give_peifang", 1, tonumber(nNum), "T¸ch lÊy bao nhiªu "..nLv.." Linh th¹ch phèi ph­¬ng?");												
end

function confirm_give_peifang(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_PF_LV);
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if nCount > GetTask(tPeifangTask[nLv]) then
		return
	else
		for i=1,nCount do
			lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLv,nLv);
		end
		Msg2Player("B¹n lÊy ra "..nLv.." (cÊp)-linh th¹ch phèi ph­¬ng."..nCount.."Tr­¬ng");
		if nLv >= 6 then
			WriteLog("Ng­êi ch¬i"..GetName().."LÊy"..nLv.." (cÊp)-linh th¹ch phèi ph­¬ng."..nCount.." ");
		end		
		SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_PF_LV,0);															
	end
end
function zhiding_main()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","Më khãa r­¬ng tr­íc.");
		return 0;
	end;
	local strtab = {
		"Sè lÇn ngÉu nhiªn ta ph¶i tiªu hao ®Ó nhËn ®­îc Linh th¹ch chØ ®Þnh/zhiding_lingshi",
		"Sè lÇn ngÉu nhiªn ta ph¶i tiªu hao ®Ó nhËn ®­îc Linh th¹ch phèi ph­¬ng chØ ®Þnh/zhiding_peifang",
		"Sè lÇn ngÉu nhiªn ta ph¶i tiªu hao ®Ó nhËn ®­îc vËt phÈm quý hiÕm (nh­ NguyÖt Hoa)/zhiding_yuehua",
		"Ta muèn ®æi sè lÇn ngÉu nhiªn cña phèi ph­¬ng vµ linh th¹ch cÊp thÊp thµnh cÊp cao. /zhiding_gaoji",
		"trë l¹i/OnUse",
		"T¹m thêi kh«ng thÓ ®æi ®­îc./nothing"
		}
	Say("B¹n bá qua nhiÒu c¬ héi nhËn linh th¹ch ®Ó lÊy Linh th¹ch chØ ®Þnh vµ Linh th¹ch phèi ph­¬ng víi 1 sè vËt phÈm quý kh¸c. ",
		getn(strtab),
		strtab)
end

function zhiding_lingshi()
	local strtab = {
		"Linh th¹ch cÊp 1 mang thuéc tÝnh ®Æc biÖt/#lingshi_zhiding_lv(1)",
		"Linh th¹ch cÊp 2 mang thuéc tÝnh ®Æc biÖt/#lingshi_zhiding_lv(2)",
		"Linh th¹ch cÊp 3 mang thuéc tÝnh ®Æc biÖt/#lingshi_zhiding_lv(3)",
		"Linh th¹ch cÊp 4 mang thuéc tÝnh ®Æc biÖt/#lingshi_zhiding_lv(4)",
		"Linh th¹ch cÊp 5 mang thuéc tÝnh ®Æc biÖt/#lingshi_zhiding_lv(5)",
		"trë l¹i/zhiding_main"
		}
	Say("Xin chän ®¼ng cÊp linh th¹ch chØ ®Þnh",
		getn(strtab),
		strtab)	
end

function lingshi_zhiding_lv(nLv)
	local strtab = {
		"M·o/#lingshi_zhiding_wz("..nLv..",0,0)",
		"Y phôc/#lingshi_zhiding_wz("..nLv..",1,0)",
		"Vò khÝ/#lingshi_zhiding_wz("..nLv..",2,0)",
		"QuÇn /#lingshi_zhiding_wz("..nLv..",3,0)",
		"trë l¹i/zhiding_lingshi",
		"T¹m thêi kh«ng ®æi. /nothing"
		}
	Say("Xin chän vÞ trÝ kh¶m linh th¹ch chØ ®Þnh. ",
		getn(strtab),
		strtab)
end

function lingshi_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --¶ÔÓ¦tRandNum±íµÄË÷Òý
	for i = 1,getn(tRandNum) do
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lingshi_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"Trang tr­íc/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang kÕ/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"trë l¹i/#lingshi_zhiding_lv("..nLv..")");
	tinsert(strtab,"T¹m thêi kh«ng ®æi. /nothing");
	Say("Xin chän thuéc tÝnh linh th¹ch muèn ®æi. ",
		getn(strtab),
		strtab);	
end

function confirm_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"M·o","Y phôc","Vò khÝ","QuÇn "};
	Say("Sè lÇn b¹n tiªu hao <color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color> lÇn"..nLv.." (cÊp) Linh th¹ch ngÉu nhiªn ®Ó ®æi thuéc tÝnh Linh th¹ch lµ <color=yellow>"..tRandNum[nIdx][1].."<color>, vÞ trÝ kh¶m lµ 1 <color=yellow> "..tWz[nWz+1].."<color> "..nLv.." (cÊp) Linh th¹ch, ®ång ý chø?",
		2,
		"õ, ta muèn ®æi./#give_lingshi_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function give_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®æi lÊy lo¹i ®¸ b¹n cÇn. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	AddLingShi(nId,nWz,nLv);
	Msg2Player("B¹n nhËn ®­îc "..nLv.."(cÊp) Linh Th¹ch!");
	if nLv >= 6 then
		WriteLog("Ng­êi ch¬i"..GetName().."Sè lÇn ngÉu nhiªn tiªu hao "..nNum.." lÇn nhËn ®­îc "..nLv.."(cÊp) Linh Th¹ch!");
	end
end

function zhiding_peifang()
	local strtab = {
		"Linh th¹ch phèi ph­¬ng mang thuéc tÝnh ®Æc biÖt cÊp 1/#lspf_zhiding_lv(1)",
		"Linh th¹ch phèi ph­¬ng mang thuéc tÝnh ®Æc biÖt cÊp 2/#lspf_zhiding_lv(2)",
		"Linh th¹ch phèi ph­¬ng mang thuéc tÝnh ®Æc biÖt cÊp 3/#lspf_zhiding_lv(3)",
		"Linh th¹ch phèi ph­¬ng mang thuéc tÝnh ®Æc biÖt cÊp 4/#lspf_zhiding_lv(4)",
		"Linh th¹ch phèi ph­¬ng mang thuéc tÝnh ®Æc biÖt cÊp 4/#lspf_zhiding_lv(5)",
		"Linh th¹ch phèi ph­¬ng mang thuéc tÝnh ®Æc biÖt cÊp 6/#lspf_zhiding_lv(6)",
		"trë l¹i/zhiding_main"
		}
	Say("Xin chän cÊp thuéc tÝnh Linh th¹ch phèi ph­¬ng chØ ®Þnh. ",
		getn(strtab),
		strtab)		
end

function lspf_zhiding_lv(nLv)
	local strtab = {
		"M·o/#lspf_zhiding_wz("..nLv..",0,0)",
		"Y phôc/#lspf_zhiding_wz("..nLv..",1,0)",
		"Vò khÝ/#lspf_zhiding_wz("..nLv..",2,0)",
		"QuÇn /#lspf_zhiding_wz("..nLv..",3,0)",
		"trë l¹i/zhiding_peifang",
		"T¹m thêi kh«ng ®æi. /nothing"
		}
	Say("Xin chän vÞ trÝ kh¶m Linh th¹ch phèi ph­¬ng chØ ®Þnh. ",
		getn(strtab),
		strtab)	
end

function lspf_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --¶ÔÓ¦tRandNum±íµÄË÷Òý
	for i = 22,getn(tRandNum) do --×¢ÒâÕâÀï£¡tRandNum±íµÄÇ°21ÏîÊôÐÔÊÇÃ»ÓÐÅä·½µÄ£¡
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lspf_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"Trang tr­íc/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang kÕ/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"trë l¹i/#lspf_zhiding_lv("..nLv..")");
	tinsert(strtab,"T¹m thêi kh«ng ®æi. /nothing");
	Say("Xin chän thuéc tÝnh Linh th¹ch phèi ph­¬ng muèn ®æi. ",
		getn(strtab),
		strtab);	
end

function confirm_lspf_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"M·o","Y phôc","Vò khÝ","QuÇn "};
	Say("Sè lÇn b¹n tiªu hao <color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color> lÇn"..nLv.." (cÊp) Linh th¹ch phèi ph­¬ng ngÉu nhiªn ®æi thµnh <color=yellow>1"..tRandNum[nIdx][1].."<color>, vÞ trÝ kh¶m lµ 1 <color=yellow> "..tWz[nWz+1].."<color> "..nLv.." (cÊp) Linh th¹ch phèi ph­¬ng, b¹n chÊp nhËn?",
		2,
		"õ, ta muèn ®æi./#give_lspf_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"T¹m thêi kh«ng ®æi. /nothing")	
end

function give_lspf_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®æi thµnh th¹ch phèi ph­¬ng. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nPfid1,nPfid2,nPfid3 = 0,0,0;		
	for i=2,lingshi_pf:getRow() do
		if tonumber(lingshi_pf:getCell(i,44)) == nId and tonumber(lingshi_pf:getCell(i,45)) == nWz and tonumber(lingshi_pf:getCell(i,46)) == nLv then
			if lingshi_pf:getCell(i,43) ~= "" then
				nPfid1 = tonumber(lingshi_pf:getCell(i,41));
				nPfid2 = tonumber(lingshi_pf:getCell(i,42));
				nPfid3 = tonumber(lingshi_pf:getCell(i,43));
				break
			end
		end
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	if AddItem(nPfid1,nPfid2,nPfid3,1) == 1 then
		Msg2Player("B¹n nhËn ®­îc "..nLv.."(cÊp)thuéc tÝnh Linh th¹ch phèi ph­¬ng");
		if nLv >= 6 then
			WriteLog("Ng­êi ch¬i"..GetName().."tiªu hao "..nNum.." lÇn ngÉu nhiªn, nhËn ®­îc 1 "..nLv.." (cÊp)thuéc tÝnh Linh th¹ch phèi ph­¬ng");
		end
	else
		WriteLog("Ng­êi ch¬i"..GetName().."tiªu hao "..nNum.." lÇn ngÉu nhiªn, nhËn ®­îc 1 "..nLv.." (cÊp)thuéc tÝnh Linh th¹ch phèi ph­¬ng ®· thÊt b¹i! ")
	end
end

function zhiding_gaoji()
	local strtab = {
		"Ta muèn ®æi Linh th¹ch ngÉu nhiªn cÊp thÊp thµnh cÊp cao. /zhiding_lingshi_gaoji",
		"Ta muèn ®æi Linh th¹ch phèi ph­¬ng ngÉu nhiªn cÊp thÊp thµnh cÊp cao. /zhiding_lspf_gaoji",
		"trë l¹i/zhiding_main",
		"T¹m thêi kh«ng ®æi. /nothing"
		}
	Say("Ng­¬i muèn ®æi Linh th¹ch hay Linh th¹ch phèi ph­¬ng?",
		getn(strtab),
		strtab)	
end

function zhiding_lingshi_gaoji()
	local strtab = {
		"Ta muèn tiªu hao Linh th¹ch ngÉu nhiªn cÊp 1 ®æi thµnh linh th¹ch cÊp 2/#ls_change_high(1)",
		"Ta muèn tiªu hao Linh th¹ch ngÉu nhiªn cÊp 2 ®æi lÊy Linh th¹ch cÊp 3/#ls_change_high(2)",
		"Ta muèn tiªu hao Linh th¹ch ngÉu nhiªn cÊp 3 ®æi lÊy Linh th¹ch cÊp 4/#ls_change_high(3)",
		"Ta muèn tiªu hao Linh th¹ch ngÉu nhiªn cÊp 4 ®æi lÊy Linh th¹ch cÊp 5/#ls_change_high(4)",
		"trë l¹i/zhiding_gaoji",
		"T¹m thêi kh«ng ®æi. /nothing"
		}
	Say("Xin chän cÊp linh th¹ch muèn ®æi. (sè l­îng ®æi sÏ x¸c nhËn ë b­íc sau)",
		getn(strtab),
		strtab)		
end

function ls_change_high(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	local tNum = {3,3,5,5};
	if GetTask(tLingshiTask[nLv]) < tNum[nLv] then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®æi");
		return
	end	
	local nCount = floor(GetTask(tLingshiTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LINGSHI_CHANGE_LV,nLv);
	AskClientForNumber("confirm_ls_change_high", 1, tonumber(nCount), "B¹n muèn ®æi bao nhiªu "..(nLv+1).." (cÊp) Linh th¹ch?");
end

function confirm_ls_change_high(nCount)
	local nLv = GetTaskTemp(TT_LINGSHI_CHANGE_LV);
	local tNum = {3,3,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("B¹n chÊp nhËn tiªu hao "..nNum.." lÇn"..nLv.." (cÊp) Linh th¹ch ngÉu nhiªn ®Ó ®æi lÊy"..nCount.." "..(nLv+1).." (cÊp) Linh th¹ch?",
		3,
		"§ång ý/#give_ls_change_high("..nLv..","..nNum..","..nCount..")",
		"Chän sai. Trë vÒ/zhiding_lingshi_gaoji",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function give_ls_change_high(nLv,nNum,nCount)  --ÏûºÄµÄµÈ¼¶  ÏûºÄµÄµÈ¼¶´ÎÊý ¶Ò»»µÄµÈ¼¶¸öÊý
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®æi lÊy lo¹i ®¸ b¹n cÇn. ");
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	SetTask(tLingshiTask[nLv+1],GetTask(tLingshiTask[nLv+1])+nCount);
	Msg2Player("B¹n nhËn ®­îc "..(nLv+1).." (cÊp) Linh Th¹ch"..nCount.." , b¹n cã thÓ t¸ch lÊy nã tõ Tô Linh §Ünh. ");	
end

function zhiding_lspf_gaoji()
	local strtab = {
		"Ta muèn tiªu hao Linh th¹ch phèi ph­¬ng cÊp 1 ngÉu nhiªn ®æi lÊy Linh th¹ch phèi ph­¬ng cÊp 2. /#lspf_change_high(1)",
		"Ta muèn tiªu hao Linh th¹ch phèi ph­¬ng cÊp 2 ngÉu nhiªn ®æi lÊy Linh th¹ch phèi ph­¬ng cÊp 3./#lspf_change_high(2)",
		"Ta muèn tiªu hao Linh th¹ch phèi ph­¬ng cÊp 3 ngÉu nhiªn ®æi lÊy Linh th¹ch phèi ph­¬ng cÊp 4. /#lspf_change_high(3)",
		"Ta muèn tiªu hao Linh th¹ch phèi ph­¬ng cÊp 4 ngÉu nhiªn ®æi lÊy Linh th¹ch phèi ph­¬ng cÊp 5. /#lspf_change_high(4)",
		"Ta muèn tiªu hao Linh th¹ch phèi ph­¬ng cÊp 5 ngÉu nhiªn ®æi lÊy Linh th¹ch phèi ph­¬ng cÊp 6./#lspf_change_high(5)",
		"trë l¹i/zhiding_gaoji",
		"T¹m thêi kh«ng ®æi. /nothing"
		}
	Say("Xin chän ®¼ng cÊp Linh th¹ch phèi ph­¬ng muèn ®æi! (sè l­îng ®æi sÏ x¸c nhËn ë b­íc sau)",
		getn(strtab),
		strtab)		
end

function lspf_change_high(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local tNum = {3,3,5,5,5};
	if GetTask(tPeifangTask[nLv]) < tNum[nLv] then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®èi lÊy Linh th¹ch phèi ph­¬ng.");
		return
	end
	local nCount = floor(GetTask(tPeifangTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LSPF_CHANGE_LV,nLv);
	AskClientForNumber("confirm_lspf_change_high", 1, tonumber(nCount), "B¹n muèn ®æi bao nhiªu "..(nLv+1).." (cÊp) Linh th¹ch phèi ph­¬ng? ");
end

function confirm_lspf_change_high(nCount)
	local nLv = GetTaskTemp(TT_LSPF_CHANGE_LV);
	local tNum = {3,3,5,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("B¹n chÊp nhËn tiªu hao "..nNum.." lÇn"..nLv.." (cÊp) Linh th¹ch phèi ph­¬ng ngÉu nhiªn ®æi lÊy "..nCount.."Tr­¬ng"..(nLv+1).." (cÊp) Linh th¹ch phèi ph­¬ng? ",
		3,
		"§ång ý/#give_lspf_change_high("..nLv..","..nNum..","..nCount..")",
		"Chän sai. Trë vÒ/zhiding_lspf_gaoji",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function give_lspf_change_high(nLv,nNum,nCount)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®èi lÊy Linh th¹ch phèi ph­¬ng.");
		return
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	SetTask(tPeifangTask[nLv+1],GetTask(tPeifangTask[nLv+1])+nCount);
	Msg2Player("B¹n nhËn ®­îc "..(nLv+1).." (cÊp)-linh th¹ch phèi ph­¬ng."..nCount.." , b¹n cã thÓ t¸ch nã tõ Tô Linh §Ünh. ");	
end

function zhiding_yuehua()
	local strtab = {
		"Ta ph¶i tiªu hao 5 lÇn Linh th¹ch cÊp 5 ngÉu nhiªn ®æi lÊy NguyÖt Hoa. /lingshi_change_yuehua",
--		"ÎÒÒªÏûºÄ5´Î5¼¶ÁéÊ¯Åä·½Ëæ»ú´ÎÊý¶Ò»»1¸öÌìµØÐþ»ÆÊ¯/lspf_change_stone",
		"trë l¹i/zhiding_main",
		"T¹m thêi kh«ng ®æi. /nothing"
		}
	Say("Xin chän vËt phÈm b¹n muèn ®æi. ",
		getn(strtab),
		strtab)	
end

function lingshi_change_yuehua()
	Say("B¹n chÊp nhËn tiªu hao 5 lÇn Linh th¹ch cÊp 5 ngÉu nhiªn ®æi lÊy NguyÖt Hoa?",
		3,
		"§ång ý/confirm_lingshi_yuehua",
		"trë l¹i/zhiding_yuehua",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function confirm_lingshi_yuehua()
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[5]) < 5 then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®æi lÊy lo¹i ®¸ b¹n cÇn. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[5],GetTask(tLingshiTask[5])-5);
	if AddItem(2,1,2002,1) == 1 then
		Msg2Player(" B¹n nhËn ®­îc 1 NguyÖt Hoa ");
	end		
end

function lspf_change_stone()
	Say("B¹n chÊp nhËn tiªu hao 5 lÇn Linh th¹ch phèi ph­¬ng cÊp 5 ngÉu nhiªn ®æi lÊy 1 HuyÒn Hoµng Th¹ch? ",
		3,
		"§ång ý/confirm_lspf_stone",
		"trë l¹i/zhiding_yuehua",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function confirm_lspf_stone()
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[5]) < 5 then
		Talk(1,"","B¹n kh«ng ®ñ sè lÇn ngÉu nhiªn ®Ó ®èi lÊy Linh th¹ch phèi ph­¬ng.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tPeifangTask[5],GetTask(tPeifangTask[5])-5);
	if AddItem(2,1,1151,1) == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 HuyÒn Hoµng Th¹ch ");
	end		
end

function how_change()
	Talk(1,"how_change2","Linh th¹ch trong Tô Linh §Ünh ®· x¸c ®Þnh thuéc tÝnh hay ch­a, t¸ch ra cã thÓ ®­îc 1 thuéc tÝnh ngÉu nhiªn. B¹n cã thÓ th«ng qua sè l­îng linh th¹ch cïng cÊp ®· tiªu hao trong Tô Linh §Ünh ®Ó chØ ®Þnh nhËn ®­îc 1 thuéc tÝnh linh th¹ch cïng cÊp. Phèi ph­¬ng chØ ®Þnh còng lµm nh­ vËy.")
end

function how_change2()
	Talk(1,"how_change3","B¹n cã thÓ linh th¹ch cÊp thÊp trong Tô Linh §Ünh chuyÓn hãa thµnh Linh th¹ch cÊp cao. VÝ dô cho vµo Tô Linh §Ünh 10 Linh th¹ch cÊp 4 ®Ó chuyÓn hãa thµnh 2 Linh th¹ch cÊp 5. Sè l­îng linh th¹ch kh«ng cïng ®¼ng cÊp cÇn ®Ó chuyÓn hãa còng kh«ng gièng nhau. ")
end

function how_change3()
	Talk(1,"OnUse","Linh th¹ch vµ Linh th¹ch phèi ph­¬ng trong Tô Linh §Ünh, ngoµi viÖc t¸ch lÊy vµ chuyÓn hãa ra, cßn cã thÓ chuyÓn hãa chóng thµnh NguyÖt Hoa vµ HuyÒn Hoµng Th¹ch cã hiÖu qu¶ ®Æc biÖt. ")
end

function nothing()

end

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
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