--	1.Ç¿ÖÆ½âËøÌõ¼þ;
--    Ã»ÓÐ²ÎÊý£¬·µ»Ø0±íÊ¾²»ÐèÒª£¬·µ»Ø1±íÊ¾ÐèÒª£»
function NeedBoxForceUnlock()
	local elapseTime = GetBoxLastLockElapseTime()
	return 0
end;

--	 2.Ç¿ÖÆ½âËø½øÐÐµÄ²Ù×÷;
--     Ã»ÓÐ²ÎÊý£¬Ã»ÓÐ·µ»ØÖµ£»
function ProcessBoxForceUnlock()
end;
	 
--	 3.²éÑ¯×îºó¼ÓËøÊ±¼ä,´Ëº¯Êý²»ÐèÒªÊµÏÖ£¬ÊÇ·þÎñÆ÷Ìá¹©µÄ¹¦ÄÜ;
--     Ã»ÓÐ²ÎÊý£¬·µ»Ø×îºó¼ÓËøÊ±¼äÎªGameLogicFrameTime
-- function GetBoxLastLockTime()

--	 4.¼ÓËøÌõ¼þ£»
--     Ã»ÓÐ²ÎÊý£¬·µ»Ø0±íÊ¾²»ÄÜ£¬·µ»Ø1±íÊ¾ÄÜ¹»£»
function CanBoxLock()
	return 1;
end;

--	 5.¼ÓËø½øÐÐµÄ²Ù×÷£»
--     Ã»ÓÐ²ÎÊý£¬Ã»ÓÐ·µ»ØÖµ£»
function ProcessBoxLock()		
end;

--	 6.¸ÄÃÜÂëÌõ¼þ£»
--     Ã»ÓÐ²ÎÊý£¬·µ»Ø0±íÊ¾ÄÜ¹»£¬·µ»Ø1±íÊ¾²»ÄÜ£»
function CanBoxChangePassword()
	local money=GetCash()
	if money >= 200 then
		return 1
	else
		TaskTip("Thay ®æi mËt m· r­¬ng cÇn 2 nÐn b¹c! H×nh nh­ ng­¬i ch­a ®ñ tiÒn!")
		return 0
	end
end;

--	 7.¸ÄÃÜÂë½øÐÐµÄ²Ù×÷£»
--     Ã»ÓÐ²ÎÊý£¬Ã»ÓÐ·µ»ØÖµ£»
function ProcessBoxChangePassword()
--	ProcessBoxLock()
	Pay(200)
end;

--	 8.ÉèÖÃÃÜÂëÌõ¼þ£»
--     Ã»ÓÐ²ÎÊý£¬·µ»Ø0±íÊ¾ÄÜ¹»£¬·µ»Ø1±íÊ¾ÄÜ£»
function CanBoxSetPassword()
	local money=GetCash()
	if money >= 2000 then
		return 1
	else
		TaskTip("Thay ®æi mËt m· r­¬ng cÇn 20 nÐn b¹c! H×nh nh­ ng­¬i ch­a ®ñ tiÒn!")
		return 0
	end
end;

--	 9.ÉèÖÃÃÜÂë½øÐÐµÄ²Ù×÷£»
--     Ã»ÓÐ²ÎÊý£¬Ã»ÓÐ·µ»ØÖµ£»
function ProcessBoxSetPassword()
	Pay(2000)
end;

--	 10.¼ì²é´¢ÎïÏäÊÇ·ñÒªÇ¿ÖÆ½âËø
--	²»ÓÃ²ÎÊý
function ProcessUnlockLapse()
	if GetBoxUnlocking() == 1 then
		if GetBoxLastLockElapseTime() > 7 * 24 * 3600 then
			UnlockBox()
			CancelBoxPassword()
			Talk(1, "", "Thêi gian ®· ®Õn! Xin lËp tøc gi¶i khãa thiÕt lËp mËt m· míi! NÕu chËm trÔ sÏ kh«ng cßn c¬ héi!")
		else
			local nTimeLeft = GetBoxLastLockElapseTime() / 3600 / 24
			nTimeLeft = floor(nTimeLeft)
			nTimeLeft = 7 - nTimeLeft
			if nTimeLeft>7 then 
				nTimeLeft=7
			end
			Talk(1, "","R­¬ng hiÖn ®ang trong tr¹ng th¸i më khãa, mËt m· sau "..nTimeLeft.."ngµy sau tù ®éng xãa! NÕu cã th¾c m¾c, xin më r­¬ng hñy chèng më khãa!")
		end
	end
	return 1
end
