Include("\\script\\newbattles\\functions.lua");

function OnUse(nItemIdx)
	local nCurJunGongMul = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurJunGongMul ~= 0 then	--µ±Ç°ÓĞ¾ü¹¦ÕÂĞ§¹û
		Talk(1,"","Huy hiÖu chiÕn c«ng vµ mÆt n¹ gian ®iÖp kh«ng thÓ cïng sö dông, nÕu muèn sö dông mÆt n¹ gi¸n ®iÖp ph¶i hñy t¸c c«ng hiÖu cña huy hiÖu chiÕn c«ng");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	local selTab = {
				format("§ång ı/#use(%d)",nItemIdx),
				"Hñy bá",
				}
	local sString = "";
	if nTimePassed >= ITEM_SPYCLOTH_TIME then
		sString = "MÆt n¹ gi¸n ®iÖp hiÖn cßn: <color=yellow>0 gi©y<color>.";
	else
		sString = "MÆt n¹ gi¸n ®iÖp cßn: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.";
	end;
	Say("Ng­¬i muèn sö dông mÆt n¹ gi¸n ®iÖp chø?"..sString.."Sö dông chó ı:\n1: <color=red>Thêi gian kĞo dµi hiÖu qu¶ cña Gi¸n ®iÖp trang lµ 3h, kh«ng céng dån<color>\n2: <color=red>Trong thêi gian Gi¸n ®iÖp trang cßn hiÖu qu¶ kh«ng ¶nh h­ëng qu©n c«ng cña bÊt kú phe nµo, b¹n cã thÓ vµo phe ®Şch.<color>\n3: <color=red>NhËn phÇn th­ëng chiÕn tr­êng sÏ hñy hiÖu qu¶ cña Gi¸n ®iÖp trang.<color>",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		BT_SetData(PT_SPYCLOTH_TIME,GetTime());
		Say("B¹n ®· dïng Gi¸n ®iÖp trang, <color=yellow>trong 3h<color> kh«ng ¶nh h­ëng qu©n c«ng cña bÊt kú phe nµo, b¹n cã thÓ vµo phe ®Şch.",0);
		Msg2Player("B¹n sö dông mÆt n¹ gi¸n ®iÖp")
		WriteLog("[ChiÕn tr­êng Nh¹n M«n Quan]:"..GetName().." sö dông mÆt n¹ gi¸n ®iÖp");
	end;
end;