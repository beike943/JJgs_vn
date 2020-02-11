--ÃÏ√≈’Ûª∂¿÷∞¸

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua")

g_sMsg = "$n mÎ g„i Song Lπc Bao, nhÀn Æ≠Óc $i!";

tClause = {
	subclauses = {
	{{"500 Æi”m tu luy÷n";giveClause = function() gf_Modify("Popur",500) end}, 3000},
	{{"5 vµng";giveClause = function() gf_Modify("Money",50000) end}, 3000},
	{{"20 vπn Æi”m kinh nghi÷m";giveClause = function() gf_Modify("Exp",200000) end}, 2350},
	{{"Bπch C©u Hoµn", {2,1,270,1},}, 1000},
	{{"Hu n LÈc BÊng", {2,95,172,1},g_sMsg}, 50},
	{{"Phi’u Thi™n M´n anh hÔng ", {2,95,691,1},g_sMsg}, 100},
	{{"C©y B∏t Nh∑", {2,0,398,1},}, 500},
	},			
	giveClause = ClauseRandom.giveClause,
};

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		gf_SetLogCaption("Hoan lπc bao");
		Clause2.giveClause(tClause);
		gf_SetLogCaption("")
	end		
end