DebugOutput = nothing
--µ±Ç°Ê¹ÓÃµÄÎäÁÖvip¿¨Ë÷Òý
--\settings\vip_card.txt
--VC_CURRENT_ID = 1;
--VC_CURRENT_ID = 2;
--VC_CURRENT_ID = 3;
--VC_CURRENT_ID = 4;
VC_CURRENT_ID = 5;


--¹±Ï×¶È½±Àø£¨¸ù¾Ý½±Àø±íÐòºÅ°´Î»±ê¼Ç£©
TASKID_VC_VALUE_FLAG = 3239;

--Ã¿ÈÕÇåÀíÈÎÎñ±äÁ¿
--¼ÇÂ¼×Ô¶¯Íê³É´ÎÊý
TASKID_VC_AUTO_FINISH_TIMES = 3241;
--¼ÇÂ¼ÈÕ³£ÈÎÎñÍê³ÉÇé¿ö£¨¸ù¾ÝÒÔÏÂÐòºÅ°´Î»±ê¼Ç£¬31Î»±íÊ¾ÊÇ·ñÁìÈ¡¾«Á¦£©
TASKID_VC_DAILY_TASK_FLAG = 3240;
--ÈÕ³£Íê³É´ÎÊý¼ÇÂ¼
TASKID_VC_DAILY_TASK_1 = 3242;
TASKID_VC_DAILY_TASK_2 = 3243;
TASKID_VC_DAILY_TASK_3 = 3253;

--¼ÇÂ¼¾ßÌåÈÎÎñÍê³ÉÇé¿ö£¨°´×Ö½Ú¼ÇÂ¼£©(VIP_CARD_IDË÷Òý)
VC_DAILY_TASK = {
	[1] = 
	{
		[1] = {
			Options = "Phã b¶n" ,
			Content = {
				{"L­¬ng S¬n B¹c ¶i 8", 2, "Hoµn thµnh ¶i 8 cña L­¬ng S¬n B¹c, sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"§Þa HuyÒn Cung ¶i 7", 2, "Hoµnh thµnh 7 ¶i §Þa HuyÒn Cung, hoµnh thµnh xong nhËn ®­îc 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"V¹n KiÕm Tròng ¶i 4", 3, "Hoµn thµnh ¶i 4 cña V¹n KiÕm Tròng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 25, "Thiªn Kiªu LÖnh"},
			Award = "vc_AwardCopy()",
		},	
		[2] = {
			Options = "Trång c©y" ,
			Content = {
				{"Trång C©y B¸t Nh· Nhá", 3, "Trång 3 lÇn C©y B¸t Nh· Nhá, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"Trång C©y B¸t Nh·", 3, "Trång 3 lÇn C©y B¸t Nh·, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"Më Tói H¹t Gièng", 3, "Më Tói H¹t Gièng 3 lÇn, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 10, "Thiªn Kiªu LÖnh"},
			Award = "vc_AwardPlant()",
		},	
		[3] = {
			Options = "Thiªn M«n trËn" ,
			Content = {
				{"ChiÕn th¾ng trong thiªn m«n trËn vµ nhËn phÇn th­ëng", 1, "Trong chiÕn tr­êng Thiªn M«n TrËn giµnh chiÕn th¾ng 1 lÇn vµ nhËn th­ëng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"Tham gia Thiªn M«n TrËn vµ nhËn th­ëng", 2, "Tham gia 2 trËn Thiªn M«n TrËn vµ nhËn th­ëng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 15, "Thiªn Kiªu LÖnh"},
			Award = "vc_AwardTmz()",
		},	
		[4] = {
			Options = "ChiÕn tr­êng" ,
			Content = {
				{"Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", 1, "Tham gia 1 trËn chiÕn tr­êng Nh¹n M«n Quan vµ nhËn th­ëng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", 1, "Tham gia vµ hoµn thµnh 1 L­¬ng Th¶o ChiÕn, Th«n Lµng ChiÕn, Ph¸o §µi ChiÕn bÊt kú vµ nhËn th­ëng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 4,
			AutoFinish = {2, 97, 236, 15, "Thiªn Kiªu LÖnh"},
			Award = "vc_AwardBattle()",
		},	
		[5] = {
			Options = "TÝnh n¨ng" ,
			Content = {
				{"TiÕn hµnh c­êng hãa trang bÞ", 1, "TiÕn hµnh 1 lÇn c­êng hãa trang bÞ, bÊt kÓ thµnh c«ng hay kh«ng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
				{"TiÕn hµnh d­ìng thµnh trang bÞ", 1, "TiÕn hµnh 1 lÇn d­ìng thµnh trang bÞ, bÊt kÓ th¨ng cÊp hay kh«ng, hoµn thµnh sÏ nhËn ®­îc phÇn th­ëng 20 ®iÓm cèng hiÕn vµ ®iÓm kinh nghiÖm"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_3,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_3,
			Byte = 2,
			AutoFinish = {2, 97, 236, 10, "Thiªn Kiªu LÖnh"},
			Award = "vc_AwardEquip()",
		},	
	},
	[2] = 
	{
		[1] = {
			Options = "Phã b¶n" ,
			Content = {
				{"L­¬ng S¬n B¹c ¶i 8", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "L­¬ng S¬n B¹c ¶i 8", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"§Þa HuyÒn Cung ¶i 7", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "§Þa HuyÒn Cung ¶i 7", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V¹n KiÕm Tròng ¶i 4", 3, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V¹n KiÕm Tròng ¶i 4", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "ChiÕn tr­êng" ,
			Content = {
				{"ChiÕn th¾ng trong Thiªn M«n TrËn", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "ChiÕn th¾ng trong Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia Thiªn M«n TrËn", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T¨ng thªm" ,
			Content = {
				{"T¨ng cÊp trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "T¨ng cÊp trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"D­ìng thµnh trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "D­ìng thµnh trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh· Nhá", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh· Nhá", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh·", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh·", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Më Tói H¹t Gièng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Më Tói H¹t Gièng", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_3()",
		},	
	},
	[3] = 
	{
		[1] = {
			Options = "Phã b¶n" ,
			Content = {
				{"L­¬ng S¬n B¹c ¶i 8", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "L­¬ng S¬n B¹c ¶i 8", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"§Þa HuyÒn Cung ¶i 7", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "§Þa HuyÒn Cung ¶i 7", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V¹n KiÕm Tròng ¶i 4", 3, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V¹n KiÕm Tròng ¶i 4", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "ChiÕn tr­êng" ,
			Content = {
				{"ChiÕn th¾ng trong Thiªn M«n TrËn", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "ChiÕn th¾ng trong Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia Thiªn M«n TrËn", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T¨ng thªm" ,
			Content = {
				{"T¨ng cÊp trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "T¨ng cÊp trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"D­ìng thµnh trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "D­ìng thµnh trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh· Nhá", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh· Nhá", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh·", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh·", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Më Tói H¹t Gièng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Më Tói H¹t Gièng", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_3()",
		},	
	},
	[4] = 
	{
		[1] = {
			Options = "Phã b¶n" ,
			Content = {
				{"L­¬ng S¬n B¹c ¶i 8", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "L­¬ng S¬n B¹c ¶i 8", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"§Þa HuyÒn Cung ¶i 7", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "§Þa HuyÒn Cung ¶i 7", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V¹n KiÕm Tròng ¶i 4", 3, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V¹n KiÕm Tròng ¶i 4", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "ChiÕn tr­êng" ,
			Content = {
				{"ChiÕn th¾ng trong Thiªn M«n TrËn", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "ChiÕn th¾ng trong Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia Thiªn M«n TrËn", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T¨ng thªm" ,
			Content = {
				{"T¨ng cÊp trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "T¨ng cÊp trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"D­ìng thµnh trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "D­ìng thµnh trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh· Nhá", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh· Nhá", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh·", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh·", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Më Tói H¹t Gièng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Më Tói H¹t Gièng", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_3()",
		},	
	},
	[5] = 
	{
		[1] = {
			Options = "Phã b¶n" ,
			Content = {
				{"L­¬ng S¬n B¹c ¶i 8", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "L­¬ng S¬n B¹c ¶i 8", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"§Þa HuyÒn Cung ¶i 7", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "§Þa HuyÒn Cung ¶i 7", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V¹n KiÕm Tròng ¶i 4", 3, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V¹n KiÕm Tròng ¶i 4", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
				{"V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "V­ît qua PhÇn Thiªn L©m-Th¸i NhÊt Th¸p_Th­êng", "Hu©n ch­¬ng anh hïng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "ChiÕn tr­êng" ,
			Content = {
				{"ChiÕn th¾ng trong Thiªn M«n TrËn", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "ChiÕn th¾ng trong Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia Thiªn M«n TrËn", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia Thiªn M«n TrËn", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng lín Nh¹n M«n Quan vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia chiÕn tr­êng nhá bÊt kú vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
				{"¢n O¸n §µi_Giµnh th¾ng lîi vµ nhËn th­ëng", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Tham gia ¢n O¸n §µi giµnh th¾ng lîi vµ nhËn th­ëng", "Hu©n ch­¬ng anh hïng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T¨ng thªm" ,
			Content = {
				{"T¨ng cÊp trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "T¨ng cÊp trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"D­ìng thµnh trang bÞ", 1, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "D­ìng thµnh trang bÞ", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh· Nhá", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh· Nhá", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Trång C©y B¸t Nh·", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Trång C©y B¸t Nh·", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
				{"Më Tói H¹t Gièng", 2, format("Hoµn thµnh %s, hoµn thµnh xong ®­îc th­ëng %s, ®é cèng hiÕn %d ®iÓm, EXP %d", "Më Tói H¹t Gièng", "Hu©n ch­¬ng anh hïng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thiªn Kiªu LÖnh"},
			Award = "vc_Award_2_3()",
		},	
	},
}

VC_VALUE_AWARD = {
	[1] = {
		[1]  = {300, 1, {2, 1, 30498, 10, 4},  "Hu©n ch­¬ng dòng sÜ"},
		[2]  = {500, 1, {2, 1, 30535, 10, 4}, "ThiÕt Tinh cÊp 3"},
		[3]  = {700, 1, {2, 1, 30499, 10, 4},  "Hu©n ch­¬ng anh hïng"},
		[4]  = {1000,3, "vc_Rand_3_4_JS_foot()", "GiÇy 3-4 sao ngÉu nhiªn"},
		[5]  = {1300,1, {2, 1, 30614, 1, 1},  "L«i Hæ Tinh Ph¸ch"},
		[6]  = {1600,3, "vc_Rand_3_4_JS_cape()", "¸o choµng 3-4 sao ngÉu nhiªn"},
		[7]  = {1900,1, {2, 1, 30614, 2, 1}, "L«i Hæ Tinh Ph¸ch"},
		[8]  = {2200,3, "vc_Rand_3_4_JS_badge()", "Huy ch­¬ng 3-4 sao ngÉu nhiªn"},
		[9]  = {2500,1, {2, 1, 30614, 3, 1}, "L«i Hæ Tinh Ph¸ch"},
		[10] = {3000,2, 10000000, "Kinh nghiÖm"},
	},
	[2] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu©n ch­¬ng anh hïng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "ThiÕt Tinh cÊp 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu©n ch­¬ng anh hïng"},
		[4]  = {1000,3, "vc_Rand_3_4_JS_foot()", "GiÇy 3-4 sao ngÉu nhiªn"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu©n ch­¬ng anh hïng"},
		[6]  = {1600,3, "vc_Rand_3_4_JS_cape()", "¸o choµng 3-4 sao ngÉu nhiªn"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L«i Hæ Tinh Ph¸ch"},
		[8]  = {2200,3, "vc_Rand_3_4_JS_badge()", "Huy ch­¬ng 3-4 sao ngÉu nhiªn"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L«i Hæ Tinh Ph¸ch"},
		[10] = {3000,2, 10000000, "Kinh nghiÖm"},
	},
	[3] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu©n ch­¬ng anh hïng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "ThiÕt Tinh cÊp 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu©n ch­¬ng anh hïng"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu©n ch­¬ng anh hïng"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L«i Hæ Tinh Ph¸ch"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L«i Hæ Tinh Ph¸ch"},
		[10] = {3000,2, 10000000, "Kinh nghiÖm"},
	},
	[4] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu©n ch­¬ng anh hïng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "ThiÕt Tinh cÊp 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu©n ch­¬ng anh hïng"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu©n ch­¬ng anh hïng"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L«i Hæ Tinh Ph¸ch"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L«i Hæ Tinh Ph¸ch"},
		[10] = {3000,2, 10000000, "Kinh nghiÖm"},
	},
	[5] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu©n ch­¬ng anh hïng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "ThiÕt Tinh cÊp 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu©n ch­¬ng anh hïng"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu©n ch­¬ng anh hïng"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L«i Hæ Tinh Ph¸ch"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "§¸ quý cÊp 2-4 (NgÉu nhiªn)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L«i Hæ Tinh Ph¸ch"},
		[10] = {3000,2, 10000000, "Kinh nghiÖm"},
	},
}