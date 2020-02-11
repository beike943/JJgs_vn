---------------------------------------------------------
--	»»È¡ÀëÏß¾­Ñé
--	
---------------------------------------------------------
Include("\\script\\lib\\offline_head.lua")
Include("\\script\\global\\offlinelive_action.lua")
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

function offline_exchange_talk_main()
	local tbDialog = {
		"Ta muèn dïng thêi gian rêi m¹ng ñy th¸c ®æi lÊy kinh nghiÖm ñy th¸c cña B¹ch C©u Hoµn/get_offline_baiju",
		"Ta muèn dïng thêi gian rêi m¹ng ñy th¸c ®æi lÊy danh väng ñy th¸c cña Lôc ThÇn Hoµn/get_offline_liushen",
		"Ta muèn dïng thêi gian rêi m¹ng ñy th¸c ®æi lÊy ®é cèng hiÕn s­ m«n ñy th¸c cña Tam Thanh Hoµn./get_offline_sanqing",
		"Ta muèn sö dông thêi gian ñy th¸c ®æi lÊy Tô Linh Hoµn Ch©n KhÝ ñy th¸c/get_offline_juling_talk",
		"Rêi khái/no"
		};
	Say("C¸c h¹ muèn dïng thêi gian ñy th¸c quy ®æi phÇn th­ëng g×?", getn(tbDialog), tbDialog)
end

function get_offline_baiju()
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	if OfflineBaijuTime <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian ñy th¸c B¹ch CÇu Hoµn cã thÓ quy ®æi", 0)
		return
	end
	
	local Baiju = min(GetTask(TASKVAL_BAIJUWAN), OfflineBaijuTime)
	local Baiju1 = min(GetTask(TASKVAL_BAIJUWAN1), OfflineBaijuTime)
	local Baiju2 = min(GetTask(TASKVAL_BAIJUWAN2), OfflineBaijuTime)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
	end
	
	local GiveExp = GiveExpPerMin * Baiju
	local GiveExp1 = floor(GiveExpPerMin * Baiju1 * 1.5)
	local GiveExp2 = GiveExpPerMin * Baiju2 * 2
	
	local GiveExpMax = GiveExpPerMin * OfflineBaijuTime
	
	Say("Thêi gian ñy th¸c B¹ch CÇu Hoµn cã thÓ quy ®æi lµ <color=yellow>"..OfflineBaijuTime.." phót (dïng B¹ch C©u Hoµn cã thÓ ®æi lÊy kinh nghiÖm"..GiveExpMax..", §¹i B¹ch C©u Hoµn gÊp 1.5 lÇn kinh nghiÖm, B¹ch C©u Tiªn ®¬n gÊp ®«i) <color><enter>Thêi gian ñy th¸c B¹ch C©u Hoµn dïng ®Ó ®æi lµ <color=yellow>"..Baiju.." phót (kinh nghiÖm:"..GiveExp.." )<color><enter>Thêi gian ñy th¸c §¹i B¹ch C©u Hoµn lµ <color=yellow>"..Baiju1.." phót (kinh nghiÖm:"..GiveExp1.." )<color><enter>Thêi gian ñy th¸c B¹ch C©u tiªn ®¬n lµ <color=yellow>"..Baiju2.." phót (kinh nghiÖm:"..GiveExp2.." )<color><enter>Thao t¸c ®æi sÏ khÊu trõ thêi gian ñy th¸c t­¬ng øng cña ng­¬i (nÕu ch­a ®æi xong, cã thÓ ®æi l¹i sau khi dïng B¹ch C©u Hoµn/§¹i B¹ch C©u Hoµn/B¹ch C©u tiªn ®¬n)",
		5,
		"Dïng thêi gian ñy th¸c B¹ch C©u Hoµn ®Ó ®æi kinh nghiÖm/#confirm_use_baiju(0)",
		"Dïng thêi gian §¹i B¹ch C©u hoµn ®Ó ®æi kinh nghiÖm/#confirm_use_baiju(1)",
		"Dïng thêi gian ñy th¸c B¹ch C©u Tiªn ®¬n ®Ó ®æi kinh nghiÖm/#confirm_use_baiju(2)",
		"trë l¹i/offline_exchange_talk_main",
		"Rêi khái/no"
		)
end

function confirm_use_baiju(BaijuType)
	if BaijuType == 0 then
		Say("X¸c ®Þnh sö dông <color=yellow>B¹ch CÇu Hoµn<color> quy ®æi thµnh ®iÓm kinh nghiÖm?", 3, "§ång ý/yes_get_offline_baiju", "trë l¹i/get_offline_baiju", "Rêi khái/no")
	elseif BaijuType == 1 then
		Say("X¸c ®Þnh sö dông <color=yellow>§¹i B¹ch CÇu Hoµn<color> quy ®æi thµnh ®iÓm kinh nghiÖm?", 3, "§ång ý/yes_get_offline_baiju1", "trë l¹i/get_offline_baiju", "Rêi khái/no")
	elseif BaijuType == 2 then
		Say("X¸c ®Þnh sö dông <color=yellow>B¹ch CÇu Tiªn §¬n<color> quy ®æi thµnh ®iÓm kinh nghiÖm?", 3, "§ång ý/yes_get_offline_baiju2", "trë l¹i/get_offline_baiju", "Rêi khái/no")
	end
end

function yes_get_offline_baiju()
	local Baiju = GetTask(TASKVAL_BAIJUWAN)
	if Baiju <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian B¹ch CÇu Hoµn, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
	end
	
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("§iÓm tÝch lòy kinh nghiÖm cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)
	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:0("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian B¹ch CÇu Hoµn quy ®æi thµnh c«ng <color=yellow>"..GiveExp.."<color> ®iÓm kinh nghiÖm, kinh nghiÖm tèi ®a ng­¬i cã thÓ nhËn ®­îc lµ <color=yellow>1950000000<color>, hiÖn giê kinh nghiÖm cßn d­ <color=yellow>"..LeftExp.."<color> ®iÓm ch­a ®æi, nÕu cã kinh nghiÖm d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (B¹ch C©u Hoµn/§¹i B¹ch C©u Hoµn/B¹ch C©u Tiªn ®¬n) ®Ó ®æi kinh nghiÖm d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng B¹ch C©u Hoµn ®æi "..GiveExp.." ®iÓm kinh nghiÖm")
end

function yes_get_offline_baiju1()
	local Baiju = GetTask(TASKVAL_BAIJUWAN1)
	if Baiju <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian §¹i B¹ch CÇu Hoµn, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000 * 1.5
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2) * 1.5
	end
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("§iÓm tÝch lòy kinh nghiÖm cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end

	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN1, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:1("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian §¹i B¹ch CÇu Hoµn quy ®æi thµnh c«ng<color=yellow>"..GiveExp.."<color> ®iÓm kinh nghiÖm, kinh nghiÖm tèi ®a ng­¬i cã thÓ nhËn ®­îc lµ <color=yellow>1950000000<color>, hiÖn giê kinh nghiÖm cßn d­ <color=yellow>"..LeftExp.."<color> ®iÓm ch­a ®æi, nÕu cã kinh nghiÖm d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (B¹ch C©u Hoµn/§¹i B¹ch C©u Hoµn/B¹ch C©u Tiªn ®¬n) ®Ó ®æi kinh nghiÖm d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng §¹i B¹ch C©u Hoµn ®æi "..GiveExp.." ®iÓm kinh nghiÖm")
end

function yes_get_offline_baiju2()
	local Baiju = GetTask(TASKVAL_BAIJUWAN2)
	if Baiju <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian B¹ch CÇu Tiªn §¬n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000 * 2
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2) * 2
	end
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("§iÓm tÝch lòy kinh nghiÖm cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)
	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN2, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:2("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian B¹ch CÇu Tiªn §¬n quy ®æi thµnh c«ng<color=yellow>"..GiveExp.."<color> ®iÓm kinh nghiÖm, kinh nghiÖm tèi ®a ng­¬i cã thÓ nhËn ®­îc lµ <color=yellow>1950000000<color>, hiÖn giê kinh nghiÖm cßn d­ <color=yellow>"..LeftExp.."<color> ®iÓm ch­a ®æi, nÕu cã kinh nghiÖm d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (B¹ch C©u Hoµn/§¹i B¹ch C©u Hoµn/B¹ch C©u Tiªn ®¬n) ®Ó ®æi kinh nghiÖm d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng B¹ch C©u Tiªn ®¬n ®æi "..GiveExp.." ®iÓm kinh nghiÖm")
end

function get_offline_liushen()
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	if floor(OfflineLiushenTime / 6) <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Lôc ThÇn Hoµn.", 0)
		return
	end
	
	local Liushen = min(EatLiushen(1, 0), OfflineLiushenTime)
	local Liushen1 = min(EatLiushen(2, 0), OfflineLiushenTime)
	local Liushen2 = min(EatLiushen(3, 0), OfflineLiushenTime)
	
	Say("Thêi gian Lôc ThÇn Hoµn cã thÓ quy ®æi lµ<color=yellow>"..GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME).." phót (dïng Lôc ThÇn Hoµn ®æi lÊy danh väng"..floor(OfflineLiushenTime/6)..", dïng C­êng Lôc ThÇn Hoµn ®æi lÊy 2 lÇn danh väng, Lôc ThÇn Tiªn ®¬n lµ 3 lÇn) <color><enter>Thêi gian ñy th¸c Lôc ThÇn Hoµn dïng ®Ó ®æi lµ <color=yellow>"..Liushen.." phót (danh väng:"..floor(Liushen / 6).." )<color><enter>Thêi gian ñy th¸c cña C­êng Lôc ThÇn Hoµn lµ <color=yellow>"..Liushen1.." phót (danh väng:"..floor(Liushen1 / 3).." )<color><enter>Thêi gian ñy th¸c cña Lôc ThÇn Tiªn ®¬n lµ <color=yellow>"..Liushen2.." phót (danh väng:"..floor(Liushen2 / 2).." )<color><enter>Thao t¸c ®æi sÏ khÊu trõ thêi gian ñy th¸c t­¬ng øng cña ng­¬i (nÕu ch­a ®æi xong, cã thÓ ®æi l¹i sau khi dïng Lôc ThÇn Hoµn/C­êng Lôc ThÇn Hoµn/Lôc ThÇn Tiªn ®¬n)",
		5,
		"Dïng thêi gian ñy th¸c Lôc ThÇn Hoµn ®Ó ®æi danh väng/#confirm_use_liushen(0)",
		"Dïng thêi gian ñy th¸c C­êng Lôc ThÇn Hoµn ®Ó ®æi danh väng/#confirm_use_liushen(1)",
		"Dïng thêi gian Lôc ThÇn Tiªn ®¬n ®Ó ®æi danh väng/#confirm_use_liushen(2)",
		"trë l¹i/offline_exchange_talk_main",
		"Rêi khái/no"
		)
end

function confirm_use_liushen(LiushenType)
	if LiushenType == 0 then
		Say("X¸c ®Þnh sö dông <color=yellow>Lôc ThÇn Hoµn<color> quy ®æi thµnh ®iÓm danh väng?", 3, "§ång ý/yes_get_offline_liushen", "trë l¹i/get_offline_liushen", "Rêi khái/no")
	elseif LiushenType == 1 then
		Say("X¸c ®Þnh sö dông <color=yellow>C­êng HiÖu Lôc ThÇn Hoµn<color> quy ®æi thµnh ®iÓm danh väng?", 3, "§ång ý/yes_get_offline_liushen1", "trë l¹i/get_offline_liushen", "Rêi khái/no")
	elseif LiushenType == 2 then
		Say("X¸c ®Þnh sö dông <color=yellow>Lôc ThÇn Tiªn §¬n<color> quy ®æi thµnh ®iÓm danh väng?", 3, "§ång ý/yes_get_offline_liushen2", "trë l¹i/get_offline_liushen", "Rêi khái/no")
	end
end

function yes_get_offline_liushen()
	local Liushen = EatLiushen(1, 0)
	if Liushen <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Lôc ThÇn Hoµn, kh«ng thÓ quy ®æi.", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("Danh väng cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 6, CalcTime)
	
	EatLiushen(1, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 6)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 6)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:0("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian Lôc ThÇn Hoµn quy ®æi thµnh c«ng <color=yellow>"..Reputation.."<color> ®iÓm danh väng, danh väng hiÖn giê lµ <color=yellow>"..GetReputation().."<color>, danh väng tèi ®a hiÖn giê cña ng­¬i lµ <color=yellow>"..LevelReputationLimit.."<color>, hiÖn giê kinh nghiÖm cßn d­ <color=yellow>"..LeftReputation.."<color> ®iÓm ch­a ®æi, nÕu cã danh väng d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (Lôc ThÇn Hoµn/C­êng Lôc ThÇn Hoµn/Lôc ThÇn Tiªn ®¬n) ®Ó ®æi danh väng d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng Lôc ThÇn Hoµn ®æi "..Reputation.." ®iÓm danh väng")
end

function yes_get_offline_liushen1()
	local Liushen = EatLiushen(2, 0)
	if Liushen <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian C­êng HiÖu Lôc ThÇn Hoµn, kh«ng thÓ quy ®æi.", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("Danh väng cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 3, CalcTime)
	
	EatLiushen(2, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 3)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 3)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:1("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian C­êng HiÖu Lôc ThÇn Hoµn quy ®æi thµnh c«ng <color=yellow>"..Reputation.."<color> ®iÓm danh väng, danh väng hiÖn giê lµ <color=yellow>"..GetReputation().."<color>, danh väng tèi ®a hiÖn giê cña ng­¬i lµ <color=yellow>"..LevelReputationLimit.."<color>, hiÖn giê kinh nghiÖm cßn d­ <color=yellow>"..LeftReputation.."<color> ®iÓm ch­a ®æi, nÕu cã danh väng d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (Lôc ThÇn Hoµn/C­êng Lôc ThÇn Hoµn/Lôc ThÇn Tiªn ®¬n) ®Ó ®æi danh väng d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng C­êng Lôc ThÇn Hoµn ®æi "..Reputation.." ®iÓm danh väng")
end

function yes_get_offline_liushen2()
	local Liushen = EatLiushen(3, 0)
	if Liushen <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Lôc ThÇn Tiªn §¬n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("Danh väng cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 2, CalcTime)
	
	EatLiushen(3, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 2)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 2)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:2("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian Lôc ThÇn Tiªn §¬n quy ®æi thµnh c«ng <color=yellow>"..Reputation.."<color> ®iÓm danh väng, danh väng hiÖn giê lµ <color=yellow>"..GetReputation().."<color>, danh väng tèi ®a hiÖn giê cña ng­¬i lµ <color=yellow>"..LevelReputationLimit.."<color>, hiÖn giê kinh nghiÖm cßn d­ <color=yellow>"..LeftReputation.."<color> ®iÓm ch­a ®æi, nÕu cã danh väng d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (Lôc ThÇn Hoµn/C­êng Lôc ThÇn Hoµn/Lôc ThÇn Tiªn ®¬n) ®Ó ®æi danh väng d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng Lôc ThÇn Tiªn §¬n ®æi "..Reputation.." ®iÓm danh väng")
end

function get_offline_sanqing()
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	if floor(OfflineSanqingTime / 20) <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Tam Thanh Hoµn.", 0)
		return
	end
	
	local Sanqing = min(EatSanqin(1, 0), OfflineSanqingTime)
	local Sanqing1 = min(EatSanqin(2, 0), OfflineSanqingTime)
	local Sanqing2 = min(EatSanqin(3, 0), OfflineSanqingTime)
	
	Say("Thêi gian Tam Thanh Hoµn cã thÓ quy ®æi hiÖn cã lµ <color=yellow>"..GetTask(TASKVAL_SANQING_OFFLINE_TIME).." phót (dïng Tam Thanh Hoµn ®æi ®é cèng hiÕn s­ m«n"..floor(OfflineSanqingTime/20)..", C­êng Tam Thanh lµ gÊp ®«i, Tam Thanh Tiªn ®¬n lµ gÊp 3) <color><enter>Thêi gian ñy th¸c Tam Thanh Hoµn dïng ®Ó ®æi lµ <color=yellow>"..Sanqing.." phót (®é cèng hiÕn s­ m«n: "..floor(Sanqing / 20).." )<color><enter>Thêi gian ñy th¸c C­êng Tam Thanh Hoµn lµ <color=yellow>"..Sanqing1.." phót (®é cèng hiÕn s­ m«n: "..floor(Sanqing1 / 10).." )<color><enter>Thêi gian ñy th¸c Tam Thanh Tiªn ®¬n lµ <color=yellow>"..Sanqing2.." phót (®é cèng hiÕn s­ m«n: "..floor(Sanqing2 * 3 / 20).." )<color><enter>Thao t¸c ®æi sÏ khÊu trõ thêi gian ñy th¸c t­¬ng øng cña ng­¬i (nÕu ch­a ®æi xong, cã thÓ ®æi l¹i sau khi dïng Tam Thanh Hoµn/C­êng Tam Thanh Hoµn/Tam Thanh Tiªn ®¬n)",
		5,
		"Dïng thêi gian ñy th¸c Tam Thanh Hoµn ®Ó ®æi ®é cèng hiÕn s­ m«n/#confirm_use_sanqing(0)",
		"Dïng thêi gian ñy th¸c C­êng Tam Thanh Hoµn ®Ó ®æi ®é cèng hiÕn s­ m«n/#confirm_use_sanqing(1)",
		"Dïng thêi gian ñy th¸c Tam Thanh Tiªn ®¬n ®Ó ®æi ®é cèng hiÕn s­ m«n/#confirm_use_sanqing(2)",
		"trë l¹i/offline_exchange_talk_main",
		"Rêi khái/no"
		)
end

function confirm_use_sanqing(SanqingType)
	if SanqingType == 0 then
		Say("X¸c ®Þnh sö dông <color=yellow>Tam Thanh Hoµn<color> ®æi ®iÓm Cèng HiÕn S­ M«n?", 3, "§ång ý/yes_get_offline_sanqing", "trë l¹i/get_offline_sanqing", "Rêi khái/no")
	elseif SanqingType == 1 then
		Say("X¸c ®Þnh sö dông <color=yellow>C­êng HiÖu Tam Thanh Hoµn<color> ®æi ®iÓm Cèng HiÕn S­ M«n?", 3, "§ång ý/yes_get_offline_sanqing1", "trë l¹i/get_offline_sanqing", "Rêi khái/no")
	elseif SanqingType == 2 then
		Say("X¸c ®Þnh sö dông <color=yellow>Tam Thanh Tiªn §¬n<color> ®æi ®iÓm Cèng HiÕn S­ M«n?", 3, "§ång ý/yes_get_offline_sanqing2", "trë l¹i/get_offline_sanqing", "Rêi khái/no")
	end
end

function yes_get_offline_sanqing()
	local Sanqing = EatSanqin(1, 0)
	if Sanqing <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Tam Thanh Hoµn, kh«ng thÓ quy ®æi.", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("§iÓm Cèng HiÕn S­ M«n cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(GainLimit * 20, CalcTime)
	
	EatSanqin(1, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime / 20)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) / 20)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:0("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian Tam Thanh Hoµn quy ®æi thµnh c«ng <color=yellow>"..FactionReputation.."<color> ®iÓm ®é cèng hiÕn s­ m«n, ®é cèng hiÕn s­ m«n hiÖn t¹i lµ <color=yellow>"..GetTask(336).."<color>, ®é cèng hiÕn s­ m«n tèi ®a hiÖn t¹i lµ <color=yellow>"..FactionReputationLimit.."<color>, hiÖn giê ®é cèng hiÕn s­ m«n cßn d­ <color=yellow>"..LeftReputation.."<color> ®iÓm ch­a ®æi, nÕu cã ®é cèng hiÕn s­ m«n d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (Tam Thanh Hoµn/C­êng Tam Thanh Hoµn/Tam Thanh Tiªn ®¬n) ®Ó ®æi danh väng d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng Tam Thanh Hoµn ®æi "..FactionReputation.." ®iÓm cèng hiÕn S­ M«n ")
end

function yes_get_offline_sanqing1()
	local Sanqing = EatSanqin(2, 0)
	if Sanqing <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian C­êng HiÖu Tam Thanh Hoµn, kh«ng thÓ quy ®æi.", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("§iÓm Cèng HiÕn S­ M«n cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(GainLimit * 10, CalcTime)
	
	EatSanqin(2, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime / 10)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) / 10)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:1("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian C­êng HiÖu Tam Thanh Hoµn quy ®æi thµnh c«ng <color=yellow>"..FactionReputation.."<color> ®iÓm ®é cèng hiÕn s­ m«n, ®é cèng hiÕn s­ m«n hiÖn t¹i lµ <color=yellow>"..GetTask(336).."<color>, ®é cèng hiÕn s­ m«n tèi ®a hiÖn t¹i lµ <color=yellow>"..FactionReputationLimit.."<color>, hiÖn giê ®é cèng hiÕn s­ m«n cßn d­ <color=yellow>"..LeftReputation.."<color> ®iÓm ch­a ®æi, nÕu cã ®é cèng hiÕn s­ m«n d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (Tam Thanh Hoµn/C­êng Tam Thanh Hoµn/Tam Thanh Tiªn ®¬n) ®Ó ®æi danh väng d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng C­êng Tam Thanh Hoµn ®æi "..FactionReputation.." ®iÓm cèng hiÕn S­ M«n ")
end

function yes_get_offline_sanqing2()
	local Sanqing = EatSanqin(3, 0)
	if Sanqing <= 0 then
		Say("C¸c h¹ kh«ng ®ñ thêi gian Tam Thanh Tiªn §¬n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("§iÓm Cèng HiÕn S­ M«n cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ quy ®æi.", 0)
		return
	end
	
	local ActualTime = min(floor(GainLimit * 20 / 3), CalcTime)
	
	EatSanqin(3, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime * 3 / 20)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) * 3 / 20)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:2("..ActualTime..")")
	Say("C¸c h¹ ®· dïng thêi gian Tam Thanh Tiªn §¬n quy ®æi thµnh c«ng <color=yellow>"..FactionReputation.."<color> ®iÓm ®é cèng hiÕn s­ m«n, ®é cèng hiÕn s­ m«n hiÖn t¹i lµ <color=yellow>"..GetTask(336).."<color>, ®é cèng hiÕn s­ m«n tèi ®a hiÖn t¹i lµ <color=yellow>"..FactionReputationLimit.."<color>, hiÖn giê ®é cèng hiÕn s­ m«n cßn d­ <color=yellow>"..LeftReputation.."<color> ®iÓm ch­a ®æi, nÕu cã ®é cèng hiÕn s­ m«n d­ nh­ng ch­a ®¹t tèi ®a, ng­¬i cã thÓ dïng l¹i (Tam Thanh Hoµn/C­êng Tam Thanh Hoµn/Tam Thanh Tiªn ®¬n) ®Ó ®æi danh väng d­, sè lÇn kh«ng giíi h¹n.", 0)
	Msg2Player("Ng­¬i dïng C­êng Tam Thanh Tiªn §¬n ®æi "..FactionReputation.." ®iÓm cèng hiÕn S­ M«n ")
end

function no()
end



