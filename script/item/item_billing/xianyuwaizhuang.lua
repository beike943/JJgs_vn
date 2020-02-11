--ÏËÓðÍâ×°°ü
--²ß»®£ºÁõÌì£¬æÂæÂ
--½Å±¾£ºÄ«ÏÉ
--´´½¨ÈÕÆÚ£º2008Äê8ÔÂ20ÈÕ

tb_prize = {
	[1] = {1,0,109,505,"Tiªm vò trang (nam tiªu chuÈn)"},
	[2] = {1,0,109,506,"Tiªm vò trang (nam kh«i ng«)"},
	[3] = {3,0,108,485,"Tiªm vò tr©m (n÷ gîi c¶m)",0,109,503,"Tiªm vò th­êng (n÷ gîi c¶m)",0,110,225,"Tiªm vò quÇn (n÷ gîi c¶m)"},
	[4] = {3,0,108,486,"Tiªm vò tr©m (kiÒu n÷)",0,109,504,"Tiªm vò th­êng (kiÒu n÷)",0,110,226,"Tiªm vò quÇn (kiÒu n÷)"}	
	
}

function OnUse(nItemIdx)
	local nTemp,nBody;
	nBody = GetBody();
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end;
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if DelItem(2,1,3384,1) ~= 1 then
		Talk(1,"","X¸c nhËn trªn ng­êi b¹n cã Tiªm vò ngo¹i trang bao! ");
		return
	end;
	for nTemp = 1,tb_prize[nBody][1] do
		local nRet,nIdx = AddItem(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4],1);
		if nRet == 1 then
			SetItemExpireTime(nIdx, nExpireTime)
		end
		Msg2Player("B¹n nhËn ®­îc "..GetItemName(tb_prize[nBody][(nTemp - 1) * 4 + 2],tb_prize[nBody][(nTemp - 1) * 4 + 3],tb_prize[nBody][(nTemp - 1) * 4 + 4]));
	end
end;

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"end_dialog","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end