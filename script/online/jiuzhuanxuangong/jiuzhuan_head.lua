--¾Å×ªĞş¹¦ÏµÍ³
--by vivi
--2008/10/10

--ÈÎÎñ±äÁ¿
TASK_XUANGONG_TELL = 1040;   --ÌáÊ¾¾Å×ªĞş¹¦ÏµÍ³
TASK_XUANGONG_NUM = 1041;    --ĞŞÁ¶¾Å×ªĞş¹¦µÄ´ÎÊı
TASK_XUANGONG_WEEK = 1042;   --Ã¿ÖÜ»»Ò»´Î

--È«¾Ö±äÁ¿
XUANGONG_QIANNENG = 5;      --Ò»´Î»»È¡µÄÇ±ÄÜµã
XUAnGONG_TOTAL_NUM = 10;    --ĞŞÁ¶µÄ´ÎÊıÉÏÏŞ 
XUANGONG_EXP = 2000000000;  --Ò»´ÎĞèÒªÏûºÄµÄ¾­ÑéÖµ

function main()
	local nLv = GetLevel();
	if nLv ~= 99 then
		Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: Ta cã thÓ d¹y ng­¬i Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng, c«ng phu nµy mçi lÇn tu thµnh, cã thÓ t¨ng 5 ®iÓm tiÒm n¨ng. Nh­ng lo¹i thÇn c«ng nµy kh«ng dÔ häc, tr­íc tiªn ph¶i ®¹t ®Õn cÊp 99 c¶nh giíi thiªn viªn m·n míi cã thÓ tu thµnh, ngoµi ra cßn cÇn quyÓn Th¸i DŞch Hçn Nguyªn Phæ, ng­¬i mau luyÖn ®Õn cÊp 99 råi h½n ®Õn t×m ta!");
		return
	else	
		SetTask(TASK_XUANGONG_TELL,1);
		Say("<color=green>Tr­ëng l·o Vâ L©m<color>: Kh«ng ngê ng­¬i ®· ®¹t ®Õn tr×nh ®é nµy, ®­îc, ta sÏ truyÒn d¹y cho ng­¬i Tiªn ThiªnTh¸i DŞch Hçn Nguyªn C«ng cña vâ l©m, thÇn c«ng nµy cÇn cã <color=yellow>2 tû kinh nghiÖm<color> vµ <color=yellow>1 quyÓn Th¸i DŞch Hçn Nguyªn Phæ<color> míi cã thÓ luyÖn, mçi lÇn tu thµnh cã thÓ t¨ng 5 ®iÓm tiÒm n¨ng. Víi t­ chÊt cña ng­¬i cã thÓ luyÖn <color=yellow>10 lÇn<color>, hiÖn giê ng­¬i ®· luyÖn ®­îc <color=yellow>"..GetTask(TASK_XUANGONG_NUM).."<color> lÇn. Mçi tuÇn chØ cã thÓ luyÖn <color=yellow>1 lÇn<color>. (sè lÇn luyÖn thÇn c«ng nµy sÏ ¶nh h­ëng ®Õn xÕp h¹ng cña nh©n vËt, luyÖn 1 lÇn t­¬ng ®­¬ng 2 tû kinh nghiÖm)",
				2,
				"\nTa muèn luyÖn Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng (mÊt 2 tû kinh nghiÖm)/xiulian_wugong",
				"\nT¹m thêi ch­a muèn luyÖn/nothing")
	end
end

function nothing()

end

function xiulian_wugong()
	local nNum = GetTask(TASK_XUANGONG_NUM);
	local nWeek = GetWeekSequence(1,0);
	if nNum >= 10 then
		Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: T­ chÊt hiÖn giê cña ng­¬i chØ cã thÓ luyÖn <color=yellow>10 lÇn<color>, ng­¬i ®· luyÖn 10 lÇn.");
		return
	end
	if GetTask(TASK_XUANGONG_WEEK) == nWeek then
		Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: Mçi tuÇn chØ cã thÓ luyÖn 1 lÇn, tuÇn nµy ng­¬i ®· luyÖn råi.");
		return
	end
	Say("<color=green>Tr­ëng l·o Vâ L©m<color>: Muèn luyÖn thÇn c«ng nµy <color=yeloow>cÇn cã 2 tû kinh nghiÖm vµ 1 quyÓn Th¸i DŞch Hçn Nguyªn Phæ<color>, ta cã Th¸i DŞch Hçn Nguyªn Phæ t×m ®­îc ë T©y B¾c <color=yellow>Mª cung sa m¹c<color>, nh­ng chØ cã thÓ gióp ng­¬i 1 lÇn, lÇn sau ng­¬i tù t×m lÊy. §©y lµ lÇn thø <color=yellow>"..(nNum+1).."<color> ng­¬i luyÖn thÇn c«ng nµy!",
		2,
		"\nTa muèn b¾t ®Çu luyÖn/confirm_xiulian",
		"\nT¹m thêi ch­a muèn luyÖn/nothing")
end

function confirm_xiulian()
	local nExp = GetExp();
	local nNum = GetTask(TASK_XUANGONG_NUM);
	local nWeek = GetWeekSequence(1,0);
	if nNum >= 10 then
		Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: T­ chÊt hiÖn giê cña ng­¬i chØ cã thÓ luyÖn <color=yellow>10 lÇn<color>, ng­¬i ®· luyÖn 10 lÇn.");
		return
	end	
	if nExp < XUANGONG_EXP then
		Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: LuyÖn Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng cÇn <color=yellow>2 tû kinh nghiÖm<color>, kinh nghiÖm cña ng­¬i kh«ng ®ñ.");
		return
	end
	if GetTask(TASK_XUANGONG_WEEK) == nWeek then
		Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: Mçi tuÇn chØ cã thÓ luyÖn 1 lÇn, tuÇn nµy ng­¬i ®· luyÖn råi.");
		return
	end	
	if nNum >= 1 then  --µÚÒ»´Î²»ÓÃ
 		if GetItemCount(2,0,1083) < 1 then
			Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: LuyÖn Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng cÇn cã <color=yellow>quyÓn Th¸i DŞch Hçn Nguyªn Phæ<color>, hiÖn giê ng­¬i kh«ng cã.");
			return
		end
	end
	if nNum >= 1 then		--µÚÒ»´Î²»ÓÃ
		if DelItem(2,0,1083,1) ~= 1 then
			return
		end
	end
	SetTask(TASK_XUANGONG_NUM,nNum+1);
	SetTask(TASK_XUANGONG_WEEK,nWeek);
	ModifyExp(-XUANGONG_EXP);
	AddProp(XUANGONG_QIANNENG);
	Talk(1,"","<color=green>Tr­ëng l·o Vâ L©m<color>: Chóc mõng ng­¬i ®· luyÖn thµnh c«ng Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng, t¨ng "..XUANGONG_QIANNENG.." ®iÓm tiÒm n¨ng.");	 
	Msg2Global("§¹i hiÖp"..GetName().."§­îc sù chØ dÉn cña Tr­ëng l·o Vâ L©m, ®· luyÖn ®Õn c¶nh giíi Tiªn Thiªn, nhËn ®­îc ®iÓm tiÒm n¨ng, luyÖn thµnh c«ng Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng!");
	WriteLog("Ng­êi ch¬i"..GetName().."§· luyÖn 1 lÇn Tiªn Thiªn Th¸i DŞch Hçn Nguyªn C«ng.");
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--¼ÆËãÖÜµÄĞòÊı
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--´¦ÀíÊ±²î
	nCurTime = nCurTime - 4*24*3600;	--¶ÔÆëµ½1970Äê1ÔÂ1ÈÕ£¨ĞÇÆÚËÄ£©ºóµÄµÚÒ»¸öÖÜÒ»Áè³¿¡£
	local nWeekSecond = 7*24*3600;	--Ò»ÖÜ¶àÉÙÃë
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--¼ÆËãÆ«ÒÆÊ±¼ä
	local nTotalTime = nCurTime - nOffset;	--¼ÆËãºóµÄ×ÜÊ±¼ä
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--¼ÆËãÖÜµÄĞòÊı
	return nWeekSeq;
end;