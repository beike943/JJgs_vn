Include("\\script\\lib\\globalfunctions.lua")

need_item={
	[209500208] = {2,95,208,"Tô NghÜa LÖnh"},
	[200130409] = {2,1,30409,"Th«ng Thiªn LÖnh"},
}
target_item = {2,97,236, "Thiªn Kiªu LÖnh"}
function OnUse(nItemIdx)
	Talk(1, "", "HiÖn t¹i kh«ng cã g× !!!!")
	do return 0 end
	local nG = GetItemGenre(nItemIdx)
	local nD = GetItemDetail(nItemIdx)
	local nP = GetItemParticular(nItemIdx)
	local nKey = nG*1000*100000 + nD*100000 + nP
	local tPara = need_item[nKey]
	if tPara then
		local nCount = GetItemCount(nG, nD, nP)
		local szItemName = GetItemName(nItemIdx)
		local szTitle = format("%s ®· kh«ng thÓ dïng, nh­ng cã thÓ ®æi thµnh mét sè %s, ®ång ý ®æi kh«ng?",szItemName, target_item[4])
		local tbSay = {
			format("Ta muèn ®æi /#_on_exchange(%d,%d)", nKey, nCount),
			"Tõ bá/no"
			}
		Say(szTitle, getn(tbSay), tbSay)
	end
	
	
end
function no()
end

function _on_exchange(nKey, nCount)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	AskClientForNumber(format("_request_number_call_back_%d", nKey), 1, nCount, "H·y nhËp vµo sè l­îng cÇn ®æi")
end

function _request_number_call_back_209500208(nNum)
	_request_number_call_back(209500208, nNum)
end
function _request_number_call_back_200130409(nNum)
	_request_number_call_back(200130409, nNum)
end

function _request_number_call_back(nType, nNum)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	local nG = floor(nType/100000000)
	local nD = mod(floor(nType/100000), 1000)
	local nP = mod(nType, 100000)
	local nDelResult = DelItem(nG, nD, nP, nNum)
	if  nDelResult and nDelResult == 1 then
		AddItem(target_item[1], target_item[2], target_item[3], nNum)
		local szMsg = format("§æi thµnh c«ng %d c¸i %s", nNum, target_item[4])
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
	end
end