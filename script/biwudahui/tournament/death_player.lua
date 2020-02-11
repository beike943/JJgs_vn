--Create date:2008-1-9 15:08
--Author:yanjun
--Description:玩家死亡脚本
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");

function OnDeath(nNpcIdx)
	RevivePlayer(0);
	local nKillerIdx = NpcIdx2PIdx(nNpcIdx);
	BWT_ChangeMSState(MS_STATE_ENDING);
	BWT_ReportResult(nKillerIdx,PlayerIndex);
	--BWT_CloseField();	--死亡后立刻结束Mission
	SetDeathScript("");
end;