--08´º½ÚË®½È½Å±¾
--by vivi
--2008/01/15

function OnUse()
	local nLv = GetLevel();
	local nExp = floor(1000000*nLv^2/80^2);
	Say("<color=green>sñi c¶o<color>: Sö dông sñi c¶o cã thÓ nhËn ®­îc <color=yellow>"..nExp.." <color> kinh nghiÖm. Dïng chø?",
		2,
		"§­îc/get_shuijiao_exp",
		"Kh«ng cÇn/nothing")
end

function get_shuijiao_exp()
	local nLv = GetLevel();
	local nExp = floor(1000000*nLv^2/80^2);
	if DelItem(2,1,3218,1) == 1 then
		ModifyExp(nExp);
	end
end

function nothing()

end