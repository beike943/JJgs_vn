--File name:	xmas_tree_npc.lua
--Describe:		Ê¥µ®Ê÷(Ò°ÍâµØÍ¼)npc½Å±¾
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")


g_szLogTitle = "Giang Sinh 2008"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_szFileName = "xmas_tree_npc.lua"						--ÎÄ¼şÃû


function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLogEx(g_szLogTitle, "C©y Th«ng Gi¸ng Sinh (ngo¹i thµnh)", "NULL", "NULL", "NULL", GetTongName(), "In file "..g_szFileName..", function GetTargetNpc() return value <= 0")
		return
	end
	SetTaskTemp(TREE_INDEX_08_XMAS_VIET, nNpcIndex)

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end

	if GetLevel() < 10 then
		Msg2Player("Ph¶i ®¹t ®¼ng cÊp 10 trë lªn míi cã thÓ trang trİ c©y th«ng")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ch­a vµo m«n ph¸i kh«ng thÓ trang trİ c©y th«ng.")
		return
	end

	if GetFightState() ~= 1 or GetPKFlag() == 0 then
		Msg2Player("Ng­êi ch¬i ph¶i ë tr¹ng th¸i chiÕn ®Êu míi cã thÓ trang trİ c©y th«ng.")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(TREE_DATE_08_XMAS_VIET) then
		SetTask(TREE_DATE_08_XMAS_VIET, nDate)
		SetTask(TREE_NUM_08_XMAS_VIET, 0)
	end

	if GetTask(TREE_NUM_08_XMAS_VIET) >= 10 then
		Msg2Player("Mçi ngµy mçi ng­êi chØ ®­îc trang trİ nhiÒu nhÊt 10 c©y th«ng.")
		return
	end

	if GetItemCount(2,1,30043) < 1 then
		Msg2Player("Hµnh trang  cña ®¹i hiÖp vÉn ch­a cã C©y KÑo Gi¸ng Sinh nªn kh«ng thÓ trang trİ  c©y th«ng gi¸ng sinh ®­îc.")
		return
	end

	if GetUnitCurStates(nNpcIndex,2) ~= 1 or (GetTime() - GetUnitCurStates(nNpcIndex,1)) > PICK_TIME_08_XMAS_VIET then
		SetUnitCurStates(nNpcIndex,1,GetTime())
		SetUnitCurStates(nNpcIndex,2,1)
		DoWait(7,8,PICK_TIME_08_XMAS_VIET)				--½øÈëµ÷ÓÃ
	else
		Talk(1,"","HiÖn t¹i c©y th«ng nµy ®· cã ng­êi trang trİ.")
		return
	end
end

