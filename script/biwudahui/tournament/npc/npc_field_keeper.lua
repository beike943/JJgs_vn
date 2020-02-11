--Create date:2008-1-9 17:37
--Author:yanjun
--Description:³¡µØ¿´ÊØÈË½Å±¾
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>ThÇn Vâ ViÖn T­ NghiÖp<color>:";

function main()
	local selTab = {
--				"ÎÒÏë¿´¿´Ã¿¸öÀŞÌ¨ÊÇÄÄĞ©ÈËÔÚ½ÏÒÕ/know_matches",
				"Ta muèn thiÕt lËp l¹i ®iÓm sè tû vâ/reset_point",
				"Ta muèn rêi khái n¬i nµy/leave",
				"Kh«ng cã g×/nothing",
				}
--	if GetMaskStatus() == 0 then
--		tinsert(selTab,1,"ÎÒÒªÄäÃû/#hide_name(1)");
--	else
--		tinsert(selTab,1,"ÎÒÒªÏÔÊ¾Ãû×Ö/#hide_name(0)");
--	end;
	Say(g_szInfoHead.."Sau khi hoµn thµnh tû vâ, ng­êi ch¬i ph¶i quay vÒ server hiÖn t¹i míi ®­îc hÖ thèng ®¨ng kı tİch ®iÓm",getn(selTab),selTab);
end;

function know_matches()
	local selTab = {
				"Ta muèn xem L«i ®µi h­íng ®«ng/#list_matches(1)",
				"Ta muèn xem L«i ®µi h­íng nam/#list_matches(2)",
				"Ta muèn xem L«i ®µi h­íng t©y/#list_matches(3)",
				"Ta muèn xem L«i ®µi h­íng b¾c/#list_matches(4)",
				"Kh«ng cã g×/nothing",
				}
	Say(g_szInfoHead.."Ng­¬i muèn xem L«i ®µi nµo?",getn(selTab),selTab);
end;

function list_matches(nDirection)
	local nPIdx1,nPIdx2 = 0,0;
	local nState = 0;
	local szString = "";
	local nCityID = 0;
	local nCurMapID = GetWorldPos();
	for i,v in TB_MAPID do
		if v[1] == nCurMapID then
			nCityID = i;
			break;
		end;
	end;
	local szStr = "";
	local szName1,szName2 = "","";
	for i=1,8 do
		nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
		if bAllow == 1 then
			szStr = ", cho phĞp xem ";
		else
			szStr = ", kh«ng cho phĞp xem ";
		end;
		if nPIdx1 == 0 then
			szString = szString.."khu vùc "..i..": hiÖn t¹i kh«ng cã ng­êi tØ vâ\n";
		elseif nState <= MS_STATE_READY then
			szString = szString.."khu vùc "..i..": hiÖn t¹i ®ang trong giai ®o¹n chuÈn bŞ tû vâ "..szStr.."\n";
		else
			szName1,szName2 = BWT_GetName(nPIdx1),BWT_GetName(nPIdx2);
			szString = szString.."khu vùc "..i..": hai bªn lµ ["..szName1.."] vµ ["..szName2.."]"..szStr.."\n";
		end;
	end;
	local tbDirection = {"H­íng ®«ng","H­íng nam","H­íng T©y","H­íng B¾c"};
	Talk(1,"know_matches",g_szInfoHead..tbDirection[nDirection].."T×nh h×nh tû vâ:\n"..szString);
end;

function leave()
	if BWDH_DEBUG_VERSION == 1 then
		BWDH_Change_Map(200,1392,2817);
	else
		local selTab = {
					--"ÈªÖİ/#leave_confirm(100)",
					"BiÖn Kinh/#leave_confirm(200)",
					--"³É¶¼/#leave_confirm(300)",
					"T¹m thêi kh«ng rêi khái/nothing",
					}
		Say(g_szInfoHead.."Ng­¬i muèn ®i ®©u?",getn(selTab),selTab);
	end;
end;

function leave_confirm(nCityID)
	GLB_BW_LEAVE(nCityID);
end;

function hide_name(nType)
	UseMask(nType,0);
end;

function reset_point()
--	local selTab = {
--		"ÖØÖÃ·ÖÊı(Çå¿Õ±¾ÖÜÊ¤¸º³¡´Î)£¬ĞèÒª100åĞÒ£Óñ /reset_point_1",
--		"ÖØÖÃ·ÖÊı(²»Çå¿Õ±¾ÖÜÊ¤¸º³¡)£¬ĞèÒª300åĞÒ£Óñ /reset_point_2",
--		"ÖØÖÃ·ÖÊı(ÖÃ»ØÉÏÖÜµÇ¼Ç·ÖÊı)£¬ĞèÒª500åĞÒ£Óñ /reset_point_3",
--		"Ã»Ê²Ã´ÊÂ/nothing",
--	}
--	Say(g_szInfoHead.."È«ĞÂµÄÖØÖÃ±ÈÎä·ÖÊı·şÎñ¿ÉÒÔ°ïÄã°Ñ·ÖÊıÖØÖÃµ½Ò»¸ö½Ï¸ß·ÖÊı¶Î£¬ÈÃÄã¿ÉÒÔÖ±½ÓÓöµ½¸üÇ¿´óµÄ¶ÔÊÖ£¬×¼±¸ºÃ£¬½ÓÊÜ¸ß·Ö¶ÎÇ¿ÕßµÄÌôÕ½Ã»£¿",getn(selTab),selTab);
end

function reset_point_1(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--		local selTab = {
--			"ÎÒÒªÖØÖÃ£¬ĞèÒª100åĞÒ£Óñ /#reset_point_1(1)",
--			"·µ»Ø /main",
--			"½áÊø¶Ô»° /nothing",
--		};
--		Say(g_szInfoHead.."¸Ã·şÎñ»á½«ÄãµÄ±ÈÎä·ÖÊıÖ±½ÓÖØÖÃµ½320·Ö£¬µ«»áÇå¿ÕÄã±¾ÖÜµÄÊ¤¸º³¡´Î£¬²¢½«Äã´«»Ø±¾·ş¡£<color=yellow>ÄãĞèÒª»Øµ½¿ç·şÖØĞÂÔÙ½øĞĞ10³¡ÒÔÉÏµÄ±ÈÎä²ÅÄÜÖØĞÂµÇ¼Ç·ÖÊı¡£<color>",getn(selTab),selTab);
--		return
--	end
--
--	if 1 == PayXYY(100) then
--		GLB_BW_SetTask(0,3);--Í¬²½åĞÒ£Óñ
--		BWDH_SetTask(TSK_CURREALRESULT,	320);
--		BWDH_SetTask(TSK_CURWEEKMATCH,	0);
--		BWDH_SetTask(TSK_CURWEEKWIN,		0);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		GLB_BW_LEAVE(200);
--	end

end

function reset_point_2(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--	local selTab = {
--			"ÎÒÒªÖØÖÃ£¬ĞèÒª300åĞÒ£Óñ /#reset_point_2(1)",
--			"·µ»Ø /main",
--			"½áÊø¶Ô»° /nothing",
--		};
--		Say(g_szInfoHead.."¸Ã·şÎñ»á½«ÄãµÄ±ÈÎä·ÖÊıÖ±½ÓÖØÖÃµ½320-350·Ö£¨Ëæ»ú£©£¬»áÔö¼ÓÄã±¾ÖÜµÄÊ¤¸º³¡´Î¸÷5³¡£¬²¢µÇ¼ÇÄãµÄ±ÈÎä»ı·Ö£¬½«Äã´«»Ø±¾·ş¡£",getn(selTab),selTab);
--		return
--	end
--
--	if 1 == PayXYY(300) then
--		GLB_BW_SetTask(0,3);--Í¬²½åĞÒ£Óñ
--		BWDH_SetTask(TSK_CURREALRESULT,	320 + random(0, 30));
--		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
--		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
--		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		SignUpGestResult();
--		GLB_BW_LEAVE(200);
--	end

end

function reset_point_3(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--	local selTab = {
--			"ÎÒÒªÖØÖÃ£¬ĞèÒª500åĞÒ£Óñ /#reset_point_3(1)",
--			"·µ»Ø /main",
--			"½áÊø¶Ô»° /nothing",
--		};
--		Say(g_szInfoHead.."¸Ã·şÎñ»á½«ÄãµÄ±ÈÎä·ÖÊıÖ±½ÓÖØÖÃµ½ÉÏÖÜµÄ±ÈÎäµÇ¼Ç·ÖÊı£¬»áÔö¼ÓÄã±¾ÖÜµÄÊ¤¸º³¡´Î¸÷5³¡£¬²¢µÇ¼ÇÄãµÄ±ÈÎä»ı·Ö£¬½«Äã´«»Ø±¾·ş¡£ÄãÖ»ÄÜÔÚ±¾ÖÜ²Î¼Ó¹ı10³¡±ÈÎäÇ°²Å¿ÉÉêÇëÊ¹ÓÃ¸Ã·şÎñ£¬Èç¹ûÄã±¾ÖÜÒÑ×Ô¶¯µÇ¼ÇÁË±ÈÎä»ı·Ö£¬½«²»ÄÜÊ¹ÓÃ¸Ã·şÎñ¡£",getn(selTab),selTab);
--		return
--	end
--
--	if 10 <= GetTask(TSK_CURWEEKMATCH) then
--		Talk(1, "", "±¾ÖÜÄãÒÑ¾­±ÈÂú10³¡£¬²»ÄÜÊ¹ÓÃ¸Ã·şÎñ¡£");
--		return
--	end
--
--	if 1 == PayXYY(500) then
--		GLB_BW_SetTask(0,3);--Í¬²½åĞÒ£Óñ
--		BWDH_SetTask(TSK_CURREALRESULT,	GetTask(TSK_CURSIGNEDRESULT));
--		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
--		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		SignUpGestResult();
--		GLB_BW_LEAVE(200);
--	end

end

