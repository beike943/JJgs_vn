--08´º½ÚĞ¡ºì°ü½Å±¾
--by vivi
--2008/01/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	Say("Sö dông tiÓu hång bao sÏ nhËn ®­îc 1 sè b¸nh n¨m míi, 1Kú L©n, 1 TiÓu ThÇn Th«ng Phï, 20% x¸c suÊt nhËn ®­îc 1 sñi c¶o. Sao h¶?",
		2,
		"§­îc/confirm_get_xiao",
		"Kh«ng cÇn/nothing")
end

function confirm_get_xiao()
	if Zgc_pub_goods_add_chk(6,20) ~= 1 then
		return
	end
	if DelItem(2,1,213,1) == 1 then
		AddItem(2,1,266,10);
		AddItem(2,1,267,3);
		AddItem(2,1,269,3);
		local add_flag,add_idx = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(add_idx,86400); --ÉèÖÃÎïÆ·´æÔÚÊ±¼ä£¬µ¥Î»£ºs
		AddItem(2,1,497,1);
		local nRand = random(1,100);
		if nRand <= 20 then
			AddItem(2,1,3218,1);
		end
	end
end