--ÎäÁÖÀñ°ü
Include("\\script\\lib\\globalfunctions.lua")
--Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

T_WULING_FREE = {
	tAward = {
		"3v3_free_Wllibao_1",
		"3v3_free_Wllibao_2",
	},
}
T_WULING_IB = {
	tAward = {
		"3v3_IB_Wllibao_1",
		"3v3_IB_Wllibao_2",
	},
	szConsume = "csm_1_tianjiaoling",
}
T_HAOXIA_FREE = {
	tAward = {
		"3v3_free_Hxlibao_1",
		"3v3_free_Hxlibao_2",
	},
}
T_HAOXIAO_IB = {
	tAward = {
		"3v3_IB_Hxlibao_1",
		"3v3_IB_Hxlibao_2",
	},
	szConsume = "csm_2_tianjiaoling",
}
T_BOX={
	[200130575] = {T_WULING_FREE, T_WULING_IB,},--ÎäÁÖÀñ°ü
	[200130576] = {T_HAOXIA_FREE, T_HAOXIAO_IB},----ÎäÁÖºÀÏÀÀñ°ü
}

function OnUse(nItemIndex)
	if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then
		return 0;
	end
	return onUse_Confirm(nItemIndex, 0)
end

function onUse_Confirm(nItemIndex, bConfirm)
	local ID = GetItemGenre(nItemIndex)*1000*100000 + GetItemDetail(nItemIndex)*100000+GetItemParticular(nItemIndex)
	local tCfg = T_BOX[ID]
	if tCfg then
		if getn(tCfg) > 1 then
			Say(format("[%s] cã %d c¸ch më.",GetItemName(nItemIndex),getn(tCfg)),
				3,
				format("\nMë miÔn phÝ/#onUse_Real(%d,%d,%d)", nItemIndex, 1, 0),
				format("\nDïng ®¹o cô më/#onUse_Real(%d,%d,%d)", nItemIndex, 2, 0),
				"\nBá qua/nothing");
			return
		elseif getn(tCfg) == 1 then
			onUse_Real(nItemIndex, 1, 0)
			return
		end
	end
end

function onUse_Real(nItemIndex, nOpenIndex, bConfirm)
	local nG,nD,nP = GetItemInfoByIndex(nItemIndex)
	local ID = nG*1000*100000 + nD*100000+nP
	local tCfg = T_BOX[ID]
	if tCfg then
		local szConsume = tCfg[nOpenIndex].szConsume
		if szConsume and 1~= bConfirm then
			local szConsumeDesc = CustomAwardGroupDesc(szConsume)
			Say(format("Më [%s] cÇn <color=yellow>[%s]<color>, ®ång ý më kh«ng?",GetItemName(nItemIndex), szConsumeDesc),
			2,
			format("\n x¸c nhËn më/#onUse_Real(%d,%d,%d)", nItemIndex, nOpenIndex, 1),
			"\nBá qua/nothing");
			return
		end
		local szFunc = format("onInputNumCallBack_%d_%d",ID, nOpenIndex)
		local nMax = GetItemCount(nG,nD,nP)
		AskClientForNumber(szFunc, 1, nMax, "Muèn më mÊy c¸i?")
	end
end

function onInputNumCallBack_200130575_1(nNum)
	onOpenBoxReal(nNum,200130575,1)
end
function onInputNumCallBack_200130575_2(nNum)
	onOpenBoxReal(nNum,200130575,2)
end
function onInputNumCallBack_200130576_1(nNum)
	onOpenBoxReal(nNum,200130576,1)
end
function onInputNumCallBack_200130576_2(nNum)
	onOpenBoxReal(nNum,200130576,2)
end

function onOpenBoxReal(nNum, nId, nOpenIndex)
	local tCfg = T_BOX[nId]
	if tCfg then
		for i=1,nNum do
			if 1 ~= onOpenBoxReal_Once(nId, nOpenIndex) then
				break
			end
		end
	end
end

function onOpenBoxReal_Once(nId, nOpenIndex)
	local tCfg = T_BOX[nId]
	local nRet = 0
	if tCfg then
		local tAward = tCfg[nOpenIndex]
		if tAward then
			local szConsume = tAward.szConsume
			if szConsume then
				if 1~=CustomAwardCheckAndConsumeGroup(szConsume,0) then
					return 0
				end
			end
			local nG = floor(nId/(1000*100000))
			local nD = floor(mod(nId,(1000*100000))/100000)
			local nP = mod(nId,100000)
			if 1 ~= DelItem(nG,nD,nP,1) then
				return 0
			end
			if szConsume then
				if 1~=CustomAwardCheckAndConsumeGroup(szConsume,1) then
					return 0
				end
			end
			local t = tAward.tAward
			for i=1,getn(t) do
				local szAward = t[i]
				local bGiveAll =  i
				if bGiveAll ~= 1 or getn(t)==1 then bGiveAll = 0 end
				if CustomAwardGiveGroup(t[i], bGiveAll)<=0 then
					return 0
				end
				nRet = 1
			end
			return nRet
		end
	end
	return 0
end

function nothing()
end