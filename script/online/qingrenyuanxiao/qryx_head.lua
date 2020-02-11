QRYX_SWITCH = 1	--ÇéÈË½Ú£¦ÔªÏü½Ú»î¶¯¿ª¹Ø¡£1Îª¿ª£¬0Îª¹Ø
--È«¾Ö±äÁ¿Ë÷Òı

--È«¾Ö³£Á¿
DEBUG = 0 	--µ÷ÊÔĞÅÏ¢Êä³ö¿ª¹Ø¡£1Îª¿ª£¬0Îª¹Ø
ROSELIFE = 60*60	--Ãµ¹å»¨µÄ×î´óÊÙÃü£ºÒ»¸öĞ¡Ê±
--ÈÎÎñ±äÁ¿
TASK_YUANFEN = 1860	--ÓÃÀ´¼ÇÂ¼Íæ¼ÒµÄÔµ·ÖÖ¸Êı
TASK_GOTUSE_CHOCOLATE = 1861	--ÓÃÀ´¼ÇÂ¼Íæ¼Òµ±ÌìÊÇ·ñÒÑ»ñµÃºÍÒÑÊ¹ÓÃÇÉ¿ËÁ¦¡£µÚ1×Ö½Ú±íÊ¾ÊÇ·ñ»ñµÃ¹ı¡£µÚ2×Ö½Ú±íÊ¾ÊÇ·ñÊ¹ÓÃ¹ı¡£
TASK_ROSE_LIFE 	 = 1862	--ÓÃÀ´¼ÇÂ¼Ãµ¹å»¨µÄÉúÃüÁ¦
TASK_ROSE_GROW 	 = 1863	--ÓÃÀ´¼ÇÂ¼Ãµ¹å»¨µÄ³É³¤¶È
TASK_ROSE_INDEX	 = 1864	--ÓÃÀ´¼ÇÂ¼Íæ¼ÒËùÖÖµÄÃµ¹å»¨µÄË÷Òı
TASK_ROSE_TYPE 	 = 1865	--ÓÃÀ´¼ÇÂ¼Íæ¼ÒËùÖÖ³öÀ´µÄÃµ¹å»¨µÄÀàĞÍ¡£1ÎªºìÃµ¹å£¬2Îª·ÛÃµ¹å£¬3Îª»ÆÃµ¹å
TASK_TEAM_INDEX  = 1866	--ÓÃÀ´¼ÇÂ¼¶ÓÎéµÄË÷Òı
TASK_LOVESTORY1  = 1867	--°®Çé¹ÊÊÂÈÎÎñÒ»£ºÁºÉ½²®Óë×£Ó¢Ì¨
TASK_LOVESTORY2  = 1868	--°®Çé¹ÊÊÂÈÎÎñ¶ş£ºĞíÏÉÓë°×ËØÕê
TASK_LOVESTORY3  = 1869	--°®Çé¹ÊÊÂÈÎÎñÈı£ºÄş²É³¼ÓëÄôĞ¡Ù»
TASK_LOVESTORY4  = 1870	--°®Çé¹ÊÊÂÈÎÎñËÄ£ºÂŞÃÜÓëÖìÀö
TASK_USE_YUPEI	 = 1871	--ÓÃÀ´¼ÇÂ¼Íæ¼ÒÊ¹ÓÃÓñÅåµÄÊ±¼ä
TASK_GOT_AWARD   = 1872	--ÓÃÀ´±êÊ¶Íæ¼ÒÊÇ²»ÊÇÁìÈ¡¹ı½±Àø
TASK_USEYUANXIAO = 1873	--ÓÃÀ´±êÊ¶Íæ¼Òµ±ÌìÓĞÃ»ÓĞ³Ô¹ıÔªÏü
TASK_GOT_QRJ	 = 1874	--ÓÃÀ´±êÊ¶Íæ¼ÒÓĞÃ»ÓĞµÃ¹ıÇéÈË½á£¨¼´ÓĞÃ»ÓĞ»Ø´ğÍêÎÊÌâ£©
--ÁÙÊ±ÈÎÎñ±äÁ¿

function Is_QRYX_Activity()	--ÅĞ¶Ï½ÚÈÕÊÇ·ñ¿ª·Å
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20080213 and nDate <= 20080215 and QRYX_SWITCH == 1 then
		return 1
	else
		return 0
	end
end

--IsLuckyº¯ÊıÊÇÓÃÀ´ÅĞ¶Ï¸ÅÂÊÊÇ·ñ³ÉÁ¢µÄ¡£ÈçIsLucky(10,100)ÊÇÅĞ¶Ï10/100µÄ¸ÅÂÊÊÇ·ñ³ÉÁ¢
function IsLucky(numer,deno)	--numerator£¨·Ö×Ó£©£¬denominator£¨·ÖÄ¸£©
	local nRandomNum = random(1,deno)
	if nRandomNum <= numer then
		return 1
	else
		return 0
	end
end

function IsLoversTeam()	--ÅĞ¶Ïµ±Ç°ÊÇ²»ÊÇÒ»ÄĞÒ»Å®×é¶Ó
	local OldPlayerIndex = PlayerIndex
	if GetTeamSize() == 2 then
		local Sex1,Sex2
		PlayerIndex = GetTeamMember(1)
		Sex1 = GetSex()
		PlayerIndex = GetTeamMember(2)
		Sex2 = GetSex()
		if Sex1 ~= Sex2 then
			PlayerIndex = OldPlayerIndex
			return 1
		else
			PlayerIndex = OldPlayerIndex
			return 0
		end
	else
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function GetLoversName()	--·µ»ØÖµ£ºµÚÒ»¸öÊÇÄĞÍæ¼ÒµÄÃû×Ö£¬µÚ¶ş¸öÊÇÅ®Íæ¼ÒµÄÃû×Ö
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		PlayerIndex = GetTeamMember(1)
		if GetSex() == 1 then
			nameMale = GetName()
			PlayerIndex = GetTeamMember(2)
			nameFemale = GetName()
		else
			nameFemale = GetName()
			PlayerIndex = GetTeamMember(2)
			nameMale = GetName()
		end
		PlayerIndex = OldPlayerIndex
		return nameMale,nameFemale
	else
		PlayerIndex = OldPlayerIndex
		return 0,0
	end
end

function GetLoversIndex()	--·µ»ØÖµ£ºµÚÒ»¸öÊÇÄĞÍæ¼ÒµÄË÷Òı£¬µÚ¶ş¸öÊÇÅ®Íæ¼ÒµÄË÷Òı¡£Èç¹û²»ÊÇÒìĞÔ×é¶ÓÔò·µ»Ø£°£¬£°
	if IsLoversTeam() == 1 then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = GetTeamMember(1)
		if GetSex() == 1 then
			PlayerIndex = OldPlayerIndex
			return GetTeamMember(1),GetTeamMember(2)
		else
			PlayerIndex = OldPlayerIndex
			return GetTeamMember(2),GetTeamMember(1)
		end
	else
		return 0,0
	end
end

function DebugOutput(message)	--µ÷ÊÔÊ±Êä³öĞÅÏ¢ÓÃµÄ
	if DEBUG == 1 then
		Msg2Player(message)
	end
end

function CreateTeamIndex(maleIdx,femaleIdx)	--ÓÃÀ´²úÉúÒ»¸öÄĞÅ®×é¶ÓµÄ¶ÓÎéË÷Òı£¬Î¨Ò»±êÊ¶Ò»¸ö¶ÓÎé
	if IsLoversTeam() == 1 then
		return maleIdx * 10000 + femaleIdx
	else
		return 0
	end
end

function CanAcceptTask(TASKID,step)	--ÅĞ¶ÏÊÇ·ñ¿ÉÒÔ½ÓÊÜÈÎÎñ
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		local OldPlayerIndex = PlayerIndex
		local teamIndex1,teamIndex2
		local Player1Step,Player2Step2
		local PlayerIndex1,PlayerIndex2 = GetLoversIndex()
		local PlayerLevel1,PlayerLevel2
		PlayerIndex = PlayerIndex1
		teamIndex1 = GetTask(TASK_TEAM_INDEX)
		Player1Step = GetTask(TASKID)
		Player1Level = GetLevel()
		PlayerIndex = PlayerIndex2
		teamIndex2 = GetTask(TASK_TEAM_INDEX)
		Player2Step = GetTask(TASKID)
		Player2Level = GetLevel()
		if Player1Level >= 10 and Player2Level >= 10 and teamIndex1 == teamIndex2 and Player1Step == Player2Step and Player1Step == step then
			PlayerIndex = OldPlayerIndex	
			return 1
		else
			PlayerIndex = OldPlayerIndex
			return 0
		end
	else
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function GetLoversDropRate()	--µÃµ½ÇéÂÂ¶ÓÎéµÄµôÂäÂÊÏµÊı£¬Èç·µ»Ø50±íÊ¾µôÂäÂÊÏµÊıÎª0.5¡£
	local nFriendliness
	local DropRate,DropRate1,DropRate2
	local YFIndex1,YFIndex2
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		PlayerIndex = GetTeamMember(1)
		nFriendliness = GetMemberFriendliness(2)	
		--ÒÔÏÂ¼ÆËãÓÉºÃ¸Ğ¶È¾ö¶¨µÄµôÂäÂÊ
		if nFriendliness >= 2000 then	--Èç¹ûºÃ¸Ğ¶È´óÓÚ200
			DropRate1 = 100	--µôÂäÂÊÎª100£¥
		else
			DropRate1 = floor(nFriendliness*99/2000 + 1)	--0µ½99
		end
		--ÒÔÏÂ¼ÆËãÓÉÔµ·ÖÖ¸Êı¾ö¶¨µÄµôÂäÂÊ
		PlayerIndex = GetTeamMember(1)
		YFIndex1 = GetTask(TASK_YUANFEN)
		PlayerIndex = GetTeamMember(2)
		YFIndex2 = GetTask(TASK_YUANFEN)
		DropRate2 = floor(100 - abs(YFIndex1 - YFIndex2) * 1.5)
		--Á½µôÂäÂÊÈ¡Æä´óÕß
		if DropRate1 >= DropRate2 then
			DropRate = DropRate1
		else
			DropRate = DropRate2
		end
		PlayerIndex = OldPlayerIndex
		return DropRate
	else 
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function AllTaskComplete()	--ÓÃÀ´ÅĞ¶ÏÊÇ·ñÈ«³ÉÁËËùÓĞËÄ¸ö°®ÇéÈÎÎñ
	if GetTask(TASK_LOVESTORY1) == 9 and GetTask(TASK_LOVESTORY2) == 9 and GetTask(TASK_LOVESTORY3) == 7 and GetTask(TASK_LOVESTORY4) == 9 then
		return 1
	else
		return 0
	end
end

function NoTaskBegin() --ÓÃÀ´ÅĞ¶ÏÊÇ·ñ»¹Ã»¿ªÊ¼ÈÎºÎÒ»¸öÈÎÎñ
	if GetTask(TASK_LOVESTORY1) == 1 and GetTask(TASK_LOVESTORY2) == 1 and GetTask(TASK_LOVESTORY3) == 1 and GetTask(TASK_LOVESTORY4) == 1 then
		return 1
	else
		return 0
	end
end

function qryx_give_a_chocolate()
	if Is_QRYX_Activity() ~= 1 then
		return
	end
	if GetSex() ~= 2 then
		return
	end
	if GetFreeItemRoom() < 2 then
		Msg2Player("Hµnh trang hoÆc søc v¸c nÆng kh«ng ®ñ, chocola nhËn ®­îc lÇn nµy mÊt råi. Xin h·y s¾p xÕp l¹i nhĞ!");
		return
	end
	if AddItem(2,0,361,1) == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 thái S«c«la")
		WriteLog("[Ho¹t ®éng lÔ t×nh nh©n vµ TÕt Nguyªn Tiªu]"..GetName().."B¹n ®· lµm 10 lÇn nhiÖm vô Th­¬ng Héi xin nhËn lÊy 1 thanh chocola.")
	end
end
