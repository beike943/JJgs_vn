Include("\\script\\online\\item_buchang\\ibc_head.lua")

--Ê¹ÓÃ²¹³¥Àñ°ü
function OnUse(nItem)
	local tSay = {
		format("§óng/#_GetBcAward(%d)", nItem),
		"Ra khái/nothing",
	}
	Say("Tói quµ ®Òn bï: §Ó bµy tá lßng thµnh xin lçi tõ viÖc hack item lÇn nµy, chóng t«i sÏ ®­a ra nh÷ng phÇn th­ëng ®Òn bï sau, mong r»ng b¹n sÏ thÝch: <color=green>1.000.000.000 EXP, 20 Hu©n Ch­¬ng Anh Hïng, 10000 ®iÓm ch©n khÝ, 20000 ®iÓm c«ng tr¹ng, thó c­ìi ngÉu nhiªn<color>", getn(tSay), tSay);
end

function _GetBcAward(nItem)
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
	if IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.AwardTag) == 2 then
		Msg2Player("B¹n ®· nhËn ®Òn bï råi");
		return 0;
	end
	if DelItemByIndex(tonumber(nItem), 1) ~= 1 then
		return 0;
	end
	DoFireworks(832, 3);
	gf_ModifyExp(1000000000);
	gf_AddItemEx2({2, 1, 30499, 20, 4}, "Hu©n ch­¬ng anh hïng", "§Òn bï hack item", "Hu©n ch­¬ng anh hïng", 0, 1);
	AwardGenuineQi(10000);
	Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm ch©n khÝ", 10000))
	if GetTask(701) >= 0 then
  	SetTask(701, GetTask(701) + 20000)
  else
  	SetTask(701, GetTask(701) - 20000)
  end
  Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", 20000));
  local tAward = {
		{1, 20, "Thá ®en", {0, 105, 30039, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "NguyÖt L­îng Thè", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "§éc Gi¸c Thó B¶o B¶o", {0, 105, 30032, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "B¸o Vµng B¶o B¶o", {0, 105, 30030, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "Hång Mao Ng­u B¶o B¶o", {0, 105, 30023, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
  }
  gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "§Òn bï hack item", "Thó c­ìi ngÉu nhiªn")
  IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.AwardTag, 2);
end