--Relay定时调用
Include("\\script\\online\\olympic\\oly_head.lua")
--print("Relay调用OLY");
if oly_IsActivityOpen() ~= 0 then
--	print("生成随机数")
	ApplyRelayShareData(Oly_Record2.szKey,Oly_Record2.nKey1,Oly_Record2.nKey2,Oly_CallBack_Script,"oly_CallBack_Relay_Random");
end