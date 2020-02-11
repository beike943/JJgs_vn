--File name:	yuanliaobao.lua
--Describe:		Ô­ÁÏ°üµÀ¾ß½Å±¾
--Item ID:		2,1,30016
--Create Date:	2008-08-18
--Author:		chenbenqian

Include("\\script\\lib\\writelog.lua")
szLogTrungThuName = "Hoat Dong Trung Thu"

g_VietMoonCake08End = 2008100600				--Ô­ÁÏ°üµÄÊ¹ÓÃ½ØÖ¹ÈÕÆÚ

g_YuanLiaoList = 
{
	--		"Ãû³Æ",		G1,G2,G3,ÊýÁ¿,¸ÅÂÊ
	[1] = {"Bét m×",		2,1,30017,1,40},
	[2] = {"§­êng c¸t",	2,1,30018,1,20},
	[3] = {"Trøng muèi",		2,1,30019,1,20},
	[4] = {"Nguyªn liÖu thËp cÈm",	2,1,30020,1,20},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_VietMoonCake08End then
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		give_yuanliao()
	end
end

function give_yuanliao()
	local nRandom = random(1,100)
	local nTableSize = getn(g_YuanLiaoList)
	local nBase = 0
	for i=1, nTableSize do
		nBase = nBase + g_YuanLiaoList[i][6]
		if nRandom <= nBase then
			add_item_ex(g_YuanLiaoList[i])
			return
		end
	end
end

function add_item_ex(tItem)
	local szLogTitle = "Ho¹t ®éng trung thu : ".."Bao nguyªn liÖu";		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..tItem[5].." c¸i "..tItem[1]);
		WriteLogEx(szLogTrungThuName,"nhËn",tItem[5],tItem[1])						
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." "..tItem[1].." Failed, return value = "..nRetCode);
	end
end
