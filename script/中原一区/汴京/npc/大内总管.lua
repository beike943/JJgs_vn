--Àñ¹Ù½Å±¾
--append by lizhi
--2005-10-14 22:52

Include("\\script\\global\\qingzhu_switch.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
Include("\\script\\online\\march08\\march08_head.lua");
Include("\\script\\online\\ngoahotanglong\\nhtl.lua");
Include("\\script\\online\\promotionhe\\vuihe.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\vng\\award\\traothuong3ty.lua")

TASK_BUCHANG = 1781

compensate_taskID = 1225

function main()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%Y%m%d"));
	local SayTable = {};
	local nCount = 0;
-- Trao gi¶i nhµ 3 tû
	if nDate >= 20140318 and nDate <= 20140319 then
		tinsert(SayTable, "Trao gi¶i nhµ 3 tû/TraoThuong2Ty_Menu")
	end
--	if nDate >= 2010102900 and nDate <= 2010121524 and GetGlbValue(GLB_TSK_SERVER_ID) == 2 then
--		tinsert(SayTable, "Ta ®Õn nhËn th­ëng bang héi ®o¹t gi¶i tuÇn Cuéc ChiÕn Hoa Hång/GiveRoseWarWeeklyAward")		
--	end

	if nDate >= 20131227 and nDate <= 20131231 then
		tinsert(SayTable, "NhËn phÇn th­ëng vinh danh game thñ tham gia §¹i Héi ViÖt Trung/Viet_Trung_2013")	
	end
	tinsert(SayTable, "NhËn phÇn th­ëng chèng giÆc Man/RequestWeekEnd")	
	tinsert(SayTable, "KÕt thóc ®èi tho¹i/no")
	
	Say("N¨m míi ®Õn ch­ëng m«n Kim S¬n quyÕt ®Þnh ban ph¸t mét sè quµ ®Ó mäi ng­êi ¨n TÕt vui vÎ!",
		getn(SayTable),
		SayTable
	);
end;
function Viet_Trung_2013()
	local nExtPoint = GetExtPoint(6)
	local nAccount = GetAccount()
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang cña ng­¬i kh«ng ®ñ!");
		return 0;
	end;
	if nExtPoint < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng cã tªn trong danh s¸ch nhËn gi¶i")
	end
	if nExtPoint > 1 then
		Talk(1, "", "§¹i hiÖp ®· nhËn gi¶i råi !!!!!")
	end
	if nExtPoint == 1 then
		if nAccount == "duyxitin123" then
			AddItem(1,6,150,300,4)
			WriteLogEx("NHAN THUONG GIAI DAU VT", "nhËn th­ëng thµnh c«ng ", 1, "§· nhËn phï")
		end
		AddItem(0,105,10108,1,4,-1,-1,-1,-1,-1,-1);
		WriteLogEx("NHAN THUONG GIAI DAU VT", "nhËn th­ëng thµnh c«ng ", 1, "§· nhËn th­ëng")
		VNG_AddExtPoint(6,2)
	else
		WriteLogEx("NHAN THUONG GIAI DAU VT", "nhËn th­ëng thµnh c«ng ", 1, "§· x¶y ra lçi kh«ng nhËn th­ëng ®­îc")
	end
end

tTongList = {
					{"Äheroic",2,1},
}

tTongAward = {
		[1] = {
					[1] = {60000000,3},
					[2] = {50000000,2},
					[3] = {40000000,1},
					[4] = {30000000,0},
					[5] = {20000000,0},
					[6] = {15000000,0},
				},
				
		[2] = {
					[1] = {30000000,1},
					[2] = {25000000,0},
					[3] = {20000000,0},
					[4] = {15000000,0},
					[5] = {10000000,0},
					[6] = {7500000,  0},		
				},
}

function GiveRoseWarWeeklyAward()
	local szTong = GetTongName() or  ""
	local nCheck = 0
	for i=1,getn(tTongList) do
		if szTong == tTongList[i][1] and GetGlbValue(GLB_TSK_SERVER_ID) == tTongList[i][2] then
			nCheck = i
			break		
		end	
	end	
	if nCheck <= 0 then
		Talk(1,"","C¸c h¹ kh«ng thuéc danh s¸ch bang héi ®o¹t gi¶i th­ëng tuÇn nµy!")
		return
	end	
	if GetLevel() < 73 then
		Talk(1,"","§¼ng cÊp 73 trë lªn míi ®­îc nhËn th­ëng!")
		return
	end
	if GetTask(TASK_ROSE_WAR) == 1 then
		Talk(1,"","C¸c h¹ ®· nhËn th­ëng tuÇn nµy!")
		return
	end	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  7 then
		Talk(1,"","Thêi gian gia nhËp cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ nhËn th­ëng tuÇn nµy!")
		return 0
	end
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","Thêi gian t¹i vÞ cña c¸c h¹ Ýt h¬n 7 ngµy, kh«ng thÓ nhËn th­ëng tuÇn nµy!")
		return 0
	end
	if gf_JudgeRoomWeight(4,100," ") == 0 then
		return		
	end
	local nLevel = IsTongMember()
	local nAwardType = tTongList[nCheck][3]
	SetTask(TASK_ROSE_WAR,1)
	ModifyExp(tTongAward[nAwardType][nLevel][1])
	if tTongAward[nAwardType][nLevel][2] > 0 then
		AddItem(2,0,1084,tTongAward[nAwardType][nLevel][2])
		Msg2Player("B¹n nhËn ®­îc "..tTongAward[nAwardType][nLevel][2].." Thiªn Qu¸i Th¹ch.")
		WriteLogEx("Cuoc Chien Hoa Hong","nhËn th­ëng bang héi",tTongAward[nAwardType][nLevel][2],"Thiªn Qu¸i Th¹ch")
	end
	Say("Chóc mõng b¹n ®· nhËn th­ëng thµnh c«ng!",0)
	Msg2Player("B¹n nhËn ®­îc "..tTongAward[nAwardType][nLevel][1].." ®iÓm kinh nghiÖm")	
	WriteLogEx("Cuoc Chien Hoa Hong","nhËn th­ëng bang héi",tTongAward[nAwardType][nLevel][1],"®iÓm kinh nghiÖm")
end

tRole ={
}

function CheckRole(szName)
	for i=1,getn(tRole) do
		if tRole[i][2] == szName then
			return i
		end
	end
	return 0
end

function RequestBHTA()
	local nDate = tonumber(date("%Y%m%d"))	
	if nDate >= 20100507 and nDate <= 20100509 then				
		local nExtVal = GetExtPoint(6)
		if nExtVal ~= 1 then
			Say("C¸c h¹ kh«ng cã trong danh s¸ch tróng th­ëng hoÆc ®· nhËn th­ëng råi!",0)
			return
		end			
		if GetFreeItemRoom() < 2  then
			Say("Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng. H·y s¾p xÕp l¹i!",0)
			return
		end		
		if GetMaxItemWeight() - GetCurItemWeight() < 200 then
			Say("Hµnh trang cña c¸c h¹ qu¸ nÆng. H·y s¾p xÕp l¹i!",0)
			return
		end	
		if nExtVal == 1 then
			PayExtPoint(6,nExtVal)
		end	
	end
end

function no()
end;
--*********************070516·þÎñÆ÷²¹³¥***********************
function Requestcompensate()
	if GetTask(compensate_taskID) == 70516 then
		Talk(1,"","Ng­¬i ®· nhËn th­ëng 1 lÇn råi. §õng tham lam thÕ!")
		return
	end
	local playerlevel = GetLevel()
	local exp_num = (playerlevel * playerlevel * playerlevel * playerlevel  / 4) +( GetPlayerGoldCoin() * 100)
	if exp_num < 10000 then
		exp_num = 10000
	elseif exp_num > 500000000 then
		exp_num = 500000000
	end
	ModifyExp(exp_num)
	Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")
	ModifyReputation(200,0)
	SetTask(336,(GetTask(336) + 100))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 100 ®iÓm cèng hiÕn s­ m«n!")
	SetTask(compensate_taskID,70516)
	local jun_gong = GetTask(701)
	local jun_gong_song = (jun_gong+1000)
	local jun_gong_liao = (jun_gong-1000)
	Say("Ng­¬i cã thÓ nhËn ®­îc <color=yellow>1000<color> ®iÓm qu©n c«ng. Muèn chän qu©n c«ng bªn nµo?",
	2,
	"Ta muèn t¨ng qu©n c«ng phe Tèng/#SetTask(701,"..jun_gong_song..")",
	"Ta muèn t¨ng qu©n c«ng phe Liªu/#SetTask(701,"..jun_gong_liao..")"
	)
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1000 ®iÓm qu©n c«ng!")
	WriteLog("Båi th­êng: 70516"..GetName().."NhËn ®­îc båi th­êng, ®iÓm kinh nghiÖm lµ:"..exp_num)
end
function RequestWeekEnd()

local szSay = {
			"§¹i Tèng sÏ ghi nhí c«ng tr¹ng ®¸nh ®uæi giÆc Man cña <sex>, giê muèn xem môc g×?",
			"Ta muèn nhËn thï lao/get_award",
			"Ta muèn xem c«ng lao/query_offer"};
			
	if CheckTime(5) == 1 or CheckTime(6) == 1 or CheckTime(0) == 1 then	--ÖÜÄ©µÄÊ±ºò²ÅÓÐ»î¶¯
		SelectSay(szSay);
	else
		Talk(1,"","Xin lçi! Trong thêi gian diÔn ra ho¹t ®éng míi cã thÓ nhËn th­ëng!");
	end;
end;
--³¬°×½ðÕÊºÅ
function RequestSuperAccountAward()
	local selTab = {
				"Ta muèn nhËn phÇn th­ëng Siªu b¹ch kim/get_sa_bag_award",
				"Ta muèn nhËn phÇn th­ëng t¨ng cÊp/get_sa_uplevel_award",
				"Lµm thÕ nµo ®Ó cã tµi kho¶n nhËn phÇn th­ëng?/know_super_account",
				"Ta kh«ng ph¶i lµ chñ nh©n cña tµi kho¶n/no",
				}
	Say("Ng­¬i muèn phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function know_super_account()
	Talk(2,"RequestSuperAccountAward","<color=yellow>Tõ 15/04-15/07<color>, ng­êi ch¬i cã thÓ tham gia nhiÒu ho¹t ®éng ®Ó nhËn phÇn th­ëng Siªu b¹ch kim. Tõ <color=yellow>15/04-15/07<color> tham gia nhiÒu ho¹t ®éng ®Ó nhËn phÇn th­ëng gi¸ trÞ. Tham kh¶o website <color=yellow>volam2.zing.vn<color>","Khi ®¹t ®Õn cÊp 40 vµ 70 nhí ®Õn chç ta ®Ó nhËn phÇn th­ëng t¨ng cÊp. Mçi 1 tµi kho¶n chØ nhËn phÇn th­ëng 1 lÇn. Chóc ch¬i vui vÎ!");
end;

function get_sa_bag_award()
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 6 then
		Talk(1,"","PhiÒn b»ng h÷u buæi s¸ng tõ <color=yellow>7:00-11:00<color> ®Õn nhËn th­ëng nhÐ!");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate < 2007041512 then
		Talk(1,"RequestSuperAccountAward","Xin c¸c vÞ <color=yellow>sau 12:00 tr­a ngµy 15/04 4<color> l¹i ®Õn nhËn th­ëng nhÐ!");
		return 0;
	end;
	if nDate >= 2007081523 then
		Talk(1,"RequestSuperAccountAward","Xin lçi ®· qu¸ thêi gian nhËn quµ Siªu B¹ch Kim, thêi gian nhËn th­ëng lµ: <color=yellow>15/04/2007 ®Õn 15/08/2007<color>.");
		return 0;
	end;
	local nExtPt = GetExtPoint(4);
	if is_super_account() == 0 then
		Talk(1,"RequestSuperAccountAward","Xin lçi, ng­¬i kh«ng ph¶i lµ chñ nh©n cña tµi kho¶n nµy!");
		return 0;
	end;
	if nExtPt ~= 0 then
		Talk(1,"RequestSuperAccountAward","Ng­¬i ®· nhËn quµ Siªu B¹ch Kim, <color=yellow>mçi mét tµi kho¶n chØ cã thÓ nhËn ®­îc 1 lÇn<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang cña ng­¬i kh«ng ®ñ.");
		return 0;
	end;
	WriteLog("[LÔ bao b¹ch kim]:"..GetName().."NhËn quµ Siªu B¹ch Kim");
	AddExtPoint(4,1);	--ÈÃextpoint4±äÎª1
end;

function get_sa_uplevel_award()
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 6 then
		Talk(1,"","PhiÒn b»ng h÷u buæi s¸ng tõ <color=yellow>7:00-11:00 giê<color> ®Õn nhËn quµ nhÐ!");
		return 0;
	end;
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"RequestSuperAccountAward","Ng­¬i ph¶i <color=yellow>gia nhËp l­u ph¸i<color> míi cã thÓ nhËn phÇn th­ëng t¨ng cÊp.");
		return 0;
	end;
	if GetTask(501) == 0 then
		Talk(1,"RequestSuperAccountAward","NhËn phÇn th­ëng <color=yellow>Siªu B¹ch Kim<color> tr­íc, sau ®ã nhËn <color=yellow>phÇn th­ëng t¨ng cÊp<color>.");
		return 0;
	end;
	local nExtPt = GetExtPoint(4);
	if is_super_account() == 0 then
		Talk(1,"RequestSuperAccountAward","Xin lçi, ng­¬i kh«ng ph¶i lµ chñ nh©n cña tµi kho¶n nµy!");
		return 0;
	end;
	local nLevel = GetLevel()
	if nLevel < 40 then
		Talk(1,"RequestSuperAccountAward","Ng­¬i ch­a ®¹t <color=yellow>cÊp 40<color>, ®îi ®Õn cÊp 40 míi cã thÓ nhËn phÇn th­ëng lµ <color=yellow>bé trang phôc s­ m«n s¬ cÊp<color>.");
		return 0;
	end;
	if gf_JudgeRoomWeight(6,500) == 0 then
		Talk(1,"RequestSuperAccountAward","Kho¶ng trèng trong hµnh trang cña ng­¬i kh«ng ®ñ!");
		return 0;
	end;
	local nTaskValue = GetTask(502);
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	if nTaskValue < 40 and nLevel < 70 then
		SetTask(502,40);
		Add_Faction_Equipment(nRoute,nBody,40,4);
		Msg2Player("B¹n nhËn ®­îc bé trang phôc s­ m«n s¬ cÊp");
		WriteLog("[LÔ bao b¹ch kim]:"..GetName().."nhËn trang phôc s­ m«n cÊp 40");
	elseif nTaskValue <= 40 then
		if nLevel < 70 then
			Talk(1,"","Ng­¬i ch­a ®¹t <color=yellow>cÊp 70<color>. §îi ®Õn cÊp 70 míi cã thÓ nhËn phÇn th­ëng <color=yellow>500 ®iÓm cèng hiÕn, 1 b¶o r­¬ng vµ trang phôc s­ m«n cao cÊp t­¬ng øng<color>.");
		else
			SetTask(502,70);
			SetTask(336,GetTask(336)+500)
			Msg2Player("B¹n nhËn ®­îc 500 ®iÓm cèng hiÕn s­ m«n");
			AddItem(2,0,606,1);
			Msg2Player("B¹n nhËn ®­îc 1 b¶o r­¬ng");
			Add_Faction_Equipment(nRoute,nBody,63,4);
			Msg2Player("B¹n nhËn ®­îc 1 trang phôc s­ m«n cao cÊp");
			WriteLog("[LÔ bao b¹ch kim]:"..GetName().."NhËn ®­îc trang phôc s­ m«n cÊp 60");
		end;
	elseif nTaskValue == 70 then
		Talk(1,"RequestSuperAccountAward","Xin lçi, ng­¬i ®· nhËn hÕt phÇn th­ëng t¨ng cÊp råi, kh«ng thÓ nhËn thªm n÷a.");
	end;
end;

tAwardInfo = 	--extpointfunc.lua½Å±¾ÀïÃæÒ²ÓÐÏàÓ¦µÄ±í
{			--ÎïÆ·Ãû		ËùÐè»ý·Ö  ÓÐÐ§Ê±¼ä
	[1] =  {"C©y B¸t Nh·",			1,7*24*3600,	{2,0,398}},
	[2] =  {"ThÇn N«ng §¬n",			2,7*24*3600,	{2,1,343}},
	[3] =  {"Cöu chuyÓn håi hån ®¬n",		3,30*24*3600,	{1,0,32}},
	[4] =  {"ThÇn hµnh bÝ phæ",			4,30*24*3600,	{0,200,39}},
	[5] =  {"Tñ nhá",			6,7*24*3600,	{2,1,1069}},
	[6] =  {"Bao lín-gi¸m ®Þnh phï cÊp 7",	10,7*24*3600,	{2,1,1058}},
	[7] =  {"§»ng Vô",				20,30*24*3600,	{0,105,20}},
	[8] =  {"ThÇn hµnh b¶o ®iÓn",			40,90*24*3600,	{0,200,40}},
	[9] =  {"Hßa ThÞ BÝch",			80,7*24*3600,	{2,1,1001}},
	[10] = {"Héi Minh LÖnh Bµi",			100,7*24*3600,	{2,0,125}},
	[11] = {"N«ng Tang phæ",			200,7*24*3600,	{2,1,1056}},
	[12] = {"Thiªn Th¹ch linh th¹ch",			400,7*24*3600,	{2,1,1068}},
	[13] = {"ChiÕn ThÇn hoµn",			1000,7*24*3600,	{2,1,1005}},
	[14] = {"T¸i chiÕn giang hå-§¹i lÔ bao",	2000,7*24*3600,	{2,1,1105}},
	[15] = {"T¸i chiÕn giang hå-Hµo hoa lÔ bao",	10000,7*24*3600,{2,1,1106}},
	[16] = {"T¸i chiÕn giang hå-ChÝ t«n lÔ bao",	20000,7*24*3600,{2,1,1107}},
}

function RequestChongZhiAward()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate < 2007051712 then
		Talk(1,"","Ho¹t ®éng vÉn ch­a chÝnh thøc b¾t ®Çu, <color=yellow>Sau 12 giê tr­a 17/5<color> quay l¹i t×m ta!");
		return 0;
	end;
	local selTab = {
				format("Ta muèn dïng ®iÓm tÝch lòy ®æi phÇn th­ëng/#list_chongzhi_award(%d,%d)",1,getn(tAwardInfo)),
				"Ta muèn xem thuyÕt minh ho¹t ®éng/chong_zhi_introduce",
				"Kh«ng cã viÖc g×/no",
				}
	Say("Hoan nghªnh anh hïng tham gia ho¹t ®éng lÇn nµy",getn(selTab),selTab);
end;

function chong_zhi_introduce()
	Talk(1,"RequestChongZhiAward","Ho¹t ®éng T×m cùu chiÕn h÷u tõ 12 giê 17/5 chÝnh thøc b¾t ®Çu, hoan nghªnh c¸c b¹n ®Õn chç ta t×m chiÕn h÷u hoÆc kÐo nhiÒu b»ng h÷u ®Õn, chØ cÇn hä n¹p thÎ vµ b¹n xem b¹n nh­ ng­êi giíi thiÖu, c¨n cø vµo sè l­îng thÎ hä n¹p b¹n sÏ nhËn ®iÓm tÝch lòy t­¬ng øng, ®æi c¸c phÇn th­ëng. Thêi gian n¹p thÎ lµ: <color=yellow>12 giê 17/5/2007 ®Õn 12 giê 17/6/2007, thêi gian chÊm døt nhËn phÇn th­ëng lµ: 24h 15/7/2007<color>. Chi tiÕt xin xem trang chñ.");
end;

function get_chongzhi_award_list()
	local tSelTab = {};
	for i=1,getn(tAwardInfo) do
		tinsert(tSelTab,format(tAwardInfo[i][1].."(cÇn %d ®iÓm tÝch lòy)/#give_chongzhi_award(%d)",tAwardInfo[i][2],i));
	end;
	return tSelTab;
end;

function list_chongzhi_award(nPageNum,nCount)
	local tList = get_chongzhi_award_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr­íc \n /#list_chongzhi_award(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#list_chongzhi_award(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n Ph¶n håi/main");
	tinsert(selTab,"§Ó ta nghÜ l¹i/no");
	local nCurPt = GetExtPoint(6);
	Say("Ng­¬i hiÖn cã <color=yellow>"..nCurPt.."<color> ®iÓm tÝch lòy, muèn ®æi phÇn th­ëng g×?",getn(selTab),selTab);
end;

function give_chongzhi_award(nAwardIdx)
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 6 then
		Talk(1,"","<color=green>LÔ quan<color>: Mêi b¹n ®Õ nhËn lÔ vËt tõ <color=yellow>7 giê s¸ng ®Õn 11 giê tr­a<color>");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang cña ng­¬i kh«ng ®ñ.");
		return 0;
	end;
	local nCurPt = GetExtPoint(6);
	local nNeedPt = tAwardInfo[nAwardIdx][2];
	if nCurPt < nNeedPt then
		Talk(1,"RequestChongZhiAward","ThËt ®¸ng tiÕc, ®iÓm tÝch lòy cña ng­¬i kh«ng ®ñ!");
		return 0;
	end;
	SetTaskTemp(16,nAwardIdx);
	WriteLog("[§iÓm n¹p thÎ ®æi phÇn th­ëng]:"..GetName().."§iÓm tÝch ph©n hiÖn t¹i lµ"..nCurPt..", hiÖn t¹i muèn dïng"..nNeedPt.."®iÓm tÝch lòy ®æi"..nAwardIdx.."phÇn th­ëng");
	PayExtPoint(6,nNeedPt);
end;

function is_super_account()
	local szAccount = GetAccount();
	if strlen(szAccount) < 4 then
		return 0;
	end;
	local cChar1 = strsub(szAccount,1,1);
	local cChar2 = strsub(szAccount,2,2);
	local cChar3 = strsub(szAccount,3,3);
	local cChar4 = strsub(szAccount,4,4);
	if (cChar1 == "K" or cChar1 == "k") and (cChar2 == "S" or cChar2 == "s") then
		if ((cChar3 == "Q" or cChar3 == "q") and (cChar4 == "D" or cChar4 == "d")) or
			((cChar3 == "J" or cChar3 == "j") and (cChar4 == "X" or cChar4 == "x")) or 
			((cChar3 == "W" or cChar3 == "w") and (cChar4 == "Z" or cChar4 == "z")) or
			((cChar3 == "G" or cChar3 == "g") and (cChar4 == "W" or cChar4 == "w")) then
				return 1;
		else
			return 0;
		end;
	else
		return 0;
	end;
end;

function GiveLuckyAward_201009()
	if gf_GetExtPointBit(2, 1) == 0 then
		Talk(1,"","§¸ng tiÕc lµ ng­¬i kh«ng tróng th­ëng hoÆc ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn tiÕp!")
		return
	end 
	if gf_SetExtPointBit(2, 1, 0) == 1 then
		gf_AddItemEx2({2, 1, 1068, 1}, "Thiªn Th¹ch linh th¹ch", "Nhan thuong may man thang 9 nam 2010", "nhËn", 30 * 24 * 3600)
		Msg2Player("NhËn ®­îc 1 Thiªn Th¹ch Linh Th¹ch")
	end
end