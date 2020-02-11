--File name:	jixiangxiaobao.lua
--Describe:		º™œÈ–°∞¸Ω≈±æ
--Item ID:		2,1,30014
--Create Date:	2008-06-23
--Author:		chenbenqian


DATE_FRUIT_ITEM_VIET_END		= 2008072800;		-- º™œÈ–°∞¸ π”√Ω· ¯»’∆⁄
g_LogTitle = "Ti”u c∏t t≠Íng";


g_tPrizeItemList =
{
	--		"√˚≥∆",		G1,	G2,		G3,	∏≈¬ 
	[1] = {"Chi™m Y PhÊ",	0,	107,	66,	30	},
	[2] = {"Thi™n Hµ MÀt tﬁch",	0,	107,	64,	60	},
	[3] = {"Tˆ Hµ MÀt tﬁch",	0,	107,	65,	50	},
	[4] = {"BÊ Kim MÀt tﬁch",	0,	107,	61,	600	},
	[5] = {"BÊ Thπch MÀt tﬁch",	0,	107,	62,	600	},
	[6] = {"NgÚ Qu˚ MÀt tﬁch",	0,	107,	63,	600	},
	[7] = {"M∂nh Thi™n thπch",	2,	2,	7,	600	},
	[8] = {"Thi™n thπch",		2,	2,	8,	5000	},
	[9] = {"B®ng thπch",		2,	1,	149,	3000	},
	[10] = {"M∂nh B®ng thπch",	2,	1,	148,	5000	},
	[11] = {"C©y B∏t Nh∑",	2,	0,	398,	5000	},
	[12] = {"C©y B∏t Nh∑ nh·",	2,	0,	504,	5000	},
	[13] = {"LÈ thÒy",		2,	0,	351,	50000	},
	[14] = {"B∏t B∂o T»y TÒy Æ¨n",	2,	0,	138,	3	},
	[15] = {"C∏t t≠Íng thπch",	2,	1,	30015,	2000	},
}


function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_FRUIT_ITEM_VIET_END then
		return
	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		use();
	end;
end;

function use()
	local nExp = 50000;
	local nExpTotal = GetTask(2442);
	if nExpTotal >= 15000000 then
		Msg2Player("ßi”m kinh nghi÷m nhÀn Æ≠Óc do mÎ Ti”u c∏t t≠Íng Æ∑ Æπt giÌi hπn 15.000.000 Æi”m kinh nghi÷m, v◊ th’ sœ kh´ng nhÀn Æ≠Óc Æi”m kinh nghi÷m n˜a, tuy nhi™n v…n c„ th” nhÀn Æ≠Óc ph«n th≠Îng kh∏c.");
		--Talk(1,"","ßi”m kinh nghi÷m nhÀn Æ≠Óc do mÎ Ti”u c∏t t≠Íng Æ∑ Æπt giÌi hπn 15.000.000 Æi”m kinh nghi÷m, v◊ th’ sœ kh´ng nhÀn Æ≠Óc Æi”m kinh nghi÷m n˜a, tuy nhi™n v…n c„ th” nhÀn Æ≠Óc ph«n th≠Îng kh∏c.");
		nExp = 0;
	elseif nExpTotal + 50000 > 15000000 then
		nExp = 15000000 - nExpTotal;
	end

	if nExp ~= 0 then
		ModifyExp(nExp);
		SetTask( 2442, (nExpTotal+nExp) )
		Msg2Player("Bπn nhÀn Æ≠Óc  "..nExp.."  Æi”m kinh nghi÷m");
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nExp.."  Æi”m kinh nghi÷m");
	end

	local nRandom = random(1,1000000);
	local nBase = 0;
	for i=1, getn(g_tPrizeItemList) do
		nBase = nBase + g_tPrizeItemList[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tPrizeItemList[i]);
			return
		end;
	end;
end;


function add_item_ex(tItem)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode, nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		if tItem[1] == "B∏t B∂o T»y TÒy Æ¨n" then
			SetItemExpireTime(nItemIdx,30*24*3600)	
		end
		Msg2Player("Bπn nhÀn Æ≠Óc 1  "..tItem[1]);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

