Include("\\script\\online\\qixi08\\star\\function.lua");

function aoyun_star_main()
	local nLevel = GetLevel()
	if nLevel <= 10 then
		Talk(1,"",g_szInfoHead.."§¼ng cÊp cña b¹n qu¸ thÊp, xin h·y luyÖn ®Õn cÊp <color=yellow>11<color> råi h·y ®Õn t×m ta.");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	local nYear1,nMonth1,nDay1 = QX08_GetDate(g_nQiXiBeginDate);
	local nYear2,nMonth2,nDay2 = QX08_GetDate(g_nQiXiEndDate);
	if nDate < g_nQiXiBeginDate then
		Talk(1,"",g_szInfoHead.."Thêi gian ho¹t ®éng <color=yellow>"..nYear1.."niªn"..nMonth1.."NguyÖt"..nDay1.." ®Õn "..nYear2.."niªn"..nMonth2.."NguyÖt"..nDay2.."<color>, vÞ thiÕu hiÖp nµy ®Õn lóc nhí ghÐ l¹i xem.");
		return 0;
	end;
	if nDate > g_nQiXiEndDate then
		Talk(1,"",g_szInfoHead.."Thêi gian lÇn ho¹t ®éng nµy lµ <color=yellow>"..nYear1.."niªn"..nMonth1.."NguyÖt"..nDay1.." ®Õn "..nYear2.."niªn"..nMonth2.."NguyÖt"..nDay2.."<color>, hiÖn ®· qu¸ thêi gian ho¹t ®éng, xin lÇn sau quay l¹i.");
		return 0;
	end;
	local selTab = {
				"Ta muèn nhËn 1 tÊm 'Tinh Tinh §Þa §å'/aoyun_star_get_star_map",
				"Ta muèn hîp thµnh 1 Tinh Tinh Chi V­¬ng/aoyun_star_compose_big_star",
				"Ta muèn ®Õn Ng©n Hµ ®Ó ch¹m sao ­íc nguyÖn/aoyun_star_goto_galaxy",
				"Ta muèn dïng §ång t©m hoµn ®Ó ®æi 1 tÊm 'Tinh Tinh §Þa §å'/aoyun_star_tongxinwan_exchange",
				"M« t¶ ho¹t ®éng sao b¨ng ­íc nguyÖn/aoyun_star_know_detail",
				"Ta sÏ quay l¹i sau/nothing",
				}
	Say(g_szInfoHead.."Ai nãi giang hå nh©n sü kh«ng ®a t×nh? Nhí n¨m ®ã ta còng tõng lµ mét hiÖp kh¸ch phong l­u! ¢y da, kh«ng nãi vÈn v¬ n÷a, cø mçi n¨m ®Õn ®é ThÊt TÞch, lµ trªn trêi sao b¨ng l¹i r¬i rông ®Çy. Nh÷ng ng«i sao b¨ng ®ã t­îng tr­ng cho ­íc nguyÖn nam n÷. ë ®©y ta cã mét tÊm Tinh Tinh §Þa §å, ng­¬i cã muèn b¾t ch­íc ®i t×m mét ng«i sao b¨ng ®Ó tá ­íc nguyÖn thÇm kÝn kh«ng? Thêi gian: <color=red>mïng 7, mïng 8, mïng 9 th¸ng 7 ©m lÞch (ngµy 7, 8, 9 th¸ng 8 d­¬ng lÞch)<color>",getn(selTab),selTab);
end;

function aoyun_star_get_star_map()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > GetTask(TSK_AOYUN_STAR_DATE) then
		local selTab = {
					"§­îc!/aoyun_star_get_star_map_1",
					"L¸t n÷a ta sÏ quay l¹i nhËn/nothing",
					}
		Say(g_szInfoHead.."Ng­êi h÷u t©m cã thÓ dùa vµo ®Þa ®å ®Ó t×m ra ng«i sao b¨ng cña m×nh. §©y chÝnh lµ 'Tinh Tinh §Þa §å' trong truyÒn thuyÕt, xin c¸c h¹ nhËn lÊy.",getn(selTab),selTab);
	else
		Talk(1,"aoyun_star_main",g_szInfoHead.."Xin lçi, h«m nay c¸c h¹ ®· nhËn 'Tinh Tinh §Þa §å' råi. Mét vËt tr©n quý nh­ vËy, kh«ng thÓ ph¸t tuú tiÖn ®­îc.");
	end;
end;

function aoyun_star_get_star_map_1()
	local nDate = tonumber(date("%Y%m%d"));
	if gf_JudgeRoomWeight(2,10,g_szInfoHead) == 0 then
		return 0;
	end;
	SetTask(TSK_AOYUN_STAR_DATE,nDate);
	AddItem(2,0,407,1);
	Msg2Player("B¹n nhËn ®­îc 1 Tinh Tinh §Þa §å");
	WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."§· nhËn ®­îc 1 Tinh Tinh §Þa §å");
end;

function aoyun_star_compose_big_star()
	local selTab = {
				"§­îc/aoyun_star_compose_big_star_1",
				"Tinh Tinh Chi V­¬ng lµ g× vËy/aoyun_star_know_big_star",
				"Ta ®îi c¸c h¹ quay l¹i/nothing",
				}
	Say(g_szInfoHead.."Dïng 7 sao b¨ng cã thÓ hîp thµnh 1 Tinh Tinh Chi V­¬ng. Cã muèn hîp thµnh kh«ng?",getn(selTab),selTab);
end;

function aoyun_star_know_big_star()
	Talk(1,"aoyun_star_main",g_szInfoHead.."Trªn bÇu trêi sao mªnh m«ng, ng«i sao s¸ng nhÊt chÝnh lµ ng«i sao chøa t©m nguyÖn thÇm kÝn cña c¸c h¹ ®ã. Dïng 7 'sao b¨ng' ®Ó §æi 1 'Tinh Tinh Chi V­¬ng'.");
end;

function aoyun_star_compose_big_star_1()
	if GetItemCount(2,0,408) < 7 then
		Talk(1,"aoyun_star_main",g_szInfoHead.."B¹n kh«ng ®ñ sao b¨ng, h·y thu thËp thªm ®i. Hîp thµnh Tinh Tinh Chi V­¬ng cÇn cã <color=yellow>7<color> sao b¨ng.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10,g_szInfoHead) == 0 then
		return 0;
	end;
	if DelItem(2,0,408,7) == 1 then
		local nRetCode,nItemIdx = AddItem(2,0,1071,1);
		SetItemExpireTime(nItemIdx,aoyun_star_get_time_left());
		Msg2Player("B¹n nhËn ®­îc 1 'Tinh Tinh Chi V­¬ng'");
		Talk(1,"aoyun_star_main",g_szInfoHead.."Xin h·y nhËn lÊy, ®©y lµ 'Tinh Tinh Chi V­¬ng' v« cïng quý gi¸, lµ ng«i sao lung linh nhÊt trong c¸c v× sao.");
		WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().." ®· hîp thµnh 1 Tinh Tinh Chi V­¬ng");
	end;
end;

function aoyun_star_goto_galaxy()
	SetLogoutRV(1);	--ÉèÎª³ÇÊÐÖØÉúµã
	SetFightState(0);	--ºÍÆ½×´Ì¬
	local nMapID = GetWorldPos();
	if nMapID ~= 100 and nMapID ~= 200 and nMapID ~= 300 then
		return 0;
	end;
	CleanInteractive();
	NewWorld(965+floor(nMapID/100),1628,3298);
end;

function aoyun_star_tongxinwan_exchange()
	local selTab = {
				"Ta muèn ®æi 1 Tinh Tinh §Þa §å/aoyun_star_tongxinwan_exchange_1",
				"T¹m thêi kh«ng ®æi/nothing",
				}
	Say(g_szInfoHead.."B¹n muèn dïng <color=yellow>1 §ång t©m hoµn<color> §æi <color=yellow>1 Tinh Tinh §Þa §å<color> ph¶i kh«ng? <color=red>L­u ý: Mçi ng­êi mçi ngµy chØ cã thÓ t×m ®­îc tèi ®a 7 ng«i sao, b¹n ®õng nªn ®æi qu¸ nhiÒu Tinh Tinh §Þa §å.<color>",getn(selTab),selTab);
end;

function aoyun_star_tongxinwan_exchange_1()
	if GetItemCount(2,1,573) < 1 then
		Talk(1,"aoyun_star_main",g_szInfoHead.."Trªn ng­êi b¹n kh«ng cã §ång t©m hoµn.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10,g_szInfoHead) == 0 then
		return 0;
	end;
	if DelItem(2,1,573,1) == 1 then
		AddItem(2,0,407,1);
		Talk(1,"aoyun_star_main",g_szInfoHead.."CÇm lÊy ®i, ®©y lµ Tinh Tinh §Þa §å cña b¹n.");
		Msg2Player("B¹n ®· dïng 1 §ång t©m hoµn ®Ó §æi 1 Tinh Tinh §Þa §å");
		WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().." ®· dïng 1 §ång t©m hoµn ®Ó §æi 1 Tinh Tinh §Þa §å");
	end;
end;

function aoyun_star_know_detail()
	Talk(2,"aoyun_star_main",g_szInfoHead.."Mïng 7, mïng 8, mïng 9 th¸ng 7 (ngµy 7, 8, 9 th¸ng 8 d­¬ng lÞch), trong 3 ngµy nµy, mçi ngµy ®Òu cã thÓ ®Õn chç ta ®Ó nhËn mét tÊm 'Tinh Tinh §Þa §å'. Dïng ®Þa ®å ®Ó t×m ra to¹ ®é, ®Õn to¹ ®é chØ ®Þnh ®Ó nhÆt sao b¨ng, <color=red>[T×m phÇn th­ëng kinh nghiÖm sao b¨ng, mçi ngµy mçi ng­êi cã thÓ nhËn ®­îc 1 lÇn]<color>. NÕu nam n÷ tæ ®éi t×m sao b¨ng th× cã x¸c suÊt 80% t×m ®­îc 'Tinh Tinh §Þa §å'. Mçi ngµy mçi ng­êi cã thÓ nhÆt tèi ®a 7 sao b¨ng. Mang 7 sao b¨ng ®Õn chç '§Æc sø §¹i Héi Vâ l©m' cã thÓ ®æi ®­îc 1 'Tinh Tinh Chi V­¬ng'. 'Sao b¨ng' vµ 'Tinh Tinh Chi V­¬ng' ®Òu lµ nh÷ng vËt phi phµm, vôt qua trong chíp m¾t, kh«ng thÓ gi÷ ®Õn ngµy h«m sau ®­îc.",g_szInfoHead.."Mang nh÷ng sao b¨ng b¹n thu nhÆt ®­îc cïng víi b¹n bÌ, cïng nhau vµo b¶n ®å Ng©n Hµ, ch¹m vµo ng«i sao, ­íc nguyÖn nh÷ng ®iÒu thÇm kÝn, b¹n sÏ nhËn ®­îc nhiÒu phÇn th­ëng phong phó. <color=yellow>Mçi ngµy mçi ng­êi chØ cã thÓ trång 1 c©y ­íc nguyÖn<color>.");
end;

function aoyun_star_get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec);
	return nTimeLeft;
end;
