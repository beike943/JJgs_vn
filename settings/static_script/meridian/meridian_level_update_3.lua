--¾­ÂöÏµÍ³¾³½ç¿ØÖÆ
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")

--Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâĞèÇóÌõ¼şÊÇ·ñ´ï³É
--1=ÒÑ´ï³É
--0=Î´´ï³É
function CheckCondition(nLevel, bNotify)
	if 3 ~= nLevel then
		return 0
	end
	if 1 ~= meridianlevel_check_require(nLevel, bNotify) then
		return 0
	end
	--Íê³ÉÈÎÎñÌõ¼şÅĞ¶Ï
	return 1;
end

--»ñÈ¡Ö¸¶¨Ñ¨Î»Ö¸¶¨µÈ¼¶µÄÌØÊâĞèÇóÃèÊöÎÄ±¾
--·µ»ØszDescription
function GetConditionDesc(nLevel)
	local szNpcDesc = format("Kİch ho¹t c¶nh giíi %s cã thÓ t×m <color=yellow>Nh¹c BÊt QuÇn<color> khai th«ng", meridianlevel_getname(nLevel - 1))
	local str = format("%s\nhoÆc%s", format("Hoµn thµnh %s d·y nhiÖm vô","Vâ V­¬ng"), szNpcDesc)
	return str;
end

--¾³½çÉı¼¶Ç°ÌØÊâĞèÇóĞèÒªÖ´ĞĞµÄ²Ù×÷
--1=²Ù×÷³É¹¦
--0=²Ù×÷Ê§°Ü
function DoBeforeLevelUpdateCallBack(nNewLevel)
	return 1;
end


--¾³½çÉı¼¶ºóÌØÊâĞèÇóĞèÒªÖ´ĞĞµÄ²Ù×÷
--1=²Ù×÷³É¹¦
--0=²Ù×÷Ê§°Ü
function DoAfterLevelUpdateCallBack(nNewLevel)
	merdiantitle_check_add_title(0)--¾­ÂöÌí¼Ó³ÆºÅ
	return 1;
end

