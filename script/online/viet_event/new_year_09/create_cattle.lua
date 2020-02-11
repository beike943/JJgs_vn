--File name:	create_cattle.lua
--Describe:		´º½Ú»î¶¯´´½¨Å£Íõ½Å±¾
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")
Include("\\script\\lib\\writelog.lua")


function main()
	create_cattle()
end

function create_cattle()
	if is_new_year_09_viet_open() == 0 then
		return
	end

	local nWeek = tonumber(date("%w"));
	if nWeek == 5 or nWeek == 6 or nWeek ==0 then
		local tbMapID = 
			{
				[1] = 
					{
						{301, 1448, 2945},
						{301, 1417, 3122},
					},
				[2] = 
					{
						{218, 1824, 3270},
						{218, 1641, 3283},
					},
				[3] = 
					{
						{408, 1558, 3120},
						{408, 1324, 2854},
					},
			}
	
		local nNpcIndex = 0
		local nRandom = 0
		for i=1, getn(tbMapID) do
			nRandom = random(1,2)
			nNpcIndex = CreateNpc("cattle_viet","Ng­u V­¬ng",tbMapID[i][nRandom][1],tbMapID[i][nRandom][2],tbMapID[i][nRandom][3])
			if nNpcIndex > 0 then
				WriteLogEx("create_cattle", "CreateNpc", 1, "Ng­u V­¬ng", format("CreateNpc(%d,%d,%d)", tbMapID[i][nRandom][1],tbMapID[i][nRandom][2],tbMapID[i][nRandom][3]), "NULL" )
			end
			SetNpcScript(nNpcIndex,"\\script\\online\\viet_event\\new_year_09\\npc\\cattle_npc.lua")
			SetNpcLifeTime(nNpcIndex,7200);
		end
		Msg2Global("Ng­u V­¬ng ®· h¹ thÕ, c¸c vÞ ®¹i hiÖp h·y nhanh ch©n t×m Ng­u V­¬ng ë: Miªu LÜnh, Linh B¶o S¬n, T©y Thµnh §«")
	end
end
