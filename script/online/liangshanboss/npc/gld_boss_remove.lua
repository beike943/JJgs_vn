--黄金BOSS被移除的时候执行的处理
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function OnRemove()
--	print("Gld_Boss OnRemove");
	--存在标记清零
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_DelDataRecord");
	--BOSS位置清理
	SetGlbValue(GS_GLOBAL_VALUE3,0);
	return 1;
end
