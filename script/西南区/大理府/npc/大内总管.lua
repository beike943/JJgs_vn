--Àñ¹Ù½Å±¾
--append by lizhi
--2005-10-14 22:52

Include("\\script\\global\\qingzhu_switch.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

TASK_BUCHANG = 1781

function main()
	--Say("<color=green>Àñ¹Ù<color>£ºÏÖÔÚÃ»ÓÐ¶«Î÷¿ÉÒÔÁìÈ¡Å¶¡£",0);
	
	local nDate;
	nDate = tonumber(date("%Y%m%d%H"));
	
	local SayTable = {};
	local nCount = 3;
	SayTable[1] = "NhËn trang bÞ Tr­êng Kh«ng./RequestChangKongCloth";
	SayTable[2] = "NhËn ph¸o hoa./RequestYanHuo";
	SayTable[3] = "NhËn phÇn th­ëng chèng giÆc Man/RequestWeekEnd";
	
	
	if nDate >= 2006011909 and nDate < 2006020207 then
		nCount = nCount + 1;
		SayTable[nCount] = "NhËn bé trang bÞ n¨m míi/RequestNewYearCloth";
	end;
	
	if nDate > 2006012000 and nDate < 2006020600 then
		nCount = nCount + 1;
		SayTable[nCount] = "NhËn bao l× x× n¨m míi/RequestNewYearPresent";
	end;

	if nDate > 2006012409 and nDate < 2006022307 then
		nCount = nCount + 1;
		SayTable[nCount] = "NhËn trang bÞ ®­îc tÆng khi n¹p tiÒn b»ng thÎ ng©n hµng/RequestClothByBank"
	end;
	
	if nDate >= 2006020900 and nDate < 2006021400 then
		nCount = nCount + 1;
		SayTable[nCount] = "NhËn danh hiÖu Tiªu Dao V¨n Khóc Tinh/RequestXiaoYaoTitle"
	end

	SayTable[nCount + 1] = "KÕt thóc ®èi tho¹i/no";
	
	Say("N¨m míi ®Õn ch­ëng m«n Kim S¬n quyÕt ®Þnh ban ph¸t mét sè quµ ®Ó mäi ng­êi ¨n TÕt vui vÎ!",
		nCount + 1,
		SayTable
	);
end;

function RequestYanHuo()

	if QINGZHU_20W == 1 and GetTask(TASK_QINGZHU) < 3 then
		qingzhu();
	else
		Talk(1,"","Xin lçi! Mçi ng­êi chØ ®­îc l·nh mét lÇn!");
	end;
end;	
		

function qingzhu()
	local szSay1 = {
		"§Ó t¨ng kh«ng khÝ n¸o nhiÖt, Minh Chñ Kim S¬n nhê ta ph¸t ph¸o hoa cho mäi ng­êi, chØ cÇn cÊp 10 trë lªn lµ cã thÓ nhËn ®­îc 3 ph¸o hoa.",
		"NhËn ph¸o hoa./begin"
	};
	local szSay2 = {
		"§Ó t¨ng kh«ng khÝ n¸o nhiÖt, Minh Chñ Kim S¬n nhê ta ph¸t ph¸o hoa cho mäi ng­êi, chØ cÇn cÊp 10 trë lªn lµ cã thÓ nhËn ®­îc 3 ph¸o hoa.",
		"KÕt thóc ®èi tho¹i/no"
	};
	if GetLevel() >= 10 then
		SelectSay(szSay1);
	else
		SelectSay(szSay2);
	end;
end;

--³àÄ»Ñæ»ð	2	1	191
--À¶Ä»Ñæ»ð	2	1	192
--³ÈÄ»Ñæ»ð	2	1	193
--ÉñÃØÑÌ»¨	2	1	194

function begin()
	local szTalk = {
		"Nµo h·y cïng nhau ®èt ph¸o chóc mõng!"
	};
	local nRetCode = 0;
	
	if GetTask(TASK_QINGZHU) == 0 then
		nRetCode = GiveYanhuo(0);
	elseif GetTask(TASK_QINGZHU) == 1 then
		nRetCode = GiveYanhuo(1);
	elseif GetTask(TASK_QINGZHU) == 2 then
		nRetCode = GiveYanhuo(2);
	end;
	if nRetCode == 1 then
		TalkEx("", szTalk);
	end;
end;

function GiveYanhuo(value)
	local szNot = {
		"Xin lçi! Kh«ng ®ñ kho¶ng trèng trong hµnh trang! S¾p xÕp l¹i råi h·y ®Õn t×m ta!"
	};
	local nRetCode = 0;
	if value == 0 then
		nRetCode = AddItem(2,1,189,-1,1); 	--³ÈÉ«ÑÌ»¨
		if nRetCode ~= 1 then	--Ã»ÓÐ³É¹¦Ìí¼Ó
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 1);
			return GiveYanhuo(1)
		end;
	elseif value == 1 then
		nRetCode = AddItem(2,1,190,-1,1);	--À¶É«ÑÌ»¨
		if nRetCode ~= 1 then	--Ã»ÓÐ³É¹¦Ìí¼Ó
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 2);
			return GiveYanhuo(2)
		end;
	elseif value == 2 then
		--ÆäËûµÄÑÌ»ðËæ¼´¸øÒ»¸ö
		local yh_table = {
			{2, 1, 191},
			{2, 1, 192},
			{2, 1, 193},
			{2, 1, 194}
		};
		local nCount = getn(yh_table);
		local nIndex = random(1, nCount);
		nRetCode = AddItem(yh_table[nIndex][1], yh_table[nIndex][2], yh_table[nIndex][3],-1,1);
		if nRetCode ~= 1 then	--Ã»ÓÐ³É¹¦Ìí¼Ó
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 3);	--È«²¿ÁìÈ¡Íê±Ï
			return 1
		end;
	end;
end;

function no()
end;

function RequestClothByBank()
	if GetExtPoint(3) >= 2 then
		Say("Thêi gian cã hiÖu lùc khi n¹p tiÒn b»ng thÎ ng©n hµng ®Ó nhËn ®­îc trang bÞ lµ <color=yellow>9:00 s¸ng ngµy 24 th¸ng 1 ®Õn 9:00 s¸ng ngµy 14 th¸ng 2<color>. Thêi gian l·nh th­ëng lµ <color=yellow>9:00 ngµy 24 th¸ng 1 ®Õn ngµy b¶o tr× 23 th¸ng 2<color>. H·y kiÓm tra l¹i kho¶ng trèng vµ søc lùc cña hµnh trang!",
			2,
			"L·nh th­ëng/GetClothByBank",
			"§îi ta kiÓm tra l¹i!/no"
		);
	else
		Say("Xin lçi! §· hÕt thêi gian nhËn trang bÞ khi n¹p tiÒn b»ng thÎ ng©n hµng!", 0);
	end;
end;

function GetClothByBank()
	if GetExtPoint(3) >= 2 then
		PayExtPoint(3, 2);
	end;
end;

function RequestChangKongCloth()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"","Ch­a gia nhËp m«n ph¸i, t¹m thêi kh«ng nhËn ®­îc trang bÞ Tr­êng Kh«ng.!");
		return
	end;
	
	if (GetExtPoint(4) >= 32768) then	
		Talk(1,"","D÷ liÖu c¸ nh©n cã chót kh¸c th­êng! Vui lßng liªn hÖ nhµ cung cÊp!");
		
	elseif (GetExtPoint(4) >= 1)then
		Say("<color=yellow>Tr­êng Kh«ng ®¹i hiÖp<color> nhê ta tÆng mãn trang bÞ, ng­¬i muèn nhËn kh«ng?",
				2,
				"NhËn trang bÞ Tr­êng Kh«ng./changkongcloth",
				"Kh«ng! LÇn sau ®i!/no");
	else
		Talk(1,"","<color=yellow>Tr­êng Kh«ng ®¹i hiÖp<color> chø?®Ó l¹i trang bÞ cho ng­¬i.");
	end;
end;

				
function changkongcloth()		
	PayExtPoint(4,1);
end;

--ÐÒÔËÀñ°ü
function RequestLuckyBag()

		Talk(1,"","Ho¹t ®éng n¹p thÎ tÆng l× x× ®· kÕt thóc vµo <color=yellow>19 th¸ng 12 n¨m 2005<color>.");
		return
end;

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

--¾Å×ª»Ø»êµ¤(1,0,32)

function RedeemAccountBlock()

	if PlayerIndex <= 0 then
		return
	end;
	if GetCreateTime() > 1135785775 then
		local szTalk = {
			"Xin lçi! Nh©n vËt míi t¹o kh«ng thÓ nhËn båi th­êng!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	nDate = tonumber(date("%Y%m%d"));
	if nDate < 20051229 or nDate > 20060109 then
		local szTalk = {
			"Xin lçi! Thêi gian nhËn båi th­êng ®· hÕt!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	if GetLevel() < 10 or GetExtPoint(0) == 0 then
		local szTalk = {
			"Xin lçi! Nh©n vËt cÊp 10 trë lªn n¹p thÎ míi nhËn ®­îc båi th­êng!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	local nTask = GetTask(TASK_BUCHANG);
	if nTask >= 6 then
		local szTalk = {
			"§a t¹ <sex> ®· nhËn chót lßng thµnh cña ta!"
		}
		TalkEx("", szTalk);
		return
	end;
	
	local n = 6 - nTask;
	if nTask >= 1 and nTask < 6 then
		local szSay = {
			"<sex> cã hµi lßng víi sù bï ®¾p nµy kh«ng?",
			"Hµi lßng/#OkRedeem("..n..")",
			"Kh«ng hµi lßng/NoRedeem"
		};
		SelectSay(szSay);
		return
	end
	
	local szTalk = {
		"Minh Chñ Kim S¬n cã nãi mÊy ngµy nay g©y nhiÒu c¶n trë cho ng­¬i khi hµnh hiÖp giang hå. §Ó t¹ lçi, Minh chñ sÏ båi th­êng 3 ngµy nh©n ®«i ®iÓm kinh nghiÖm. Thêi gian nh©n ®«i b¾t ®Çu tõ 18:00 ngµy 31 th¸ng 12 ®Õn 6:00 ngµy 4 th¸ng 1. Thêi gian l·nh båi th­êng b¾t ®Çu tõ h«m nay ®Õn 6:00 ngµy 9 th¸ng 1.",
		"Ta tÆng ng­¬i tr­íc 1 viªn Cöu ChuyÓn Hoµn Hån §¬n!",
		"Sau ®ã h·y chän 3 bé vËt phÈm tiÖn dông!"
	};
	
	TalkEx("RedeemBlockNext", szTalk);
	do
		return
	end

	if PlayerIndex > 0 then
		-- 1132862405=2005Äê11ÔÂ25ºÅÁè³¿4µã     1133279385=2005Äê11ÔÂ30ºÅÁè³¿0µã
		if GetLastLoginTime() > 1132862405 and GetCreateTime() < 1133279385 then
			if GetTask(600) == 0 then
				local nLevel = GetLevel()
				if nLevel <= 50 then
					local nExp = nLevel * nLevel * 100
					if nExp < 10000 then
						nExp = 10000
					end
					ModifyExp(nExp)
				else
					ModifyExp(nLevel * 10000)
				end
				Talk(1, "", "Xin lçi! Ch¾c ®· g©y cho ng­¬i nhiÒu phiÒn phøc. PhÇn ®iÓm kinh nghiÖm nµy xin nhËn lÊy. Tõ nay, nÕu x¶y ra sù cè nµo, triÒu ®×nh sÏ hoµn toµn chÞu tr¸ch nhiÖm!")
			else
				Talk(1, "", "B»ng h÷u ®· nhËn båi th­êng. Tõ nay, nÕu cßn sù cè, triÒu ®×nh sÏ hoµn toµn chÞu tr¸ch nhiÖm!")
			end
		else
			Talk(1, "", "D­êng nh­ ng­¬i ch­a chÞu tæn h¹i nµo. L·o phu kh«ng thÓ båi th­êng cho ng­¬i!")
		end
		SetTask(600, 1)
	end
end

function RedeemBlockNext()
	local szSay = {
		"H·y x¸c nhËn ®ñ 5 « hµnh trang chøa vËt phÈm vµ søc lùc 167!",
		"NhËn båi th­êng./GetRedeemBlock",
		"Vui lßng s¾p xÕp l¹i hµnh trang!/no"
	};
	SelectSay(szSay);
end;

--¹²¹¤¸ä	0	200	23
--À×Éñµ¶	0	200	24
--Ñ×µÛ³ú	0	200	25
--ÅÌ¹Å¸«	0	200	26
--Ö¯Å®Ëó	0	200	27
--ÉñÅ©³ú	0	200	28

function GetRedeemBlock()
	local szSay = {
		"H·y chän lÊy vËt phÈm hoµng kim thø 1!",
		"Cuèc Céng C«ng/#GetRedeemItemOne(0)",
		"L«i ThÇn ®ao/#GetRedeemItemOne(1)",
		"Cuèc Viªm §Õ/#GetRedeemItemOne(2)",
		"Bµn Cæ phñ/#GetRedeemItemOne(3)",
		"Chøc N÷ thoa/#GetRedeemItemOne(4)",
		"Cuèc ThÇn N«ng/#GetRedeemItemOne(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemOne(nIndex)
	SetTaskTemp(240, nIndex);
	
	local szSay = {
		"H·y chän lÊy vËt phÈm hoµng kim thø 2!",
		"Cuèc Céng C«ng/#GetRedeemItemTwo(0)",
		"L«i ThÇn ®ao/#GetRedeemItemTwo(1)",
		"Cuèc Viªm §Õ/#GetRedeemItemTwo(2)",
		"Bµn Cæ phñ/#GetRedeemItemTwo(3)",
		"Chøc N÷ thoa/#GetRedeemItemTwo(4)",
		"Cuèc ThÇn N«ng/#GetRedeemItemTwo(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemTwo(nIndex)
	SetTaskTemp(241, nIndex);
	
	local szSay = {
		"H·y chän lÊy vËt phÈm hoµng kim thø 3!",
		"Cuèc Céng C«ng/#GetRedeemItemThree(0)",
		"L«i ThÇn ®ao/#GetRedeemItemThree(1)",
		"Cuèc Viªm §Õ/#GetRedeemItemThree(2)",
		"Bµn Cæ phñ/#GetRedeemItemThree(3)",
		"Chøc N÷ thoa/#GetRedeemItemThree(4)",
		"Cuèc ThÇn N«ng/#GetRedeemItemThree(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemThree(nIndex)
	SetTaskTemp(242, nIndex);
	
	ITEM_TABLE = {
		"Cuèc Céng C«ng",
		"L«i ThÇn ®ao",
		"Cuèc Viªm §Õ",
		"Bµn Cæ phñ",
		"Chøc N÷ thoa",
	    "Cuèc ThÇn N«ng"
	};
	if GetTask(TASK_BUCHANG) == 0 then	--»¹Ã»ÓÐÁìÈ¡¹ý
		AddItem(1, 0, 32, 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(240), 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(241), 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(242), 1, 1);
		SetTask(TASK_BUCHANG, 1);
		WriteLog("#Ho¹t ®éng båi th­êng trong tÕt Nguyªn §¸n LOG: ["..GetAccount().."] ["..GetName().."] ["..date("%y%m%d").."]nhËn ®­îc 1 Cöu ChuyÓn, 1 ["..ITEM_TABLE[GetTaskTemp(240)+1].."], ["..ITEM_TABLE[GetTaskTemp(241)+1].."] vµ 1 ["..ITEM_TABLE[GetTaskTemp(242)+1].."]");
	end;
	
	local szSay = {
		"<sex> cã hµi lßng víi sù bï ®¾p nµy kh«ng?",
		"Hµi lßng/#OkRedeem(5)",
		"Kh«ng hµi lßng/NoRedeem"
	};
	SelectSay(szSay);
end

--ÉñÃØÑÌ»¨	2	1	194
function OkRedeem(nCount)
	local n = GetTask(TASK_BUCHANG);
	local szTalk = {
		"<sex> Xin ®a t¹!"
	};
	SetTask(TASK_BUCHANG, n + nCount);
	AddItem(2, 1, 194, nCount, 1);
end;

function NoRedeem()
	local nTask = GetTask(TASK_BUCHANG);
	
	if nTask >= 6 then
		return
	end;
	
	local szTalk = {
		"<sex> cßn ch­a hµi lßng sao? Xin h·y nhËn lÊy ph¸o hoa cho ngu«i giËn!"
	};
	TalkEx("NoRedeemNext", szTalk);
end;

function NoRedeemNext()
	local nTask = GetTask(TASK_BUCHANG);
	SetTask(TASK_BUCHANG, nTask + 1);
	AddItem(2, 1, 194, 1, 1);
end;

function RequestNewYearCloth()
	if GetExtPoint(5) > 0 then
		Say("Thêi gian ho¹t ®éng n¹p thÎ th¸ng nhËn bé trang bÞ n¨m míi cã hiÖu lùc tõ <color=yellow>9:00 s¸ng ngµy 17 th¸ng 1 ®Õn 9:00 s¸ng ngµy 26 th¸ng 1<color>. Thêi gian l·nh th­ëng cã hiÖu lùc lµ <color=yellow>9h:00 ngµy 19.01 ®Õn ngµy b¶o tr× 2 th¸ng 2<color>. H·y kiÓm tra l¹i hµnh trang vµ søc lùc!",
			2,
			"L·nh th­ëng/GetNewYearCloth",
			"§îi ta kiÓm tra l¹i!/no"
		);
	else
		Say("Xin lçi! §· hÕt thêi gian nhËn trang bÞ khi n¹p thÎ th¸ng!", 0);
	end;
end;

function GetNewYearCloth()
	PayExtPoint(5, 1);
end;

--´º½ÚËÍ´óÀñ°ü(added by yanjun,06-01-10)
function RequestNewYearPresent()
	if GetLevel() < 10 then
		Say("<color=green>LÔ Quan<color>Xin lçi! Nh©n vËt cÊp 10 trë lªn míi nhËn ®­îc bao l× x× n¨m míi!",0)
		return 0
	end
	Say("Ho¹t ®éng tÆng l× x× n¨m míi kÕt thóc vµo <color=yellow>5 th¸ng 2 n¨m 2006<color>. H·y kiÓm tra l¹i kho¶ng trèng vµ søc lùc cña hµnh trang!",
			2,
			"L·nh th­ëng/GiveNYPresent",
			"§îi ta kiÓm tra l¹i!/no");	
end

function GiveNYPresent()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TASK_GOT_LIBAO) ~= nDate then
		SetTask(TASK_GOT_LIBAO,0)
	end
	if GetTask(TASK_GOT_LIBAO) == 0 then
		if nDate == 20060128 or nDate == 20060129 then
			if AddItem(2,1,265,2) == 1 then	--´óÀñ°ü
				WriteLog("[Ho¹t ®éng mïa xu©n (l·nh l× x×)]:"..GetName().."§· nhËn 2 bao l× x× n¨m míi!")
				SetTask(TASK_GOT_LIBAO,nDate)
				Say("H·y nhËn lÊy tÆng phÈm cña ng­¬i!",0)
			end
		else
			if AddItem(2,1,265,1) == 1 then	--´óÀñ°ü
				WriteLog("[Ho¹t ®éng mïa xu©n (l·nh l× x×)]:"..GetName().."§· nhËn 1 bao l× x× n¨m míi!")
				SetTask(TASK_GOT_LIBAO,nDate)
				Say("H·y nhËn lÊy tÆng phÈm cña ng­¬i!",0)
			end		
		end
	else
		Say("Xin lçi! Mçi ngµy chØ ®­îc l·nh mét lÇn!",0)
	end
end

function RequestXiaoYaoTitle()
	local PlayerTab = {}
	PlayerTab[1] = {"Ng­êi l¹ quen thuéc","406087445"}
	PlayerTab[2] = {"Hi hi-ha ha ha","sutanqing"}
	PlayerTab[3] = {"PhËt T©m Phæ §é","huanglei1204"}
	PlayerTab[4] = {"L·nh V©n Tö Yªn","231238193"}
	PlayerTab[5] = {"*Ba La HiÖp*","cz_wangke"}
	PlayerTab[6] = {"B¹c Mé Khinh Nghª","zhen2519"}
	PlayerTab[7] = {"Th¸i Cùc_T©y M«n Xuy TuyÕt","szh881028"}
	for i=1,getn(PlayerTab) do 
		if GetName() == PlayerTab[i][1] and GetAccount() == PlayerTab[i][2] then
			AddTitle(5,1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc danh hiÖu Tiªu Dao V¨n Khóc Tinh!")
			WriteLog("[Tiªu Dao hái]:"..GetName().."NhËn ®­îc danh hiÖu Tiªu Dao V¨n Khóc Tinh")
			return 1
		end
	end
	Say("Xin lçi! Ng­¬i kh«ng cã tªn trong danh s¸ch nhËn th­ëng!",0)
end
