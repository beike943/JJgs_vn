--File name:	create_xmas_tree.lua
--Describe:		圣诞节活动创建圣诞树脚本
--Create Date:	2008-11-17
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_head.lua")


function main()
	create_xmas_tree()
end

function create_xmas_tree()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	local i = 1
	local j = 1
	local nWeek = tonumber(date("%w"));
	if nWeek == 5 or nWeek == 6 or nWeek ==0 then
		local tbMapID = 
			{
				{203,1471,2995},
				{201,1482,3030},
				{205,1712,2960},
				{202,1490,2844},
				{108,1496,3021},
				{105,1536,3027},
				{103,1693,3212},
				{104,1405,2985},
				{308,1482,3069},
				{301,1510,2980},
				{304,1486,3020},
				{302,1407,2963},
				{151,1477,2938},
				{106,1456,3058},
				{107,1484,2931},
				{102,1458,2959},
				{306,1460,2913},
				{327,1447,3067},
				{401,1588,2946},
				{404,1410,2925},
				{312,1556,3545},
				{326,1537,2994},
				{405,1475,2975},
				{406,1417,2901},
			}
	
		local nNpcIndex = 0
		for i=1, getn(tbMapID) do
			for j=1, 50 do
				nNpcIndex = CreateNpc("C﹜ Gi竛g sinh 4c","C﹜ th玭g gi竜 h閕",tbMapID[i][1],tbMapID[i][2],tbMapID[i][3],-1,1,1,2000)
				SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\xmas_08\\npc\\xmas_tree_npc.lua")
				SetNpcLifeTime(nNpcIndex,1700);
			end
		end
		Msg2Global("C﹜ th玭g gi竛g sinh ngo礽 th祅h  xu蕋 hi謓 r錳, m鋓 ngi nhanh 甶 xem!")
	end
end
