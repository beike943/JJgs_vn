Include("\\script\\online_activites\\silingmount\\string.lua");
Include("\\script\\lib\\globalfunctions.lua");

function VET_BuySilingMount(nCamp)
	if (VET_CheckBuySilingMout(nCamp) == 1) then
		VET_BuySilingMount_Dlg(nCamp);
	end
end

function VET_CheckBuySilingMout(nCamp)
	local jugong = GetTask(707); -- 宋方是正数, 辽方是负数
	if (nCamp == 1) then --宋方
		if (jugong < 0) then
			Talk(1,"",VET_TB_SILING_MSG[3]);
		else
			if (GetTask(704) ~= 6) then -- 元帅才能购买
				Talk(1,"",VET_TB_SILING_MSG[5]);
			else
				return 1;
			end
		end
	else
		if (jugong >= 0) then
			Talk(1,"",VET_TB_SILING_MSG[4]);
		else
			if (GetTask(704) ~= -6) then -- 元帅才能购买
				Talk(1,"",VET_TB_SILING_MSG[5]);
			else
				return 1;
			end
		end
	end
	return 0;
end

function VET_BuySilingMount_Dlg(nCamp)
	local strTitle = format(VET_TB_SILING_NPC_DLG[4],3,30000,250000,VET_TB_SILING_MSG[18]);
	local tbOpt = 
	{
		format("%s/#%s",VET_TB_SILING_NPC_DLG[5],format("VET_BuySilingMount_Confirm(%d)",nCamp)), 
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing")
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end

function VET_BuySilingMount_Confirm(nCamp)
	if (gf_Judge_Room_Weight(1, 0, "") == 1 and VET_CheckBuySilingMout(nCamp) == 1) then
		if (GetItemCount(2, 1, 1001) < 3) then
			Talk(1,"",format(VET_TB_SILING_MSG[6],3));
		else
			local nJifen = GetTask(707); -- 宋方是正数, 辽方是负数
			if (nJifen < 30000 and nJifen > -30000) then
				Talk(1,"",format(VET_TB_SILING_MSG[7],30000));
			elseif (DelItem(2, 1, 1001, 3) == 1) then
				if (nJifen >= 0) then
					nJifen = nJifen - 30000;
				else
					nJifen = nJifen + 30000;
				end
				SetTask(707, nJifen);	
				gf_AddItemEx2({0,105,30033,1,1,-1,-1,-1,-1,-1,-1}, VET_TB_SILING_ITEM_TITLE[2], VET_STR_SILING_LOG_TITLE, VET_TB_SILING_LOG_ACTION[2], 30 * 24 * 3600, 1);
			end
		end
	end
end

function VET_SilingMountEvolution_Dlg()
	local strTitle = format(VET_TB_SILING_NPC_DLG[10],1,3);
	local tbOpt = 
	{
		format("%s/%s",VET_TB_SILING_NPC_DLG[11],"VET_SilingMountEvolution"),
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end

function VET_SilingMountRestore_Dlg()
	local strTitle = VET_TB_SILING_NPC_DLG[12];
	local tbOpt = 
	{
		format("%s/%s",VET_TB_SILING_NPC_DLG[13],"VET_SilingMountRestore_Confirm_Dlg"),
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end

function VET_SilingMountRestore_Confirm_Dlg()
	if (VET_CheckSilingMountRestore() == 1) then
		local nIdx = GetPlayerEquipIndex(10);
		local strMountName = GetItemName(nIdx);
		if (type(VET_TB_SILING_RESTORE_MOUNT_COST[strMountName]) == "number") then
			local strTitle = format(VET_TB_SILING_NPC_DLG[14],strMountName,VET_TB_SILING_RESTORE_MOUNT_COST[strMountName]/10000);
			local tbOpt = 
			{
				format("%s/%s",VET_TB_SILING_NPC_DLG[15],"VET_SilingMountRestore_Confirm"),
				format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
			};
			Say(strTitle, getn(tbOpt), tbOpt);
		end
	end
end

function VET_CheckSilingMountRestore()
	local nG,nD,nP = GetPlayerEquipInfo(10);
	if (nG == 0 and nD == 105 and nP >= 30001 and nP <= 30032) then
		local nIdx = GetPlayerEquipIndex(10);
		local tbItemInfo = GetItemInfoByIndex(nIdx,1);
		local nDurability = tbItemInfo["durability"];
		local nMaxDurability = tbItemInfo["maxdurability"];		
		if nDurability >= floor(nMaxDurability*0.4) then
			Talk(1,"",format(VET_TB_SILING_MSG[9],40));
		else
			return 1;
		end
	else
		Talk(1,"",VET_TB_SILING_MSG[8]);
	end
	return 0;
end

function VET_SilingMountRestore_Confirm()
	if (VET_CheckSilingMountRestore() == 1) then
		local nIdx = GetPlayerEquipIndex(10);
		local strMountName = GetItemName(nIdx);
		if (type(VET_TB_SILING_RESTORE_MOUNT_COST[strMountName]) == "number") then
			if (GetCash() >= VET_TB_SILING_RESTORE_MOUNT_COST[strMountName] and 
				Pay(VET_TB_SILING_RESTORE_MOUNT_COST[strMountName]) == 1) then
				ChangeItemDurability("horse");	
				Talk(1,"",VET_TB_SILING_MSG[11]);
			else
				Talk(1,"",VET_TB_SILING_MSG[10]);
			end
		end
	end
end

function VET_SilingMountEvolution()
	PutinItemBox(VET_TB_SILING_MSG[12] ,4, VET_TB_SILING_NPC_DLG[16], "\\script\\online_activites\\silingmount\\mount_evolution.lua",0);
end

function VET_SilingMountDailyPersonalTaskAward()
--	if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
--		return
--	end
--	if random(1,1000) <= 1 then
--		gf_AddItemEx2({2, 1, 30283,1}, VET_TB_SILING_ITEM_TITLE[1], VET_STR_SILING_LOG_TITLE, VET_TB_SILING_LOG_ACTION[4], 30 * 24 * 3600, 1);
--	end
end

function VET_SilingMountDailyTeamTaskAward()
--	if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
--		return
--	end
--	if random(1,1000) <= 2 then
--		gf_AddItemEx2({2, 1, 30283,1}, VET_TB_SILING_ITEM_TITLE[1], VET_STR_SILING_LOG_TITLE, VET_TB_SILING_LOG_ACTION[5], 30 * 24 * 3600, 1);
--	end
end
