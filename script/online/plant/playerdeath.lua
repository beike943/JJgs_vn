Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\lib\\writelog.lua");

function OnDeath(Launcher)
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then
		SetDeathScript("");	--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
		SetTask(TASK_TREEINDEX,0);	--
		SetTask(TASK_TREEGROW,0);	--
		SetTask(TASK_PLANTTIME,0);		
		return 0;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	KillerIndex = NpcIdx2PIdx(Launcher);
	OldPlayerIndex = PlayerIndex;
	local sName = GetName();
	SetDeathScript("");	--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetNpcLifeTime(GetTask(TASK_TREEINDEX),0);	--Ê÷ÏûÊ§µô
	SetNpcScript(GetTask(TASK_TREEINDEX),"");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	WriteLogEx("Trong cay Bat Nha", "Mat cay");
	PlayerIndex = KillerIndex;
	if PlayerIndex > 0 then
		if AddItem(2,0,398,1) == 1 then
			Msg2Player(TREETYPE[nTreeGrow][2].."Linh khİ ®ét nhiªn mÊt ®i vµ biÕn l¹i thµnh h¹t gièng, b¹n mau nhÆt lÊy h¹t gièng");
		end;
		sName = GetName();
		PlayerIndex = OldPlayerIndex;
		Msg2Player(TREETYPE[nTreeGrow][2].."Linh khİ ®ét nhiªn mÊt ®i vµ biÕn l¹i thµnh h¹t gièng, b¹n mau nhÆt lÊy h¹t gièng, h¹t gièng còng bŞ tªn c­íp ®o¹t mÊt.");
	end;
end;