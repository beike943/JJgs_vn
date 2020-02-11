Include("\\script\\online\\Ê¥µ®½Ú»î¶¯\\christmas_head.lua")
function main()
	iMonth = GetCurMonth()
	iDay = GetCurDate()
	if iMonth == 12 and (iDay >=23 and iDay <=28) and CHRISTMAS_SWITCH == 1 then
		SetGlbValue(ID_PRESENT_NUMBER_CD,100)
		SetGlbValue(ID_PRESENT_NUMBER_QZ,100)
		SetGlbValue(ID_PRESENT_NUMBER_BJ,100)
		AddLocalNews("HiÖn giê th«ng Gi¸ng Sinh ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u ®· treo quµ, ng­êi ch¬i h·y mau ®Õn lÊy.")
		Msg2SubWorld("HiÖn giê th«ng Gi¸ng Sinh ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u ®· treo quµ, ng­êi ch¬i h·y mau ®Õn lÊy.")
	end
end