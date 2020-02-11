Include("\\script\\newbattles\\functions.lua");
tbJUNGONGZHANG = 
{
	[1] = {"Huy hiÖu chiÕn c«ng (tiÓu)",2,1,9999,2},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,5},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,10},
}

function OnUse(nItemIdx)
	if 1==1 then
		return 0;
	end;
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B¹n kh«ng sö dông huy hiÖu chiÕn c«ng!");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	if nTimePassed < ITEM_SPYCLOTH_TIME then
		Talk(1,"","Huy hiÖu chiÕn c«ng vµ mÆt n¹ gi¸n ®iÖp kh«ng thÓ cïng sö dông! Thêi gian sö dông mÆt n¹ chiÕn «cng cña ng­¬i cßn: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.");
		return 0;
	end;
	local selTab = {
				format("§ång ý/#use(%d)",nType),
				"Hñy c«ng dông huy hiÖu chiÕn c«ng/cancel_effect",
				"Hñy bá/nothing",
				}
	local nCurMultiple = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurMultiple ~= 0 then
		nCurMultiple = nCurMultiple + 1;
	end;
	Say("C«ng dông huy hiÖu chiÕn c«ng cña ng­¬i hiÖn lµ <color=yellow>"..nCurMultiple.."<color>lÇn. Sö dông <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> khi chiÕn trËn kÕt thóc sÏ nhËn ®­îc <color=yellow>"..tbJUNGONGZHANG[nType][5].."<color> lÇn c«ng tr¹ng. §ång ý sö dông chø? <enter> Chó ý: <enter>1: <color=yellow> C«ng tr¹ng kh«ng t­¬ng øng víi huy hiÖu chiÕn c«ng sÏ bÞ khÊu trõ khi chiÕn trËn kÕt thóc. <color><enter>2: ®iÓm c«ng tr¹ng <color=yellow>sÏ c¨n cø vµo sè lÇn th¾ng b¹i mµ tÝch lòy<color>.<enter>3 <color=red>Qu©n c«ng tr¹ng vµ MÆt n¹ gi¸n ®iÖp kh«ng thÓ ®ång thêi sö dông<color>!",getn(selTab),selTab);
end;

function cancel_effect()
	BT_SetData(PT_MULTIPLE_JUNGONG,0)
	Talk(1,"","Hñy bá c«ng dông huy hiÖu chiÕn c«ng, hiÖn cßn lµ <color=yellow>0<color> lÇn")
	Msg2Player("C«ng dông huy hiÖu chiÕn c«ng hiÖn lµ 0 lÇn");
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbJUNGONGZHANG) do
		if genre == tbJUNGONGZHANG[i][2] and detail == tbJUNGONGZHANG[i][3] and particular == tbJUNGONGZHANG[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nType)
	BT_SetData(PT_MULTIPLE_JUNGONG,tbJUNGONGZHANG[nType][5]-1)
	Talk(1,"","C«ng dông huy hiÖu chiÕn c«ng hiÖn lµ <color=yellow>"..tbJUNGONGZHANG[nType][5].."<color> lÇn");
	Msg2Player("C«ng dông huy hiÖu chiÕn c«ng hiÖn lµ "..tbJUNGONGZHANG[nType][5].."lÇn")
end;