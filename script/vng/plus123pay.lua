Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\config\\vng_feature.lua");

szNPCname = "<color=green>Ng­êi VËn ChuyÓn:<color> "
tbConfig = {
	[1] = {"ThiÕt tinh cÊp 3 (khãa)", TSK_123PAY1, 50,2,1, {item={{gdp={2,1,30535,1,4}}}}},
	[2] = {"S¸ch kü n¨ng Pet cÊp 1", TSK_123PAY1, 8,3,3, {fn="PetBookAward(1);"}},
	[3] = {"S¸ch kü n¨ng Pet cÊp 2", TSK_123PAY1, 5,4,4, {fn="PetBookAward(2);"}},
	[4] = {"S¸ch kü n¨ng Pet cÊp 3", TSK_123PAY1, 5,5,5, {fn="PetBookAward(3);"}},
	[5] = {"S¸ch kü n¨ng Pet cÊp 4", TSK_123PAY1, 3,6,6, {fn="PetBookAward(4);"}},
	[6] = {"ThÇn hµnh b¶o ®iÓn (60 ngµy)", TSK_123PAY1, 2,7,7, {item={{gdp={0,200,40,1}, nExpired = 60*24*3600}}}},
	[7] = {"Tô linh tiªn ®¬n (khãa, 7 ngµy)", TSK_123PAY1, 10,9,8, {item={{gdp={2,1,30460,1,4}, nExpired = 7*24*3600}}}},
	[8] = {"Huy hiÖu chiÕn c«ng huy hoµng (khãa, 7 ngµy)", TSK_123PAY2, 9,2,1, {item={{gdp={2,1,9977,1,4}, nExpired = 7*24*3600}}}},
}

function main()
	local tbSay = {}
	for i=1,getn(tbConfig) do
--		tinsert(tbSay, tbConfig[i][1].."("..VNG_GetTaskPos(tbConfig[i][2],tbConfig[i][4],tbConfig[i][5]).."-"..tbConfig[i][2][3]..")/#Plus124Pay_Done("..i..")")
		tinsert(tbSay, tbConfig[i][1].."("..VNG_GetTaskPos(tbConfig[i][2],tbConfig[i][4],tbConfig[i][5]).."/"..tbConfig[i][3]..")/#Plus124Pay_Done("..i..")")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	local szSay = "C¸c h¹ nÕu cã quµ 123Pay cã thÓ ®Õn gÆp ta ®Ó nhËn."
	local nAwardIndex = GetExtPoint(EXT_PLUS123PAY)
	if nAwardIndex > 0 then
		szSay = "Quµ c¸c h¹ ®ang cã gåm: <color=yellow>"
		for i=1,getn(tbConfig) do
			if GetBit(GetExtPoint(EXT_PLUS123PAY),i) == 1 then
				szSay =  szSay..tbConfig[i][1]..", "
			end
		end
		szSay = szSay .. "<color> h·y nhanh chãng nhËn lÊy."
	end
	Say(szSay, getn(tbSay), tbSay)
end

function Plus124Pay_Done(nIndex)
	if tbConfig[nIndex] == nil then
		return 0
	end
	if GetBit(GetExtPoint(EXT_PLUS123PAY),nIndex) == 0 then
		Talk(1,"",szNPCname.."C¸c h¹ kh«ng cã quµ <color=yellow>"..tbConfig[nIndex][1].."<color>, xin h·y kiÓm tra l¹i.")
		return 0
	end
	local nUsed = VNG_GetTaskPos(tbConfig[nIndex][2],tbConfig[nIndex][4],tbConfig[nIndex][5])
	if nUsed >= tbConfig[nIndex][3] then
		Talk(1,"",szNPCname.."H«m nay c¸c h¹ ®· nhËn ®ñ <color=red>"..tbConfig[nIndex][3].."<color> lÇn "..tbConfig[nIndex][1]..", mai h·y nhËn tiÕp nhÐ.")
		return 0
	end
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"",szNPCname.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ!");
		return 0
	end
	VNG_SetExtBit(EXT_PLUS123PAY, nIndex,0)
	VNG_SetTaskPos(tbConfig[nIndex][2], nUsed +1, tbConfig[nIndex][4],tbConfig[nIndex][5])
	LIB_Award.szLogTitle = "PLUS 123PAY"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbConfig[nIndex][6])
end

function PetBookAward(nLevel)
	local tbPetBook = {
		[1] = {1,5,9,13,17,21,25,29,33,37,41,45,49,53,57},
		[2] = {2,6,10,14,18,22,26,30,34,38,42,46,50,54,58},
		[3] = {3,7,11,15,19,23,27,31,35,39,43,47,51,55,59},
		[4] = {4,8,12,16,20,24,28,32,36,40,44,48,52,56,60},
	}
	local nRand = mod(random(1,10000),getn(tbPetBook[nLevel])) + 1
	local tbAward = {item={{gdp={2,150,tbPetBook[nLevel][nRand],1}}}}
	LIB_Award:Award(tbAward)
end
