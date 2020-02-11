Include("\\script\\online_activites\\reborn\\tongban\\head.lua");

t_pet_fighting_pos = {
	{101,1660, 3081},
	{101,1638, 3151},
	{101,1605, 3183},
	{101,1572, 3165},
	{101,1543, 3184},
	{101,1515, 3300},
	{101,1520, 3243},
	{101,1551, 3272},
	{101,1501, 3116},
	{101,1538, 3131},
}

function main()
	local tSay = {
		"So tµi B¹n §ång Hµnh/pet_fight",
		"RÌn luyÖn B¹n §ång Hµnh/pet_train",
		"KÕt thóc ®èi tho¹i/gf_DoNothing",	
	}
	Say("T¹i ®©y diÔn ra thi ®Êu B¹n §ång Hµnh. PhÝ ®¨ng ký thi ®Êu lµ 60 vµng 1 lÇn. Chñ nh©n cña B¹n §ång Hµnh chiÕn th¾ng sÏ nhËn ®­îc 4 T¸o. NÕu so tµi hßa sÏ ®­îc 2 T¸o.", getn(tSay), tSay)
end

function pet_fight()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
		return
	end
	local tSay = {
		"B¾t ®Çu so tµi B¹n §ång Hµnh/pet_fight_start",
		"NhËn phÇn th­ëng chiÕn th¾ng/pet_fight_reward",
		"KÕt thóc ®èi tho¹i/gf_DoNothing",	
	}
	Say("T¹i ®©y diÔn ra thi ®Êu B¹n §ång Hµnh. PhÝ ®¨ng ký thi ®Êu lµ 60 vµng 1 lÇn. Chñ nh©n cña B¹n §ång Hµnh chiÕn th¾ng sÏ nhËn ®­îc 3 T¸o. Thêi gian thi ®Êu lµ 10 phót.", getn(tSay), tSay)
end

function pet_fight_reward()
	if GetTrigger(2516) ~= 0 then
		Talk(1,"","B¹n §ång Hµnh cña b¹n ®ang thi ®Êu víi ng­êi kh¸c!")		
		return
	end
	local nTaskVal = GetTask(TASK_PET_FIGHT)
	if nTaskVal== 0 or nTaskVal > 2 then
		Talk(1,"","B¹n hiÖn t¹i kh«ng cã phÇn th­ëng nµo!")		
		return
	end
	if gf_JudgeRoomWeight(1,1,"") == 0 then
		return
	end	
	SetTask(TASK_PET_FIGHT,0)
	if nTaskVal == 1 then
		gf_AddItemEx2({2, 1, 30176, 4},"T¸o","Ban Dong Hanh","so tµi th¾ng",0,1)
	elseif nTaskVal == 2 then
		gf_AddItemEx2({2, 1, 30176, 2},"T¸o","Ban Dong Hanh","so tµi hßa",0,1)
	end
end

function pet_fight_start()
	local nTeamSize = GetTeamSize()
	local nTargetIdx = GetTargetNpc()
	if GetTime() - GetUnitCurStates(nTargetIdx,6) <= 10*60 then
		Talk(1,"","Khu vùc nµy hiÖn ®ang cã thi ®Êu!")		
		return	
	end	
	if nTeamSize ~= 2  then	
		Talk(1,"","Tæ ®éi thi ®Êu ph¶i cã 2 ng­êi!")		
		return
	end
	if GetName() ~= GetCaptainName() then		
		Talk(1,"","ChØ cã ®éi tr­ëng míi cã thÓ kÝch ho¹t thi ®Êu!")		
		return
	end
	local nOldIndex = PlayerIndex;	
	local nEnemyIndex = 0
	local nPetEnemyIndex = 0
	local nCheck = 1	
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if  mod(GetTask(TASK_VNG_PET), 100) < 2 then
			Talk(1,"","B¹n §ång Hµnh cÊp 2 trë lªn míi cã thÓ tham gia thi ®Êu!")		
			nCheck = 0
			break
		end
		if GetCash() < 600000 then
			Talk(1,"","PhÝ ®¨ng ký thi ®Êu lµ 60 vµng! B¹n ch­a mang theo ®ñ vµng!")		
			nCheck = 0
			break
		end
		if GetTrigger(2516) ~= 0 then
			Talk(1,"","B¹n §ång Hµnh cña b¹n ®ang thi ®Êu víi ng­êi kh¸c!")		
			nCheck = 0
			break
		end
		if PlayerIndex ~= nOldIndex then
			nEnemyIndex = PlayerIndex
		end
	end
	PlayerIndex = nOldIndex
	if nCheck == 0 then	
		Talk(1,"","Tæ ®éi cã ng­êi kh«ng ®ñ ®iÒu kiÖn ®¨ng ký!")
		return
	end
	
	local nPosIdx = GetUnitCurStates(nTargetIdx,2)
	AddUnitStates(nTargetIdx,6, - GetUnitCurStates(nTargetIdx,6) + GetTime())
	
	local nNpcIdx1, nNpcIdx2 = 0,0
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100) 
		local nPetType = gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_TYPE)
		Pay(600000)		
		SetTask(TASK_PET_FIGHT,nTargetIdx*10)		
		CreateTrigger(1, 1001, 2516);
    		ContinueTimer(GetTrigger(2516));
		if PlayerIndex == nOldIndex then	
			SetTaskTemp(TSK_TMP_ENEMY_INDEX,nEnemyIndex)
			nNpcIdx1 = CreateNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType],GetName(),t_pet_fighting_pos[nPosIdx][1],t_pet_fighting_pos[nPosIdx][2],t_pet_fighting_pos[nPosIdx][3],-1,1,1,15)
			SetTaskTemp(TSK_TMP_PET_INDEX,nNpcIdx1)			
			SetCampToNpc(nNpcIdx1,"dasong")
			SetNpcDeathScript(nNpcIdx1,"\\script\\online\\viet_event\\pet_fighting\\pet_death.lua")
			SetNpcLifeTime(nNpcIdx1,600)
			AddUnitStates(nNpcIdx1,7,10)
			local nState = GetUnitCurStates(nNpcIdx1,6)
			AddUnitStates(nNpcIdx1,8, 50)
			AddUnitStates(nNpcIdx1,6, - nState)
			AddUnitStates(nNpcIdx1,6,PlayerIndex)
		else
			SetTaskTemp(TSK_TMP_ENEMY_INDEX,nOldIndex)
			nNpcIdx2 = CreateNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType],GetName(),t_pet_fighting_pos[nPosIdx][1],t_pet_fighting_pos[nPosIdx][2],t_pet_fighting_pos[nPosIdx][3],-1,1,1,15)
			SetTaskTemp(TSK_TMP_PET_INDEX,nNpcIdx2)
			SetCampToNpc(nNpcIdx2,"daliao")
			SetNpcDeathScript(nNpcIdx2,"\\script\\online\\viet_event\\pet_fighting\\pet_death.lua")
			SetNpcLifeTime(nNpcIdx2,600)
			AddUnitStates(nNpcIdx2,7,10)
			local nState = GetUnitCurStates(nNpcIdx2,6)
			AddUnitStates(nNpcIdx2,8, 50)
			AddUnitStates(nNpcIdx2,6, - nState)
			AddUnitStates(nNpcIdx2,6,PlayerIndex)
		end		
	end	
	PlayerIndex = nOldIndex
		
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex == nOldIndex then	
			SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,nNpcIdx2)
		else
			SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,nNpcIdx1)
		end
	end
	PlayerIndex = nOldIndex
end