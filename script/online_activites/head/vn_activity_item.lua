--½Å±¾¹¦ÄÜ£º20011Äê6ÔÂÊî¼Ù»î¶¯½Å±¾
--¹¦ÄÜÉè¼Æ£ºÔ½ÄÏ·½Í¬ÊÂ
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-5-16
--ÐÞ¸Ä¼ÇÂ¼£ºÁõ²¨
--2011Äê6ÔÂÊî¼Ù»î¶¯¿ªÊ¼Í¨¹ýÅäÖÃ±í´¦Àí»î¶¯»ù±¾ÐÅÏ¢
--<»î¶¯ÎïÆ·>ÏìÓ¦½Å±¾
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	if gf_CheckEventDateEx(138) ~= 1 then
		Talk(1,"","Event ®· hÕt nªn ®¹i hiÖp kh«ng thÓ sö dông vËt phÈm nµy ®­îc n÷a!")
		return 0;
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)	

---- Më réng event
--
--	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
--	if tbActivity then
--		local nCheckMaxEvent = gf_GetTaskByte(2731, 1)
--		local tbPrizeItemInfo = tbActivity.tbPrizeItemInfo[nItemSeq]
--		--local nTask = Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdGetFinalPrize)
--		local nUseTimes = Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes)
--		if nUseTimes >= 2000 and nUseTimes < 4000 then
--			if GetTask(2785) < 1 or GetTask(2786) < 1 or GetTask(2787) < 1 then
--				Talk(1,"","§¹i hiÖp ch­a nhËn phÇn th­ëng cuèi mèc 2000 nªn kh«ng thÓ sö dông tiÕp vËt phÈm event !!!!")
--				return 0
--			end
--			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
----			if GetTask(2788) == 4000 and GetTask(2789) == 4000 and GetTask(2790) == 4000 and nCheckMaxEvent == 0 then
----				--SetTask(2731,1)
----				gf_SetTaskByte(2731, 1, 1)
----			end
----		elseif nUseTimes >= 3000 and nUseTimes < 4000 then
----			if nCheckMaxEvent < 2 then
----				Talk(1,"","§¹i hiÖp ch­a nhËn phÇn th­ëng cuèi mèc 3000 vËt phÈm nªn kh«ng thÓ sö dông tiÕp!!!!")
----				return 0
----			end
----			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
----			if GetTask(2836) == 4000 and GetTask(2837) == 4000 and GetTask(2838) == 4000 and nCheckMaxEvent == 2 then
----				--SetTask(2731,3)
----				gf_SetTaskByte(2731, 1, 3)
----			end
--		else
--			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
--		end
--	end
	
	
end
