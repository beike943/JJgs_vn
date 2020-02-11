Include("\\script\\online\\viet_event\\golden_card\\golden_head.lua")

function main()	
	local nzTaskVal = 0
	local nTaskCheck = TASK_DIG_COUNT_1
	local nMapID = GetWorldPos()
	local nLevel = GetLevel()
	local nDate = tonumber(date("%y%m%d"))
	local npc_index = GetTargetNpc()
	local nChestID  = GetUnitCurStates(npc_index,2)
	if CheckAccount() <= 0 then
		Talk(1, "", "Tµi kho¶n cña c¸c h¹ kh«ng cã Hoµng Kim LÖnh Bµi.");
		return
	end
	if Zgc_pub_npc_distance() > 15 then
		Talk(1,"","Cù ly qu¸ xa, kh«ng thÓ më r­¬ng!")
		return 0
	end	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return
	end	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Vâ c«ng hÖ ph¸i ch­a häc ®Çy ®ñ, kh«ng thÓ nhËn th­ëng.");
		return
	end
	if GetItemCount(0,200,25) < 1 then
		Talk(1, "", "Ph¶i cã Cuèc Viªm §Õ trong ng­êi míi cã thÓ më r­¬ng.");
		return
	end
	if nLevel < 80 then
		if nMapID ~= 108 and nMapID ~= 301 then
			Talk(1, "", "§¼ng cÊp cña c¸c h¹ kh«ng thÝch hîp më r­¬ng t¹i ®©y. H·y t×m n¬i kh¸c.");
			return
		end
	elseif nLevel >= 80 and nLevel <= 89 then
		if nMapID ~= 513 then
			Talk(1, "", "§¼ng cÊp cña c¸c h¹ kh«ng thÝch hîp më r­¬ng t¹i ®©y. H·y t×m n¬i kh¸c.");
			return
		end
	elseif nLevel >= 90 then
		if nMapID ~= 514 then
			Talk(1, "", "§¼ng cÊp cña c¸c h¹ kh«ng thÝch hîp më r­¬ng t¹i ®©y. H·y t×m n¬i kh¸c.");
			return
		end
	end	
	local nChestType = CheckDigLevel()
	if nChestType <= 0 then
		Talk(1, "", "C¸c h¹ kh«ng ®ñ ®iÒu kiÖn më r­¬ng. C¸c h¹ ph¶i cã tµi kho¶n <color=red>Vâ L©m TiÒn Bèi, cã ®iÓm danh väng, ®iÓm s­ m«n vµ ®iÓm c«ng tr¹ng theo quy ®Þnh míi më ®­îc<color>!");
		return	
	end
	
	if (floor(GetTask(TASK_DIG_DATE)/100)) ~= nDate then
		SetTask(TASK_DIG_COUNT_1,0)
		SetTask(TASK_DIG_COUNT_2,0)
		SetTask(TASK_DIG_DATE,nDate*100)	
	end
			
	if mod( GetTask(TASK_DIG_DATE),100)  >=  tbOpenBoxTimes[nChestType]  then
		Talk(1, "", "H«m nay c¸c ®· sö dông hÕt sè lÇn më r­¬ng, mai thö l¹i nhÐ!");
		return
	end
	if GetTime() - GetTask(TASK_DIG_TIME) <= 60 then
		local nRemainTime = 60 - (GetTime() - GetTask(TASK_DIG_TIME))
		Talk(1, "", "Thêi gian gi÷a 2 lÇn më r­¬ng lµ 60 gi©y. C¸c h¹ cßn "..nRemainTime.." gi©y míi cã thÓ më tiÕp.");
		return
	end
	if nChestID > 31 then
		nChestID = nChestID - 31
		nTaskCheck = TASK_DIG_COUNT_2
	end
	if gf_GetTaskBit(nTaskCheck,nChestID) == 1 then
		Talk(1, "", "Mçi r­¬ng chØ ®­îc më 1 lÇn, h·y ®i t×m r­¬ng kh¸c!");
		return
	end	
		SetTask(TASK_DIG_DATE,GetTask(TASK_DIG_DATE)+1)
		SetTask(TASK_DIG_TIME,GetTime())
		gf_SetTaskBit(nTaskCheck,nChestID,1)		
		SetTask(TASK_DIG_COUNT_ALL,GetTask(TASK_DIG_COUNT_ALL) + 1)
		AbradeDigTool(3,61,10)
		DoWait(21,14,5)
end