--Relayµ÷ÓÃ
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
--print("Relay Call Boss")
--print(CallBack_Script);
if LSB_IsActivityOpen(LSB_ACTIVITY_ID) == 1 then
	ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay");
end
--print("Relay Call Boss End")