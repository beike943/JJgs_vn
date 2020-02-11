Include("\\script\\online\\qixi08\\box\\head.lua")
Include("\\script\\online\\qixi08\\function.lua")
IB_VERSION = 1
function aoyun_box_main()
	local szGameName,nGameID = QX08_GetTodayGame();
	if nGameID ~= GAME_ID_BOX then
		Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: H«m nay <color=yellow>"..szGameName.."<color>ho¹t ®éng b¾t ®Çu, thËt thó vŞ.");
		return
	end
	Say(Npc_name.."§Ó t×m §o¹t B¶o Kú Binh <color=yellow>thËt<color>, chóng ta ®Æt nhiÒu <color=yellow>b¶o r­¬ng<color> vµ <color>c¬ quan<color> ë danh lam th¾ng c¶nh, chê thêi gian!",
		5,
		"\nTa muèn tham gia ho¹t ®éng '§o¹t B¶o Kú Binh'/box_log_in",
		"\nTa muèn t×m hiÓu ho¹t ®éng '§o¹t B¶o Kú Binh'/box_info",
		"\nTa muèn biÕt phÇn th­ëng ho¹t ®éng '§o¹t B¶o Kú Binh'/prize_list",
		"\nTa ®Õn nhËn phÇn th­ëng '§o¹t B¶o Kú Binh'/box_prize",
		"\nChØ ®Õn xem/end_dialog"
	)
end
--²Î¼Ó»î¶¯
function box_log_in()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Thêi gian ho¹t ®éng lµ <color=yellow>9h s¸ng-11h tèi<color>, vŞ thiÕu hiÖp nµy muèn xem giê chİnh x¸c µ.");
		return 0;
	end;
	--ÅĞ¶Á½ñÌìÊıÁ¿ÉÏÏŞ
--	if GetItemCount(2,0,1069) < 1 then 
--		Talk(1,"",Npc_name.."ÇëÈ·ÈÏÄúĞ¯´øÁË<color=red>ÌìÏÂµÚÒ»±ÈÎäÑûÇëº¯<color>£¡")
--		return
--	end
	--ÅĞ¶Ï³¡µØÊÇ·ñÂú
		--ÒÑ¿ª³¡µØÊÇ·ñ»¹ÓĞ¿ÕÎ»
	local map_loaded = gf_GetDataTable(GetSameMaps(Box_map_id))
	for i = 2,getn(map_loaded) do
		local last_map_start_sec_num = mf_GetMissionV(MS_ID,MS_LOOP_NUM,map_loaded[i])
		local player_num = getn(mf_GetMSPlayerIndex(MS_ID,0,map_loaded[i]))
		if last_map_start_sec_num < 60 and player_num < Box_player_max and player_num > 0  then
			player_log_in(map_loaded[i])
			return
		elseif player_num == 0 then
			FreeDynamicMap(map_loaded[i],SubWorldID2Idx(map_loaded[i]))
		end
	end
		--Èç¹ûÃ»ÓĞ³¬¹ı³¡µØÉÏÏŞ£¬ÔòÔö¼Ó³¡µØ
	if getn(map_loaded) < Map_num_max then
		local map_id,map_index = DynamicLoadMap(Box_map_id)
		if mf_OpenMission(MS_ID,map_id) == 1 then
			player_log_in(map_id)
		else
			return
		end
	else
		Talk(1,"",Npc_name.."Khu thi ®Êu ®· ®Çy, ®îi chót!")
		return
	end
end
--Íæ¼Ò½øÈë
function player_log_in(map_id)
	local last_map_start_sec_num = mf_GetMissionV(MS_ID,MS_LOOP_NUM,map_id)
	local player_num = getn(mf_GetMSPlayerIndex(MS_ID,0,map_id))
	--Èç¹ûÎŞ·¨½øÈëÔò·µ»Ø
	if player_num >= Box_player_max or last_map_start_sec_num > 60 then
		return
	else
		local nMapID = GetWorldPos()
		SetTask(Log_in_mapID,nMapID)
		mf_JoinMission(MS_ID,0,map_id)
	end
end
--ÁË½â»î¶¯
function box_info()
	Talk(4,"main",
		Npc_name.."Sè ng­êi vµo s©n ph¶i <color=yellow>4 ng­êi trë lªn<color> míi b¾t ®Çu, mçi s©n nhiÒu nhÊt lµ <color=yellow>10<color> ng­êi, tr­íc khi khai trËn cã <color=yellow>1 phót<color> chuÈn bŞ, nÕu sè ng­êi kh«ng ®ñ, hñy thi ®Êu.",
		Npc_name.."B¶o r­¬ng chóng ta ®Æt trong danh lam th¾ng c¶nh mçi <color=yellow>30 gi©y<color> sÏ xuÊt hiÖn 1 lÇn, chØ cã ng­êi t×m ®­îc <color=yellow>b¶o r­¬ng<color>, míi cã t­ c¸ch tiÕp tôc ë l¹i trong danh lam th¾ng c¶nh nµy, ng­îc l¹i rêi khái cuéc ch¬i.. Cuèi cïng cßn l¹i mét ng­êi, trËn ®Êu kÕt thóc.",
		Npc_name.."C¬ quan chóng ta ®Æt trong danh lam th¾ng c¶nh kh«ng ph¶i ®Ó ch¬i, nÕu ng­¬i chän c¬ quan thµnh c«ng, sÏ t¨ng c¬ héi sèng sãt, quÊy ph¸ thÕ trËn cña ng­êi kh¸c!",
		Npc_name.."NÕu trong 1 ngµy <color=yellow>10 lÇn t×m ®­îc 7 b¶o r­¬ng trë lªn<color> bao gåm 7 c¸i, th× ®Õn nhËn phÇn th­ëng, nhËn danh hiÖu ®Æc biÖt, '<color=yellow>§o¹t B¶o Kú Binh<color>'!"
	)
end
--½±ÀøÃèÊö
function prize_list()
	if IB_VERSION == 0 then
		Talk(3,"main",
			Npc_name.."\nT×m ®­îc <color=yellow>9<color> b¶o r­¬ng nhËn ®­îc 5 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*200w kinh nghiÖm, cßn cã thÓ chuyÓn (®¼ng cÊp/80) b×nh ph­¬ng*400w ®iÓm søc kháe. CÊp 99 tÆng 6 Tói b¶o th¹ch. \nT×m ®­îc <color=yellow>8<color> b¶o r­¬ng nhËn ®­îc 4 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*100w kinh nghiÖm, cßn cã thÓ chuyÓn (®¼ng cÊp/80) b×nh ph­¬ng*400w ®iÓm søc kháe. CÊp 99 tÆng 5 Tói b¶o th¹ch.",
			Npc_name.."\nT×m ®­îc <color=yellow>7<color> b¶o r­¬ng nhËn ®­îc 3 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*100w kinh nghiÖm, cßn cã thÓ chuyÓn (®¼ng cÊp/80) b×nh ph­¬ng*350w ®iÓm søc kháe. CÊp 99 tÆng 4 Tói b¶o th¹ch.\nT×m ®­îc <color=yellow>4-6<color> b¶o r­¬ng nhËn ®­îc 2 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*100w kinh nghiÖm, cßn cã thÓ chuyÓn (®¼ng cÊp/80) b×nh ph­¬ng*300w ®iÓm søc kháe. CÊp 99 tÆng 3 Tói b¶o th¹ch.",
			Npc_name.."\nT×m ®­îc <color=yellow>1-3<color> b¶o r­¬ng nhËn ®­îc 1 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*100w kinh nghiÖm, cßn cã thÓ chuyÓn (®¼ng cÊp/80) b×nh ph­¬ng*250w ®iÓm søc kháe. CÊp 99 tÆng 3 Tói b¶o th¹ch.\nNÕu trong 10 lÇn t×m ®­îc 7 hoÆc nhiÒu b¶o r­¬ng, th× ®Õn nhËn phÇn th­ëng, nhËn ®­îc danh hiÖu ®Æc biÖt, '§o¹t B¶o Kú Binh'!"
		)
	else
		Talk(3,"main",
			Npc_name.."	T×m ®­îc <color=yellow>9<color> b¶o r­¬ng nhËn ®­îc 5 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*500w kinh nghiÖm. CÊp 99 tÆng 6 goi B¶o th¹ch.\nT×m ®­îc <color=yellow>8<color> b¶o r­¬ng nhËn ®­îc 4 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*420w kinh nghiÖm. CÊp 99 tÆng 5 Tói b¶o th¹ch.",
			Npc_name.."T×m <color=yellow>7<color> b¶o r­¬ng nhËn ®­îc 3 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*380w kinh nghiÖm. CÊp 99 tÆng 4 Tói b¶o th¹ch.\nT×m ®­îc <color=yellow>4-6<color> b¶o r­¬ng nhËn ®­îc 2 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*350w kinh nghiÖm. CÊp 99 tÆng 3 Tói b¶o th¹ch.",
			Npc_name.."T×m ®­îc <color=yellow>1-3<color> b¶o r­¬ng nhËn ®­îc 1 ®iÓm tİch lòy. Ngoµi ra cÊp 99 trë xuèng tÆng (®¼ng cÊp/80) b×nh ph­¬ng*300w kinh nghiÖm. CÊp 99 tÆng 2 Tói b¶o th¹ch.\nNÕu trong 10 lÇn t×m ®­îc ®­îc 7 b¶o r­¬ng trë lªn (bao gåm 7 c¸i), sÏ nhËn ®­îc danh hiÖu ®Æc biÖt, '§o¹t B¶o Kú Binh'!"
		)
	end
end
		
--»î¶¯½±Àø
function box_prize()
	if GetTask(Box_prize_get_flag) == 1 then
		Talk(1,"",Npc_name.."H«m nay ng­¬i ®· nhËn phÇn th­ëng råi, khi kh¸c h·y quay l¹i!")
		return
	end
	if GetTask(Box_prize_date_seq) ~=zgc_pub_day_turn(1) then
		Talk(1,"",Npc_name.."H«m nay ng­¬i ch­a tham gia ho¹t ®éng ®o¹t b¶o, phÇn th­ëng ®©u mµ nhËn!")
		return
	elseif GetTask(Box_best_prize) <= 0 then
		Talk(1,"",Npc_name.."§©y lµ…, İt nhÊt còng cã ®­îc 1 r­¬ng, míi cã th­ëng.")
		return
	else
		QX08_GetAward(2,Tb_box_num_prize[min(GetTask(Box_best_prize),9)],Box_prize_get_flag)
	end
end
