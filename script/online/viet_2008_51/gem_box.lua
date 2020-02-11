-- ±¦Ê¯Ïä

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");

tItems = 
{
--		{ ¸ÅÂÊ, "Ãû×Ö", {G1, G2, G3, ÊýÁ¿} },
		{  6, "Ngò Linh Th¹ch", { 2, 1, 30005, 1, 1} },
		{ 47, "Lam Tinh Th¹ch", { 2, 1, 30006, 1, 1} },
		{ 47, "Hoµng B¶o Th¹ch", { 2, 1, 30007, 1, 1} },
};

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_ITEM_END then
		Say("Më b¶o r­¬ng sÏ ngÉu nhiªn nhËn ®­îc 1 viªn Ngò Linh Th¹ch, Lam Tinh Th¹ch hoÆc Hoµng B¶o Th¹ch, cã ®ång ý më b¶o r­¬ng kh«ng?\nThêi h¹n sö dông: <color=red>24h00 31-05-2008<color>",
			2,
			format("Më/#OnOpen(%d)", nItemIdx),
			"Kh«ng cÇn ®©u/nothing");
	end
end

function OnOpen(nItemIdx)
	local nItem = 0;
	if GetLevel() < 20 then
		Say("§îi ®Õn cÊp 20 h·y ghÐ l¹i..", 0);
		return
	end
	if CheckWeight() ~= 1 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		nItem = GetRandomItem(tItems)
		gf_SetLogCaption("viet_2008_51_gembox");
		gf_AddItemEx( tItems[nItem][3], tItems[nItem][2] );
		gf_SetLogCaption("");
	end
end

function CheckWeight()
	return gf_Judge_Room_Weight(1, 20);
end