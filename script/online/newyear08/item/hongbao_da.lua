--08´º½Ú´óºì°ü½Å±¾
--by vivi
--2008/01/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function OnUse()
	Say("Sö dông ®¹i hång bao sÏ nhËn ®­îc mét sè b¸nh n¨m míi, 1 Kú L©n, ,3 TiÓu ThÇn Th«ng Phï, x¸c suÊt 40% nhËn ®­îc 1 sñi c¶o, ngÉu nhiªn 1-2 §¹i Néi Thanh §ång. Sao h¶?",
		2,
		"§­îc/confirm_get_da",
		"Kh«ng cÇn/nothing")
end

function confirm_get_da()
	if Zgc_pub_goods_add_chk(6,35) ~= 1 then
		return
	end
	if DelItem(2,1,212,1) == 1 then
		AddItem(2,1,266,20);
		AddItem(2,1,267,6);
		AddItem(2,1,269,5);
		local add_flag,add_idx = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1);
		SetItemExpireTime(add_idx,86400); --ÉèÖÃÎïÆ·´æÔÚÊ±¼ä£¬µ¥Î»£ºs
		AddItem(2,1,497,3);
		local nRand = random(1,100);
		if nRand <= 40 then
			AddItem(2,1,3218,1);
		end
		local nRand2 = random(1,100);
		if nRand2 <= 50 then
			AddItem(2,1,3208,1);
		else
			AddItem(2,1,3208,2);
		end
	end
end