--ÑÝÎä°ü

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua")
--Include("\\script\\lib\\xoyobi.lua")

tItems = {
	{"DiÔn Vâ Nguyªn So¸i Bao",2,95,692},
	{"DiÔn Vâ T­íng Qu©n Bao",2,95,693},
	{"DiÔn Vâ Tiªn Phong Bao",2,95,694},
	{"DiÔn Vâ SÜ Binh Bao",2,95,695},
}

tClause = {
	{
		subclauses = {
		{{"V¹n Hoa H¹p [§Çu kh«i cÊp 1]", {2,95,574,1},}, 1000},
		{{"TiÓu Thiªn M«n DiÔn Vâ LÖnh", {2,95,206,1},}, 1000},
		{{"TiÓu Thiªn Th¹ch Bao", {2,95,221,1},}, 1000},
		{{"PhiÕu Thiªn M«n anh hïng ", {2,95,691,1,4},}, 7000},
		},			
		giveClause = ClauseRandom.giveClause,
	},
	{
		subclauses = {
--		{{"ÁðÁ§½äµ¶", {0,3,8890,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"À×Òô¹üÊÖ", {0,0,8872,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"¾ªÀ×ìøÕÈ", {0,8,8908,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"ÒõÑô´©Ó°", {0,1,8878,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"´Èº½èóÒô½£", {0,2,8881,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"¾ÅÏö»·ÅåÇÙ", {0,10,8917,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"¹êÁÛ»¤ÊÖ", {0,0,8873,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"Õòéá¹÷", {0,5,8899,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"Íò»ª´¿·ç½£", {0,2,8882,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"ÐÇÒÆ¶·×ª±Ê", {0,9,8911,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"ÆÆ¾üÉ±ÕóÇ¹", {0,6,8902,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"´©ñ·×·Ãü¹­", {0,4,8896,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"¹Î¹ÇÑªµ¶", {0,7,8905,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"Á¶»êÑª×¦", {0,11,8920,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"ÓùÌì·çÀ×½£", {0,2,8883,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"ÉñÑ×Ììµ¶", {0,3,8891,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"Éñ·æÅÐ±Ê", {0,9,8912,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"ÉñÁéÖä×¦", {0,11,8921,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"»ÃÎèÁáççÖ¦", {0,13,8929,1,1,-1,-1,-1,-1,-1,-1},}, 25},
--		{{"»ÃÒô¾ÅÏöµÑ", {0,12,8926,1,1,-1,-1,-1,-1,-1,-1},}, 25},			
		{{"HuyÒn Th¹ch Kim Tinh", {2,201,3,1},}, 2000},
		{{"PhØ Thóy Méc Tinh", {2,201,5,1},}, 2000},
		{{"NguyÖt Hoa Thñy Tinh", {2,201,7,1},}, 2000},
		{{"Cöu HuyÒn Háa Tinh", {2,201,9,1},}, 2000},
		{{"Ng­ng Ngäc Thæ Tinh", {2,201,11,1},}, 2000},
		},			
		giveClause = ClauseRandom.giveClause,
	},
	{
		subclauses = {
		{{"Xu Tiªu Dao 300";giveClause = function() EarnXYB(300) end}, 5000},
		{{"2 vµng";giveClause = function() gf_Modify("Money",20000) end}, 4500},
		{{"TiÓu TiÓu Kim Hæ", {2,95,696,1},}, 500},
		},			
		giveClause = ClauseRandom.giveClause,
	},
	{
		subclauses = {
		{{"Kim Tinh", {2,201,2,1},}, 2000},
		{{"Méc Tinh", {2,201,4,1},}, 2000},
		{{"Thñy Tinh", {2,201,6,1},}, 2000},
		{{"Háa Tinh", {2,201,8,1},}, 2000},
		{{"Thæ Tinh", {2,201,10,1},}, 2000},
		},			
		giveClause = ClauseRandom.giveClause,
	},	
}

function OnUse(nItemIdx)
	local g, d, p = GetItemInfoByIndex(nItemIdx)
	local nType = 0;
	for i = 1,getn(tItems) do
		if g == tItems[i][2] and d == tItems[i][3] and p == tItems[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then return 0; end
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("DiÔn Vâ Bao");
		ClauseRandom.giveClause(tClause[nType]);
		gf_SetLogCaption("")
	end	
end