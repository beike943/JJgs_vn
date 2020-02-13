--	1.强制解锁条件;
--    没有参数，返回0表示不需要，返回1表示需要；
function NeedBoxForceUnlock()
	local elapseTime = GetBoxLastLockElapseTime()
	return 0
end;

--	 2.强制解锁进行的操作;
--     没有参数，没有返回值；
function ProcessBoxForceUnlock()
end;
	 
--	 3.查询最后加锁时间,此函数不需要实现，是服务器提供的功能;
--     没有参数，返回最后加锁时间为GameLogicFrameTime
-- function GetBoxLastLockTime()

--	 4.加锁条件；
--     没有参数，返回0表示不能，返回1表示能够；
function CanBoxLock()
	return 1;
end;

--	 5.加锁进行的操作；
--     没有参数，没有返回值；
function ProcessBoxLock()		
end;

--	 6.改密码条件；
--     没有参数，返回0表示能够，返回1表示不能；
function CanBoxChangePassword()
	local money=GetCash()
	if money >= 200 then
		return 1
	else
		TaskTip("修改储物箱密码需要交纳2两银子，你身上的钱不够哦！")
		return 0
	end
end;

--	 7.改密码进行的操作；
--     没有参数，没有返回值；
function ProcessBoxChangePassword()
--	ProcessBoxLock()
	Pay(200)
end;

--	 8.设置密码条件；
--     没有参数，返回0表示能够，返回1表示能；
function CanBoxSetPassword()
	local money=GetCash()
	if money >= 2000 then
		return 1
	else
		TaskTip("设置储物箱密码需要交纳20两银子，你身上的钱不够哦！")
		return 0
	end
end;

--	 9.设置密码进行的操作；
--     没有参数，没有返回值；
function ProcessBoxSetPassword()
	Pay(2000)
end;

--	 10.检查储物箱是否要强制解锁
--	不用参数
function ProcessUnlockLapse()
	if GetBoxUnlocking() == 1 then
		if GetBoxLastLockElapseTime() > 7 * 24 * 3600 then
			UnlockBox()
			CancelBoxPassword()
			Talk(1, "", "您的解锁申请时间到了，储物箱已经解锁,请尽快重新设置密码，以免丢失。")
		else
			local nTimeLeft = GetBoxLastLockElapseTime() / 3600 / 24
			nTimeLeft = floor(nTimeLeft)
			nTimeLeft = 7 - nTimeLeft
			if nTimeLeft>7 then 
				nTimeLeft=7
			end
			Talk(1, "","您的储物箱正处在强制解锁状态,您的储物箱密码将在"..nTimeLeft.."天后自动消除!如有疑问,请开启储物箱取消强制解锁!")
		end
	end
	return 1
end
