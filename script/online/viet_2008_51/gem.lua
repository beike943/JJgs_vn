-- Ô½ÄÏ2008 51 »î¶¯
-- ±¦Ê¯

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_ITEM_END then
		Say("Sö dông b¶o th¸ch sÏ nhËn ®­îc 1 ®iÓm kinh nghiÖm, cã muèn sö dông kh«ng?\nThêi h¹n sö dông: <color=red>24h00 31-05-2008<color>",
			2,
			format("§­îc/#OnOpen(%d)", nItemIdx),
			"Kh«ng cÇn ®©u/nothing");
	end
end

function OnOpen(nItemIdx)
	local nItem = 0                                 
	if GetLevel() < 20 then
		Say("§îi ®Õn cÊp 20 h·y ghÐ l¹i..", 0);
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("viet_2008_51_gem");
		gf_Modify("Exp", 1);
		gf_SetLogCaption("");
	end
end
