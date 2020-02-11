--File name:	muchai.lua
--Describe:		Ä¾²ñµÀ¾ß½Å±¾
--Item ID:		2,1,30022
--Create Date:	2008-08-25
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."Lß n­íng b¸nh Trung Thu"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë

g_VietMoonCake08End = 2008100600				--Ä¾²ñµÄÊ¹ÓÃ½ØÖ¹ÈÕÆÚ

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate >= g_VietMoonCake08End then
		return
	end
	
	if GetTime() - GetTask(FIRE_TIME_08_MOONCAKE_VIET) < g_nTime_MoonCakeViet then
		return
	end

	local selTab = {
				"N­íng 8 c¸i B¸nh trung thu lo¹i th­êng/#make_mooncake(1)",
				"N­íng 8 c¸i B¸nh trung thu lo¹i ®Æc biÖt/#make_mooncake(2)",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("C¸c h¹ muèn n­íng lo¹i B¸nh trung thu nµo??",getn(selTab),selTab);
end

function make_mooncake(nType)
	if nType == 1 then
		if GetItemCount(2,1,30023) < 8 then
			Say("Sè l­îng b¸nh trung thu cña ®¹i hiÖp vÉn ch­a ®ñ, kh«ng thÓ tiÕn hµnh n­íng b¸nh.",0);
			return
		end
		if del_item_ex("B¸nh ch­a n­íng lo¹i th­êng",2,1,30023,8) == 1 and del_item_ex("Cñi",2,1,30022,1) == 1 then
			SetTask(CAKE_TYPE_08_MOONCAKE_VIET, 1)
			create_burner()
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30024) < 8 then
			Say("Sè l­îng b¸nh trung thu cña ®¹i hiÖp vÉn ch­a ®ñ, kh«ng thÓ tiÕn hµnh n­íng b¸nh.",0);
			return
		end
		if del_item_ex("B¸nh ch­a n­íng lo¹i ®Æc biÖt",2,1,30024,8) == 1 and del_item_ex("Cñi",2,1,30022,1) == 1 then
			SetTask(CAKE_TYPE_08_MOONCAKE_VIET, 2)
			create_burner()
		end
	end
end

function create_burner()
	local nNpcIdx = CreateNpc("Lß n­íng b¸nh", "Lß n­íng b¸nh Trung Thu", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\online\\viet_event\\mooncake_08\\npc\\burner.lua")
	SetNpcLifeTime(nNpcIdx, g_nTime_MoonCakeViet)
	SetTask(FIRE_TIME_08_MOONCAKE_VIET, GetTime())
	SetTask(BURNER_IDX_08_MOONCAKE_VIET, nNpcIdx)
	SetTask(WOOD_NUM_08_MOONCAKE_VIET, 0)
	SetTask(OBTAIN_CAKE_08_MOONCAKE_VIET, 0)
end

function del_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = DelItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		return 1;
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] delete "..nItemNum.." "..szItemName.." Failed, DelItem("..genre..", "..detail..", "..particular..", "..nItemNum..") return value = "..nRetCode);
		return 0;
	end
end

function no()
end
