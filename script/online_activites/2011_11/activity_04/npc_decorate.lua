--bu liubo
--×°ÊÎÊ¥µ®Ê÷
Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")

VET_ITEM_COUNT = 5 --ËùÐèÂ¶Ë®µÄÊýÁ¿

VET_DECOTREE_AWARD = {
	{1, 6, "§u §ñ", {2, 1, 30178, 2}, 0},
	{4, 19, 10, 1},
	{5, 19, 10, 1},
	{31, 25, "get_popur_value()", ""},
	{31, 25, "get_petgrow_value()", ""}, --3µã³èÎï³É³¤Öµ
	{31, 6, "get_petmp_value()", ""}, --1µãÁéÁ¦Öµ
}

function main()
	-- »î¶¯ÊÇ·ñ¿ªÆô
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) ~= 1 then
		return 0
	end
	local npcIndexz = GetTargetNpc()
	local nPlayerIdx = GetUnitCurStates(npcIndexz,6)
	if nPlayerIdx ~= PlayerIndex then
		Talk(1, "", "§©y kh«ng ph¶i c©y cña ®¹i hiÖp!")
		return 0
	end
	
	local strName = GetTargetNpcName() or "C©y th«ng gi¸o héi"
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.PlayerIndex) ~= PlayerIndex then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[9],strName))
		return 0
	end
	
	local tbChoice = {
		[1] = "Trang trÝ c©y th«ng gi¸ng sinh/to_decorate",
		[2] = "Kh«ng cÇn ®©u/do_nothing",
	}
	local nTimes = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nTimes == 5 then 
		tremove(tbChoice,1)
		tinsert(tbChoice,1,"NhËn lÊy phÇn th­ëng./to_get_award")
	end	
	Say(format(tSTRING_DECORATETREE_TABLE[9],strName),getn(tbChoice),tbChoice)
end

function to_decorate()
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_TABLE[2])
		return 0
	end
	
	local nTimes = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nTimes <= 0 or nTimes >= 5 then return 0 end
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DaySeq,zgc_pub_day_turn())
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DecoTimes,0)
	end
	if GetTime() - VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace) < VET_201111_TIMESPACE_MAX then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[8],VET_201111_TIMESPACE_MAX / 60))
		return 0
	end
	if GetItemCount(2,0,351) < VET_ITEM_COUNT then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[6],VET_ITEM_COUNT))
		return 0
	end
	if DelItem(2,0,351,VET_ITEM_COUNT) == 0 then
		return 0
	end
	local nNpcIndex = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TreeIndex)
	local nMapId,nX,nY = GetNpcWorldPos(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,0)
	nNpcIndex = CreateNpc(VET_201111_TREENPC_NAME[nTimes+1],format(tSTRING_DECORATETREE_TABLE[7],nTimes+1),nMapId,nX,nY)
	SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_11\\activity_04\\npc_decorate.lua")
	SetNpcLifeTime(nNpcIndex,VET_201111_TREE_EXITSTIME)
	AddUnitStates(nNpcIndex,6,PlayerIndex)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TreeIndex,nNpcIndex)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,GetTime())
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.IsCreate,nTimes+1)
	gf_EventGiveCustomAward(1,500000,1,"Event trang tri cay thong noel","C©y th«ng gi¸o héi")
end

function to_get_award()
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
	end
	gf_EventGiveCustomAward(1,600000,1,"Event trang tri cay thong noel","C©y th«ng gi¸o héi")
	gf_EventGiveRandAward(VET_DECOTREE_AWARD,100,"Event trang trÝ c©y th«ng noel","C©y th«ng gi¸o héi")
	local nNpcIndex = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TreeIndex)
	SetNpcLifeTime(nNpcIndex,0)
	VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace)-VET_201111_TREE_EXITSTIME)
	return 1
end

--¸øÐÞÎª
function get_popur_value()
	gf_EventGiveCustomAward(26,1000,1,"Event trang tri cay thong noel","C©y th«ng gi¸o héi")
end

function do_nothing()
	--do nothing
end

------------------------------------------------------
--attention:all the pet-award-api are here
--add pet grow award
function get_petgrow_value()
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 1 then
		Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh nªn phÇn th­ëng bÞ v« hiÖu!")		
		return
	end
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (3 * 100))
	Msg2Player("B¹n nhËn ®­îc 3 §iÓm N©ng CÊp B¹n §ång Hµnh")
	gf_WriteLogEx("Event trang tri cay thong noel" ,"3 §iÓm N©ng CÊp B¹n §ång Hµnh")
end

--add pet mp award api
function get_petmp_value()
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel < 2 then
		Talk(1,"","B¹n §ång Hµnh ch­a ®ñ cÊp 2 nªn phÇn th­ëng bÞ v« hiÖu!")		
		return
	end
	Pet_AddGP(1)
	Msg2Player("B¹n nhËn ®­îc 1 §iÓm Linh Lùc B¹n §ång Hµnh")
	gf_WriteLogEx("Event trang tri cay thong noel" ,"1 §iÓm Linh Lùc B¹n §ång Hµnh")
end