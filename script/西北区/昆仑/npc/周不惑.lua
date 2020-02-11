-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII À¥ÂØNPCÖÜ²»»óScript
-- By StarryNight
-- 2007/08/16 AM 10:26

-- ÄÜ×öÕÆÃÅÓÖÈçºÎ¡­¡­

-- ======================================================
--´å³¤2009-3-12Ôö¼ÓÊµÖÊ¶«Î÷
--»¹Ã»ÓĞ×ö²ß»®NB
-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>Chu BÊt HoÆc<color>: "
PLAYER_NAME = "<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!"
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
KUN_FACTION_TASK_FINISH = 5

function main()
	local dia_sel = {
		"Nguån gèc C«n L«n/say1_1",
		"Vâ c«ng C«n L«n/say1_2",
		"§iÒu kiÖn nhËp m«n/say1_3",
		--"ÎÒÒª¼ÓÈëÀ¥ÂØ/say1_4",
		"Ta muèn lµm nhiÖm vô S­ M«n/#ftask_repeat_main(8)",
		--"±Õ¹ØĞŞÁ¶/#practice_main(8)",
		"Ta dù ®Şnh thµnh th©n nªn muèn xuÊt s­ /#faction_graduate(8)",
		"Chµo hái ch­ëng m«n/end_dialog",
	}
	Say(NPC_NAME.."C«n L«n sõng s÷ng, tiªn khİ bao quanh, lµ th¸nh ®Şa tu t©m d­ìng tİnh.",
		getn(dia_sel),dia_sel
	)
end;
--À¥ÂØÅÉÆğÔ´
function say1_1()
	Talk(3,"main",
		NPC_NAME.."Ph¸i ta ë T©y Vùc xa x«i İt khi vµo Trung Nguyªn. Do ®ã nh÷ng ph¸i kh¸c kh«ng hiÓu vÒ bæn ph¸i. Cho ®Õn khi ta ph¸i mét kú tµi tíi Trung Nguyªn lËp ®­îc uy danh hiÓn h¸ch, ph¸i ta míi ®­îc c¸c ®¹i m«n ph¸i chó ı.",
		NPC_NAME.."Tr­íc giê ph¸i ta lu«n Èn c­ chuyªn t©m tu hµnh, kh«ng tranh danh lîi thÕ tôc. Nh­ng mét khi xuÊt hiÖn yªu ma th× ph¶i hÕt søc diÖt trõ.",
		NPC_NAME.."Trung Nguyªn gÇn ®©y yªu ma hoµnh hµnh, nªn ®Ö tö trong ph¸i ®i kh¾p n¬i gi¸ng ma phôc yªu. Nh­ng c¸c m«n ph¸i kh¸c l¹i nghi ngê hµnh ®éng cña ph¸i ta, nªn bæn kh¸i kh«ng cã ®ång minh trong vâ l©m."
	)
end
--À¥ÂØÅÉÎä¹¦
function say1_2()
	Talk(3,"main",
		NPC_NAME.."Vâ häc bæn ph¸i cã 2 nh¸nh Thiªn S­ vµ KiÕm T«n. Thiªn S­ chia lµm 2 hÖ phong l«i. KiÕm T«n dïng khİ ngù kiÕm, theo ®uæi c¶nh giíi tèi cao nh©n kiÕm hîp nhÊt.",
		NPC_NAME.."Thiªn S­ l«i quyÕt uy lùc v« cïng, dïng ®Ó trõ ma phôc yªu, ®èi thñ muèn chèng l¹i ®­îc uy lùc cña nã ph¶i tiªu hao thªm néi lùc. NÕu bŞ thiªn l«i ®¸nh tróng dï lµ cao thñ còng ph¶i h«n mª. Phong quyÕt linh ho¹t, cã thÓ che giÊu b¶n th©n, l­ít ®i nh­ giã. Vâ häc bæn m«n vèn biÕn hãa ®a d¹ng, l¹i dïng phong quyÕt ®Ó t¨ng tèc b¶n th©n, cã thÓ gäi cuång phong, bao v©y ®Ó ®èi thñ kh«ng thÓ hµnh ®éng. KiÕm T«n cã thÓ luyÖn hãa linh kiÕm, dïng khİ ngù kiÕm, kiÕm thuËt tù nhiªn, lÊy nhanh ®¸nh chËm, chiÕm thÕ th­îng phong, KiÕm T«n tu luyÖn ®Õn c¶nh giíi nh©n kiÕm hîp nhÊt th× kiÕm chiªu hãa thµnh v« h×nh.",
		NPC_NAME.."Vâ c«ng <color=yellow>Thiªn S­<color> C«n L«n do <color=yellow>TÇn BÊt Trİ<color> truyÒn thô, cã thÓ häc ®­îc kü n¨ng trÊn ph¸i <color=yellow>V« Cùc Phong L«i QuyÕt<color>! Vâ c«ng <color=yellow>KiÕm T«n<color> C«n L«n do <color=yellow>V©n Hy Hßa<color> truyÒn thô, cã thÓ häc ®­îc kü n¨ng trÊn ph¸i <color=yellow>V¹n KiÕm Hãa Vò TrËn<color>!"
	)
end
--ÈëÃÅÌõ¼ş
function say1_3()
	Talk(1,"",NPC_NAME.."Vâ c«ng C«n L«n vèn <color=yellow>chØ truyÒn cho nam<color>, nªn bæn gi¸o chØ cho <color=yellow>nam<color> gia nhËp, nam nhi ch­a gia nhËp ph¸i kh¸c vµ kh«ng ph¶i ph¶n ®å ®Òu cã thÓ vµo.")
end
--ÎÒÒª¼ÓÈëÀ¥ÂØ
function say1_4()
	--µÈ¼¶ÅĞ¶Ï
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."CÊp kh«ng ®ñ, ®¹t cÊp <color=yellow>10<color> råi quay l¹i.")
		return
	end
	--ĞÔ±ğÅĞ¶Ï
	if GetSex() == 2 then
		Talk(1,"",NPC_NAME.."N÷ hiÖp thµnh t©m tíi C«n L«n häc ®¹o ph¸p, thËt ®¸ng khen, nh­ng vâ c«ng C«n L«n ta chØ truyÒn cho nam, ta kh«ng thÓ cho n÷ hiÖp gia nhËp ®­îc.")
		return
	end
	--±¾ÃÅÅĞ¶Ï
	if GetPlayerFaction() == KUN_FACTION_ID then
		Talk(1,"",NPC_NAME.."Ng­¬i ®· lµ ®Ö tö ph¸i C«n L«n, mau ®i luyÖn c«ng.")
		return
	end
	--Á÷ÅÉÅĞ¶Ï
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."ThiÕu hiÖp ®· cã m«n ph¸i, ta kh«ng thÓ nhËn.")
		return
	end
	--ÈëÃÅÈÎÎñÅĞ¶Ï
	local faction_task_step = without_other_factask(KUN_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."§· nhËn nhiÖm vô cña ph¸i kh¸c, kh«ng thÓ gia nhËp bæn ph¸i.")
		return
	elseif faction_task_step == KUN_FACTION_TASK_FINISH then
		Talk(4,"",
			NPC_NAME.."§Ö tö bæn m«n cÇn thanh t©m tŞnh khİ, tu th©n d­ìng ®øc, chuyªn t©m tu luyÖn.",
			PLAYER_NAME.."§Ö tù ph¶i nhí s­ huÊn, ch¨m chØ tu luyÖn.",
			NPC_NAME.."H·y t×m <color=green>TÇn BÊt Trİ<color> häc vâ c«ng, kü nghÖ <color=yellow>C«n L«n Thiªn S­<color> do «ng Êy truyÒn thô, sau ®ã lµm quen nh÷ng quy t¾c kh¸c.",
			PLAYER_NAME.."§Ö tö tu©n mÖnh."
		)
		TaskTip("§· gia nhËp C«n L«n Ph¸i")
		SetPlayerFaction(8)
		SetPlayerRoute(22)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],6)
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],1)
			TaskTip("§i t×m M· BÊt TiÒn ®èi tho¹i")
			Msg2Player("§i t×m M· BÊt TiÒn (197/203) ®èi tho¹i")
		end
		Talk(1,"",NPC_NAME.."C«n L«n sõng s÷ng, thanh tŞnh, lµ th¸nh ®Şa tu th©n d­ìng tİnh. Ai cã chİ ®Òu cã thÓ gia nhËp bæn ph¸i, chi tiÕt nhËp m«n do <color=yellow>M· BÊt TiÒn<color>(197/203) xö lı, chØ cÇn «ng Êy ®ång ı l·o phu sÏ cho ng­¬i gia nhËp.")
	end
end
--´¦Àíº¯Êı
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end
