--粘贴心得
function OnUse(id)
	local nRet = InsertAddenda(id)--粘贴附录
	if nRet == -2 then
		Msg2Player("你的密码锁上了，不能添加秘密！")
	elseif nRet == -3 then
		Msg2Player("锁上了!不能添加密码。")
	end
end
