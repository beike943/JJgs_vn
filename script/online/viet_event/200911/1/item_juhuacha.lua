--=============================================
--create by baiyun 2009.10.14
--describe:Ô½ÄÏ°æ11ÔÂ·Ý»î¶¯ ¾Õ»¨²è½Å±¾ÎÄ¼þ
--=============================================
Include("\\script\\online\\viet_event\\200911\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20091213 then
		Talk(1, "", "VËt phÈm ®· hÕt h¹n sö dông.");
		return 0;
	end

	if GetTask(VIET_0911_TASK_JUHUACHA_COUNT) >= VIET_0911_JUHUACHA_MAX_COUNT then
		Talk(1, "", "§¹i hiÖp ®· sö dông trµ hoa cóc ®¹t ®Õn kinh nghiÖm cao nhÊt, kh«ng thÓ tiÕp tôc sö dông trµ hoa cóc n÷a.");
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		ModifyExp(125000);
		WriteLogEx(VIET_0911_LOG_TITLE,"Trµ Hoa Cóc",125000,"®iÓm kinh nghiÖm")
		SetTask(VIET_0911_TASK_JUHUACHA_COUNT, GetTask(VIET_0911_TASK_JUHUACHA_COUNT) + 1);
		--¸øÎïÆ·½±Àø		
		if mod(GetTask(VIET_0911_TASK_JUHUACHA_COUNT),50) == 0 then
			local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD_2, 1000000, 1);
			local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD_2[nRand][3], tbVIET_0911_JUHUACHA_AWARD_2[nRand][1]);
			WriteLogEx(VIET_0911_LOG_TITLE,"Trµ Hoa Cóc",1,tbVIET_0911_JUHUACHA_AWARD_2[nRand][1])
			if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD_2[nRand][4] ~= 0 then
				SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD_2[nRand][4]);
			end
		else			
			local nRand = gf_GetRandItemByTable(tbVIET_0911_JUHUACHA_AWARD, 1000000, 19);
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			if nRand == 18 then
				ModifyReputation(2, 0);
				Msg2Player("B¹n nhËn ®­îc 2 ®iÓm Danh väng.")
				WriteLogEx(VIET_0911_LOG_TITLE,"Trµ Hoa Cóc",2,"®iÓm danh väng")
			elseif nRand == 19 then
				SetTask(336, GetTask(336) + 2);
				Msg2Player("B¹n nhËn ®­îc 2 ®iÓm S­ m«n.")
				WriteLogEx(VIET_0911_LOG_TITLE,"Trµ Hoa Cóc",2,"®iÓm s­ m«n")
			else
				local nRetCode, nIndex = gf_AddItemEx(tbVIET_0911_JUHUACHA_AWARD[nRand][3], tbVIET_0911_JUHUACHA_AWARD[nRand][1]);
				WriteLogEx(VIET_0911_LOG_TITLE,"Trµ Hoa Cóc",1,tbVIET_0911_JUHUACHA_AWARD[nRand][1])
				if nRetCode == 1 and tbVIET_0911_JUHUACHA_AWARD[nRand][4] ~= 0 then
					SetItemExpireTime(nIndex, tbVIET_0911_JUHUACHA_AWARD[nRand][4]);
				end
				gf_SetLogCaption("");
			end
		end
	end
end