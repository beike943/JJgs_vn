--File name:	fruit_item.lua
--Describe:		Ë®¹ûÑç»á»î¶¯µÀ¾ß½Å±¾
--Item ID:		2,1,30008	--	Ë®¹û°ü
--				2,1,30009	--	ÆÏÌÑ
--				2,1,30010	--	·¬ÀóÖ¦
--				2,1,30011	--	É½Öñ
--				2,1,30012	--	Å£ÄÌ¹û
--				2,1,30013	--	ÁñÁ«
--Create Date:	2008-06-23
--Author:		chenbenqian


DATE_FRUIT_ITEM_VIET_END		= 2008080100;		-- Ë®¹ûÑç»á»î¶¯µÀ¾ßÊ¹ÓÃ½áÊøÈÕÆÚ

g_tFruitItemList = 
{
	--		"Ãû³Æ",	G1,G2,G3,¾­Ñé,¸ÅÂÊ
	[1] = {"Tói tr¸i c©y",2,1,30008},				--Éè¶¨¸ÃÏîµÄË÷Òý±ØÐëÎª1
	[2] = {"Nho",	2,1,30009,8,	60},
	[3] = {"M·ng cÇu",2,1,30010,80,	20},
	[4] = {"M¨ng côt",	2,1,30011,800,	14},
	[5] = {"Vó s÷a",2,1,30012,8000,	4},
	[6] = {"SÇu riªng",	2,1,30013,80000,2},		--Éè¶¨¸ÃÏîµÄË÷Òý±ØÐëÎª6
}

g_tPrizeItemList =
{
	--		"Ãû³Æ",		G1,	G2,		G3,	¸ÅÂÊ
	[1] = {"Chiªm Y Phæ",	0,	107,	66,	10},
	[2] = {"Thiªn Hµ MËt tÞch",	0,	107,	64,	40},
	[3] = {"Tö Hµ MËt tÞch",	0,	107,	65,	20},
	[4] = {"Bæ Kim MËt tÞch",	0,	107,	61,	500},
	[5] = {"Bæ Th¹ch MËt tÞch",	0,	107,	62,	500},
	[6] = {"Ngò Quû MËt tÞch",	0,	107,	63,	500},
	[7] = {"M¶nh Thiªn th¹ch",	2,	2,		7,	500},
	[8] = {"Thiªn th¹ch",		2,	2,		8,	2000},
	[9] = {"M¶nh B¨ng th¹ch",	2,	1,		148,	8000},
	[10] = {"B¨ng th¹ch",		2,	1,		149,	2500},
	[11] = {"C©y B¸t Nh·",	2,	0,		398,	3000},
	[12] = {"C©y B¸t Nh· nhá",2,	0,		504,	5000},
	[13] = {"Lé thñy",		2,	0,		351,	10000},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_FRUIT_ITEM_VIET_END then
		return
	end
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","VËt phÈm b¹n ®ang sö dông kh«ng ®óng yªu cÇu!");
		return 0;
	end;
	if nType ~= 1 and nType ~= 6 then
		if GetTask(2441) >= 25000000 then
			Msg2Player("§iÓm kinh nghiÖm nhËn ®­îc do tham gia ho¹t ®éng LÔ héi tr¸i c©y ®· ®¹t giíi h¹n 25.000.000, b¹n kh«ng thÓ tiÕp tôc sö dông vËt phÈm.");
			Talk(1,"","§iÓm kinh nghiÖm nhËn ®­îc do tham gia ho¹t ®éng LÔ héi tr¸i c©y ®· ®¹t giíi h¹n 25.000.000, b¹n kh«ng thÓ tiÕp tôc sö dông vËt phÈm.");
			return
		end
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use(nType);
	end;
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(g_tFruitItemList) do
		if genre == g_tFruitItemList[i][2] and detail == g_tFruitItemList[i][3] and particular == g_tFruitItemList[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nType)
	if nType == 1 then
		local nRandom = random(1,100);
		local nBase = 0;
		for i=2, getn(g_tFruitItemList) do
			nBase = nBase + g_tFruitItemList[i][6];
			if nRandom <= nBase then
				add_item_ex(g_tFruitItemList[i]);
				return
			end;
		end;
	else
		local szLogTitle = "LÔ héi tr¸i c©y : "..g_tFruitItemList[nType][1];
		local nExp = g_tFruitItemList[nType][5];
		local nExpTotal = GetTask(2441);
		if nExpTotal >= 25000000 then
			Msg2Player("§iÓm kinh nghiÖm nhËn ®­îc do tham gia ho¹t ®éng LÔ héi tr¸i c©y ®· ®¹t giíi h¹n 25.000.000, sö dông SÇu riªng sÏ kh«ng nhËn ®­îc ®iÓm kinh nghiÖm, nh­ng vÉn cã c¬ héi nhËn ®­îc phÇn th­ëng kh¸c.");
			--Talk(1,"","§iÓm kinh nghiÖm nhËn ®­îc do tham gia ho¹t ®éng LÔ héi tr¸i c©y ®· ®¹t giíi h¹n 25.000.000, sö dông SÇu riªng sÏ kh«ng nhËn ®­îc ®iÓm kinh nghiÖm, nh­ng vÉn cã c¬ héi nhËn ®­îc phÇn th­ëng kh¸c.");
			nExp = 0;
		elseif nExpTotal + g_tFruitItemList[nType][5] > 25000000 then
			nExp = 25000000 - nExpTotal;
		end

		if nExp ~= 0 then
			ModifyExp(nExp);
			SetTask( 2441, (nExpTotal+nExp) )
			Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm");
			WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nExp.."  ®iÓm kinh nghiÖm");
		end

		if nType == 6 then
			local nRandom = random(1,100000);
			local nBase = 0;
			for i=1, getn(g_tPrizeItemList) do
				nBase = nBase + g_tPrizeItemList[i][5];
				if nRandom <= nBase then
					add_item_ex2(g_tPrizeItemList[i]);
					return
				end;
			end;
		end;
	end;
end;

function add_item_ex(tItem)
	local szLogTitle = "LÔ héi tr¸i c©y : ".."Tói tr¸i c©y";		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1  "..tItem[1]);
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

function add_item_ex2(tItem)
	local szLogTitle = "LÔ héi tr¸i c©y : ".."VËt phÈm tõ SÇu riªng";		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1  "..tItem[1]);
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end
