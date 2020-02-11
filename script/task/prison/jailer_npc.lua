--author:yanjun
--date:06-12-13
--describe:Óü×ä½Å±¾
Include("\\script\\task\\prison\\jail_head.lua");
g_NpcName = " Ngôc tèt"
function main()
	local selTab = {};
	local sString = "";
	if GetPKValue() > 0 then
		tinsert(selTab,"Xem ra ph¶i hèi lé th«i!/want_bail");
	else
		tinsert(selTab,"Ta ®Õn th¨m b»ng h÷u, mau ®­a ta ®i/#go_outside(2)");
	end;
	tinsert(selTab,"Kh«ng cã g×/nothing");
	Say("<color=green>"..g_NpcName.."<color>: §i hay ë, ng­¬i quyÕt ®Şnh ®i.",getn(selTab),selTab);
end;

function want_bail()
	local selTab = {
				"§ång ı/#go_outside(1)",
				"Hñy bá/nothing",
				}
	Say("<color=green>"..g_NpcName.."<color>: Hèi lé cÇn <color=yellow>10 tiÒn vµng<color>, cã tiÒn kh«ng?",getn(selTab),selTab);
end;

function go_outside(nType)
	CleanInteractive();
	if nType == 1 then	--±£ÊÍ
		if Pay(100000) == 1 then
			if NewWorld(tJailOutPoint[1],tJailOutPoint[2],tJailOutPoint[3],100) == 1 then	--701µØÍ¼¶ÔNewWorld×÷ÁËÏŞÖÆ£¬ÒªÌîµÚËÄ²ÎÊı¡£È¨ÏŞÉèÖÃ²Î¿´\GameSvr\maps\god_power.iniÅäÖÃÎÄ¼ş
				UseScrollEnable(1);	--ÔÊĞíÊ¹ÓÃ»Ø³Ç
				local nPKValue = GetPKValue();
				SetZoomPKValue(nPKValue*36000);
				SetCanRestorePK(0);	--²»ÄÜÏûPKÖµ
				ForbidRead(0)	--ÄÜĞŞÊé
			else	
				Earn(100000)
			end;
		else
			Talk(1,"","<color=green>"..g_NpcName.."<color>: Kh«ng tiÒn mµ còng ®ßi qua ¶i µ? Lµm mÊt thêi gian cña ta qu¸!");
		end;
	elseif nType == 2 then	--Ì½¼àÀë¿ªµÄ
		if NewWorld(tJailOutPoint[1],tJailOutPoint[2],tJailOutPoint[3],100) == 1 then	--701µØÍ¼¶ÔNewWorld×÷ÁËÏŞÖÆ£¬ÒªÌîµÚËÄ²ÎÊı¡£È¨ÏŞÉèÖÃ²Î¿´\GameSvr\maps\god_power.iniÅäÖÃÎÄ¼ş
			ForbidRead(0)	--ÄÜĞŞÊé
			UseScrollEnable(1);	--ÔÊĞíÊ¹ÓÃ»Ø³Ç
		end;
	end;
end;