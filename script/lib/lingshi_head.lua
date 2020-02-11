--°ÑÓëÁéÊ¯¡¢ÁéÊ¯Åä·½ÅäÖÃÎÄ¼şÎŞ¹ØµÄÄÚÈİÒÆµ½ÕâÀï¡£
--Ö÷ÒªÊÇ¿¼ÂÇµ½ÁéÊ¯Õâ¸ö¶«Î÷»á±»´ó·¶Î§ÓÃµ½£¬
--Èç¹û½ö½öÊÇ²Ù×÷Ò»ÏÂÈÎÎñ±äÁ¿Ò²Òª°ÑÅäÖÃÎÄ¼ş¶Á½øÀ´ÄÇ¾ÍÌ«ÀË·ÑÄÚ´æÁË
--ËùÒÔlspf_AddLingShiInBottleºÍlspf_AddPeiFangInBottle±»Ğ´µ½ÕâÀïÀ´ÁË

--´æ´¢ÁéÊ¯ÈÎÎñ±äÁ¿
SYS_TSK_LINGSHI_ONE = 2321;   --1¼¶ÁéÊ¯µÄÊıÁ¿
SYS_TSK_LINGSHI_TWO = 2322;
SYS_TSK_LINGSHI_THREE = 2323;
SYS_TSK_LINGSHI_FOUR = 2324;
SYS_TSK_LINGSHI_FIVE = 2325;
SYS_TSK_LINGSHI_SIX = 2326;
SYS_TSK_LINGSHI_SEVEN = 2327;  --7¼¶ÁéÊ¯µÄÊıÁ¿

--´æ´¢ÁéÊ¯Åä·½ÈÎÎñ±äÁ¿
SYS_TSK_PEIFANG_ONE = 2328;   --1¼¶Åä·½µÄÊıÁ¿
SYS_TSK_PEIFANG_TWO = 2329;
SYS_TSK_PEIFANG_THREE = 2330;
SYS_TSK_PEIFANG_FOUR = 2331;
SYS_TSK_PEIFANG_FIVE = 2332;
SYS_TSK_PEIFANG_SIX = 2333;
SYS_TSK_PEIFANG_SEVEN = 2334;  --7¼¶Åä·½µÄÊıÁ¿

--°ÑÁéÊ¯¼ÓÈë¾ÛÁé¶¦
function lspf_AddLingShiInBottle(nLevel,nCount)
	SetTask(SYS_TSK_LINGSHI_ONE+nLevel-1,GetTask(SYS_TSK_LINGSHI_ONE+nLevel-1)+nCount);
end;
--°ÑÅä·½¼ÓÈë¾ÛÁé¶¦
function lspf_AddPeiFangInBottle(nLevel,nCount)
	SetTask(SYS_TSK_PEIFANG_ONE+nLevel-1,GetTask(SYS_TSK_PEIFANG_ONE+nLevel-1)+nCount);
end;

function lspf_AddLingShiInBottleEx(nLevel, nCount)
	lspf_AddLingShiInBottle(nLevel, nCount);
	Msg2Player(format("%s nhËn ®­îc %d viªn cÊp %d  Linh Th¹ch, ®· cho vµo Tô Linh §Ønh","C¸c h¹…", nCount, nLevel));
	WriteLog(format("%s Get %d Level %d LingShi", GetName(), nCount, nLevel));
end

function lspf_AddTaiShiLingShiInBottleEx(nLevel, nCount)
	if 1 == lspf_AddTaiShiLingShiInBottle(nLevel, nCount) then
		Msg2Player(format("%s nhËn ®­îc %d viªn cÊp %d Th¸i Thñy Linh Th¹ch, ®· cho vµo Tô Linh §Ønh","C¸c h¹…", nCount, nLevel));
		WriteLog(format("%s Get %d Level %d TaiShiLingShi", GetName(), nCount, nLevel));
	end
end

--function lspf_AddPeiFangInBottleEx(nLevel,nCount)
--	lspf_AddPeiFangInBottle(nLevel,nCount);
--	Msg2Player("Äã»ñµÃ"..nCount.."ÕÅ"..nLevel.."¼¶ÁéÊ¯Åä·½, ÒÑ·ÅÈë¾ÛÁé¶¦");
--	WriteLog(GetName().."»ñµÃ"..nCount.."ÕÅ"..nLevel.."¼¶ÁéÊ¯Åä·½, ÒÑ·ÅÈë¾ÛÁé¶¦");
--end;
