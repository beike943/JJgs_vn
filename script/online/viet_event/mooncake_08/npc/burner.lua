--File name:	burner.lua
--Describe:		ÔÂ±ý¿¾Â¯npc½Å±¾
--Create Date:	2008-08-25
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."Lß n­íng b¸nh Trung Thu"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szFileName = "burner.lua"						--ÎÄ¼þÃû

g_tbMoonCake = 
{
--·ÅÄ¾²ñ³É¹¦´ÎÊý	ÒÑÊìÔÂ±ýµÄ¸öÊý	Î´ÊìÔÂ±ýµÄ¸öÊý
	[0] = {0, 8},
	[1] = {2, 6},
	[2] = {3, 5},
	[3] = {4, 4},
	[4] = {6, 2},
	[5] = {8, 0},
}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end

	local nBurnerIndex = GetTargetNpc()
	if nBurnerIndex <= 0 then
		WriteLog("["..g_szLogTitle.." Error]: [Account: "..GetAccount().."][Role Name:"..GetName().."] In file "..g_szFileName.." function GetTargetNpc() return value = 0")
		return
	end

	local nTimeElapse = GetTime() - GetTask(FIRE_TIME_08_MOONCAKE_VIET)
	if nTimeElapse > g_nTime_MoonCakeViet or nBurnerIndex ~= GetTask(BURNER_IDX_08_MOONCAKE_VIET) then
		Msg2Player("VËt phÈm nµy kh«ng ph¶i cña ®¹i hiÖp ".."Lß n­íng b¸nh Trung Thu")
		return
	end

	if nTimeElapse <= 60 then
		free_state(1, 60 - nTimeElapse)
		return
	elseif nTimeElapse <= 70 then
		give_wood()
		return
	elseif nTimeElapse <= 80 then
		free_state(2, 80 - nTimeElapse)
		return
	elseif nTimeElapse <= 90 then
		give_wood()
		return
	elseif nTimeElapse <= 100 then
		free_state(3, 100 - nTimeElapse)
		return
	elseif nTimeElapse <= 110 then
		give_wood()
		return
	elseif nTimeElapse <= 120 then
		free_state(4, 120 - nTimeElapse)
		return
	elseif nTimeElapse <= 130 then
		give_wood()
		return
	elseif nTimeElapse <= 140 then
		free_state(5, 140 - nTimeElapse)
		return
	elseif nTimeElapse <= 150 then
		give_wood()
		return
	elseif nTimeElapse <= 180 then
		free_state(6, 180 - nTimeElapse)
		return
	elseif nTimeElapse <= 300 then
		obtain_mooncake()
	end
end

function free_state(nType,nTime)
	if nType == 6 then
		Talk(1,"", format("Bá cñi thµnh c«ng <color=yellow>%d<color> lÇn, \n Cßn <color=yellow>%d<color> gi©y n÷a míi cã thÓ lÊy b¸nh.", GetTask(WOOD_NUM_08_MOONCAKE_VIET), nTime) )
		return
	end
	Talk(1,"", format("Kho¶ng c¸ch thêi gian ®Õn lÇn bá cñi thø <color=yellow>%d<color> lµ <color=yellow>%d<color> gi©y.", nType, nTime) )
end

function give_wood()
	if GetTime() - GetTask(WOOD_TIME_08_MOONCAKE_VIET) < 15 then
		Say("Mçi giai ®o¹n chØ ®­îc bá 1 bã cñi, h·y ®îi giai ®o¹n kÕ tiÕp råi bá cñi l¹i.", 0)
		return
	end
	
	if GetTask(WOOD_NUM_08_MOONCAKE_VIET) >= 5 then
		Say("B¹n ®· bá cñi 5 lÇn, kh«ng thÓ tiÕp tôc bá cñi n÷a.", 0)
		return
	end

	if GetItemCount(2,1,30022) < 1 then
		Say("Thêi gian sö dông ".."Cñi".."  H×nh nh­ kh«ng ®ñ ", 0)
		return
	end

	if DelItem(2,1,30022,1) == 1 then
		SetTask(WOOD_TIME_08_MOONCAKE_VIET, GetTime())
		SetTask(WOOD_NUM_08_MOONCAKE_VIET, GetTask(WOOD_NUM_08_MOONCAKE_VIET)+1 )
		Talk(1,"", format("Bá cñi thµnh c«ng <color=yellow>%d<color> lÇn.", GetTask(WOOD_NUM_08_MOONCAKE_VIET) ) )
	else
		Say("Thêi gian sö dông ".."Cñi".."  H×nh nh­ kh«ng ®ñ ", 0)
		return
	end
end

function obtain_mooncake()
	local nObtainFlag = GetTask(OBTAIN_CAKE_08_MOONCAKE_VIET)
	local nWoodNum = GetTask(WOOD_NUM_08_MOONCAKE_VIET)
	local nMoonCakeType = GetTask(CAKE_TYPE_08_MOONCAKE_VIET)

	if gf_Judge_Room_Weight(2, 20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end

	if nObtainFlag == 1 then
		Say("B¹n ®· lÊy B¸nh trung thu råi.", 0)
		return
	else
		if nMoonCakeType == 1 then
			if g_tbMoonCake[nWoodNum][1] ~= nil and g_tbMoonCake[nWoodNum][1] > 0 then
				add_item_ex("B¸nh Trung Thu th­êng",2,1,30025,g_tbMoonCake[nWoodNum][1])
			end
			if g_tbMoonCake[nWoodNum][2] ~= nil and g_tbMoonCake[nWoodNum][2] > 0 then
				add_item_ex("B¸nh ch­a chÝn lo¹i th­êng",2,1,30027,g_tbMoonCake[nWoodNum][2])
			end
		elseif nMoonCakeType == 2 then
			if g_tbMoonCake[nWoodNum][1] ~= nil and g_tbMoonCake[nWoodNum][1] > 0 then
				add_item_ex("B¸nh trung thu ®Æc biÖt",2,1,30026,g_tbMoonCake[nWoodNum][1])
			end
			if g_tbMoonCake[nWoodNum][2] ~= nil and g_tbMoonCake[nWoodNum][2] > 0 then
				add_item_ex("B¸nh ch­a chÝn lo¹i ®Æc biÖt",2,1,30028,g_tbMoonCake[nWoodNum][2])
			end
		else
			return
		end
		SetTask(OBTAIN_CAKE_08_MOONCAKE_VIET, 1)
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(szLogTrungThuName,"nhËn",nItemNum,szItemName)		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

