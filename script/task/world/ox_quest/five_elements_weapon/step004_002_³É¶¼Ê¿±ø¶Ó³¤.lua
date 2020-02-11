-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 9, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("§éi tr­ëng Binh sÜ", "green")..":"
quest_title = cf_ox_SetColor("Thuéc tİnh vò khİ", "yellow").."\n"
quest_detail = cf_ox_SetColor("§Õn thî rÌn BiÖn Kinh hái th¨m vÒ c¸ch giÕt qu¸i", "gray").."\n\n"
--quest_description_1 = quest_giver.."¿´À´½­½ò´åÀïµÄĞ°ÆøËÆºõÒÑ¾­¸ĞÈ¾µ½ÆäËûµØ·½ÁË£¬µ«ÊÇ»¹²»ÄÜÈ·¶¨ÄÇĞ©Á÷Ã¥ÊÇ·ñ¸úÕâĞ©½©Ê¬Ò»Ñù£¬ÒÑ¾­ÊÇÍêÈ«ËÀÈ¥µÄÈË£¬Òªµ÷¶¯ÕâÃ´¶à¿´ÆğÀ´ºÁÎŞÒâÊ¶µÄ¹ÖÎï£¬¿Ï¶¨ÓĞÒ»¸öÄ»ºóµÄ¿ØÖÆÕß£¬µ«ÊÇÏÖÔÚ¿´ÆğÀ´ËÆºõºÁÎŞÍ·Ğ÷°¡¡£\nÓÉÓÚÄÇĞ©ÕÎÆø£¬ÎÒÃÇ¸ù±¾½ø²»ÁË½­½ò´å£¬¶øÄÇĞ©½©Ê¬ÓÃÍ¨³£µÄ±øÈĞÒ²ºÜÄÑÉ±ËÀ¡£ÏÖÔÚ¿´À´ĞèÒªÕÒµ½ÄÜÉ±ËÀÕâĞ©¹ÖÎïµÄ·½·¨²ÅĞĞ£¬ãê¾©³ÇÀïÓĞÎ»¾­Ñé·á¸»µÄÌú½³£¬Ò²¾­³£Îª³¯Í¢ÖÆ×÷¾«±øÀûÈĞ¡£"
quest_description_1 = quest_giver.."Tµ khİ ë Giang t©n th«n ®· lan sang c¸c vïng kh¸c, kh«ng biÕt mÊy tªn L­u manh ®ã cã chÕt gièng nh­ c¸i x¸c kia kh«ng. CÇn ph¶i cã mét ng­êi ®Ó khèng chÕ bän yªu qu¸i nµy. \n Nghe nãi thî rÌn ë BiÖn Kinh bao n¨m ®· ®óc luyÖn binh khİ cho binh lİnh cña TriÒu ®×nh, cã thÓ rÌn ra mét lo¹i vò khİ trõ ®­îc bän yªu ma. Ngoµi ra cßn ph¶i ®iÒu tra xem ®»ng sau bän chóng cßn Èn chøa ®iÒu g× n÷a."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 12, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 14)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
		
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§Õn thî rÌn BiÖn Kinh hái th¨m vÒ c¸ch giÕt qu¸i")
	Say(quest_title..quest_detail..quest_description_1, 0)
end