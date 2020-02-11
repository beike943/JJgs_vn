--File name:	xmas_func.lua
--Describe:		Ê¥µ®½Ú»î¶¯º¯ÊýÎÄ¼þ
--Create Date:	2008-11-17
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_head.lua")
Include("\\script\\lib\\writelog.lua")

--Ìí¼ÓÊ¥µ®ÀñºÐ
function add_box_xmas_08_viet(nItemNum, szLog)
	local szLogTitle = "Giang Sinh 2008"
	local szItemName = "Hép quµ gi¸ng sinh"
	local G, D, P = 2, 1, 30032
	local nRetCode = 0
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName)
		WriteLogEx(szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLogTitle,szLog, "", "", "", "", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

