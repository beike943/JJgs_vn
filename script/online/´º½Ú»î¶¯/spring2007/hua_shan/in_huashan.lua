Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
function In_huashan()
	SetDeathPunish(0)
	Msg2Player("B筺  i sang tr筺g th竔 PK!")
	if spring_2007_date_chk() == 0 then
		RemoveTrigger(GetTrigger(901))
	end
end
