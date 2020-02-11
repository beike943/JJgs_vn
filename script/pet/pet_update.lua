Include("\\script\\lib\\globalfunctions.lua")

--¾É³èÎïÉý¼¶µ½ÐÂ³èÎï
TASK_VNG_PET_INFO = 1536
TASK_VNG_PET = 2560
BYTE_PET_INFO_TYPE = 3
MAX_PET_COUNT = 5
t_pet_update = 
{
	[1] =
	{
		[1] = 24,
		[2] = 25,
		[3] = 26,
	},
	[2] = {
		[3] = 1,
		[4] = 2,
		[5] = 3,
	},
	[3] =
	{
		[1] = 4,
		[2] = 5,
		[3] = 6,
		[4] = 7,
		[5] = 8,
		[6] = 9,
		[7] = 10,
		[8] = 11,
		[9] = 12,
		[10] = 13,
		[11] = 14,
		[12] = 15,
	},
	[4] =
	{
		[13] = 16,
		[14] = 17,
		[15] = 18,
		[16] = 19,
		[17] = 20,
		[18] = 21,
		[19] = 22,
		[20] = 23,
	},
}

function PetUpdateMain()
	local szTitle = "GÇn ®©y l·o phu ®· tinh th«ng trong lÜnh vùc nu«i thó, b©y giê cã thÓ nu«i ®­îc kh«ng Ýt thó cao cÊp. NÕu ®¹i hiÖp ®· cã b¹n ®ång hµnh cò, cã thÓ ®Õn t×m l·o phu ®Ó ®æi b¹n ®ång hµnh  míi, b¹n ®ång hµnh míi sÏ tèt h¬n, m¹nh h¬n, tuyÖt vêi h¬n."
	local tbSay = {}
	tinsert(tbSay, "Ta muèn n©ng cÊp/OnUpdatePet")
	tinsert(tbSay, "Th«i, ta kh«ng n©ng cÊp n÷a/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function OnUpdatePet()
	local nPetCount,tbPetList = GetPetList()
	if nPetCount >= MAX_PET_COUNT then
		Talk(1,"","Sè b¹n ®ång hµnh cña ng­¬i ®· v­ît qu¸ giíi h¹n, kh«ng thÓ n©ng cÊp!")
		return
	end
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nOldType = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
--	if 1 == nCurLevel then
--		local nFeedExp = floor(GetTask(TASK_VNG_PET) / 100)
--		if nFeedExp >= 1 and nFeedExp <= 100 then
--			nOldType = 1
--		elseif nFeedExp >= 101 and nFeedExp <= 200 then
--			nOldType = 2
--		elseif nFeedExp >= 201 and nFeedExp <= 300 then
--			nOldType = 3
--		else
--			nOldType = 0
--		end
--	end
	local tbLevelTable = t_pet_update[nCurLevel] or {}
	local nNewType = tbLevelTable[nOldType]
	if nNewType then
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("HÖ thèng b¹n ®ång hµnh n©ng cÊp thµnh c«ng")
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 0)
			WriteLog(format("[Account:%s Role:%s] Update pet system success (Level=%d,OldType=%d NewType=%d)"
			, GetAccount(), GetName(), nCurLevel, nOldType, nNewType
			))
		else
			Msg2Player("HÖ thèng b¹n ®ång hµnh n©ng cÊp thÊt b¹i")
		end
	else
		Talk(1,"","Ng­¬i kh«ng cã b¹n ®ång hµnh nµo cÇn th¨ng cÊp!")
	end
end

function no()
end