--½Å±¾Ãû³Æ£ºÇåÃ÷½Ú»î¶¯Ö¸ÄÏÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º¶ÔÇåÃ÷½Ú»î¶¯µÄ½éÉÜ
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-14
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı

tomb_sweep_2007_date_seq = 852						--°İ¼ÀµÄÊ±¼ä
tomb_sweep_2007_times_count = 853					--°İ¼ÀµÄ´ÎÊıÍ³¼Æ
tomb_sweep_2007_task_reel_diff = 857				--µ±Ç°µÄÈÎÎñÖÖÀà

function OnUse()
	Say("ë ®©y ghi râ ho¹t ®éng <color=yellow>TiÕt Thanh Minh<color>, b¹n muèn t×m hiÓu môc nµo?",
	4,
	"Xem tiÕn triÓn ho¹t ®éng/player_step_inq",
	"Xem néi dung ho¹t ®éng./tomb_sweep_2007_inf",
	"TiÕt Thanh Minh/tomb_sweep_story",
	"§ãng h­íng dÉn/end_dialog"
	)
end
--************************»î¶¯½øÕ¹²éÑ¯***************************
function player_step_inq()
	local kotowl_today_chk = "Ch­a b¸i tÕ!"
	if GetTask(tomb_sweep_2007_date_seq) >= zgc_pub_day_turn(1) then
		kotowl_today_chk = "§· b¸i tÕ"
	end
	local totowl_times_count = GetTask(tomb_sweep_2007_times_count)
	if totowl_times_count == nil then
		totowl_times_count = 0
	end
	local task_inf = ""
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_diff ~= 0 and task_diff ~= nil then
		local task_reel_table = {
			--ÈÎÎñÀàĞÍ(£¨1¡¢ÎªÉ±¹Ö£»2ÎªÊÕ¼¯£©-Íê³É±êÖ¾-¹ÖÎïÃû³Æ-´¥·¢Æ÷ID-½±Àø°Ù·Ö¼¸ÂÊ-½±Àø±¶Êı-Ëæ»ú¼ÀÆ·ÊıÁ¿--ËµÃ÷
			"    <color=yellow>NhiÖm vô:<color>Ngoµi thµnh cã nh÷ng tªn <color=yellow>C«n ®å<color> lµm h¹i b¸ t¸nh,  ®i ®¸nh b¹i <color=yellow>30<color> tªn,  sau ®ã ®Õn <color=yellow>Thñ l¨ng nh©n<color> phôc mÖnh. \n    <color=yellow>PhÇn th­ëng: 95%<color> x¸c suÊt <color=yellow>nh©n ®«i<color> kinh nghiÖm hoÆc <color=yellow>5%<color> x¸c suÊt gÊp <color=yellow>11<color>lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÎïÆ·Ãû³Æ-ÊÕ¼¯µÄÎïÆ·´óÀà-¸±Àà-Ğ¡Àà-ÊıÁ¿--ËµÃ÷<color>
			"    <color=yellow>Néi dung nhiÖm vô: §u«i hæ<color> lµm thuèc cã thÓ ®iÒu trŞ c¸c bÖnh tËt,  thu thËp <color=yellow>20<color> <color=yellow>®u«i hæ<color> sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color>phôc mÖnh. \n <color=yellow>PhÇn th­ëng: x¸c suÊt 90% nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>10%<color> x¸c suÊt gÊp <color=yellow>6<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>Néi dung nhiÖm vô: Quan sø<color> ë <color=yellow>D­¬ng Trung ®éng<color> hµ hiÕp b¸ t¸nh,  gi¸o huÊn <color=yellow>30<color> tªn mét bµi häc sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: x¸c suÊt 84$ nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>16%<color> x¸c suÊt gÊp <color=yellow>4<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>NhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu,  ®i thu thËp 10 <color=yellow>Linh Chu t¬<color>,  10 <color=yellow>Da gÊu<color> sau ®ã ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 80% x¸c suÊt nh©n ®«i <color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>20%<color> x¸c suÊt gÊp <color=yellow>3.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>NhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu,  ®Õn <color=yellow>KiÕm M«n Quan<color> thu thËp 10 <color=yellow>bÇu r­îu da dª<color>,  ®Õn <color=yellow>KiÕm C¸c thôc ®¹o<color> thu thËp 10 <color=yellow>Kim Thoa<color> sau ®ã quay vÒ Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 70% x¸c suÊt nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>30%<color> gÊp <color=yellow>2.7<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>NhiÖm vô<color>: T×m 1 <color=yellow>Thiªn Lang y<color> vµ 1 <color=yellow>Minh Quang gi¸p<color> sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 60% x¸c suÊt nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>40%<color> x¸c suÊt gÊp <color=yellow>2.25<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>NhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu,  ®i thu thËp 10 <color=yellow>Gi¸p x¸c phiÕn ë §µo Hoa §¶o<color>,  10 <color=yellow>b¶n ®å rõng nói gèc ë §¹i Th¶o Nguyªn<color> sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 50% x¸c suÊt nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>50%<color> x¸c suÊt gÊp <color=yellow>1.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>Néi dung nhiÖm vô: Xi Háa tr­ëng l·o<color> ë <color=yellow>Long Nh·n ®éng<color> mª hoÆc b¸ t¸nh,  ®i ®¸nh b¹i <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 35% x¸c suÊt nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.75<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>NhiÖm vô<color>: T×m 1 chu«i <color=yellow>HuyÒn thiÕt träng kiÕm<color> vµ 1 chu«i <color=yellow>Ph¸ Thiªn kİch<color> sau ®ã quay vÒ Hµn gia nh©n phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 35% x¸c suÊt nh©n ®«i<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm hoÆc <color=yellow>65% x¸c suÊt<color> gÊp <color=yellow>1.75<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. ",
			"    <color=yellow>Néi dung nhiÖm vô: Tiªu Tiªn Tö<color> ë <color=yellow>Thanh ¢m ®éng<color> mª hoÆc kh«ng İt nh©n sÜ vâ l©m, ®i ®¸nh b¹i mét trong <color=yellow>30<color> ng­êi sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 100%<color> gÊp <color=yellow>1.5<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."
			}
		Talk(1,"","NhiÖm vô hiÖn t¹i: \n H«m nay b¹n"..kotowl_today_chk.."HiÖp Chñng. \nHiÖn b¹n nhËn mËt ®å nhiÖm vô thø <color=yellow>"..task_diff.."<color>, tin tøc: \n"..task_reel_table[task_diff])
	else
		Talk(1,"","NhiÖm vô hiÖn t¹i: \n H«m nay b¹n"..kotowl_today_chk.."HiÖp Chñng. \nHiÖn b¹n ch­a nhËn mËt ®å nhiÖm vô TiÕt Thanh Minh!")
	end
end
--***************************»î¶¯ÏêÇé****************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"    Thêi gian ho¹t ®éng: <color=yellow>30/3 - 8/4<color>. \n Trong TiÕt Thanh Minh viÖc t¶o mé lµ chñ yÕu, ta cÇn ®Õn cóng b¸i <color=yellow>Chu ®¹i hiÖp, Hµn ®¹i hiÖp, Hiªn Viªn ®¹i hiÖp<color>.",
	"     Trong TiÕt Thanh Minh mçi ngµy ®Õn bÊt kú mé phÇn cóng b¸i <color=yellow>1<color> lÇn b»ng c¸ch <color=yellow>v¸i l¹y<color>. Do"..Zgc_pub_sex_name().."thµnh t©m nhËn ®­îc mËt ®å nhiÖm vô cña thñ l¨ng nh©n."
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","    Hoµn thµnh nhiÖm vô mang <color=yellow>mËt ®å<color> giao tr¶ <color=yellow>Hµn gia nh©n<color> sÏ nhËn ®­îc <color=yellow>phÇn th­ëng<color> nhÊt ®Şnh.",
		"    Hoµn thµnh 15 lÇn <color=yellow>mËt ®å Thanh Minh<color> nhËn ®­îc phÇn th­ëng gÊp <color=yellow>10<color> lÇn."
)
end
--**************************ÇåÃ÷½ÚÓÉÀ´***************************
function tomb_sweep_story()
	Talk(2,"tomb_sweep_story_1",
	"    T­¬ng truyÒn vµo thêi chiÕn quèc phi tö cña <color=green>TÊn HiÕn C«ng<color> lµ <color=green>Li C¬<color> v× muèn con m×nh <color=green>HÒ TÒ<color> kÕ vŞ nªn ©m m­u giÕt h¹i th¸i tö <color=green>Th©n Sanh<color>, <color=green>Th©n Sanh<color> bŞ Ğp tù s¸t. Lóc nµy ®Ö ®Ö cña <color=green>Th©n Sanh<color> lµ <color=green>Träng NhÜ<color> nh»m tr¸nh sù truy giÕt nªn ®· bá trèn, trong thêi gian nµy chŞu mäi u uÊt, tïy tïng ®i theo chØ cã mÊy ng­êi, trong sè ®ã cã ng­êi th©n tİn tªn <color=green>Giíi Tö Th«i<color>. Cã lÇn <color=green>Träng NhÜ<color> ngÊt xØu v× ®ãi. <color=green>Giíi Tö Th«i<color> mét lßng cøu <color=green>chñ<color> ®· lĞn c¾t miÕng thŞt cña m×nh, n­íng chİn d©ng cho Träng NhÜ. 19 n¨m sau <color=green>Träng NhÜ<color> vÒ n­íc lµm vua trë thµnh 1 trong ngò b¸ thêi Xu©n Thu hiÖu <color=green>TÊn V¨n C«ng<color>.",
	"    <color=green>TÊn V¨n C«ng<color> sau khi n¾m quyÒn ®· ban th­ëng hËu hÜnh cho nh÷ng ai ®· cïng «ng l­u vong chŞu khæ duy chØ cã <color=green>Giíi Tö Th«i<color> lµ kh«ng cã. Vµ råi cã ng­êi tÊu víi <color=green>TÊn V¨n C«ng<color> c©u chuyÖn tr­íc kia mµ <color=green>Giíi Tö Th«i<color> ®· lµm. <color=green>TÊn V¨n C«ng<color> ch¹nh lßng nhí l¹i chuyÖn cò, lËp tøc cho ng­êi mêi <color=green>Giíi Tö Th«i<color> vÒ triÒu thô phong. §¸ng tiÕc ng­êi cö ®i mêi mÊy lÇn mµ <color=green>Giíi Tö Th«i<color> vÉn tõ chèi."
	)
end
function tomb_sweep_story_1()
	Talk(2,"tomb_sweep_story_2",
	"    <color=green>TÊn V¨n C«ng<color> ®İch th©n ®i mêi cho b»ng ®­îc nh­ng khi <color=green>TÊn V¨n C«ng<color> ®Õn n¬i <color=green>Giíi Tö Th«i<color> th× thÊy cöa ®ãng. ¢n nh©n kh«ng lêi tõ biÖt dÉn mÑ trèn vµo <color=yellow>CÈm s¬n<color>. <color=green>TÊn V¨n C«ng<color> cho Ngù L©m qu©n t×m kh¾p <color=yellow>CÈm s¬n<color> vÉn kh«ng thÊy, cã ng­êi ®­a ra chñ ı ®èt rõng, ®Ó l¹i mét ®­êng sèng, khi löa lín <color=green>Giíi Tö Th«i<color> ¾t ph¶i ch¹y ra.",
	"    <color=green>TÊn V¨n C«ng<color> h¹ lÖnh ®èt rõng, löa ch¸y ba ngµy ba ®ªm vÉn kh«ng thÊy <color=green>Giíi Tö Th«i<color> xuÊt hiÖn. §Õn khi löa t¾t ph¸t hiÖn trªn nói x¸c chÕt ch¸y cña hai mÑ con <color=green>Giíi Tö Th«i<color> ®ang «m chÆt gèc c©y. <color=green>TÊn V¨n C«ng<color> nh×n thi thÓ <color=green>Giíi Tö Th«i<color> bËt khãc, sau ®ã cho ng­êi an t¸ng tö tÕ, nh÷ng ng­êi an t¸ng thi thÓ <color=green>Giíi Tö Th«i<color> ph¸t hiÖn mét c¸i hang bªn trong cã rÊt nhiÒu ®å, trong ®ã cã tµ ¸o trªn ghi mÊy dßng huyÕt th­: "
	)
end
function tomb_sweep_story_2()
	Talk(2,"",
	"    C¸t nhôc phông qu©n tËn ®an t©m, ®·n nguyÖn chñ c«ng th­êng Thanh Minh. \n LiÔu h¹ t¸c quû chung bÊt kiÕn, c­êng tù b¹n qu©n t¸c gi¸n thÇn. \nTh­ëng nh­îc chñ c«ng t©m h÷u ng·, øc ng· chi thêi th­êng tù tØnh. \n ThÇn t¹i cöu tuyÒn t©m v« quı, cÇn chİnh thanh minh phôc thanh minh.",
	"    <color=green>TÊn V¨n C«ng<color> cho ng­êi an t¸ng hai mÑ con <color=green>Giíi Tö Th«i<color> d­íi gèc c©y liÔu. Vµ ®Ó t­ëng nhí <color=green>©n nh©n<color> bÌn ra lÖnh ®æi <color=yellow>CÈm s¬n<color> thµnh <color=yellow>Giíi s¬n<color>, trªn nói x©y dùng am miÔu thê cóng ®ång thêi ngµy ®èt rõng ®­îc xem lµ TÕt Hµn Thùc, ng­êi d©n trong ngµy nµy kh«ng ®­îc ®èt löa, chØ ¨n ®å nguéi. \n N¨m thø hai <color=green>TÊn V¨n C«ng<color> cïng ®¸m quÇn thÇn lªn nói cóng b¸i ®Ó tá lßng biÕt ¬n. Sau khi cóng b¸i bÌn ®Şnh ngµy nµy lµ <color=yellow>TiÕt Thanh Minh<color>."
	)
end
