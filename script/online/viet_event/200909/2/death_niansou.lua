--=============================================
-- Created by TuanNA5
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	
	ModifyExp(5000000)
	Msg2Player("B¹n nhËn ®­îc 5.000.000 ®iÓm kinh nghiÖm.")
	
	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	
	-- xuÊt hiÖn 50 con tiÒu niªn thó khi ®¹i niªn thó bÞ die
	for i = 1, 50 do
		nAddX = random(-30, 30)
		nAddY = random(-30, 30)		
		nTargetNpc = CreateNpc("TiÓu Niªn Thó", "TiÓu Niªn Thó", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 60)	-- thêi gian tån t¹i 60 gi©y
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\xiaoniansou_baoguo.lua")			
	end	
	
	SetNpcLifeTime(nNpcIndex, 0)	
end

--function OnDeath(nNpcIndex)
--	SetNpcLifeTime(nNpcIndex, 30);
	
--	ModifyExp(5000000)
--	Msg2Player("B¹n nhËn ®­îc 5000000 ®iÓm kinh nghiÖm.")
	
--	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
--	local nAddX = 0
--	local nAddY = 0
--	local nTargetNpc = 0
			
--	for i = 1, 100 do
--		nAddX = random(-70, 70)
--		nAddY = random(-70, 70)		
--		nTargetNpc = CreateNpc("TiÓu Niªn Thó", "TiÓu Kú L©n", nMapID, nWx + nAddX, nWy + nAddY)
--		SetNpcLifeTime(nTargetNpc, 120)
--		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\xiaoniansou_baoguo.lua")
--	end
	
--	if gf_Judge_Room_Weight(1, 100, " ") == 0 then
--       return 0;
--    end
    
 --   	if random(1,100) <= 50 then
--		local nRand = gf_GetRandItemByTable(tb_Niansou_Award,1000,1)
--		local nRet, nItemIdx = gf_AddItemEx2(tb_Niansou_Award[nRand][3],tb_Niansou_Award[nRand][1],"Hoat dong Tet Nguyen Dan","giÕt §¹i Kú L©n",tb_Niansou_Award[nRand][4])
--	end
	
--	SetNpcLifeTime(nNpcIndex, 0);
-- end