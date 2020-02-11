--Íò±¦¸óÅä·½Ï»½Å±¾
--by vivi
--08/21/2007

Include("\\script\\lib\\lingshipeifang_info.lua")

function OnUse()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end 	
	local tPeifang = lspf_GetRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,1,5);
	if type(tPeifang) ~= "table" then
		return 0;
	end
	if DelItem(2,1,2640,1) == 1 then
		local add_flog_one = AddItem(tPeifang[1],tPeifang[2],tPeifang[3],1,1);
		local add_flog_two = AddItem(2,1,2641,1,1);
		if add_flog_one == 1 and add_flog_two == 1 then
			Msg2Player("Chóc mõng b¹n ®¹t ®­îc 1 Linh th¹ch phèi ph­¬ng ");
			Msg2Player("Chóc mõng b¹n ®¹t ®­îc 1 Linh th¹ch phèi ph­¬ng r¸ch");
		else
			WriteLog("Hép V¹n B¶o C¸c phèi ph­¬ng: Ng­êi ch¬i "..GetName().."Phèi ph­¬ng thªm vµo thÊt b¹i, id thÊt b¹i lµ: "..add_flog_one.." vµ"..add_flog_two);
		end
	end
end

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end