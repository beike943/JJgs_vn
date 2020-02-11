Include("\\script\\lib\\dice.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\shimen_tier4\\string.lua")
Include("\\script\\online_activites\\shimen_tier4\\common.lua")

function main()
--	local nNpcIndex = GetTargetNpc()
--	if (nNpcIndex <= 0) then
--		return
--	end
--	
--	local nStage = GetUnitCurStates(nNpcIndex, 4)
--	local nDiceID = GetUnitCurStates(nNpcIndex, 5)
--	
--	if nDiceID == 0 then
--		local tbItem = VET_GetRandomTier4Equip(VET_TB_TIER4_DROP_TYPE[nStage]);
--		if (tbItem ~= nil) then
--			nDiceID = roll_item(VET_TB_TIER4_SCRIPT_NAME[2], VET_TB_TIER4_FUNC_NAME[1], tbItem)
--			if (nDiceID == nil) then
--				return
--			end
--			gf_WriteLogEx(VET_STR_TIER4_LOG_TITLE, format(VET_TB_TIER4_LOG_ACTION[1],nStage), 1, GetItemName(tbItem[1],tbItem[2],tbItem[3]), format("(%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d)",tbItem[1],tbItem[2],tbItem[3],tbItem[4] or 1,tbItem[5] or 1,tbItem[6] or -1,tbItem[7] or -1,tbItem[8] or -1,tbItem[9] or -1,tbItem[10] or -1,tbItem[11] or -1));
--			AddUnitStates(nNpcIndex, 5, nDiceID);
--		else
--			Msg2Player(VET_TB_TIER4_MSG[1]);
--			return
--		end
--	end
--	
--	check_roll_state(nDiceID);
end