--filename:init_present_num.lua
--create date:2006-01-05
--author:yanjun
--describe:³õÊ¼»¯¸£ÉñÉíÉÏµÄÀñÎïÊıÁ¿
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")

function main()
	if Check_Date() == 0 then
		SetGlbValue(GLB_PRESENT_NUM_BJ,50)
		SetGlbValue(GLB_PRESENT_NUM_CD,50)
		SetGlbValue(GLB_PRESENT_NUM_QZ,50)
		AddLocalNews("Phóc thÇn ë Thµnh §«, BiÖn Kinh, TuyÒn Ch©u ®· b¾t ®Çu ph¸t hång bao, chØ cã 50 hång bao th«i nhĞ, xin c¸c vŞ h·y nhanh ch©n ®Õn lÊy!")
		Msg2SubWorld("Phóc thÇn ë Thµnh §«, BiÖn Kinh, TuyÒn Ch©u ®· b¾t ®Çu ph¸t hång bao, chØ cã 50 hång bao th«i nhĞ, xin c¸c vŞ h·y nhanh ch©n ®Õn lÊy!")
	end
end	