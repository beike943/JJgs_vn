--½Å±¾Ãû³Æ£º2007ÇåÃ÷½Ó»î¶¯ÈÎÎñ¾íÖáµ÷ÓÃ½Å±¾¡£
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖá£¬Ôö¼ÓÏà¹ØÈÎÎñ¡£
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-14
--´úÂëĞŞ¸Ä¼ÇÂ¼£º2008-3-19 2008ÄêÇåÃ÷½Ú
Include("\\script\\online\\zgc_public_fun.lua")					--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\lib\\lingshi_head.lua")
Include("\\script\\online\\qingming08\\head_qingming.lua")

--========================================Glb±äÁ¿¶¨ÒåÇø====================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2008_task_reel_date_seq = 1852			--ÈÎÎñµÄÈÕÆÚĞòÊı
tomb_sweep_2008_task_reel_num = 1853					--¿ÉÍê³ÉµÄÈÎÎñÊıÁ¿
tomb_sweep_2008_task_reel_diff = 1854				--µ±Ç°µÄÈÎÎñÖÖÀà
tomb_sweep_2008_task_reel_step = 1855				--µ±Ç°ÈÎÎñ²½Öè£¨É±¹Ö£©
if IS_SHOUFEI == TRUE then
	task_reel_table = {
		--ÈÎÎñÀàĞÍ(£¨1¡¢ÎªÉ±¹Ö£»2ÎªÊÕ¼¯£»3ÎªÁéÊ¯£©-¹ÖÎïÃû³Æ-´¥·¢Æ÷ID-½±Àø°Ù·Ö¼¸ÂÊ-½±Àø±¶Êı-·µ»ØµÄ´¥·¢Æ÷Ë÷Òı--ËµÃ÷
		{1,"C«n ®å",1205,5,11,900,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>NhiÖm vô<color>: <color=yellow>C«n ®å ngoµi thµnh<color> lµm h¹i b¸ t¸nh, ®i ®¸nh b¹i <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng: 95%<color> x¸c suÊt <color=yellow>nh©n ®«i kinh nghiÖm<color> hoÆc <color=yellow>5%<color> x¸c suÊt gÊp <color=yellow>11<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow> 2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà¸öÊı-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÎïÆ·Ãû³Æ-ÊÕ¼¯µÄÎïÆ·´óÀà-¸±Àà-Ğ¡Àà-ÊıÁ¿--ËµÃ÷<color>
		{2,1,10,6,2,"Hæ vÜ",2,1,19,20,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: §u«i hæ<color> lµm thuèc cã thÓ ®iÒu trŞ c¸c bÖnh tËt, thu thËp <color=yellow>20<color> <color=yellow>®u«i hæ<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng: x¸c suÊt 90%<color> nh©n ®«i <color=yellow>kinh nghiÖm<color> hoÆc <color=yellow>10%<color> x¸c suÊt gÊp <color=yellow>6<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{1,"Quan sø",1206,16,4,901,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: Quan sø <color>ë<color=yellow> D­¬ng Trung ®éng <color> hµ hiÕp b¸ t¸nh, gi¸o huÊn <color=yellow>30<color> tªn mét bµi häc sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 84%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>16%<color> x¸c suÊt gÊp <color=yellow>4<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà¸öÊı-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÁéÊ¯Ãû³Æ-ÊÕ¼¯µÄÁéÊ¯ÊıÁ¿-ÊÕ¼¯µÄÁéÊ¯ÊıÁ¿µÄÈÎÎñ±äÁ¿-ËµÃ÷
		{3,1,20,3.5,2,"Linh th¹ch cÊp 1",4,SYS_TSK_LINGSHI_ONE,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu. Thu thËp <color=yellow> 4 Linh th¹ch cÊp 1<color>, sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 80%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>20%<color> x¸c suÊt gÊp <color=yellow>3.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{2,2,30,2.7,2,"BÇu r­îu da dª",2,1,60,10,"Kim Thoa",2,1,41,10,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu. §Õn <color=yellow>KiÕm M«n Quan<color> thu thËp 10 <color=yellow>bÇu r­îu da dª<color>, ®Õn <color=yellow>KiÕm C¸c thôc ®¹o<color> thu thËp 10 <color=yellow>Kim Thoa<color> sau ®ã quay vÒ Thñ l¨ng mé <color>phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 70% <color>nh©n ®«i<color=yellow> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm <color>hoÆc<color=yellow>30%<color> x¸c suÊt gÊp <color=yellow>2.7<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{3,2,40,2.25,2,"Linh th¹ch cÊp 2",2,SYS_TSK_LINGSHI_TWO,"Linh th¹ch cÊp 3",2,SYS_TSK_LINGSHI_THREE,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: T×m <color=yellow>2 Linh th¹ch cÊp 2<color>, <color=yellow>2 Linh th¹ch cÊp 3<color> ®Æt vµo Tô Linh ®Ønh xong, ®Õn gÆp <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 60%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>40%<color> x¸c suÊt gÊp <color=yellow>2.25<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{2,2,50,2,2,"Gi¸p x¸c phiÕn",2,1,177,10,"Khª S¬n chİ",2,1,98,10,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu. Thu thËp 10 <color=yellow>Gi¸p x¸c phiÕn ë §µo Hoa §¶o<color>, <color=yellow>10 b¶n ®å rõng nói gèc ë §¹i Th¶o Nguyªn<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 50%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm <color> hoÆc <color=yellow>50%<color> x¸c suÊt gÊp <color=yellow>2<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i,1 Linh th¹ch ngËu nhiªn 1-7<color>."},
		{1,"Cao thñ quan ngo¹i",1207,65,1.75,902,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: ë Long M«n trÊn cã <color=yellow>Cao thñ quan ngo¹i<color> hµ hiÕp b¸ t¸nh, ®i ®¸nh <color=yellow>30<color> tªn trong sè chóng, sau ®ã ®Õn <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 35%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.75<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{3,1,80,1.65,2,"Linh th¹ch cÊp 4",2,SYS_TSK_LINGSHI_FOUR,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: T×m <color=yellow>2 Linh th¹ch cÊp 4<color> ®Æt vµo trong Tô Linh ®Ønh xong, ®Õn Thñ l¨ng mé phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 45%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.65<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{1,"TÇm B¶o Nh©n",1208,100,1.5,903,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: Sa m¹c mª cung cã <color=yellow>TÇm b¶o nh©n<color> ®¶ th­¬ng kh«ng İt nh©n sÜ giang hå, h·y ®¸nh b¹i <color=yellow>30<color> tªn sau ®ã ®Õn gÆp <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: 100%<color> x¸c suÊt gÊp <color=yellow>1.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."}
		}
else
	task_reel_table = {
		--ÈÎÎñÀàĞÍ(£¨1¡¢ÎªÉ±¹Ö£»2ÎªÊÕ¼¯£»3ÎªÁéÊ¯£©-¹ÖÎïÃû³Æ-´¥·¢Æ÷ID-½±Àø°Ù·Ö¼¸ÂÊ-½±Àø±¶Êı-·µ»ØµÄ´¥·¢Æ÷Ë÷Òı--ËµÃ÷
		{1,"C«n ®å",1205,5,11,900,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: Ngoµi thµnh cã nh÷ng tªn <color=yellow>C«n ®å<color> lµm h¹i b¸ t¸nh, ®¸nh <color=yellow>30<color> tªn sau ®ã ®Õn <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 95%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>5%<color> x¸c suÊt gÊp <color=yellow>11<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà¸öÊı-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÎïÆ·Ãû³Æ-ÊÕ¼¯µÄÎïÆ·´óÀà-¸±Àà-Ğ¡Àà-ÊıÁ¿--ËµÃ÷<color>
		{2,1,10,6,2,"Hæ vÜ",2,1,19,20,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: §u«i hæ<color> lµm thuèc cã thÓ ®iÒu trŞ c¸c bÖnh tËt, thu thËp <color=yellow>20<color> <color=yellow>®u«i hæ<color> sau ®ã ®Õn <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 90%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>10%<color> x¸c suÊt gÊp <color=yellow>6<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{1,"Quan sø",1206,16,4,901,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: Quan sø<color> ë <color=yellow>D­¬ng Trung ®éng<color> hµ hiÕp b¸ t¸nh, gi¸o huÊn <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 84%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>16%<color> x¸c suÊt gÊp <color=yellow>4<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà¸öÊı-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÁéÊ¯Ãû³Æ-ÊÕ¼¯µÄÁéÊ¯ÊıÁ¿-ÊÕ¼¯µÄÁéÊ¯ÊıÁ¿µÄÈÎÎñ±äÁ¿-ËµÃ÷
		{3,1,20,3.5,2,"Linh th¹ch cÊp 1",4,SYS_TSK_LINGSHI_ONE,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn thu thËp <color=yellow>4 Linh th¹ch cÊp 1<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 80%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>20%<color> x¸c suÊt gÊp <color=yellow>3.5<color> lÇn ®iÓm søc kháe chuyÓn kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{2,2,30,2.7,2,"BÇu r­îu da dª",2,1,60,10,"Kim Thoa",2,1,41,10,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu, ®Õn <color=yellow>KiÕm M«n Quan<color> thu thËp 10 <color=yellow>bÇu r­îu da dª<color>, ®Õn <color=yellow>KiÕm C¸c thôc ®¹o<color> thu thËp 10 <color=yellow>Kim Thoa<color> sau ®ã quay vÒ Thñ l¨ng mé <color>phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 70%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>30%<color> x¸c suÊt gÊp <color=yellow>2.7<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{3,2,40,2.25,2,"Linh th¹ch cÊp 2",2,SYS_TSK_LINGSHI_TWO,"Linh th¹ch cÊp 3",2,SYS_TSK_LINGSHI_THREE,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: T×m <color=yellow>2 Linh th¹ch cÊp 2<color>, <color=yellow>2 Linh th¹ch cÊp 3<color> ®Æt vµo Tô Linh ®Ønh xong ®Õn <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 60%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>40%<color> x¸c suÊt gÊp <color=yellow>2.25<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{2,2,50,2,2,"Gi¸p x¸c phiÕn",2,1,177,10,"Khª S¬n chİ",2,1,98,10,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu, thu thËp 10 <color=yellow>Gi¸p x¸c phiÕn ë §µo Hoa §¶o<color>, 10 <color=yellow>b¶n ®å rõng nói gèc ë §¹i Th¶o Nguyªn<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 50%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>50%<color> x¸c suÊt gÊp <color=yellow>2<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{1,"Cao thñ quan ngo¹i",1207,65,1.75,902,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: <color=yellow>Cao thñ quan ngo¹i<color> ë Long M«n trÊn ®¶ th­¬ng b¸ t¸nh, h·y ®¸nh b¹i <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 35%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.75<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{3,1,80,1.65,2,"Linh th¹ch cÊp 4",2,SYS_TSK_LINGSHI_FOUR,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: T×m <color=yellow>2 Linh th¹ch cÊp 4<color> ®Æt vµo Tô Linh ®Ønh xong ®Õn t×m Thñ l¨ng mé phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 45%<color> nh©n ®«i <color=yellow> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.65<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."},
		{1,"TÇm B¶o Nh©n",1208,100,1.5,903,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: ë Sa m¹c mª cung<color> cã <color=yellow>TÇm b¶o nh©n<color> ®¶ th­¬ng kh«ng İt nh©n sÜ giang hå, ®¸nh b¹i <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: 100%<color> x¸c suÊt gÊp <color=yellow>1.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm. NÕu cÊp 99, th× nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp 1-7<color>."}
		}
end
--========================================º¯ÊıÖ÷Âß¼­Çø=====================================
--***********************************¾íÖáÊ¹ÓÃÖ÷º¯Êı****************************
function OnUse(goods_index)
	if GetLevel() < 11 then
		Talk(1,"","<color=green>Nh¾c nhë<color>:"..Zgc_pub_sex_name().."cÇn rÌn luyÖn thªm mét thêi gian!")
		return
	end
	local task_reel_diff = (GetItemParticular(goods_index) - tomb_sweep_2007_start_goodsID + 1)
	local task_step_now = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_step_now == 0 or task_step_now == nil then
		Say("B¹n muèn thùc hiÖn b­íc nµo?",
		3,
		"NhËn nhiÖm vô trong mËt ®å/#reel_task_accept("..task_reel_diff..")",
		"Xem néi dung nhiÖm vô/#reel_inf_print("..task_reel_diff..",1)",
		"§ãng nhiÖm vô/end_dialog"
		)
	elseif task_step_now >= 1 and task_step_now <= 10 then
		Say("B¹n muèn thùc hiÖn b­íc nµo?",
		3,
		"Xem nhiÖm vô ®ang lµm/#reel_inf_print("..task_step_now..",2)",
		"Xem néi dung nhiÖm vô/#reel_inf_print("..task_reel_diff..")",
		"§ãng nhiÖm vô/end_dialog"
		)
	else										--·ÀÖ¹Êı¾İ³ö´í
		SetTask(tomb_sweep_2008_task_reel_diff,0)
	end
end
--*********************************¾íÖáÏêÏ¸ĞÅÏ¢²éÑ¯****************************
function reel_inf_print(reel_diff,inq_flag)
	if is_qingming_opened() ~= 1 then				--ÔÚ»î¶¯ÆÚ¼äÓĞĞ§
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end
	Talk(1,"",task_reel_table[reel_diff][getn(task_reel_table[reel_diff])])
end
--************************************½ÓÊÜÈÎÎñ********************************
function reel_task_accept(task_diff)
	--ÔÚ»î¶¯ÆÚ¼äÓĞĞ§
	if is_qingming_opened() ~= 1 then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end
	--
	--Êı¾İ»ñÈ¡
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--¿ÉÒÔÍê³ÉµÄÈÎÎñ´ÎÊı¼ì²â
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		if IS_SHOUFEI == TRUE then
			Talk(1,"","<color=green>Nh¾c nhë<color>: Vµo tiÕt Thanh Minh mçi ngµy ng­¬i chØ cã thÓ hoµn thµnh mËt ®å nhiÖm vô <color=yellow>2<color> lÇn! Ng­¬i cã thÓ d¹o phè mua giÊy cóng tÕ t¨ng sè lÇn nhiÖm vô mËt ®å.")
		else
			Talk(1,"","<color=green>Nh¾c nhë<color>: Vµo tiÕt Thanh Minh mçi ngµy ng­¬i chØ cã thÓ hoµn thµnh mËt ®å nhiÖm vô <color=yellow>1<color> lÇn! Ng­¬i cã thÓ d¹o phè mua giÊy cóng tÕ t¨ng sè lÇn nhiÖm vô mËt ®å.")
		end
		return
	end
	if reel_task_date_seq_save < date_seq_now then--¹ıÁËÒ»Ìì£¬ÖØÉèÈÎÎñ´ÎÊı
		if IS_SHOUFEI == TRUE then
			SetTask(tomb_sweep_2008_task_reel_num,2)--ÊÕ·ÑÇøÃ¿Ìì¿ÉÒÔ½ÓÊÜÈÎÎñÁ½´Î
		else
			SetTask(tomb_sweep_2008_task_reel_num,1)
		end
	end
	SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)		--½ñÌìÈÕÆÚĞòÊıĞ´Èë
	SetTask(tomb_sweep_2008_task_reel_diff,task_diff)
	SetTask(tomb_sweep_2008_task_reel_step,0)
	if task_reel_table[task_diff][1] == 1 then						--Èç¹ûÎªÉ±¹ÖÈÎÎñÔò´´½¨É±¹Ö´¥·¢Æ÷
		CreateTrigger(0,task_reel_table[task_diff][3],task_reel_table[task_diff][6])
	end
	Talk(1,"","B¹n ®· nhËn nhiÖm vô thø <color=yellow>"..task_diff.."<color> cã thÓ ®Õn <color=yellow>thñ l¨ng nh©n<color> hñy nhiÖm vô hoÆc nhËn th­ëng! \n NhÊn chuét ph¶i xem néi dung nhiÖm vô!")
end
