--File name:	create_seed.lua
--Describe:		春节活动创建幸福种子脚本
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")


function main()
	create_seed()
end

function create_seed()
	if is_new_year_09_viet_open() == 0 then
		return
	end

	local nWeek = tonumber(date("%w"));
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~=0 then
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
				nNpcIndex = CreateNpc(" nh竛h hoa h錸g","H箃 gi鑞g h筺h ph骳",tbMapID[i][1],tbMapID[i][2],tbMapID[i][3],-1,1,1,2000)
				SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\new_year_09\\npc\\seed_npc.lua")
				SetNpcLifeTime(nNpcIndex,3600);
			end
		end
		Msg2Global("H箃 gi鑞g h筺h ph骳  xu蕋 hi謓, m鋓 ngi h穣 mau mau t譵!")
	end
end
