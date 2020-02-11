Include("\\script\\Ω·ªÈ\\marriage_head.lua");

TAKE_FOOD_INTERVAL = 30;

function main()
	local sFoodString = MR_GetFoodsString(2);
	if sFoodString == "" then
		Talk(1,"","Th¯c ®n v…n ch≠a chu»n bﬁ xong");
		return 0;
	end;
	if GetTime() - GetTask(TASK_TAKE_FOOD_TIME) <= TAKE_FOOD_INTERVAL then
		Talk(1,"","°n tı tı th´i!");
		return 0;
	end;
	get_random_food()
end

function get_random_food()
	local tFoodInfo = {};
	for i=1,getn(tFoods) do
		nFoodCount = GetMissionV(MV_FOOD_BEGIN+i-1);
		if nFoodCount > 0 then
			tinsert(tFoodInfo,{i,nFoodCount});
		end;	
	end;
	local nRand = random(1,getn(tFoodInfo));
	local nFoodIndex = tFoodInfo[nRand][1];
	local nCount = tFoodInfo[nRand][2];
	AddItem(tFoods[nFoodIndex][1],tFoods[nFoodIndex][2],tFoods[nFoodIndex][3],1);
	SetMissionV(MV_FOOD_BEGIN+nFoodIndex-1,nCount-1);
	SetTask(TASK_TAKE_FOOD_TIME,GetTime());
	Msg2Player("Bπn nhÀn Æ≠Óc 1 "..tFoods[nFoodIndex][4]);
end;


