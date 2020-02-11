--filename:yuandan_notice.lua
--create date:2005-12-26
--author:yanjun
--describe:ÓÃÀ´·¢Í¨¸æµÄ
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main()
	local iMonth = GetCurMonth()
	local iDay = GetCurDate()
	if ((iMonth == 12 and iDay ==31) or (iMonth == 1 and iDay <= 5)) and YUANDAN_SWITCH == 1 then
		if GetLocalTime() == 20 then
			AddLocalNews("H«m nay 21:00 sÏ më ho¹t ®éng Nguyªn ®¸n ®o¹t kú, c¸c b¹n nhí ®Õn gÆp §o¹t Kú Gi¸o §Çu ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u ®Ó t×m hiÓu th«ng tin vÒ ho¹t ®éng.")
			Msg2SubWorld("H«m nay 21:00 sÏ më ho¹t ®éng Nguyªn ®¸n ®o¹t kú, c¸c b¹n nhí ®Õn gÆp §o¹t Kú Gi¸o §Çu ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u ®Ó t×m hiÓu th«ng tin vÒ ho¹t ®éng.")
		elseif GetLocalTime() == 22 then
			AddLocalNews("H«m nay 23:00 sÏ më ho¹t ®éng Nguyªn ®¸n ®o¹t kú, c¸c b¹n nhí ®Õn gÆp §o¹t Kú Gi¸o §Çu ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u ®Ó t×m hiÓu th«ng tin vÒ ho¹t ®éng.")
			Msg2SubWorld("H«m nay 23:00 sÏ më ho¹t ®éng Nguyªn ®¸n ®o¹t kú, c¸c b¹n nhí ®Õn gÆp §o¹t Kú Gi¸o §Çu ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u ®Ó t×m hiÓu th«ng tin vÒ ho¹t ®éng.")
		end
	end
end