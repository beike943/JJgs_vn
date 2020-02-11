
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÏÉ²ÝÂ¶Ê¹ÓÃÎÄ¼þ
-- Edited by peres
-- 2005/08/16 AM 11:20

-- Ö»ÓÐÍíÉÏËûÃÇÊÇÔÚÒ»ÆðµÄ
-- Ëû¿¿½üËý£¬Óµ±§Ëý
-- ËûµÄÊÖÖ¸ºÍÆ¤·ô
-- Ëý¿´×ÅËû£¬ÐÄÀïÈáÈí¶øÌÛÍ´
-- ËýÏë£¬Ëý»¹ÊÇ°®Ëû
-- Ëý²»Ïë±§Ô¹Ê²Ã´
-- Ã¿ÌìÍíÉÏËûÃÇ¶¼ÔÚ×ö°®
-- Ëý²»ÖªµÀ£¬³ýÁËÕâÖÖ½Ó´¥£¬ËýµÄ°²È«¸ÐºÍÎÂÅ¯£¬»¹ÄÜ´ÓÄÄÀïÈ¡µÃ
-- ËýÏ²»¶ÄÇÒ»Ë²¼ä¡£·Â·ðÔÚºÚ°µµÄ´óº£ÉÏ£¬Æ¯ÏòÊÀ½çµÄ¾¡Í·

-- ======================================================

--add by lizhi
-- Ç°3ÁÐÊÇÎïÆ·Àà±ð,µÚ4Î»ÊÇÊ±¼ä,µÚ5Î»ÊÇËÙ¶È / 100 = ¶àÉÙ±¶

-- ×¢Òâ£¬³õÊ¼»¯²Ù×÷ÒÆ¶¯µ½ \script\global\autoexec.lua ÖÐ£¡
tItemInfo =
{
	{2, 1, 1012, 7200, 150, "Bång Lai Tiªn Thñy",1},
	{2, 0, 109, 7200, 200, "Bång Lai Tiªn Lé",1.5},
	{2, 1, 1013, 7200, 300, "Bång Lai Tiªn §¬n",2},
	{2, 1, 1052, 7200, 120, "Bång Lai Lé Thñy",0},
}

keepsake_date_TaskID = 1241
keepsake_num_TaskID = 1227		--2007¶ËÎç£¬¹ÒÅîÀ³ÐÅÎïÔö¼Ó
--2007ÆßÏ¦ÈÎÎñ±äÁ¿
TASK_FLOWER_GROW = 2391; --¼ÇÂ¼»¨µÄ³É³¤¶È
TASK_TOTAL_TIME = 2394; --µ±ÌìÀÛ»ýÔÚÏßÊ±¼ä
TASK_IS_PLANT = 2396; --ÊÇ·ñÖÖÏÂÁËÉñÃØµÄ»¨
TASK_IS_GROW = 2397; --µ±Ìì³É³¤¶ÈÊÇ·ñÒÑ¾­¼Ó¹ý£¬´æÈëday

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			TestEat(index)
			break
		end
	end
end

function ConfirmEat(nItem)
	if DelItem(tItemInfo[nItem][1], tItemInfo[nItem][2], tItemInfo[nItem][3], 1) == 1 then
		local nRet = EatXcl(nItem, tItemInfo[nItem][4])
		if nRet == 1 then
			Msg2Player("B¹n nhËn ®­îc "..tItemInfo[nItem][6].."*hiÖu qu¶")
		end
	end
end

function TestEat(nIndex)
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if tItemInfo[nIndex][5] < nSpeed then
			Say("B¹n nhËn ®­îc hiÖu qu¶"..tItemInfo[nType][6].."m¹nh nhÊt, kh«ng thÓ sö dông"..tItemInfo[nIndex][6], 0)
		elseif tItemInfo[nIndex][5] == nSpeed then
			ConfirmEat(nIndex)
		elseif tItemInfo[nIndex][5] > nSpeed then
			Say("HiÖn b¹n b¹n cã "..tItemInfo[nType][6]..", muèn ®æi thµnh"..tItemInfo[nIndex][6].."?\n<color=red>Chó ý: Sau khi thay ®æi thêi gian hiÖu qu¶ ban ®Çu sÏ trë vÒ 0<color>", 2, "§óng/#ConfirmEat("..nIndex..")", "Sai/no_say")
		end
	else
		ConfirmEat(nIndex)
	end
end
--Ã¿·ÖÖÓ¼ÓÒ»´ÎÐÅÎï
--´å³¤
function OnTimer(nSpeed)
	local dragon_boat_flag = GetTask(keepsake_date_TaskID)
	if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil then
		for i = 1,getn(tItemInfo) do
			if nSpeed == tItemInfo[i][5] then
				SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + tItemInfo[i][7]))
				break
			end
		end
	end
	
--2007ÆßÏ¦	
	if nSpeed == tItemInfo[1][5] or nSpeed == tItemInfo[2][5] or nSpeed == tItemInfo[3][5] then
		local nFlowerPlantFlog = GetTask(TASK_IS_PLANT); 
		if nFlowerPlantFlog ~= 0 and nFlowerPlantFlog ~= nil and GetTask(TASK_FLOWER_GROW) < 100 then
			local nLastDay = floor((GetTime()+28800-60)/86400); --Ç°Ò»·ÖÖÓµÄÈÕÆÚ£¬ÓÃÓÚÅÐ¶Ï¿äÌì
			local nNowDay = floor((GetTime()+28800)/86400);		 
			if nLastDay ~= nNowDay then  --¿äÌìÁË£¬Çå0
				SetTask(TASK_TOTAL_TIME,0);
			end
			if GetTask(TASK_IS_GROW) < nNowDay then  --µ±Ìì»¹Ã»³É³¤¹ý
				SetTask(TASK_TOTAL_TIME,GetTask(TASK_TOTAL_TIME)+1); --ÀÛ¼ÆÊ±¼ä£¬µ¥Î»£º·Ö
				if GetTask(TASK_TOTAL_TIME) >= 60 then
					SetTask(TASK_FLOWER_GROW,GetTask(TASK_FLOWER_GROW)+1);
					SetTask(TASK_IS_GROW,nNowDay);
					SetTask(TASK_TOTAL_TIME,0);
				end
			end
		end	
	end	
end
function no_say()

end
