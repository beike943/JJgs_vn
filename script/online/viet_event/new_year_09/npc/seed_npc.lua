--File name:	seed_npc.lua
--Describe:		´º½Ú»î¶¯ĞÒ¸£ÖÖ×Ónpc½Å±¾
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")


g_szLogTitle = "Hoat dong Tet 2009"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë
g_szFileName = "seed_npc.lua"						--ÎÄ¼şÃû


function main()
	if is_new_year_09_viet_open() == 0 then
		Msg2Player("Ho¹t ®éng tÕt ®· kÕt thóc.")
		return
	end

	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "In file "..g_szFileName..", function GetTargetNpc() return value <= 0")
		return
	end
	SetTaskTemp(SEED_INDEX_09_NEWYEAR_VIET, nNpcIndex)

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end

	if GetLevel() < 10 then
		Msg2Player("ChØ cã ng­êi ch¬i cÊp 10 trë lªn míi thu thËp ®­îc h¹t gièng h¹nh phóc.")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ng­êi ch¬i kh«ng m«n ph¸i kh«ng thÓ thu thËp h¹t gièng h¹nh phóc.")
		return
	end

	if GetItemCount(2,1,30058) < 1 then
		Msg2Player("§¹i hiÖp vÉn ch­a cã bao tay thu thËp nªn kh«ng thÓ ®µo h¹t gièng h¹nh phóc ®­îc.")
		return
	end

	if GetUnitCurStates(nNpcIndex,2) ~= 1 or (GetTime() - GetUnitCurStates(nNpcIndex,1)) > PICK_TIME_09_NEWYEAR_VIET then
		SetUnitCurStates(nNpcIndex,1,GetTime())
		SetUnitCurStates(nNpcIndex,2,1)
		DoWait(7,8,PICK_TIME_09_NEWYEAR_VIET)				--½øÈëµ÷ÓÃ
	else
		Talk(1,"","HiÖn t¹i ®· cã ng­êi ch¬i ®ang thu thËp h¹t gièng hµnh phóc nµy.")
		return
	end
end

