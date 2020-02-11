-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII À¥ÂØNPCÂí²»Ç°Script
-- By StarryNight
-- 2007/08/16 AM 10:24

-- Õâ¸öÊÀ½çĞèÒª¾»»¯¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
NPC_NAME = "<color=green>M· BÊt TiÒn<color>: "
PLAYER_NAME = "<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!"
function main()
	if tGtTask:check_cur_task(139) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Vâ c«ng cña ta trong ph¸i kh«ng nhÊt còng nh× nh­ng tr­ëng m«n s­ huynh l¹i kh«ng chŞu nh­êng chøc tr­ëng m«n, thËt lµ tøc."},
		{"NÕu ta ®­îc lµm tr­ëng m«n nhÊt ®Şnh C«n L«n sÏ thµnh vâ l©m ®Ö nhÊt ®¹i ph¸i."},
		}
	local i = random(1,getn(strTalk));
	local n_task_step = GetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID])
	if n_task_step == 0 or GetPlayerFaction() == KUN_FACTION_ID then
		TalkEx("",strTalk[i]);
		return
	elseif n_task_step == 1 then
		Talk(6,"",
			NPC_NAME.."Ng­¬i kh«ng ph¶i ®Ö tö bæn m«n, t×m ta cã chuyÖn g×?",
			PLAYER_NAME.."Ta muèn gia nhËp <color=yellow>C«n L«n Ph¸i<color>, Chu Ch­ëng M«n b¶o ta ®Õn t×m ng­êi.",
			NPC_NAME.."Muèn vµo <color=yellow>C«n L«n Ph¸i<color> ph¶i qua ®­îc kh¶o nghiÖm cña ta ®·.",
			PLAYER_NAME.."§¹o tr­ëng cø c¨n dÆn, ta sÏ lµm theo.",
			NPC_NAME.."µ, ng­¬i ®Õn thËt ®óng lóc, gÇn ®©y t¹i hËu s¬n <color=yellow>Thiªn Nguyªn Th¸p<color> ®¸m <color=yellow>Hå Yªu<color> l¹i muèn ph¸ phong Ên cña Thiªn Nguyªn Ph¸p TrËn, cÇn dïng <color=yellow>Thiªn S­ Phï<color> ®Ó duy tr×, ng­¬i h·y t×m <color=green>Mai BÊt Dung<color> (195/204) lÊy mét tÊm.",
			PLAYER_NAME.."§­îc, ta sÏ ®i chuÈn bŞ."
		)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],2)
		TaskTip("T×m Mai BÊt Dung lÊy 1 Thiªn S­ Phï")
		Msg2Player("T×m Mai BÊt Dung (195/204) lÊy 1 Thiªn S­ Phï, råi giao cho M· BÊt TiÒn (197/203)")
		return
	elseif n_task_step == 2 and GetItemCount(2,0,779) == 1 then
		Talk(5,"",
			NPC_NAME.."§­îc l¾m, nh­ng ng­¬i ph¶i qua kh¶o nghiÖm 2 cña ta.",
			PLAYER_NAME.."……",
			NPC_NAME.."<color=yellow>C«n L«n Ph¸i<color> ta vèn chia 2 hÖ LuyÖn Thuèc vµ Thiªn S­, tiÕc r»ng LuyÖn Thuèc ®· thÊt truyÒn, chØ cßn l¹i Thiªn S­, ng­¬i muèn gia nhËp <color=yellow>C«n L«n Ph¸i<color> th× ph¶i cã can ®¶m ®èi mÆt víi yªu ma.",
			NPC_NAME.."Ng­¬i mang Thiªn S­ Phï nµy tíi hËu s¬n <color=yellow>Thiªn Nguyªn Th¸p<color> t×m <color=yellow>Thiªn Nguyªn Ph¸p TrËn<color> (197/194), d¸n <color=yellow>Thiªn S­ Phï<color> Th¹ch Trô, ph¸p trËn sÏ tiÕp tôc phong Ên <color=yellow>Hå Yªu<color>. NÕu lµm mÊt Thiªn S­ Phï, cã thÓ t×m <color=green>Mai BÊt Dung<color> lÊy thªm.",
			PLAYER_NAME.."Ta sÏ lµm theo lêi dÆn cña ®¹o tr­ëng."
		)
			TaskTip("Tíi hËu s¬n Thiªn Nguyªn Th¸p dïng Thiªn S­ Phï kİch ho¹t Thiªn Nguyªn Ph¸p TrËn phong Ên Hå Yªu")
			Msg2Player("Tíi hËu s¬n Thiªn Nguyªn Th¸p (197/194) dïng Thiªn S­ Phï kİch ho¹t Thiªn Nguyªn Ph¸p TrËn phong Ên Hå Yªu")
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],3)
			return
	elseif n_task_step == 4 then
		Talk(2,"",
			NPC_NAME.."ThiÕu hiÖp hoµn thµnh nhiÖm vô xuÊt s¾c, l·o phu rÊt hµi lßng, C«n L«n Ph¸i chµo mõng thiÕu hiÖp gia nhËp, ta ®· ®¨ng kı danh s¸ch, cã thÓ ®i t×m Ch­ëng M«n (199/200).",
			PLAYER_NAME.."§a t¹ ®¹o tr­ëng."
			)
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],5)
		TaskTip("T×m Chu BÊt HoÆc")
		Msg2Player("T×m Chu BÊt HoÆc (199/200)")
	else
		Talk(1,"",NPC_NAME.."Muèn vµo ph¸i ph¶i v­ît qua kh¶o nghiÖm cña ta!")
		return
	end	
end
