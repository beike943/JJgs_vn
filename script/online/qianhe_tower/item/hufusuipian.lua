Include("\\script\\online\\qianhe_tower\\qht_head.lua")

HFSP_DIALOG = {
	--"3»¢·ûËéÆ¬+3½ð=Í­ÎÆ»¢·û/exchange_1",
	--"9»¢·ûËéÆ¬+9½ð=ÒøÎÆ»¢·û/exchange_2",
	"3 m¶nh Hæ phï + 1 Bæ Kim Th¹ch = Kim Hæ phï/exchange_3",
	"Kh«ng cÇn ®©u/nothing"
}

function OnUse(nItem)
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	Say("C¸c h¹ muèn ghÐp lo¹i Hæ phï nµo?",getn(HFSP_DIALOG),HFSP_DIALOG);
end

function exchange_1()
	local nNum1 = floor(GetItemCount(2,1,30435) / 3);
	local nNum2 = floor(GetCash() / 30000);
	AskClientForNumber("exchange_tw",1,min(nNum1,nNum2),"NhËp sè l­îng vµo","");
end	

function exchange_2()
	local nNum1 = floor(GetItemCount(2,1,30435) / 9);
	local nNum2 = floor(GetCash() / 90000);
	AskClientForNumber("exchange_yw",1,min(nNum1,nNum2),"NhËp sè l­îng vµo","");
end

function exchange_3()
	local nNum1 = floor(GetItemCount(2,1,30435) / 3);
	local nNum2 = GetItemCount(2,1,30439);
	AskClientForNumber("exchange_jw",1,min(nNum1,nNum2),"NhËp sè l­îng vµo","");
end

function exchange_tw(nNum)
	if GetItemCount(2,1,30435) < 3 * nNum then
		Msg2Player(format("M¶nh Hæ phï kh«ng ®ñ %d c¸i",3 * nNum));
		return 0;
	end
	if GetCash() < nNum * 30000 then
		Msg2Player("TiÒn trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,3 * nNum) == 1 and Pay(nNum * 30000) == 1 then
		gf_AddItemEx2({2,1,30436,nNum}, "§ång Hæ phï", "C«ng chiÕn Thiªn TÇm Th¸p", "§æi m¶nh Hæ phï", 0, 1);
	end
end

function exchange_yw(nNum)
	if GetItemCount(2,1,30435) < 9 * nNum then
		Msg2Player(format("M¶nh Hæ phï kh«ng ®ñ %d c¸i",9 * nNum));
		return 0;
	end
	if GetCash() < nNum * 90000 then
		Msg2Player("TiÒn trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,9 * nNum) == 1 and Pay(nNum * 90000) == 1 then
		gf_AddItemEx2({2,1,30437,nNum}, "Ng©n Hæ phï", "C«ng chiÕn Thiªn TÇm Th¸p", "§æi m¶nh Hæ phï", 0, 1);
	end
end

function exchange_jw(nNum)
	if GetItemCount(2,1,30435) < 3 * nNum then
		Msg2Player(format("M¶nh Hæ phï kh«ng ®ñ %d c¸i",3 * nNum));
		return 0;
	end
	if GetItemCount(2,1,30439) < nNum then
		Msg2Player("Bæ Kim Th¹ch trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,3 * nNum) == 1 and DelItem(2,1,30439,nNum) == 1 then
		gf_AddItemEx2({2,1,30438,nNum}, "Kim Hæ phï", "C«ng chiÕn Thiªn TÇm Th¸p", "§æi m¶nh Hæ phï", 0, 1);
	end
end