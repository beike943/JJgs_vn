--File name:	cattle_npc.lua
--Describe:		´º½Ú»î¶¯Å£Íõnpc½Å±¾
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")


g_szLogTitle = "Hoat dong Tet 2009"				--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_szFileName = "cattle_npc.lua"						--ÎÄ¼şÃû


g_tbPrizeItem = 
{
	--		"Ãû³Æ",				G1,	G2,	G3,		ÊıÁ¿	¸ÅÂÊ
	[1] = {"§¹t Ma Vò quyÕt",		2,	6,	10,		1,		7,	},
	[2] = {"Long Tr¶o Thñ quyÕt",	2,	6,	20,		1,		8,	},
	[3] = {"Kim Cang ChØ quyÕt",	2,	6,	31,		1,		7,	},
	[4] = {"M·n Thiªn Vò quyÕt",		2,	6,	46,		1,		7,	},
	[5] = {"§¹i Bi quyÕt",	2,	6,	59,		1,		7,	},
	[6] = {"Mª T©m Khóc quyÕt",	2,	6,	70,		1,		7,	},
	[7] = {"Tóy QuyÒn",			2,	6,	79,		1,		7,	},
	[8] = {"§¶ CÈu quyÕt",		2,	6,	88,		1,		7,	},
	[9] = {"ThÊt TiÖt KiÕm quyÕt",	2,	6,	108,	1,		7,	},
	[10] = {"Th­îng Thanh C«ng quyÕt",	2,	6,	119,	1,		7,	},
	[11] = {"Bİch Th­¬ng quyÕt",	2,	6,	130,	1,		7,	},
	[12] = {"L­u TuyÖt TiÔn quyÕt",	2,	6,	141,	1,		8,	},
	[13] = {"Bİ kiÕp Thi LiÖt Ma C«ng",		2,	6,	154,	1,		7,	},
	[14] = {"Bİ kiÕp Tµm Cæ",			2,	6,	168,	1,		7,	},

}

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")

	if is_new_year_09_viet_open() == 0 then
		return
	end

	local nExp = 500000
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm")
	WriteLogEx(g_szLogTitle, "Ng­u V­¬ng", nExp, " ®iÓm kinh nghiÖm", format("ModifyExp(%d)", nExp), GetTongName() )

	local nRandom = random(1, 100)
	if nRandom <= 5 then
		give_item_award()
	end
end


function give_item_award()
	local nRandom = random(1,100);
	local nBase = 0;
	for i=1, getn(g_tbPrizeItem) do
		nBase = nBase + g_tbPrizeItem[i][6];
		if nRandom <= nBase then
			add_item_award(g_tbPrizeItem[i]);
			return
		end;
	end;
end

function add_item_award(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(g_szLogTitle, "Ng­u V­¬ng", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Ng­u V­¬ng", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

