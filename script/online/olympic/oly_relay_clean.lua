--Relay定时调用
Include("\\script\\online\\olympic\\oly_head.lua")
--print("Relay调用OLY");
if oly_IsActivityOpen() ~= 0 then
--	print("清理数据OLY")
	ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_LuckNum_ReSet");
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Register_ReSet");
	if oly_GetActivityOpenDays() * 24 * 3600 == OLY_ACTIVITY_DURATION then
		ApplyRelayShareData(Oly_Record.szKey,Oly_Record.nKey1,Oly_Record.nKey2,Oly_CallBack_Script,"oly_CallBack_TGL_ReSet");
	end
end