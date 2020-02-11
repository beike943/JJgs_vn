--File name:	lantern.lua
--Describe:		ÐÒÔËµÆÁýnpc½Å±¾
--Create Date:	2008-08-28
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."Lång ®Ìn may m¾n"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szFileName = "lantern.lua"					--ÎÄ¼þÃû

g_tbItem = 
{
	--		"Ãû³Æ",		G1,	G2,	G3,		¸ÅÂÊ
	[1] = {"Lé thñy",		2,	0,	351,	30	},
	[2] = {"C©y B¸t Nh·",	2,	0,	398,	5	},
	[3] = {"C©y B¸t Nh· nhá",2,	0,	504,	10	},
	[4] = {"M¶nh B¨ng th¹ch",	2,	1,	148,	2	},
	[5] = {"B¨ng th¹ch",		2,	1,	149,	5	},
	[6] = {"M¶nh Thiªn th¹ch",	2,	2,	7,		2	},
	[7] = {"Thiªn th¹ch",		2,	2,	8,		5	},
}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end

	local PKState = GetPKFlag()	
	if PKState == 0  then
		Msg2Player("B¹n ph¶i ë tr¹ng th¸i chiÕn ®Êu míi th¾p ®­îc lång ®Ìn may m¾n!")
		return
	end
	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLog("["..g_szLogTitle.." Error]: [Account: "..GetAccount().."][Role Name:"..GetName().."] In file "..g_szFileName.." function GetTargetNpc() return value = 0")
		return
	end

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCKY_DATE_08_MOONCAKE_VIET) then
		SetTask(LUCKY_DATE_08_MOONCAKE_VIET, nDate)
		SetTask(LUCKY_TIMES_08_MOONCAKE_VIET, 0)
	end

	if GetTask(LUCKY_TIMES_08_MOONCAKE_VIET) >= 5 then
		Msg2Player("Mçi ngµy mçi ng­êi chØ ®­îc th¾p s¸ng nhiÒu nhÊt lµ 5 lång ®Ìn may m¾n.")
		return
	end

	if GetItemCount(2,1,30029) < 1 then
		Msg2Player("Th¾p s¸ng lång ®Ìn may m¾n cÇn 1 NÕn vµng, trªn hµnh trang cña b¹n kh«ng cã nÕn vµng, kh«ng thÓ th¾p lång ®Ìn may m¾n.")
		return
	end

	if DelItem(2,1,30029,1) == 1 then
		SetNpcLifeTime(nNpcIndex, 0)
		SetTask(LUCKY_TIMES_08_MOONCAKE_VIET, GetTask(LUCKY_TIMES_08_MOONCAKE_VIET)+1 )
	
		local nExp = 80000
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc  "..nExp.."  ®iÓm kinh nghiÖm")
		WriteLogEx(szLogTrungThuName,"nhËn",nExp,"®iÓm kinh nghiÖm")		
		
		give_award()
	else
		Msg2Player("Th¾p s¸ng lång ®Ìn may m¾n cÇn 1 NÕn vµng, trªn hµnh trang cña b¹n kh«ng cã nÕn vµng, kh«ng thÓ th¾p lång ®Ìn may m¾n.")
		return
	end
end

function give_award()
	local nRandom = random(1,100);
	local nBase = 0;
	for i=1, getn(g_tbItem) do
		nBase = nBase + g_tbItem[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tbItem[i]);
			return
		end;
	end;
end

function add_item_ex(tItem)
	local nRetCode,nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1  "..tItem[1]);
		WriteLogEx(szLogTrungThuName,"Lång ®Ìn may m¾n",1,tItem[1])		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

