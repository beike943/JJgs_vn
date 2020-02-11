Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\define.lua")

_,AT_GGS = GetRealmType();
if 1==AT_GGS then
	Include("\\script\\paycoin_head.lua")
end	

--==========================================================================================
tAllowItemList = {
	{0,103,-1, "Trang bÞ ®Çu"},  --Í·²¿×°±¸
	{0,108,-1, "Trang bÞ ®Çu"},	 --Í·²¿×°±¸
	{0,100,-1, "Trang bÞ trªn"},
	{0,109,-1, "Trang bÞ trªn"},
	{0,101,-1, "Trang bÞ d­íi"},
	{0,110,-1, "Trang bÞ d­íi"},
	{0,102,-1, "Giíi chØ"},
	{0,{0,14},-1, "Vò khÝ"}, --ÎäÆ÷????
	{0,105,-1, "M·"},
	{0,107,-1, "MËt tÞch"},
	{0,112,-1, "MËt tÞch"},
	{2,15,10, "Tªn"},
	{2,3,7, "X¸ Lîi Kim ®¬n"}, --ÉáÀû½ðµ¤
	{2,3,6}, --»ú¹Ø
	{2,3,222, "Tinh LuyÖn HuyÒn ThiÕt"},
	{2,97,6, "Thiªn H­¬ng Hoa"},
	{2,97,7, "Thanh L­îng Th¶o"},
	{2,97,8, "TriÒu Thiªn Tiªu"},
	{2,97,9, "QuÕ Hoa Ng­"},
	{2,97,10, "Hång S¬n Qu¶"},
	{2,20,-1, "§iªu"},
	{2,0,1063, "ThÇn Méc V­¬ng §Ønh"},
	{2,3,4, "Ph¸ Ma Chó"},
	{2,3,12, "Thiªn PhËt Ch©u"},
--	{0,113,-1, "ÎÆÊÎ"},
--	{0,114,-1, "ÎÆÊÎ"},
--	{0,115,-1, "ÎÆÊÎ"},
--	{0,116,-1, "ÎÆÊÎ"},
	{2,11,-1, "¸m khÝ"},
	{0,118,1},
	{0,118,2},
	{0,118,3},
	{0,117,1},
	{0,117,2},
	{0,117,3},
	{0,119,-1},
	{0,120,-1},
	{0,121,-1},
	{0,122,-1},
	
	{0,152,-1, "¸o Choµng"},
	{0,153,-1, "Huy HiÖu"},
	{0,154,-1, "Giµy"},
	{2,97,236, "Thiªn Kiªu LÖnh"},
};

--¸øÓèÎïÆ·Çåµ¥
--¸ù¾ÝÁ÷ÅÉ¸øÓè£¬µÚ3ÁÐÎªÁ÷ÅÉ£¬0ÎªËùÓÐÁ÷ÅÉ
tGiveItemList = {
	{{1,0,125,999},"Tiªu Dao B¹ch V©n T¸n",0},
	{{1,0,126,999},"Tiªu Dao V©n CÈm Tôc",0},
	{{1,0,127,999},"Tiªu Dao §o¹n Tôc Cao",0},
	{{1,0,128,999},"Tiªu Dao §¹i Hoµn §¬n",0},
	{{1,0,129,999},"Tiªu Dao Phôc Thñy §¬n",0},
	{{1,0,130,999},"Tiªu Dao Quy Nguyªn §¬n",0},
	{{1,0,131,999},"Tiªu Dao Ngäc Linh T¸n",0},
	{{1,0,132,999},"Tiªu Dao Ngäc Lé Hoµn",0},
	{{1,0,133,999},"Tiªu Dao T¹o Hãa T¸n",0},
	{{1,0,134,999},"Tiªu Dao Cöu ChuyÓn §¬n",0},
	{{1,7,46,999},"Tiªu Dao Phï (Háa Kú L©n)",20},
	{{1,7,154,999},"Tiªu Dao Phï (LiÖt Nham Li Long)",20},
	{{1,7,148,999},"Tiªu Dao Phï (Th­¬ng ThÇn Doanh Thiªn)",20},
	{{1,7,147,999},"Tiªu Dao Phï (B¾c Lôc L©m Minh Chñ)",20},
	{{1,7,10000,999},"Tiªu Dao Phï (NgÉu nhiªn)",20},
	{{2,0,1063,1}, "ThÇn Méc V­¬ng §Ønh",21},
};

function exchgsvr_on_player_login()
	local nVersion,nCurGs = GetRealmType();
	--print("exchgsvr_on_player_login:",nVersion,nCurGs)
	_exchgsvr_reset_player_state(nCurGs)
	_exchgsvr_item_filter(nCurGs)
	exgsvr_func_on_player_login()--Í¬²½¿ç·þÊý¾Ý
	_exchgsvr_do_things()  --ÔÚÍ¬Ê±Êý¾ÝÍê³ÉÖ®ºó×öÒ»Ð©ÆäËûµÄÊÂ
end

function Del_Item_By_List()
	local tAllItem = GetAllItem(); --Íæ¼ÒÉíÉÏËùÓÐÎïÆ·£¨°üÀ¨²Ö¿â£©Ë÷Òý
	local nID1,nID2,nID3 = 0,0,0;
	local nCount = 0;
	for i,v in tAllItem do
		nID1,nID2,nID3 = GetItemInfoByIndex(v);
		nCount = BigGetItemCount(nID1,nID2,nID3);
		if nCount ~= 0 then
			local nCheckItem = Check_Item_By_List(nID1,nID2,nID3);
			if nCheckItem == 0 then
				BigDelItem(nID1,nID2,nID3,nCount);
			end
		end
		Check_SuohunEquip(v); --¼ì²éËø»êÎÆÊÎ
	end
	for i = 0,16 do --´©×ÅµÄËø»ê
		local nEquipIdx = GetPlayerEquipIndex(i);
		Check_SuohunEquip(nEquipIdx);
	end
end

function Check_Item_By_List(nID1,nID2,nID3)
	local tID = {nID1,nID2,nID3};
	for i = 1,getn(tAllowItemList) do
		local nCheck = 0;
		for j = 1,3 do
			if tAllowItemList[i][j] ~= -1 then
				if type(tAllowItemList[i][j]) == "table" then
					if tAllowItemList[i][j][1] > tID[j] or tAllowItemList[i][j][2] < tID[j] then
						nCheck = 1;
						break;
					end
				elseif tAllowItemList[i][j] ~= tID[j] then
					nCheck = 1;
					break;
				end
			end
		end
		if nCheck == 0 then --Æ¥Åä
			return 1;
		end
	end
	return 0;
end

function Add_Item_By_List()
	local nRoute = GetPlayerRoute();
	for i = 1,getn(tGiveItemList) do
		if gf_Judge_Room_Weight(1,100) == 1 and GetItemCount(tGiveItemList[i][1][1], tGiveItemList[i][1][2], tGiveItemList[i][1][3]) == 0 then
			if tGiveItemList[i][3] == 0 then
				gf_AddItemEx(tGiveItemList[i][1],tGiveItemList[i][2]);
			elseif nRoute == tGiveItemList[i][3] then
				gf_AddItemEx(tGiveItemList[i][1],tGiveItemList[i][2]);
			end
		end
	end
end

function _exchgsvr_reset_player_state(bAtExchgServer)
	if 1 == bAtExchgServer then
		SetFightState(0);
		--ForbidChangePK(1);
		ForbitTrade(1);	--½ûÖ¹½»Ò×
		StallEnable(0);	--½ûÖ¹°ÚÌ¯
	else
		
	end
end

function _exchgsvr_item_filter(bAtExchgServer)
	if 1 == bAtExchgServer then
		Del_Item_By_List()
		Add_Item_By_List()
	else
		
	end
end

function Check_SuohunEquip(nEquipIdx)
	local nCheck = 0;
	local nOwnName = GetItemOwner(nEquipIdx);
	local nPlayerName = GetName();
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		local strGbGroup,strName = _kf_GetRealmName(GetName());
		nPlayerName = strName;
	end
	if nOwnName ~= "" and nOwnName ~= nPlayerName then
		DelItemByIndex(nEquipIdx,-1);
		nCheck = nCheck+1;
	end
	if nCheck ~= 0 then
		Talk(1,"","Kh«ng ph¶i trang bÞ Táa Hån kh«ng thÓ mang vµo ®Êu tr­êng! Trang bÞ Táa Hån cña ng­¬i ®· bÞ hñy bá (quay vÒ server cò sÏ tù kh«i phôc).");
	end
end

function _exchgsvr_do_things()
	local nVersion,nCurGs = GetRealmType();
	--print("exchgsvr_on_player_login:",nVersion,nCurGs)
	if nCurGs == 0 and GetTask(TASKID_EXCHG_SVR_TAG) ~= 0 then
		SetTask(TASKID_EXCHG_SVR_TAG, 0, TASK_ACCESS_CODE_EXGSVR);
		SetTask(TASKID_EXCHG_SVR_TIME, GetTime(), TASK_ACCESS_CODE_EXGSVR);
	end
	if nCurGs == 1 and GetTask(TASKID_EXCHG_SVR_TAG) ~= 0 then
		pc_pay_addtask(1000);
	end
end



