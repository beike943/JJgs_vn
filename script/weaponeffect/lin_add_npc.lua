--½Å±¾Ãû³Æ£º¸½ÁéNPC¶Ô»°
--½Å±¾¹¦ÄÜ£º¸½ÁéÏà¹ØNPC¹¦ÄÜ
--¹¦ÄÜ²ß»®ÈË£ºÍõÇ¿
--¹¦ÄÜ¿ª·¢ÈË£º´å³¤
--¹¦ÄÜ¿ª·¢Ê±¼ä£º2008-01-15
--ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\weaponeffect\\ling_add_main.lua")
Include("\\script\\weaponeffect\\yun_ling_add.lua")
Include("\\script\\lib\\globalfunctions.lua")
--Ö÷¶Ô»°
function main()
	local tSel = {
--		"ÎÒÒª¿´ÏÂÔÌÁéÍâ×°/yunling_main",
--		"ÎÒÏë´¦ÀíÏÂÎäÆ÷ÌØĞ§Ïà¹ØÊÂÇé/lin_main",
		"Ta muèn n©ng cÊp ngo¹i trang UÈn Linh/upgrade_clothes",
		"Ta muèn Ğp Linh Ph¸ch vµo vò khİ ®ang sö dông (cÇn 70 vËt phÈm Xu + 200 vµng)/soul_upgrade",
		"Ta chØ ghĞ qua th«i/end_dialog",
	}
	Say(Npc_name.."H«m nay trêi trë l¹, cã yªu khİ t¹i ®¹i m¹c t©y b¾c, lµ §Ö tö C«n L«n ph¶i biÕt tr¶m ma trõ yªu. BÇn ®¹o gÇn ®©y nghiªn cøu ra c¸ch g¾n thªm linh tİnh lªn trang phôc, thªm gäi Linh tİnh cho vò khİ ®Ó trë nªn m¹nh mÏ h¬n, ®¹i hiÖp cã høng thó kh«ng?",
		getn(tSel), tSel)
end
--ÔÌÁéºÍÎäÆ÷ÌØĞ§·ÖÁ÷¶Ô»°
function lin_main()
	if GetPlayerRoute() == 0 then
		Talk(1,"",Npc_name.."BÇn ®¹o chØ d¹y vâ cho anh hïng hµo kiÖt <color=yellow>®· vµo l­u ph¸i<color> c¸c m«n ph¸i vâ l©m!")
		return
	end
	if Tb_route_point_info[GetPlayerRoute()] == nil then
		Talk(1,"",Npc_name.."BÇn ®¹o chØ d¹y vâ cho anh hïng hµo kiÖt <color=yellow>®· vµo l­u ph¸i<color> c¸c m«n ph¸i vâ l©m!")
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	SetTaskTemp(Weapon_index_save_TasktempID,weapon_index)
	Say(Npc_name.."C«n L«n cã lo¹i ®¹o thuËt, cã thÓ dùa vµo t­ c¸ch cña thiªn h¹ hµo kiÖt ®Ó kİch ho¹t <color=yellow>Linh Ph¸ch<color> cña vò khİ, lµm vò khİ rùc rì ¸nh s¸ng, thªm Linh tİnh cho <color=yellow>Linh Ph¸ch<color> cã thÓ t¨ng thªm uy lùc cho vò khİ. VŞ ®¹i hiÖp nµy muèn bÇn ®¹o gióp g× ®©y?",
		6,
		"Ta muèn kİch ho¹t Linh Ph¸ch cña vò khİ trong tay/soul_add",
		"Ta muèn thªm Linh tİnh cho vò khİ trong tay/ability_add",
		"Xem t­ liÖu liªn quan Linh tİnh vµ Linh Ph¸ch/soul_info",
		"Ta muèn th¸o Linh Ph¸ch cho vò khİ trong tay (Linh Ph¸ch Linh tİnh ®Òu mÊt)/soul_del",
		"Ta muèn th¸o Linh tİnh cho vò khİ trong tay (chØ mÊt Linh tİnh)/ability_del",
		"Ta chØ ghĞ qua th«i/end_dilaog"
	)
end
--=========================ÁéÆÇ============================
--Ôö¼ÓÁéÆÇ
function soul_add()
	local weapon_index = GetPlayerEquipIndex(2)
	--ÎäÆ÷×°±¸ÅĞ¶Ï
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H·y trang bŞ vò khİ tr­íc råi ®Õn t×m ta!")
		return
	end
	local weapon_nume = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	--ÎäÆ÷ÄÍ¾ÃÅĞ¶Ï
	if AbradeItem(weapon_index,0) == 0 then
		Talk(1,"",Npc_name.."  "..weapon_nume.."§· hÕt ®é bÒn, kh«ng thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color>!")
		return
	end
	--ÅĞ¶ÏÊÇ·ñÒÑ¾­¸½¼ÓÁËÁéÆÇ
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name  ~= "" then
		Talk(1,"",Npc_name.."  "..weapon_nume.."§· cã <color=yellow>"..aptitude_name.."<color> Linh Ph¸ch, th¸o tr­íc råi h·y kİch ho¹t <color=yellow>Linh Ph¸ch<color>!")
		return
	end
	--³õÊ¼½øÈëÊı¾İÇåÀí
	SetTaskTemp(Aptitue_seq_save_1_TasktempID,0)
	SetTaskTemp(Aptitue_seq_save_10_TasktempID,0)
	SetTaskTemp(Break_sky_get_date_seq_TaskID,0)
	SetTaskTemp(Aptitue_cent_TasktempID,0)
	--½øÈë×ÊÖÊÑ¡Ôñ¶Ô»°
	aptitude_sel(0,0)
end
--×ÊÖÊÑ¡Ôñ¶Ô»°
function aptitude_sel(aptitue_count,page_seq)
	--Ö÷¶Ô»°ÄÚÈİÉú³É
	local dia_main = Npc_name.."ChØ cã t­ chÊt t­¬ng øng míi cã thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color> t­¬ng øng. Sau khi bÇn ®¹o kİch ho¹t <color=yellow>Linh Ph¸ch<color>, nÕu muèn gäi hån chØ cÇn nhÊn 2 ch÷ <color=yellow>kİch ho¹t<color> trªn ch©n dung vò khİ lµ ®­îc. Ng­¬i cã t­ chÊt nµo? Sau khi chän xong nhí b¸o cho bÇn ®¹o mét tiÕng."
	if aptitue_count ~= 0 then
		dia_main = Npc_name.."Ta biÕt råi"..Zgc_pub_sex_name().." bÇn ®¹o ®· ghi nhí,  "..Zgc_pub_sex_name().."VÉn cßn t­ chÊt kh¸c sao? (Tæng linh lùc hiÖn t¹i lµ: <color=red>"..GetTaskTemp(Aptitue_cent_TasktempID).."<color>)"
	end
	--Ñ¡ÏîÉú³É
	local dia_sel = {}
	local page_start,page_end = 0,0
	if page_seq == 0 then
		page_start = 1
		page_end = 6
	else
		page_start = 7
		page_end = getn(Tb_aptitude_info)
	end
	if page_seq ~= 0 then
		tinsert(dia_sel,"Trang tr­íc/#aptitude_sel("..aptitue_count..",0)")
	end
	for i = page_start,page_end do
		tinsert(dia_sel,Tb_aptitude_info[i][1].."/#aptitude_chk("..aptitue_count..","..i..")")
	end
	if page_seq == 0 then
		tinsert(dia_sel,"Trang kÕ/#aptitude_sel("..aptitue_count..",1)")
	end
	tinsert(dia_sel,"Ta chän råi, t­ chÊt cña ta cã nhiªu ®©y th«i/#aptitude_dtm(0)")
	tinsert(dia_sel,"§Ó ta suy nghÜ l¹i/end_dilaog")
	--¶Ô»°Õ¹¿ª
	Say(dia_main,
		getn(dia_sel),
		dia_sel
	)
end
--×ÊÖÊ×Ê¸ñ¼ì²â
function aptitude_chk(aptitue_count,aptitue_seq)
	--ÊÇ·ñÒÑ¾­Ñ¡È¡¹ı¸Ã×ÊÖÊ
	local aptidue_sel_temp_taskid = Aptitue_seq_save_1_TasktempID
	local aptitue_save_seq = aptitue_seq
	if aptitue_seq >= 10 then
		aptidue_sel_temp_taskid = Aptitue_seq_save_10_TasktempID
		aptitue_save_seq = aptitue_seq + 1 - 10
	end
	local aptidue_saved = GetTaskTemp(aptidue_sel_temp_taskid)
	local aptidue_uped_chk = strfind(tostring(aptidue_saved),tostring(aptitue_save_seq))
	if aptidue_uped_chk ~= 0  and aptidue_uped_chk ~= nil then
		Talk(1,"#aptitude_sel("..aptitue_count..",0)",Npc_name.."ïm…BÇn ®¹o biÕt t­ chÊt nµy cña ng­¬i, cã t­ chÊt kh¸c sao?")
		return
	end
	--ÎäÆ÷ÊÇ·ñ¸ü»»
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	--Ìõ¼ş¼ì²â
	if dostring(Tb_aptitude_info[aptitue_seq][2]) ~=1  then
		Talk(1,"#aptitude_sel("..aptitue_count..",0)",Npc_name.."Ha ha, ®õng cã lõa bÇn ®¹o, bÇn ®¹o kh«ng thÊy ng­¬i cã t­ chÊt nµy. Ng­¬i xem cßn t­ chÊt nµo kh¸c cÇn b¸o cho bÇn ®¹o kh«ng?")
		return
	end
	--Êı¾İ´¦ÀíºÍ»Øµ÷
	SetTaskTemp(aptidue_sel_temp_taskid,((aptidue_saved * 10) + aptitue_save_seq))
	aptitue_count =  (aptitue_count + Tb_aptitude_info[aptitue_seq][5])
	SetTaskTemp(Aptitue_cent_TasktempID,aptitue_count)
	aptitude_sel(aptitue_count,0)
end
--×ÊÖÊÈ·ÈÏº¯Êı
num_per_page = 8
function aptitude_dtm(page_seq)
	--ÊÇ·ñÑ¡È¡ÁË×ÊÖÊ
	local aptitue_count = GetTaskTemp(Aptitue_cent_TasktempID)
	if aptitue_count == 0 or aptitue_count == nil then
		Talk(1,"#aptitude_sel(0,0)",Npc_name..Zgc_pub_sex_name().."VÉn ch­a chän t­ chÊt nµo?")
		return
	end
	--×ÊÖÊ·Ö½â
	local magic_dia_sel = {}
	local aptitude_seled = ""
	local aptitude_seq = 0
	for i = Aptitue_seq_save_1_TasktempID,Aptitue_seq_save_10_TasktempID do
		aptitude_seled = tostring(GetTaskTemp(i))
		if tonumber(aptitude_seled) ~= 0 then
			for j = 1,strlen(aptitude_seled) do
				if i == Aptitue_seq_save_1_TasktempID then
					aptitude_seq = tonumber(strsub(aptitude_seled,j,j))
				else
					aptitude_seq = tonumber(strsub(aptitude_seled,j,j)) + 9
				end
				tinsert(magic_dia_sel,Tb_aptitude_info[aptitude_seq][3].."(Thêi h¹n: "..Tb_aptitude_info[aptitude_seq][8].." ngµy)".."/#magic_add("..aptitude_seq..")")
			end
		end
	end
	tinsert(magic_dia_sel,"Ng­¬i xem t­ chÊt ta cã thÓ kİch ho¹t Linh Ph¸ch m¹nh h¬n kh«ng?/break_sky_chk")
	--¶Ô»°×éÖ¯
	local dia_sel = {}
	local dia_sel_num = getn(magic_dia_sel)
	if page_seq ~= 0 then
		tinsert(dia_sel,"Trang tr­íc/#aptitude_dtm("..(page_seq - 1)..")")
	end
	for i = (1+num_per_page * page_seq),min((num_per_page * (1 +page_seq)),dia_sel_num) do
		tinsert(dia_sel,magic_dia_sel[i])
	end
	--¼ÓÈëº³Ìì
	if dia_sel_num == (num_per_page + 1) then
		tinsert(dia_sel,magic_dia_sel[dia_sel_num])
	elseif dia_sel_num > (num_per_page + 1 + (num_per_page * page_seq)) then
		tinsert(dia_sel,"Trang kÕ/#aptitude_dtm("..(page_seq + 1)..")")
	end
	tinsert(dia_sel,"§Ó ta suy nghÜ l¹i/end_dialog")
	--¶Ô»°Õ¹¿ª
	Say(Npc_name.."Kh«ng thÓ kİch ho¹t nhiÒu <color=yellow>Linh Ph¸ch<color> vËy, ng­¬i chØ cã thÓ kİch ho¹t 1 <color=yellow>Linh Ph¸ch<color> cho 1 vò khİ. Chó ı: khi ®é bÒn vò khİ lµ <color=yellow>0<color> hoÆc <color=yellow>hÕt h¹n<color>, Linh Ph¸ch sÏ bŞ mÊt, ng­¬i cÇn ®Õn chç ta ®Ó kİch ho¹t Linh Ph¸ch l¹i. Ng­¬i muèn kİch ho¹t Linh Ph¸ch nµo?",
	getn(dia_sel),
	dia_sel
	)
end
------------------------------ÆÕÍ¨ÌØĞ§--------------------
--È·ÈÏ¶Ô»°
function magic_add(aptitude_seq)
	Say(Npc_name.."Linh Ph¸ch ng­¬i muèn kİch ho¹t lµ: <color=yellow>"..Tb_aptitude_info[aptitude_seq][3].."<color>, cÇn t­ chÊt: "..Tb_aptitude_info[aptitude_seq][6].."; CÇn tiªu hao: "..aptitude_cost_string_build(Tb_aptitude_info[aptitude_seq][4])..". Linh Ph¸ch tån t¹i: <color=yellow>"..Tb_aptitude_info[aptitude_seq][8].."<color> ngµy. Ng­¬i cã thÓ nhÊn ch÷ '<color=yellow>Linh'<color> trªn ch©n dung vò khİ ®Ó kİch ho¹t Linh Ph¸ch. Chó ı: NÕu t­ chÊt kh«ng ®ñ ®iÒu kiÖn th× kh«ng thÓ kİch ho¹t, chØ khi ®ñ míi ®­îc. Ngoµi ra ph¶i yªu th­¬ng ThÇn binh cña ng­¬i, mét khi ®é bÒn lµ 0, Linh Ph¸ch sÏ biÕn mÊt, ph¶i ®Õn chç ta kİch ho¹t l¹i. Muèn kİch ho¹t Linh Ph¸ch nµy kh«ng?",
		3,
		"§ång ı, ta ®· nghe râ lêi khuyÕn khİch cña ng­¬i/#magic_add_dtm("..aptitude_seq..")",
		"Ta kh«ng cã vËt liÖu còng muèn kİch ho¹t Hµo M«n Linh Ph¸ch/use_money_consume",
		"Kh«ng, ®Ó ta suy nghÜ ®·/end_dialog"
	)
end
--2208-5-20:Ôö¼ÓÓÃÇ®»½ĞÑºÀÃÅµÄ´¦Àí
Tb_consume_money = {3000,4000}
function use_money_consume()
	--ÎäÆ÷ÇĞ»»¼ì²â
	if weapon_cha_chk() ~= 1 then
		return
	end
	Say(Npc_name.."Kh«ng cã vËt liÖu còng ®­îc, nh­ng chi phİ kh¸ cao. CÇn tiªu hao <color=yellow>"..Tb_consume_money[Sever_diff].."<color> vµng, ®ång ı kİch ho¹t kh«ng?",
		2,
		"§ång ı!/use_money_dtm",
		"Kh«ng, ta muèn suy nghÜ/end_dialog"
	)
end
--È·ÈÏÔö¼Ó
function use_money_dtm()
	--ÎäÆ÷ÇĞ»»¼ì²â
	if weapon_cha_chk() ~= 1 then
		return
	end
	local aptitude_seq = getn(Tb_aptitude_info)
	--Ïû·Ñ»ı·ÖÅĞ¶Ï
	if dostring(Tb_aptitude_info[aptitude_seq][2]) ~=1  then
		Talk(1,"end_dialog",Npc_name.."§iÓm tİch lòy tiªu dïng kh«ng ®ñ, kh«ng thÓ thªm hiÖu øng <color=yellow>Hµo m«n<color>!")
		return
	end	
	--½ğÇ®Ğ¯´øÅĞ¶Ï
	if GetCash() < (Tb_consume_money[Sever_diff] * 10000) then
		Talk(1,"",Npc_name.."TiÒn vµng kh«ng ®ñ <color=yellow>"..Tb_consume_money[Sever_diff].."<color> vµng, ®Ó quªn trong r­¬ng µ?")
		return
	end
	--½ğÇ®É¾³ıÅĞ¶Ï
	if Pay(Tb_consume_money[Sever_diff] * 10000) ~=  1 then
		Talk(1,"",Npc_name.."TiÒn vµng kh«ng ®ñ <color=yellow>"..Tb_consume_money[Sever_diff].."<color> vµng, ®Ó quªn trong r­¬ng µ?")
		return
	end
	--ºÀÃÅÌØĞ§Ôö¼Ó
	SetTask(IB_cost_num,(GetTask(IB_cost_num) - Tb_aptitude_num[12][Sever_diff]))
	SetTask(Consume_get_sec_seq_TaskID,GetTime())
	if BindWeaponEffect(Tb_aptitude_info[aptitude_seq][7],(Tb_aptitude_info[aptitude_seq][8]*86400)) == 1 then
		--Ôö¼ÓÊ±¼ä´¦Àí
		--SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Chóc mõng ®· thªm hiÖu øng <color=yellow>"..Tb_aptitude_info[aptitude_seq][7].."<color> thµnh c«ng! ë <color=yellow>gãc tr¸i ch©n dung vò khİ<color>, nhÊn nót kİch ho¹t mµu ®á lµ cã thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color>. Phİm t¾t kİch ho¹t <color=yellow>Linh Ph¸ch<color> lµ: <color=red>F<color>!")
		if Tb_aptitude_info[aptitude_seq][4] == 4 or Tb_aptitude_info[aptitude_seq][4] == 5 then
			AddGlobalNews("Tin giang hå míi nhÊt, "..GetName().."Víi b¶n lÜnh h¬n ng­êi, ®· kİch ho¹t Linh Ph¸ch: "..Tb_aptitude_info[aptitude_seq][7]..", kh«ng hæ lµ ®¹i hiÖp v¨n vâ song toµn!")
		end
		return
	else
		WriteLog("HiÖu øng vò khİ: Ng­êi ch¬i["..GetName().."]g¾n thªm "..Tb_aptitude_info[aptitude_seq][7].."hiÖu øng thÊt b¹i!")
	end
end
--Ôö¼Ó²Ù×÷
function magic_add_dtm(aptitude_seq)
	--ÎäÆ÷ÇĞ»»¼ì²â
	if weapon_cha_chk() ~= 1 then
		return
	end
	--ÎïÆ·Ğ¯´ø¼ì²â
	if aptitude_cost_deal(1,Tb_aptitude_info[aptitude_seq][4]) ~= 1 then
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if aptitude_cost_deal(2,Tb_aptitude_info[aptitude_seq][4]) ~= 1 then
		return
	end
	--ºÀÃÅ´¦Àí
	if aptitude_seq == getn(Tb_aptitude_info) then
		SetTask(IB_cost_num,(GetTask(IB_cost_num) - Tb_aptitude_num[12][Sever_diff]))
		SetTask(Consume_get_sec_seq_TaskID,GetTime())
	end
	--ÌØĞ§Ôö¼Ó
	if BindWeaponEffect(Tb_aptitude_info[aptitude_seq][7],(Tb_aptitude_info[aptitude_seq][8]*86400)) == 1 then
		--Ôö¼ÓÊ±¼ä´¦Àí
		--SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Chóc mõng ®· thªm hiÖu øng <color=yellow>"..Tb_aptitude_info[aptitude_seq][7].."<color> thµnh c«ng! ë <color=yellow>gãc tr¸i ch©n dung vò khİ<color>, nhÊn nót kİch ho¹t mµu ®á lµ cã thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color>. Phİm t¾t kİch ho¹t <color=yellow>Linh Ph¸ch<color> lµ: <color=red>F<color>!")
		if Tb_aptitude_info[aptitude_seq][4] == 4 or Tb_aptitude_info[aptitude_seq][4] == 5 then
			AddGlobalNews("Tin giang hå míi nhÊt, "..GetName().."Víi b¶n lÜnh h¬n ng­êi, ®· kİch ho¹t Linh Ph¸ch: "..Tb_aptitude_info[aptitude_seq][7]..", kh«ng hæ lµ ®¹i hiÖp v¨n vâ song toµn!")
		end
		return
	else
		WriteLog("HiÖu øng vò khİ: Ng­êi ch¬i["..GetName().."]g¾n thªm "..Tb_aptitude_info[aptitude_seq][7].."hiÖu øng thÊt b¹i!")
	end
end
------------------------------º³ÌìÏà¹Ø---------------------
--º³Ìì¼ì²â
function break_sky_chk()
	--SetTaskTemp(Aptitue_cent_TasktempID,26)
	local aptitue_count = GetTaskTemp(Aptitue_cent_TasktempID)
	if aptitue_count >= 26 then
		Talk(1,"break_sky_dia",Npc_name.."T­ chÊt cña ng­¬i cã thÓ kİch ho¹t Linh Ph¸ch <color=red>H¸m Thiªn<color>! Linh Ph¸ch nµy ph¸t ra sĞt, ¸nh s¸ng kh¸c th­êng. Hy väng ng­¬i cã thÓ ph¸t huy søc m¹nh cña nã!")
		return
	else
		Talk(1,"#aptitude_dtm(0)",Npc_name.."T­ chÊt d­êng nh­ kh«ng ®ñ yªu cÇu ®Ó kİch ho¹t hiÖu øng H¸m Thiªn, Linh Ph¸ch nµy yªu cÇu t­ chÊt (tr¹ng th¸i vµ trang bŞ trªn ng­êi hiÖn t¹i) ®ñ cung cÊp tæng linh lùc cña Linh Ph¸ch ®¹t hoÆc h¬n <color=red>26<color>. Xin h·y luyÖn tËp thªm!\nLinh lùc 1: <color=yellow>ThiÕt Cèt, L¹c Hµ<color>\nLinh lùc 2: <color=yellow>B¸ch ChiÕn, Ch­íc NhËt, TuÊn DËt, §µo Lı, Danh Tó, L¨ng Tiªu<color>\nLinh lùc 3: <color=yellow>PhÇn V©n, Tinh Di<color>\nLinh lùc 4: <color=yellow>C¸i ThÕ<color>\nLinh lùc 6: <color=yellow>§o¹n Giao<color>\nLinh lùc 7: <color=red>Hµo M«n<color>\nLinh lùc 8: <color=red>Ph¸ Qu©n<color>")
		return
	end
end
--º³ÌìÔö¼ÓÈ·ÈÏ
function break_sky_dia()
	Say(Npc_name.."Linh Ph¸ch ng­¬i muèn kİch ho¹t lµ: <color=red>H¸m Thiªn<color>; T­ chÊt cÇn lµ: <color=red>Ch­a râ<color>; Tiªu hao cÇn: "..aptitude_cost_string_build(5)..". Thêi gian Linh Ph¸ch tån t¹i: <color=yellow>30<color> ngµy. Ng­¬i cã thÓ nhÊn ch÷ 'Linh' trªn ch©n dung vò khhİ ®Ó kİch ho¹t Linh Ph¸ch. Chó ı: NÕu t­ chÊt kh«ng ®ñ ®iÒu kiÖn th× kh«ng thÓ kİch ho¹t, chØ khi ®ñ míi ®­îc. Ngoµi ra ph¶i yªu th­¬ng ThÇn binh cña ng­¬i, mét khi ®é bÒn lµ 0, Linh Ph¸ch sÏ biÕn mÊt, ph¶i ®Õn chç ta kİch ho¹t l¹i. Muèn kİch ho¹t Linh Ph¸ch nµy kh«ng?",
		2,
		"§ång ı, ta ®· nghe râ lêi khuyÕn khİch cña ng­¬i/break_sky_dtm",
		"Kh«ng, ®Ó ta suy nghÜ ®·/end_dialog"
	)
end
--º³Ìì´¦Àí
function break_sky_dtm()
	--ÎäÆ÷ÇĞ»»¼ì²â
	if weapon_cha_chk() ~= 1 then
		return
	end
	--ÎïÆ·Ğ¯´ø¼ì²â
	if aptitude_cost_deal(1,5) ~= 1 then
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if aptitude_cost_deal(2,5) ~= 1 then
		return
	end
	--ÌØĞ§Ôö¼Ó
	if BindWeaponEffect("H¸m Thiªn",(30*86400)) == 1 then
		--º³ÌìÔö¼ÓÊ±¼ä´¦Àí
		SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Chóc mõng thªm hiÖu øng <color=red>H¸m Thiªn<color> cho trang bŞ thµnh c«ng! ë <color=yellow>gãc ph¶i ch©n dung vò khİ<color>, nhÊn nót gäi hån mµu ®á lµ cã thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color>. Phİm t¾t kİch ho¹t <color=yellow>Linh Ph¸ch<color> lµ: <color=red>F<color>!")
		AddGlobalNews("Tin giang hå míi nhÊt, "..GetName().."Víi b¶n lÜnh h¬n ng­êi, ®· kİch ho¹t Linh Ph¸ch: H¸m Thiªn, kh«ng hæ lµ ®¹i hiÖp v¨n vâ song toµn!")
		return
	else
		WriteLog("HiÖu øng vò khİ: Ng­êi ch¬i["..GetName().."] thªm hiÖu øng 'H¸m Thiªn' thÊt b¹i!")
	end
end
--ÏûºÄ¶Ô»°Éú³É
function aptitude_cost_string_build(aptitude_level)
	local string_rtn = "<color=yellow>Kh«ng tiªu hao g×<color>"
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] ~= 0 then
		string_rtn ="<color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][1].."<color> vµng; "
	end
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  ~= 0 then
		string_rtn = string_rtn.."<color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][2].."<color> <color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][4].."<color>;"
	end
	return string_rtn
end
--ÏûºÄĞ¯´ø»òÉ¾³ı¼ì²â
function aptitude_cost_deal(deal_flag,aptitude_level)
	--deal_flag£º1ÎªĞ¯´ø¼ì²â£¬2ÎªÉ¾³ı¼ì²â
	local chk_flag = 1
	--½ğÇ®
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] ~= 0 then
		if deal_flag == 1 then 
			if GetCash() < (Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] * 10000) then
				chk_flag = 0
			end
		else 
			if Pay(Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] * 10000) ~= 1 then
				chk_flag = 0
			end
		end
		if chk_flag == 0 then
			Talk(1,"",Npc_name.."Trªn ng­êi kh«ng ®ñ <color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] .."<color> vµng, ®Ó quªn trong r­¬ng µ?")
			return 0
		end
	end
	--²ÄÁÏ
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  ~= 0 then
		if deal_flag == 1 then 
			if GetItemCount(Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][1],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][2],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][3]) <  Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  then
				chk_flag = 0
			end
		else
			if DelItem(Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][1],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][2],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][3],Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]) ~= 1 then
				chk_flag = 0
			end
		end
		if chk_flag == 0 then
			Talk(1,"",Npc_name.."Ng­¬i mang <color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][4].."<color> kh«ng ®ñ <color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][2] .."<color> c¸i, ®Ó quªn trong r­¬ng µ?")
			return 0
		end
	end
	return 1
end
--=========================¸½ÁéÄÜ============================
function ability_add()
	--ÅĞ¶ÏÊÇ·ñÒÑ¾­¸½¼şÁéÄÜ
	if GetWeaponEffectAttributes() ~= 0 then
		Talk(1,"",Npc_name.."Vò khİ hiÖn t¹i ®· kİch ho¹t <color=yellow>Linh tİnh<color>, chØ khi <color=yellow>Xãa bá<color> c¸i cò tr­íc bÇn ®¹o míi kİch ho¹t c¸i míi!")
		return 0
	end
	--¶Ô»°Éú³É
	Say(Npc_name.."Ng­¬i muèn kİch ho¹t <color=yellow>Linh tİnh<color> g×? Nhí: NÕu kh«ng thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color>, <color=yellow>Linh tİnh<color> còng kh«ng thÓ ph¸t huy t¸c dông.",
	4,
		"Linh tİnh t¨ng sinh lùc tèi ®a/#add_ability_dia(1)",
		"Linh tİnh t¨ng thuéc tİnh l­u ph¸i/#add_ability_dia(3)",
		"Linh tİnh t¨ng toµn thuéc tİnh/#add_ability_dia(2)",
		"Ta muèn suy nghÜ l¹i"
	)
end
--»½ĞÑ¶Ô»°
function add_ability_dia(ability_diff)
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	local aptitude_level = aptitude_level_rtn()
	if aptitude_level == 0 then
		return
	end
	if ability_diff == 1 then
		Say(Npc_name.."Linh tİnh muèn kİch ho¹t lµ: "..ability_cost_string_rtn(ability_diff).."Chó ı, nÕu Linh Ph¸ch mÊt ®i, Linh tİnh còng mÊt ®i! Tr­íc khi kİch ho¹t Linh tİnh vò khİ hiÖn t¹i, nhí t×m hiÓu th«ng tin Linh Ph¸ch, muèn kİch ho¹t kh«ng?",
		2,
		"Ta muèn kİch ho¹t/#add_ability_dtm(1)",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	elseif ability_diff == 2 then
		Say(Npc_name.."Linh tİnh muèn kİch ho¹t lµ: "..ability_cost_string_rtn(ability_diff).."Chó ı, nÕu Linh Ph¸ch mÊt ®i, Linh tİnh còng mÊt ®i! Tr­íc khi kİch ho¹t Linh tİnh vò khİ hiÖn t¹i, nhí t×m hiÓu th«ng tin Linh Ph¸ch, muèn kİch ho¹t kh«ng?",
		2,
		"Ta muèn kİch ho¹t/#add_ability_dtm(7)",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	else
		local player_route = GetPlayerRoute()
		Say(Npc_name.."Linh tİnh muèn kİch ho¹t lµ: "..ability_cost_string_rtn(ability_diff).."Chó ı, nÕu Linh Ph¸ch mÊt ®i, Linh tİnh còng mÊt ®i! Tr­íc khi kİch ho¹t Linh tİnh vò khİ hiÖn t¹i, nhí t×m hiÓu th«ng tin Linh Ph¸ch, xin chän ®iÓm thuéc tİnh l­u ph¸i muèn kİch ho¹t.",
		3,
		"Ta muèn t¨ng"..Tb_point_name[Tb_route_point_info[player_route][1]].." ®iÓm/#add_ability_dtm("..Tb_route_point_info[player_route][1]..")",
		"Ta muèn t¨ng"..Tb_point_name[Tb_route_point_info[player_route][2]].." ®iÓm/#add_ability_dtm("..Tb_route_point_info[player_route][2]..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	end
end
--ÁéÄÜÔö¼ÓÈ·ÈÏ
function add_ability_dtm(point_diff)
	--ÁéÄÜÇø·Ö
	local aptitude_diff = 3
	if point_diff == 1 then
		aptitude_diff = 1
	elseif point_diff == 7 then
		aptitude_diff = 2
	end
	--ÁéÄÜµÈ¼¶»î¶¯Çø
	local aptitude_level = aptitude_level_rtn()
	if aptitude_level == 0 then
		return
	elseif aptitude_level > 5 then
		aptitude_level = aptitude_level - 4
	end
	--²ÄÁÏĞ¯´ø¼ì²â
	if ability_cost_deal(1,aptitude_diff) ~= 1 then
		return
	end
	--²ÄÁÏÉ¾³ı¼ì²â
	if ability_cost_deal(2,aptitude_diff) ~= 1 then
		return
	end
	--ÁéÄÜÔö¼Ó
	if AddWeaponEffectAttribute(point_diff,aptitude_level) == 1 then
		Talk(1,"",Npc_name.."Chóc mõng kİch ho¹t Linh tİnh thµnh c«ng!")
		return
	else
		WriteLog("HiÖu øng vò khİ: Ng­êi ch¬i["..GetName().."]g¾n thªm "..aptitude_level.."CÊp "..aptitude_diff.."T¨ng Linh tİnh thÊt b¹i!")
	end
end
--ÁéÆÇµÈ¼¶»Øµ÷
function aptitude_level_rtn()
	--ÊÇ·ñĞ¯´øÁËÎäÆ÷
	local weapon_index = GetPlayerEquipIndex(2)
	if weapon_index == nil then
		Talk(1,"",Npc_name.."HiÖn kh«ng mang vò khİ, kh«ng thÓ thªm <color=yellow>Linh tİnh<color>!")
		return 0
	end
	--ÎäÆ÷ÊÇ·ñÒÑ¾­¸½ÁËÁéÆÇ
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"",Npc_name.."Vò khİ cÇn ph¶i thªm <color=yellow>Linh Ph¸ch<color> xong míi cã thÓ thªm <color=yellow>Linh tİnh<color>, "..Zgc_pub_sex_name().."h·y ®em vò khİ thªm <color=yellow>Linh Ph¸ch<color> råi quay l¹i!")
		return 0
	end
	--º³ÌìÌØÊâ´¦Àí
	if aptitude_name == "H¸m Thiªn" then
		return 5
	end
	--·µ»ØÁéÆÇµÈ¼¶
	for i = 1,getn(Tb_aptitude_info) do
		if Tb_aptitude_info[i][7] == aptitude_name then
			return Tb_aptitude_info[i][4]
		end
	end
	Talk(1,"",Npc_name.."Vò khİ cÇn ph¶i thªm <color=yellow>Linh Ph¸ch<color> xong míi cã thÓ thªm <color=yellow>Linh tİnh<color>, "..Zgc_pub_sex_name().."h·y ®em vò khİ thªm <color=yellow>Linh Ph¸ch<color> råi quay l¹i!")
	return 0
end
--ÁéÄÜĞèÒª²ÄÁÏ×Ö·û´®·µ»Ø
function ability_cost_string_rtn(deal_diff)
	--deal_diff:1ÎªÔö¼ÓÉúÃü£¬2ÎªÔö¼Óµ¥ÊôĞÔ£¬3ÎªÔö¼ÓÈ«ÊôĞÔ
	local aptitude_level = aptitude_level_rtn()
	local attribute_level_real = aptitude_level
	if attribute_level_real > 5 then
		attribute_level_real =  attribute_level_real - 4
	end
	local cost_string_rtn ="<color=yellow>"..Tb_lin_ability_info[deal_diff][1]..(Tb_lin_ability_info[deal_diff][2] + (Tb_lin_ability_info[deal_diff][3] * (attribute_level_real - 1))).."<color> ®iÓm, cÇn tiªu hao: "
	cost_string_rtn = cost_string_rtn.."<color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> vµng; "
	local mertiral_seq = 3
	if deal_diff == 2 then
		mertiral_seq = 5
	elseif deal_diff == 3 then
		mertiral_seq = 4
	end
	if Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level] ~= 0 then
		cost_string_rtn = cost_string_rtn.."<color=yellow>"..Tb_add_mertiral[mertiral_seq][4]..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>;"
	end
	return cost_string_rtn
end
--²ÄÁÏ¼ì²â
function ability_cost_deal(deal_flag,deal_diff)
	--deal_flag:1ÎªĞ¯´ø¼ì²â£¬2ÎªÉ¾³ı¼ì²â
	--deal_diff:1ÎªÔö¼ÓÉúÃü£¬2ÎªÔö¼ÓÈ«ÊôĞÔ£¬3ÎªÔö¼Óµ¥ÊôĞÔ
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	local mertiral_seq = 3
	if deal_diff == 2 then
		mertiral_seq = 5
	elseif deal_diff == 3 then
		mertiral_seq = 4
	end
	--ÁéÆÇµÈ¼¶»ñÈ¡
	local aptitude_level = aptitude_level_rtn()
	--²ÄÁÏĞ¯´ø¼ì²â
	if deal_flag == 1 then
		if GetCash() < (Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff]*10000)  then
			Talk(1,"", Npc_name.."Ng­¬i mang <color=yellow>tiÒn vµng<color> kh«ng ®ñ <color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> vµng")
			return 0
		end
		if GetItemCount(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3]) < Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level] then
			Talk(1,"",Npc_name.."Ng­¬i mang <color=yellow>"..Tb_add_mertiral[mertiral_seq][4].."<color> kh«ng ®ñ <color=yellow>"..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>.")
			return 0
		end
	else
		if Pay(Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff]*10000) ~= 1  then
			Talk(1,"", Npc_name.."Ng­¬i mang <color=yellow>tiÒn vµng<color> kh«ng ®ñ <color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> vµng")
			return 0
		end
		if DelItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level]) ~= 1 then
			Talk(1,"",Npc_name.."Ng­¬i mang <color=yellow>"..Tb_add_mertiral[mertiral_seq][4].."<color> kh«ng ®ñ <color=yellow>"..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>.")
			return 0
		end
	end
	return 1
end
--=====================ÁéÆÇÉ¾³ı==================
function soul_del()
	--ÊÇ·ñ¸½ÁËÁéÆÇ
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"main",Npc_name.."§õng ®ïa víi bÇn ®¹o, ta kh«ng thÓ thÊy ®­îc Linh Ph¸ch trªn vò khİ cña ng­¬i.")
		return
	end
	--´¢ÎïÏäÊÇ·ñËø¶¨
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."R­¬ng chøa ®å ®· khãa, më khãa tr­íc råi míi ®Õn bÇn ®¹o th­¬ng l­îng xãa bá Linh Ph¸ch!")
		return
	end
	--ÎäÆ÷ÊÇ·ñËø¶¨
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main",Npc_name.."<color=yellow>Vò khİ<color> cña b¹n ®· bŞ khãa, më khãa tr­íc råi míi ®Õn bÇn ®¹o th­¬ng l­îng xãa bá Linh Ph¸ch!")
		return
	end
	Say(Npc_name.."Muèn xáa bá Linh Ph¸ch <color=yellow>"..aptitude_name.."<color> kh«ng? NÕu xãa Linh tİnh còng mÊt theo! Ng­¬i cã thÓ suy nghÜ kü!",
		2,
		"Ta suy nghÜ råi/soul_del_dtm",
		"Kh«ng, ta muèn nghÜ l¹i/end_dialog"
	)
end
--ÔÙ´ÎÈ·ÈÏ
function soul_del_dtm()
	Say(Npc_name.."§©y lµ chuyÖn lín, ®õng tr¸ch bÇn ®¹o nãi nhiÒu. Ng­¬i ®· h¹ quyÕt t©m ch­a?",
	2,
	"Ta thËt muèn xãa bá/soul_del_deal",
	"Kh«ng, ta ®æi ı råi/end_dialog"
	)
end
--É¾³ı²Ù×÷
function soul_del_deal()
	--ÎäÆ÷ÊÇ·ñ¸ü»»
	if weapon_cha_chk() ~= 1 then
		return
	end
	--ÊÇ·ñ¸½ÁËÁéÆÇ
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"main",Npc_name.."§õng ®ïa víi bÇn ®¹o, ta kh«ng thÓ thÊy ®­îc <color=yellow>Linh Ph¸ch<color> trªn vò khİ cña ng­¬i.")
		return
	end
	--´¢ÎïÏäÊÇ·ñËø¶¨
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."R­¬ng chøa ®å ®· khãa, më khãa tr­íc råi míi ®Õn bÇn ®¹o th­¬ng l­îng xãa bá <color=yellow>Linh Ph¸ch<color>!")
		return
	end
	--ÎäÆ÷ÊÇ·ñËø¶¨
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main",Npc_name.."<color=yellow>Vò khİ<color> cña b¹n ®· bŞ khãa, më khãa tr­íc råi míi ®Õn bÇn ®¹o th­¬ng l­îng xãa bá Linh Ph¸ch!")
		return
	end
	--É¾³ı´¦Àí
	UnbindWeaponEffect()
end
--==================ÁéÄÜÉ¾³ı=====================
function ability_del()
	local ability_num,tb_ability_id = GetWeaponEffectAttributes()
	if ability_num == 0 then
		Talk(1,"",Npc_name.."§õng ®ïa víi bÇn ®¹o, ta kh«ng thÓ thÊy ®­îc <color=yellow>Linh tİnh<color> trªn vò khİ cña ng­¬i.")
		return
	end
--´¢ÎïÏäÊÇ·ñËø¶¨
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."R­¬ng chøa ®å ®· khãa, më khãa tr­íc råi míi ®Õn bÇn ®¹o th­¬ng l­îng xãa bá <color=yellow>Linh tİnh<color>!")
		return
	end

	Say(Npc_name.."Muèn xãa <color=yellow>Linh tİnh<color> trªn vò khİ hiÖn t¹i kh«ng?",
	2,
	"Ta muèn xãa/ability_del_dtm",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--É¾³ıÈ·ÈÏ
function ability_del_dtm()
	--ÎäÆ÷ÊÇ·ñ¸ü»»
	if weapon_cha_chk() ~= 1 then
		return
	end
	local ability_num,tb_ability_id = GetWeaponEffectAttributes()
	for i = 1 ,getn(tb_ability_id)  do
		RemoveWeaponEffectAttribute(tb_ability_id[i].id)
		WriteLog("Linh tİnh kÌm theo: Ng­êi ch¬i["..GetName().."]®· xãa "..tb_ability_id[i].id.."Linh Ph¸ch!")
	end
	Msg2Player("B¹n ®· xãa thµnh c«ng Linh tİnh trªn vò khİ hiÖn t¹i!")
end
--==================ÁéÆÇºÍÁéÄÜĞÅÏ¢===============
function soul_info()
	local tb_dia = {
		"Lµm sao kİch ho¹t Linh Ph¸ch vµ Linh tİnh/Say1_4_1",
		"§¼ng cÊp, mµu s¾c, ®iÒu kiÖn kİch ho¹t Linh Ph¸ch/#Say1_4_2(1)",
		"VËt liÖu cÇn ®Ó kİch ho¹t Linh Ph¸ch/Say1_4_3",
		"TrŞ sè, thuéc tİnh, ®¼ng cÊp Linh tİnh/Say1_4_4",
		"VËt liÖu cÇn ®Ó kİch ho¹t Linh tİnh/Say1_4_5",
		"Ta muèn tra ®iÓm tİch lòy tiªu dïng cña m×nh/Say_1_4_6",
		"Kh«ng t×m hiÓu/main"
	}
	Say(Npc_name.."Ng­¬i muèn t×m hiÓu g×?",
		getn(tb_dia),
		tb_dia
	)
end
--¶Ô»°1-4-1
function Say1_4_1()
	Talk(1,"soul_info",Npc_name.."<color=yellow>Linh Ph¸ch<color> lµ 1 lo¹i hµo quan cña vò khİ, chØ khi t­ chÊt chñ nh©n ®¹t ®Õn ®iÒu kiÖn nhÊt ®Şnh míi cã thÓ kİch ho¹t. NÕu sau khi kİch ho¹t t­ chÊt kh«ng ®¸p øng ®ñ yªu cÇu <color=yellow>Linh Ph¸ch<color> n÷a, sÏ kh«ng thÓ kİch ho¹t, chØ cã t­ c¸ch cã thÓ ®¸p øng yªu cÇu cña <color=yellow>Linh Ph¸ch<color> lÇn n÷a míi cã thÓ kİch ho¹t. <color=yellow>Linh tİnh<color> vµ <color=yellow>Linh Ph¸ch<color> t­¬ng sinh, cÊp <color=yellow>Linh tİnh<color> t­¬ng øng cÊp <color=yellow>Linh Ph¸ch<color>. ChØ khi kİch ho¹t <color=yellow>Linh Ph¸ch<color> th× <color=yellow>Linh tİnh<color> míi cã t¸c dông. <color=yellow>Linh Ph¸ch<color> chØ cã thÓ duy tr× <color=red>30<color> ngµy, <color=yellow>Linh Ph¸ch<color> mÊt ®i, <color=yellow>Linh tİnh<color> còng sÏ mÊt ®i. Lóc ®ã t×m bÇn ®¹o kİch ho¹t l¹i. Ngoµi ra, khi ®é bÒn vò khİ lµ <color=red>0<color>, Linh Ph¸ch còng mÊt ®i.")
end
function Say1_4_2(att_seq)
	local attitude_string = Npc_name.."§iÒu kiªn t­¬ng øng Linh Ph¸ch vò khİ kh¸c nhau nh­ sau:"
	local for_num_min = ((att_seq -1) * 5 +1)
	local for_num_max = min((for_num_min + 4),getn(Tb_aptitude_info))
	for i = for_num_min ,for_num_max do
		attitude_string =attitude_string.. "\n<color=yellow>"..Tb_aptitude_info[i][3].."<color>: Linh lùc "..Tb_aptitude_info[i][5].." ®iÓm, ®iÒu kiÖn "..Tb_aptitude_info[i][6]..", thêi h¹n "..Tb_aptitude_info[i][8].." ngµy."
	end
	if for_num_max == getn(Tb_aptitude_info) then
		attitude_string = attitude_string.."\n<color=red>H¸m Thiªn, chïm s¸ng sÊm sĞt tİm lam (Linh Ph¸ch cÊp 5)<color>: Yªu cÇu trŞ cung cÊp cho Linh Ph¸ch ®¹t ®Õn hoÆc v­ît qua <color=red>26<color>, thêi h¹n 30 ngµy!"
		Talk(1,"soul_info",attitude_string)
	else
		Talk(1,"#Say1_4_2("..(att_seq+1)..")",attitude_string)
	end
end
function Say1_4_3()
	local mertiral_needs_string = ""
	for i = 1,5 do
		mertiral_needs_string = mertiral_needs_string.."\n<color=yellow>"..i.."<color> cÊp: "
		mertiral_needs_string = mertiral_needs_string ..Tb_aptitude_cost_info[Sever_diff][i][1].." Kim     "
		if Tb_aptitude_cost_info[Sever_diff][i][2] ~= 0 then
			mertiral_needs_string = mertiral_needs_string .."<color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][i][3]][4].."<color><color=red>"..Tb_aptitude_cost_info[Sever_diff][i][2].."<color> c¸i"
		end
	end
	Talk(1,"soul_info",Npc_name.."VËt liÖu ®Ó kİch ho¹t Linh Ph¸ch nghe nãi ®Òu r¬i vµo tay vµi cao thñ T©y Vùc, vËt quı nhÊt lµ <color=red>ThÊt HuyÔn L­u V¨n<color> r¬i vµo tay <color=green>Lı Nguyªn Kh¸nh<color>, khi t×m kiÕm th× cÇn cÈn thËn! Sè l­îng nh­ sau "..mertiral_needs_string)
end
function Say1_4_4()
	Talk(1,"soul_info",Npc_name.."Sau khi thªm <color=yellow>Linh tİnh<color> vµo vò khİ, thuéc tİnh t­¬ng øng t¨ng nh­ sau\nT¨ng <color=yellow>sinh lùc<color>: 500/1000/1500/2000/2500 ®iÓm\nT¨ng <color=yellow>thuéc tİnh ®¬n<color>: 6/12/18/24/30 ®iÓm\nT¨ng <color=yellow>toµn thuéc tİnh<color>: 3/6/9/12/15 ®iÓm")
end
function Say1_4_5()
	local talk_string =" \n<color=yellow>§é NguyÖt ThÇn Sa<color>: ¶i T©y B¾c, t¨ng <color=yellow>sinh lùc tèi ®a<color>, tiªu hao theo ®¼ng cÊp "..Tb_ability_magic_goods_cost_num[Sever_diff][3][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][5]
	talk_string =talk_string.." \n<color=yellow>PhÇn Quang ThÇn Sa<color>: ®æi ë mËt thÊt s­ m«n, t¨ng <color=yellow>thuéc tİnh l­u ph¸i<color>, tiªu hao theo ®¼ng cÊp "..Tb_ability_magic_goods_cost_num[Sever_diff][4][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][5]
	talk_string =talk_string.." \n<color=yellow>Tr¶m Tinh ThÇn Sa<color>: ®æi ®iÓm tİchlòy chiÕn tr­êng, t¨ng <color=yellow>toµn thuéc tİnh<color>, tiªu hao theo ®¼ng cÊp "..Tb_ability_magic_goods_cost_num[Sever_diff][5][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][5]
	Talk(1,"soul_info",Npc_name.."VËt liÖu ®Æc biÖt cÇn lµ: "..talk_string)
end
--Ïû·Ñ»ı·Ö²éÑ¯
function Say_1_4_6()
	local consume_cent = GetTask(IB_cost_num)
	if consume_cent == nil then
		consume_cent = 0 
	end
	Talk(1,"",Npc_name.."§iÓm tİch lòy tiªu dïng hiÖn t¹i lµ <color=yellow>"..consume_cent.."<color>! ChØ cÇn mua t¹i Ngù C¸c lµ ®­îc tÆng!"..Tb_aptitude_info[getn(Tb_aptitude_info)][6] .."Cã thÓ dïng <color=yellow>"..Tb_aptitude_info[getn(Tb_aptitude_info)][8] .."<color> ngµy! <color=red>Chó ı: ë Ngù C¸c dïng  "..Tb_ib_money[Sever_diff].." cã thÓ nhËn ®­îc 1 ®iÓm tİch lòy.<color>")
end

tUpgradableClothes =
{
				{0,108,510},
				{0,109,510},
				{0,110,510},
				{0,108,511},
				{0,109,511},
				{0,110,511},
				{0,108,513},
				{0,109,513},
				{0,110,513},
				{0,108,512},
				{0,109,512},
				{0,110,512},	
				{0,108,207},
				{0,108,208},
				{0,108,209},
				{0,108,210},
				{0,108,211},
				{0,108,212},
				{0,108,213},
				{0,108,214},
				{0,108,215},
				{0,108,216},
				{0,108,217},
				{0,108,218},	
				{0,109,281},
				{0,109,282},
				{0,109,283},
				{0,109,284},
				{0,109,285},
				{0,109,286},
				{0,109,287},
				{0,109,288},
				{0,109,289},
				{0,109,290},
				{0,109,291},
				{0,109,292},
				{0,110,281},
				{0,110,282},
				{0,110,283},
				{0,110,284},
				{0,110,285},
				{0,110,286},
				{0,110,287},
				{0,110,288},
				{0,110,289},
				{0,110,290},
				{0,110,291},
				{0,110,292},	
				{0,108,199},
				{0,108,200},
				{0,108,201},
				{0,108,202},
				{0,109,277},
				{0,109,278},
				{0,109,279},
				{0,109,280},
				{0,110,89},
				{0,110,90},
				{0,110,91},
				{0,110,92},	
				{0,108,195},
				{0,108,196},
				{0,108,197},
				{0,108,198},
				{0,109,255},
				{0,109,256},
				{0,109,257},
				{0,109,258},
				{0,110,85},
				{0,110,86},
				{0,110,87},
				{0,110,88},
				{0,108,139},
				{0,109,185},
				{0,110,81},
				{0,108,140},
				{0,109,186},
				{0,110,82},
				{0,108,141},
				{0,109,187},
				{0,110,83},
				{0,108,142},
				{0,109,188},
				{0,110,84},
				{0,108,30001},
				{0,108,30002},
				{0,108,30003},
				{0,108,30004},
				{0,108,30005},
				{0,108,30006},
				{0,108,30007},
				{0,108,30008},
				{0,108,30009},
				{0,108,30010},
				{0,108,30011},
				{0,108,30012},
				{0,109,30001},
				{0,109,30002},
				{0,109,30003},
				{0,109,30004},
				{0,109,30005},
				{0,109,30006},
				{0,109,30007},
				{0,109,30008},
				{0,109,30009},
				{0,109,30010},
				{0,109,30011},
				{0,109,30012},
				{0,110,30001},
				{0,110,30002},
				{0,110,30003},
				{0,110,30004},
				{0,110,30005},
				{0,110,30006},
				{0,110,30007},
				{0,110,30008},
				{0,110,30009},
				{0,110,30010},
				{0,110,30011},
				{0,110,30012},
				{0, 108, 109},
				{0, 108, 110},
				{0, 108, 111},
				{0, 108, 112},
				{0, 109, 109},
				{0, 109, 110},
				{0, 109, 111},
				{0, 109, 112},
				{0, 110, 73},
				{0, 110, 74},
				{0, 110, 75},
				{0, 110, 76},
				{0, 108, 1},
				{0, 108, 2},
				{0, 108, 3},
				{0, 108, 4},
				{0, 108, 5},
				{0, 108, 6},
				{0, 108, 7},
				{0, 108, 8},
				{0, 108, 9},
				{0, 108, 10},
				{0, 108, 11},
				{0, 108, 12},
				{0, 108, 13},
				{0, 108, 14},
				{0, 108, 15},
				{0, 108, 16},
				{0, 108, 17},
				{0, 108, 18},
				{0, 108, 518},
				{0, 108, 522},
				{0, 108, 526},
				{0, 108, 19},
				{0, 108, 20},
				{0, 108, 21},
				{0, 108, 22},
				{0, 108, 23},
				{0, 108, 24},
				{0, 108, 25},
				{0, 108, 26},
				{0, 108, 27},
				{0, 108, 28},
				{0, 108, 29},
				{0, 108, 30},
				{0, 108, 31},
				{0, 108, 32},
				{0, 108, 33},
				{0, 108, 34},
				{0, 108, 35},
				{0, 108, 36},
				{0, 108, 519},
				{0, 108, 523},
				{0, 108, 527},
				{0, 108, 37},
				{0, 108, 38},
				{0, 108, 39},
				{0, 108, 40},
				{0, 108, 41},
				{0, 108, 42},
				{0, 108, 43},
				{0, 108, 44},
				{0, 108, 45},
				{0, 108, 46},
				{0, 108, 47},
				{0, 108, 48},
				{0, 108, 49},
				{0, 108, 50},
				{0, 108, 51},
				{0, 108, 52},
				{0, 108, 53},
				{0, 108, 54},
				{0, 108, 520},
				{0, 108, 524},
				{0, 108, 528},
				{0, 108, 55},
				{0, 108, 56},
				{0, 108, 57},
				{0, 108, 58},
				{0, 108, 59},
				{0, 108, 60},
				{0, 108, 61},
				{0, 108, 62},
				{0, 108, 63},
				{0, 108, 64},
				{0, 108, 65},
				{0, 108, 66},
				{0, 108, 67},
				{0, 108, 68},
				{0, 108, 69},
				{0, 108, 70},
				{0, 108, 71},
				{0, 108, 72},
				{0, 108, 521},
				{0, 108, 525},
				{0, 108, 529},
				{0, 109, 1},
				{0, 109, 2},
				{0, 109, 3},
				{0, 109, 4},
				{0, 109, 5},
				{0, 109, 6},
				{0, 109, 7},
				{0, 109, 8},
				{0, 109, 9},
				{0, 109, 10},
				{0, 109, 11},
				{0, 109, 12},
				{0, 109, 13},
				{0, 109, 14},
				{0, 109, 15},
				{0, 109, 16},
				{0, 109, 17},
				{0, 109, 18},
				{0, 109, 518},
				{0, 109, 522},
				{0, 109, 526},
				{0, 109, 19},
				{0, 109, 20},
				{0, 109, 21},
				{0, 109, 22},
				{0, 109, 23},
				{0, 109, 24},
				{0, 109, 25},
				{0, 109, 26},
				{0, 109, 27},
				{0, 109, 28},
				{0, 109, 29},
				{0, 109, 30},
				{0, 109, 31},
				{0, 109, 32},
				{0, 109, 33},
				{0, 109, 34},
				{0, 109, 35},
				{0, 109, 36},
				{0, 109, 519},
				{0, 109, 523},
				{0, 109, 527},
				{0, 109, 37},
				{0, 109, 38},
				{0, 109, 39},
				{0, 109, 40},
				{0, 109, 41},
				{0, 109, 42},
				{0, 109, 43},
				{0, 109, 44},
				{0, 109, 45},
				{0, 109, 46},
				{0, 109, 47},
				{0, 109, 48},
				{0, 109, 49},
				{0, 109, 50},
				{0, 109, 51},
				{0, 109, 52},
				{0, 109, 53},
				{0, 109, 54},
				{0, 109, 520},
				{0, 109, 524},
				{0, 109, 528},
				{0, 109, 55},
				{0, 109, 56},
				{0, 109, 57},
				{0, 109, 58},
				{0, 109, 59},
				{0, 109, 60},
				{0, 109, 61},
				{0, 109, 62},
				{0, 109, 63},
				{0, 109, 64},
				{0, 109, 65},
				{0, 109, 66},
				{0, 109, 67},
				{0, 109, 68},
				{0, 109, 69},
				{0, 109, 70},
				{0, 109, 71},
				{0, 109, 72},
				{0, 109, 521},
				{0, 109, 525},
				{0, 109, 529},
				{0, 110, 1},
				{0, 110, 2},
				{0, 110, 3},
				{0, 110, 4},
				{0, 110, 5},
				{0, 110, 6},
				{0, 110, 7},
				{0, 110, 8},
				{0, 110, 9},
				{0, 110, 10},
				{0, 110, 11},
				{0, 110, 12},
				{0, 110, 13},
				{0, 110, 14},
				{0, 110, 15},
				{0, 110, 16},
				{0, 110, 17},
				{0, 110, 18},
				{0, 110, 518},
				{0, 110, 522},
				{0, 110, 526},
				{0, 110, 19},
				{0, 110, 20},
				{0, 110, 21},
				{0, 110, 22},
				{0, 110, 23},
				{0, 110, 24},
				{0, 110, 25},
				{0, 110, 26},
				{0, 110, 27},
				{0, 110, 28},
				{0, 110, 29},
				{0, 110, 30},
				{0, 110, 31},
				{0, 110, 32},
				{0, 110, 33},
				{0, 110, 34},
				{0, 110, 35},
				{0, 110, 36},
				{0, 110, 519},
				{0, 110, 523},
				{0, 110, 527},
				{0, 110, 37},
				{0, 110, 38},
				{0, 110, 39},
				{0, 110, 40},
				{0, 110, 41},
				{0, 110, 42},
				{0, 110, 43},
				{0, 110, 44},
				{0, 110, 45},
				{0, 110, 46},
				{0, 110, 47},
				{0, 110, 48},
				{0, 110, 49},
				{0, 110, 50},
				{0, 110, 51},
				{0, 110, 52},
				{0, 110, 53},
				{0, 110, 54},
				{0, 110, 520},
				{0, 110, 524},
				{0, 110, 528},
				{0, 110, 55},
				{0, 110, 56},
				{0, 110, 57},
				{0, 110, 58},
				{0, 110, 59},
				{0, 110, 60},
				{0, 110, 61},
				{0, 110, 62},
				{0, 110, 63},
				{0, 110, 64},
				{0, 110, 65},
				{0, 110, 66},
				{0, 110, 67},
				{0, 110, 68},
				{0, 110, 69},
				{0, 110, 70},
				{0, 110, 71},
				{0, 110, 72},
				{0, 110, 521},
				{0, 110, 525},
				{0, 110, 529},				
}

tUpgradeClothCost =
{
	[1] = {3, 100, 1000000},
	[2] = {3, 150, 1000000},
	[3] = {3, 200, 1000000},
}

function upgrade_clothes()
	local tSay = {}
	tinsert(tSay, "Ta muèn n©ng cÊp M·o Ngo¹i Trang/#upgrade_choose_1(6)")
	tinsert(tSay, "Ta muèn n©ng cÊp Th­îng Y Ngo¹i Trang/#upgrade_choose_1(7)")
	tinsert(tSay, "Ta muèn n©ng cÊp H¹ Y Ngo¹i Trang/#upgrade_choose_1(8)")
	tinsert(tSay, "§Ó ta suy nghÜ l¹i/end_dialog")
	
	Say(Npc_name.."C¸c h¹ h·y chän lo¹i ngo¹i trang muèn n©ng cÊp:", getn(tSay), tSay)
end

function upgrade_choose_1(nCloth)
	local tSay = {}
	tinsert(tSay, format("Ta muèn n©ng cÊp Søc M¹nh/#upgrade_choose_2(%d, 246)",nCloth))
	tinsert(tSay, format("Ta muèn n©ng cÊp Néi C«ng/#upgrade_choose_2(%d, 249)",nCloth))
	tinsert(tSay, format("Ta muèn n©ng cÊp G©n Cèt/#upgrade_choose_2(%d, 245)",nCloth))
	tinsert(tSay, format("Ta muèn n©ng cÊp Th©n Ph¸p/#upgrade_choose_2(%d, 247)",nCloth))
	tinsert(tSay, format("Ta muèn n©ng cÊp Linh Ho¹t/#upgrade_choose_2(%d, 248)",nCloth))
	tinsert(tSay, "§Ó ta suy nghÜ l¹i/end_dialog")
	
	Say(Npc_name.."C¸c h¹ muèn n©ng cÊp thuéc tİnh nµo:", getn(tSay), tSay)
end

function upgrade_choose_2(nCloth, nType1)
	local tSay = {}
	tinsert(tSay, format("CÊp 1 - 5 ®iÓm (CÇn 3 §é NguyÖt ThÇn Sa, 100 ®iÓm s­ m«n, 100 vµng)/#confirm_upgrade_cloth(%d, %d, 1)",nCloth,nType1))
	tinsert(tSay, format("CÊp 2 - 10 ®iÓm (CÇn 3 §é NguyÖt ThÇn Sa, 150 ®iÓm s­ m«n, 100 vµng)/#confirm_upgrade_cloth(%d, %d, 2)",nCloth,nType1))
	tinsert(tSay, format("CÊp 3 - 15 ®iÓm (CÇn 3 §é NguyÖt ThÇn Sa, 200 ®iÓm s­ m«n, 100 vµng)/#confirm_upgrade_cloth(%d, %d, 3)",nCloth,nType1))
--	tinsert(tSay, format("CÊp 4 - 20 ®iÓm (CÇn 3 §é NguyÖt ThÇn Sa, 250 ®iÓm s­ m«n, 1 Tö Kim Hång Bao)/#confirm_upgrade_cloth(nCloth, nType1, 4)",nCloth,nType1))
	tinsert(tSay, "§Ó ta suy nghÜ l¹i/end_dialog")
	
	Say(Npc_name.."H·y chän lo¹i n©ng cÊp::", getn(tSay), tSay)
end

function confirm_upgrade_cloth(nCloth, nType1, nType2)
	local nG, nD, nP  = GetPlayerEquipInfo(nCloth)
	local cloth_index = GetPlayerEquipIndex(nCloth)

	if  cloth_index == 0 then
		Talk(1,"",Npc_name.."H·y trang bŞ ngo¹i trang tr­íc råi ®Õn t×m ta!")
		return
	end
	
	local nCheck = 0
	for i = 1, getn(tUpgradableClothes) do
		if nG  == tUpgradableClothes[i][1] and nD == tUpgradableClothes[i][2] and nP == tUpgradableClothes[i][3] then
			nCheck = 1
			break
		end
	end
	if nCheck == 0 then
		Talk(1,"",Npc_name.."Ngo¹i trang n©ng cÊp kh«ng phï hîp!")
		return
	end
	
	local cloth_name = GetItemName(cloth_index)
	if AbradeItem(cloth_index, 0) == 0 then
		Talk(1,"", Npc_name.."  "..cloth_name.." ®· hÕt ®é bÒn, kh«ng thÓ n©ng cÊp!")
		return
	end

	if GetPlayerRoute() == 0 then
		Talk(1,"", Npc_name.."Ch­a gia nhËp hÖ ph¸i kh«ng thÓ n©ng cÊp ngo¹i trang!")
		return
	end

	if GetTask(336) < 10000 then
		Talk(1,"",Npc_name.."Kh«ng ®ñ ®iÓm s­ m«n ®Ó n©ng cÊp!")
		return
	end
	
	if GetLevel() < 79 then
		Talk(1,"",Npc_name.."CÊp 79 trë lªn míi cã thÓ n©ng cÊp ngo¹i trang!")
		return
	end
	
	if GetCash()  < tUpgradeClothCost[nType2][3] then
		Talk(1,"",Npc_name.."Kh«ng ®ñ ng©n l­îng ®Ó n©ng cÊp!")
		return
	end
	
	if GetItemCount(2, 1, 3332) <  tUpgradeClothCost[nType2][1] then
		Talk(1,"", "Kh«ng ®ñ §é NguyÖt ThÇn Sa ®Ó n©ng cÊp")
		return
	end
	
	local nCustomExpire = 30 * 24 * 3600
	local nExpire = GetItemExpireTime(cloth_index)
	if nExpire <= 0 or nExpire == nil then
		nExpire = nCustomExpire
	end
	UnEquipAtPosition(nCloth)
	if DelItemByIndex(cloth_index, -1) == 1 and DelItem(2, 1, 3332,  tUpgradeClothCost[nType2][1]) == 1 then
		Pay(tUpgradeClothCost[nType2][3])
		SetTask(336, GetTask(336) - tUpgradeClothCost[nType2][2])
		gf_AddItemEx2({nG, nD, nP, 1, 1, nType2, nType1}, cloth_name, "Nang cap ngoai trang Uan Linh", "n©ng cÊp ®­îc", nExpire)
	else
		Talk(1,"", Npc_name.."N©ng cÊp thÊt b¹i!")
		return
	end	
end

function soul_upgrade()
	local tSay = {}
	
	tinsert(tSay, "Ta muèn kİch ho¹t Danh Tóc/#confirm_soul_upgrade(1)")
	tinsert(tSay, "Ta muèn kİch ho¹t §µo Lı/#confirm_soul_upgrade(2)")
	tinsert(tSay, "Ta muèn kİch ho¹t TuÊn DËt/#confirm_soul_upgrade(3)")
	tinsert(tSay, "Ta muèn kİch ho¹t Ch­íc NhËt/#confirm_soul_upgrade(4)")
	tinsert(tSay, "Ta muèn kİch ho¹t B¸ch ChiÕn/#confirm_soul_upgrade(5)")
	tinsert(tSay, "§Ó ta suy nghÜ l¹i/end_dialog")
	
	Say(Npc_name.."Kh«ng thÓ kİch ho¹t nhiÒu <color=yellow>Linh Ph¸ch<color>, ng­¬i chØ cã thÓ kİch ho¹t 1 <color=yellow>Linh Ph¸ch<color> cho 1 vò khİ. Chó ı: khi ®é bÒn vò khİ lµ <color=yellow>0<color> hoÆc <color=yellow>hÕt h¹n sau 7 ngµy<color>, Linh Ph¸ch sÏ bŞ mÊt, ng­¬i cÇn ®Õn chç ta ®Ó kİch ho¹t Linh Ph¸ch l¹i. Ng­¬i muèn kİch ho¹t Linh Ph¸ch nµo?", getn(tSay), tSay)
end

function confirm_soul_upgrade(nType)
	if GetPlayerRoute() == 0 or GetLevel() < 73 or gf_Check55MaxSkill() == 0 then
		Talk(1,"", Npc_name.."§¹i hiÖp cÇn ph¶i gia nhËp m«n ph¸i, ®¼ng cÊp 73 trë lªn vµ ®· th«ng th¹o vâ c«ng cÊp 55 míi cã thÓ Ğp Linh Ph¸ch cho vò khİ!")
		return
	end
	if GetItemCount(2,1,30230) < 70 or GetCash() < 2000000 then
		Talk(1,"", Npc_name.."§¹i hiÖp cÇn ph¶i mang ®ñ 70 vËt phÈm Xu vµ 200 vµng ®Õn míi cã thÓ Ğp Linh Ph¸ch cho vò khİ!")
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H·y trang bŞ vò khİ tr­íc råi ®Õn t×m ta!")
		return
	end
	local weapon_name = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	if AbradeItem(weapon_index, 0) == 0 then
		Talk(1,"",Npc_name.."  "..weapon_name.." ®· hÕt ®é bÒn, kh«ng thÓ kİch ho¹t <color=yellow>Linh Ph¸ch<color>!")
		return
	end
	
	local tSoulType =
	{
		[1] = "Danh Tóc",
		[2] = "§µo Lı",
		[3] = "TuÊn DËt",
		[4] = "Ch­íc NhËt",
		[5] = "B¸ch ChiÕn",
	}
	
	if DelItem(2,1,30230, 70) == 1 and Pay(2000000) == 1 then
		BindWeaponEffect(tSoulType[nType], 7 * 24 * 3600)
		Talk(1,"", Npc_name.."Chóc mõng ®¹i hiÖp ®· Ğp Linh Ph¸ch thµnh c«ng cho "..weapon_name.."!")
	end
end