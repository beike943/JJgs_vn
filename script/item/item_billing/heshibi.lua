------------------------------------------------------------
-- ´ó°ü°×ÔÆÉ¢µÄ½Å±¾ dabaobaiyunsan.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸ö°×ÔÆÉ¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,486
-- °×ÔÆÉ¢ID: 1,0,4
------------------------------------------------------------
TSK_USE_PLB_DATE = 596
TSK_USE_HSB_DATE = 597
TSK_USE_PLB = 598
TSK_USE_HSB = 599

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("B¹n cã muèn lÊy <color=yellow>Hßa ThÞ BÝch<color> ®æi thµnh tiÒn game kh«ng? Cã thÓ ®æi ®­îc <color=yellow>2000<color>.",
		2,
		"§­îc/open_panlongbi",
		"T¹m thêi kh«ng më/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function open_panlongbi()
	local nDate = tonumber(date("%Y%m%d"));
	local nLimitTime = get_limit_time();
	if GetTask(TSK_USE_HSB_DATE) < nDate then
		SetTask(TSK_USE_HSB,0);
	end;
	if nLimitTime == -1 then
		Talk(1,"","§¼ng cÊp qu¸ thÊp, kh«ng thÓ dïng Hßa ThÞ BÝch. CÊp 50 trë lªn míi cã thÓ dïng Hßa ThÞ BÝch. ");
		return 0;
	end; 
	local nCurUseTime = GetTask(TSK_USE_HSB);
	if nCurUseTime >= nLimitTime and nLimitTime ~= 0 then
		Talk(1,"","Dùa vµo ®¼ng cÊp hiÖn t¹i, h«m nay b¹n chØ cã thÓ dïng <color=yellow>"..nLimitTime.."<color> Hßa ThÞ BÝch.");
		return 0;
	end;
	if (DelItem(2, 1, 1001, 1) == 1) then
		Earn(20000000);
		SetTask(TSK_USE_HSB_DATE,nDate);
		SetTask(TSK_USE_HSB,nCurUseTime+1);
		if nLimitTime == 0 then
			Say("B¹n nhËn ®­îc <color=yellow>2000 tiÒn game<color>!",0);
		else
			Say("B¹n nhËn ®­îc <color=yellow>2000 tiÒn game<color>! H«m nay b¹n ®· dïng Hßa ThÞ BÝch lÇn thø <color=yellow>"..(nCurUseTime+1).."<color>. Dùa vµo ®¼ng cÊp hiÖn t¹i, h«m nay b¹n cã thÓ dïng <color=yellow>"..nLimitTime.."<color> Hßa ThÞ BÝch.", 0)
			Msg2Player("H«m nay b¹n ®øng thø"..(nCurUseTime+1).." lÇn");
		end;
		WriteLog("[Hßa ThÞ BÝch]:"..GetName().."H«m ®ã lÇn "..(nCurUseTime+1).." lÇn");
	else
		Say("Ng­¬i kh«ng hÒ cã <color=yellow>Hßa ThÞ BÝch<color>", 0)
	end
end;

function get_limit_time()
	local nLevel = GetLevel();
	local nLimitTime = 0;
	if nLevel <= 50 then
		nLimitTime = -1;
	elseif nLevel <= 75 then
		nLimitTime = 1;
	else
		nLimitTime = 0;
	end;
	return nLimitTime;
end;

