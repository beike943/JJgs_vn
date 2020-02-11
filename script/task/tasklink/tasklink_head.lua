
-- ½£ÏÀÇéÔµ II ÈÎÎñÁ´½Å±¾Í·ÎÄ¼ş
-- 2005/02/02  PM 15:32
-- Edited by peres

TL_TASKSTART_01 = 1025 -- ¼ÇÂ¼Íæ¼ÒÊÇ·ñÒÑ¾­¿ªÊ¼×öµÚÒ»ÌõÈÎÎñÁ´
TL_TASKID_01 = 11		-- ÉÌ»áÀÏ°åÈÎÎñÁ´µÄ±êÊ¶


function tl_getTaskInfo(myTaskID)

local myText1,myText2,myText3,myText4 = "","","",""

myText1 = GetInfo(myTaskID,1)
myText2 = GetInfo(myTaskID,2)
myText3 = GetInfo(myTaskID,3)
myText4 = GetInfo(myTaskID,4)

return myText1, myText2, myText3, myText4

end

-- ×Óº¯Êı£¬ÓÃÒÔÈ·¶¨Íæ¼ÒÊÇ·ñµÚÒ»´Î×öÈÎÎñÁ´
function tl_isFirstTime(myTaskID)
	if (GetTask(myTaskID) == 0) then
		return 0
	else
		return 1
	end
end


-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()
local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 1) then
		mySex = "C«ng tö"
	elseif (GetSex() == 2) then
		mySex = "N÷ hiÖp "
	end
	
return mySex
end