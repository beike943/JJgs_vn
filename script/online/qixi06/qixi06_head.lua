--file name:7xi06_head.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯½Å±¾Í·ÎÄ¼ş
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\qixi06\\mission_head.lua");
tabPos = new(KTabFile, "\\settings\\task\\killer\\killer_pos.txt");

TASK_POS_INDEX = 1888;	--¼ÇÂ¼Î»ÖÃĞÅÏ¢ÔÚ±íÖĞµÄË÷Òı
TASK_GOTATLAS_DATE = 1889;	--¼ÇÂ¼µÃµ½ĞÇĞÇµØÍ¼µÄÈÕÆÚ
TASK_PLANTSTAR_DATE = 1890;	--¼ÇÂ¼ÖÖÏÂĞÇĞÇµÄÈÕÆÚ
TASK_GOTPRESENT_DATE = 1891;	--¼ÇÂ¼ÁìÈ¡½±ÀøµÄÈÕÆÚ
TASK_FIND_STAR_COUNT = 1892;	--¼ÇÂ¼ÕÒµ½ĞÇĞÇµÄ´ÎÊı
TASK_PLANT_STAR_COUNT = 1893;	--¼ÇÂ¼ÖÖĞÇĞÇµÄ´ÎÊı
TASK_ADDED_AWARD_PLANTSTAR_DATE = 1894;	--¼ÇÂ¼µÃµ½ÖÖĞÇĞÇË«ÈË½±ÀøµÄÈÕÆÚ
TASK_ADDED_AWARD_FINDSTAR_DATE = 1895;	--¼ÇÂ¼µÃµ½ÕÒĞÇĞÇË«ÈË½±ÀøµÄÈÕÆÚ
TASK_QIAONV_AWARD_DATE = 1896;	--¼ÇÂ¼ÁìÈ¡ÇÉÅ®½±ÀøµÄÈÕÆÚ
TASK_EXPIATION_AWARD = 1897;	--¼ÇÂ¼Íæ¼ÒÓĞÃ»ÓĞÁìÈ¡¹ı½±Àø²¹³¥
--===============================================================================
GALAXY_MAP1 = 966;
GALAXY_MAP2 = 967;
GALAXY_MAP3 = 968;

REQUIRE_STAR_COUNT = 7;
--===============================================================================
tSexName = {"ThiÕu hiÖp","N÷ hiÖp "};

t7XiItem = {	--Ãû×Ö,ÎïÆ·±àºÅ1,ÎïÆ·±àºÅ2,ÎïÆ·±àºÅ3
		atlas = {"Tinh Tinh §Şa §å",2,0,407},
		star = {"Sao b¨ng r¬i xuèng trÇn gian",2,0,408},
		}
--ÅĞ¶Ïµ±Ç°ÊÇ²»ÊÇÒ»ÄĞÒ»Å®×é¶ÓÇÒ¶¼´óÓÚ£±£°¼¶ÇÒÏà»¥¾àÀë²»³¬¹ı¾ÅÆÁ
function Is_Lovers_Team()	
	local nOldPlayerIndex = PlayerIndex
	if GetTeamSize() == 2 then
		local Sex1,Sex2
		PlayerIndex = GetTeamMember(1)
		if IsPlayerNear(GetTeamMember(2)) < 0 then	--¾àÀëÌ«Ô¶£¨³¬¹ı¾ÅÆÁ£©
			return 0;
		end;
		Sex1 = GetSex()
		if GetLevel() <= 10 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		PlayerIndex = GetTeamMember(2)
		Sex2 = GetSex()
		if GetLevel() <= 10 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		if Sex1 ~= Sex2 then
			PlayerIndex = nOldPlayerIndex
			return 1
		else
			PlayerIndex = nOldPlayerIndex
			return 0
		end
	else
		PlayerIndex = nOldPlayerIndex
		return 0
	end
end

function Get_Qixi06_State()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 060728 and nDate <= 060806 then
		return 1;
	else
		return 0;
	end;
end;

function nothing()

end;