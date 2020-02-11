--Å¿Å¿¿ÍÕ»Íâ×°°ü
--²ß»®£ºÁõÌì£¬æÂæÂ
--½Å±¾£ºÄ«ÏÉ
--´´½¨ÈÕÆÚ£º2008Äê8ÔÂ20ÈÕ

tb_prize = {
	[1] = {3,0,108,510,"C­íc ®iÕm ®Çu (nam tiªu chuÈn)",0,109,510,"C­íc ®iÕm y (nam tiªu chuÈn)",0,110,510,"C­íc ®iÕm trang (nam tiªu chuÈn)"},
	[2] = {3,0,108,511,"C­íc ®iÕm ®Çu (nam kh«i ng«)",0,109,511,"C­íc ®iÕm y (nam kh«i ng«)",0,110,511,"C­íc ®iÕm trang (nam kh«i ng«)"},
	[3] = {3,0,108,513,"C­íc ®iÕm ®Çu (n÷ gîi c¶m)",0,109,513,"C­íc ®iÕm y (n÷ gîi c¶m)",0,110,513,"C­íc ®iÕm trang (n÷ gîi c¶m)"},
	[4] = {3,0,108,512,"C­íc ®iÕm ®Çu (kiÒu n÷)",0,109,512,"C­íc ®iÕm y (kiÒu n÷)",0,110,512,"C­íc ®iÕm trang (kiÒu n÷)"}	
	
}

function OnUse(nIdx)
	local nTemp,nBody;
	local nItemIndex = tonumber(nIdx)
	local nTime = GetItemExpireTime(nItemIndex)
	
	nBody = GetBody();
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end;
	if DelItem(2,1,3383,1) ~= 1 then
		Talk(1,"","X¸c nhËn trªn ng­êi b¹n cã B¸t B¸t trang bao!");
		return
	end;
	for nTemp = 1,tb_prize[nBody][1] do
		local nRet, nItemIdx =AddItem(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4],1);
		if nRet > 0 then
			SetItemExpireTime(nItemIdx,nTime)
		end
		Msg2Player("B¹n nhËn ®­îc "..GetItemName(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4]));
	end
end;

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"end_dialog","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end