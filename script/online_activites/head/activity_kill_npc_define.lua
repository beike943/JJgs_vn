AKCD_TABLE = {
	[121] = {
		nAcitvityID = 121,
		tTaskGroup = {3, 12},
		szTaskName = "phôc long – h¾c b¹ch song kú ",
		szStartName = "Ngò Hµnh T«n Gi¶",
		nDaySeq = 1, --ÈÎÎñ±äÁ¿ÖØÖÃ±ê¼Ç
		nTaskStatus = 2, --ÈÎÎñ×´Ì¬
		tAward = {
			nAwardTag = 3, --Áì½±×´Ì¬0Î´ÁìÈ¡1ÁìÈ¡2ÒÑÁìÈ¡ÌØÊâ
			tDialog = {
				[1] = "phæ th«ng ( miÔn phÝ )",
				[2] = "¦u ®·i ( tiªu hao 89 tiªu dao ngäc)",
				[3] = "Siªu cÊp ( tiªu hao 555 tiªu dao ngäc)",
			},
			tCost = {
				[1] = {},
				[2] = {{2, 1, 30603, 89, "Tiªu Dao Ngäc"}},
				[3] = {{2, 1, 30603, 555, "Tiªu Dao Ngäc"}},
			},
			tFreeRoom = {1, 2, 6},
			tAwardFunc = {
				[1] = "fakct_Award201404_GetAward_1()",
				[2] = "fakct_Award201404_GetAward_2()",
				[3] = "fakct_Award201404_GetAward_3()",
			},
			tSpecial = {
				bIsOpen = 1,
				nRebornLimitUp = 6,
				sTitle = "H¾c B¹ch Song Long Tiªn ThuËt ( tiªu hao 203 b¹ch kú + 203 h¾c kú + 203 tiªu dao ngäc + 203 xu +203 vµng)",
				tCost = {{2,1, 30639, 203, " b¹ch kú "}, {2,1, 30640, 203, " h¾c kú "}, {2, 1, 30603, 203, "Tiªu Dao Ngäc"}, {2, 1, 30230, 203, "XU"}, {2030000}},
				nFreeRoom = {1, 1},
				sAwardFunc = "fakct_Award201404_GetSpecialAward()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "V« Danh T¨ng",
				szNpcPosName = "thiÕu l©m (210,190)",
				szTargetNpcTitle = "t«i cÇn mét sè nguyªn liÖu ®Ó luyÖn vâ vµ luyÖn thuèc ",
				tTaskIndex = {4, 5}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{333, "Ngäc phong", "Thóy Yªn"},
						{333, "Mao Ng­u", "Miªu LÜnh"},
					},
					[2] = {
						{666, "CÇm Tiªn Tö", "V­¬ng MÉu ®éng_2"},
					},
					[3] = {
						{444, "Ng­êi c©y", "D­îc V­¬ng ®éng"},
					},
				},
				DropItem = {
					[1] = {
						["Ngäc phong"] = {222, "Tæ ong", {2,1,13}, 30},
						["Mao Ng­u"] = {222, "Mao Ng­u b×", {2,1,287}, 30},
					},
					[2] = {
						["§Þch tiªn Tö"] = {222, "Linh §Þch", {2,1,187}, 30},
					},
					[3] = {
						["Ng­êi c©y"] = {99, "RÔ c©y ngµn n¨m", {2,1,1422}, 30},
					},
				},
				tAward = {
					bIsOpen = 1,
					nFreeRoom = {1, 1},
					sAwardFunc = "fakct_Award201404_TaskStep_1()",
				}
			},
			[2] = {
				szTargetNpcName = "Hé MÉn",
				szNpcPosName = "Thóy Yªn (199,172)",
				szTargetNpcTitle = "tiªu diÖt ph¶n qu©n, thu thËp tµi nguyªn chÕ t¹o ®éc d­îc, vò khÝ  ",
				tTaskIndex = {6, 7}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{222, "Ph¶n Qu©n tuÇn la", "T©y Song B¶n N¹p Nam "},
						{222, "VÖ sÜ ph¶n qu©n", "T©y Song B¶n N¹p Nam "},
					},
					[2] = {
						{222, "Ph¶n Qu©n tuÇn la", "T©y Song B¶n N¹p Nam "},
						{222, "VÖ sÜ ph¶n qu©n", "T©y Song B¶n N¹p Nam "},
					},
					[3] = {
						{222, "Ph¶n Qu©n tuÇn la", "T©y Song B¶n N¹p Nam "},
						{222, "VÖ sÜ ph¶n qu©n", "T©y Song B¶n N¹p Nam "},
					},
				},
				DropItem = {
					[1] = {
						["Ph¶n Qu©n tuÇn la"] = {66, "Thuèc næ", {2,1,298}, 30},
						["VÖ sÜ ph¶n qu©n"] = {66, "Tµn kiÕm", {2,1,299}, 30},
					},
					[2] = {
						["Ph¶n Qu©n tuÇn la"] = {66, "Thuèc næ", {2,1,298}, 30},
						["VÖ sÜ ph¶n qu©n"] = {66, "Tµn kiÕm", {2,1,299}, 30},
					},
					[3] = {
						["Ph¶n Qu©n tuÇn la"] = {66, "Thuèc næ", {2,1,298}, 30},
						["VÖ sÜ ph¶n qu©n"] = {66, "Tµn kiÕm", {2,1,299}, 30},
					},
				},
				tAward = {
					bIsOpen = 1,
					nFreeRoom = {1, 1},
					sAwardFunc = "fakct_Award201404_TaskStep_2()",
				}
			},
		},
	},
	
	[125] = {
		nAcitvityID = 125,
		tTaskGroup = {7, 9},
		szTaskName = "Trõ gian diÖt b¹o",
		szStartName = "Th«n tr­ëng",
		nDaySeq = 1, --ÈÎÎñ±äÁ¿ÖØÖÃ±ê¼Ç
		nTaskStatus = 2, --ÈÎÎñ×´Ì¬
		tAward = {
			nAwardTag = 3, --Áì½±×´Ì¬0Î´ÁìÈ¡1ÁìÈ¡2ÒÑÁìÈ¡ÌØÊâ
			tDialog = {
				[1] = "Phæ th«ng ( tiªu hao 19 tiªu dao ngäc)",
				[2] = "¦u ®·i ( tiªu hao 99 tiªu dao ngäc)",
			},
			tCost = {
				[1] = {{2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
				[2] = {{2, 1, 30603, 99, "Tiªu Dao Ngäc"}},
			},
			tFreeRoom = {0, 0},
			tAwardFunc = {
				[1] = "fakct_Award201405_GetAward_1()",
				[2] = "fakct_Award201405_GetAward_2()",
			},
			tSpecial = {
				bIsOpen = 0,
				nRebornLimitUp = 0,
				sTitle = "",
				tCost = {},
				nFreeRoom = {},
				sAwardFunc = "nothing()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "Phï Nghi",
				szNpcPosName = "T­¬ng D­¬ng 190/187",
				szTargetNpcTitle = "XÝch LiÖt vµ Li Long ë Cæ D­¬ng §éng tµn ph¸ th«n xãm, d©n lµng ¨n ngñ kh«ng yªn, h·y ®Õn Cæ d­¬ng ®éng tÇng 2 ®Ó tiªu diÖt chóng",
				tTaskIndex = {4, 5}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{299, "LiÖt Nhan Li Long", "Cæ D­¬ng ®éng_2"},
						{299, "XÝch LuyÖn Háa Hå", "Cæ D­¬ng ®éng_2"},
					},
					[2] = {
						{299, "LiÖt Nhan Li Long", "Cæ D­¬ng ®éng_2"},
						{299, "XÝch LuyÖn Háa Hå", "Cæ D­¬ng ®éng_2"},
					},
					[3] = {
						{399, "LiÖt Nhan Li Long", "Cæ D­¬ng ®éng_2"},
						{399, "XÝch LuyÖn Háa Hå", "Cæ D­¬ng ®éng_2"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[2] = {
				szTargetNpcName = "N¹n d©n_Gi¸p",
				szNpcPosName = "Thµnh §« 228/227",
				szTargetNpcTitle = "L­u manh trong Thiªn TÇm Th¸p hµ hiÕp danh lµnh, ®¹i hiÖp h·y ®i tiªu diÖt chóng",
				tTaskIndex = {6, 7}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{399, "Thiªn TÇm Vâ T¨ng", "Thiªn TÇm th¸p_2"},
						{399, "Ma Ni T¨ng", "Thiªn TÇm th¸p_3"},
					},
					[2] = {
						{399, "Thiªn TÇm Vâ T¨ng", "Thiªn TÇm th¸p_2"},
						{399, "Ma Ni T¨ng", "Thiªn TÇm th¸p_3"},
					},
					[3] = {
						{499, "Thiªn TÇm Vâ T¨ng", "Thiªn TÇm th¸p_2"},
						{499, "Ma Ni T¨ng", "Thiªn TÇm th¸p_3"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
		},
	},
	
	[128] = {
		nAcitvityID = 128,
		tTaskGroup = {10, 9},
		szTaskName = "B¸ch §éc BÊt X©m",
		szStartName = "Th«n tr­ëng",
		szSayWhat = "§¹i Liªu lín m¹nh, c¸c chiÕn sÜ trªn th¶o nguyªn ®ang cÇn sù gióp søc. §¹i hiÖp cã thÓ gióp ®ì kh«ng?",
		nDaySeq = 1, --ÈÎÎñ±äÁ¿ÖØÖÃ±ê¼Ç
		nTaskStatus = 2, --ÈÎÎñ×´Ì¬
		tAward = {
			nAwardTag = 3, --Áì½±×´Ì¬0Î´ÁìÈ¡1ÁìÈ¡2ÒÑÁìÈ¡ÌØÊâ
			tDialog = {
				[1] = "Phæ th«ng ( tiªu hao 19 tiªu dao ngäc)",
				[2] = "VIP (Tiªu hao 99 Tiªu Dao Ngäc + 109 Vµng)",
			},
			tCost = {
				[1] = {{2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
				[2] = {{2, 1, 30603, 99, "Tiªu Dao Ngäc"},{1090000}},
			},
			tFreeRoom = {1, 5},
			tAwardFunc = {
				[1] = "fakct_Award201406_GetAward_1()",
				[2] = "fakct_Award201406_GetAward_2()",
			},
			tSpecial = {
				bIsOpen = 0,
				nRebornLimitUp = 0,
				sTitle = "",
				tCost = {},
				nFreeRoom = {},
				sAwardFunc = "nothing()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "Tèng qu©n tr­ëng hé vÖ",
				szNpcPosName = "Nh¹n M«n Quan 163/181",
				szTargetNpcTitle = "Qu©n Liªu hµnh hoµnh ©m m­u tiªu diÖt §¹i Tèng, qu©n ®Þch qu¸ ®«ng ng­¬i cã thÓ x«ng pha trËn m¹c gióp qu©n ta? H·y ®Õn §¹i Th¶o Nguyªn 2 tiªu diÖt bän chóng",
				tTaskIndex = {4, 5}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{399, "Vâ sÜ dÞ téc", "§¹i Th¶o Nguyªn 2"},
						{399, "TiÔn thñ dÞ téc", "§¹i Th¶o Nguyªn 2"},
					},
					[2] = {
						{399, "Vâ sÜ dÞ téc", "§¹i Th¶o Nguyªn 2"},
						{399, "TiÔn thñ dÞ téc", "§¹i Th¶o Nguyªn 2"},
					},
					[3] = {
						{399, "Vâ sÜ dÞ téc", "§¹i Th¶o Nguyªn 2"},
						{399, "TiÔn thñ dÞ téc", "§¹i Th¶o Nguyªn 2"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[2] = {
				szTargetNpcName = "D­¬ng NghiÖp",
				szNpcPosName = "Nh¹n M«n Quan 168/179",
				szTargetNpcTitle = "• Trong lóc ®¹i chiÕn liªu binh, do s¬ xuÊt ta ®· bÞ tróng ®éc cña Nhiªu L©n, kh«ng biÕt ®¹i hiÖp cã thÓ gióp ta ®Õn Nga Mi Ph¸i lÊy thuèc gi¶i kh«ng?",
				tTaskIndex = {}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {},
					[2] = {},
					[3] = {},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[3] = {
				szTargetNpcName = "D­¬ng NguyÖt s­ th¸i",
				szNpcPosName = "Nga Mi Ph¸i 205/192",
				szTargetNpcTitle = "§éc d­îc Nhiªu L©n chØ cã Thiªn Hoa T¸n míi cã thÓ ®iÒu trÞ, muèn cã Thiªn Hoa T¸n ph¶i tiªu diÖt Ho¶ Kú L©n vµ Trïng Qu¸i V­¬ng.",
				tTaskIndex = {6, 7}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{399, "Háa Kú L©n", "Thiªn S­ ®éng-2"},
						{399, "Trïng Qu¸i V­¬ng", "Thiªn S­ ®éng-2"},
					},
					[2] = {
						{399, "Háa Kú L©n", "Thiªn S­ ®éng-2"},
						{399, "Trïng Qu¸i V­¬ng", "Thiªn S­ ®éng-2"},
					},
					[3] = {
						{399, "Háa Kú L©n", "Thiªn S­ ®éng-2"},
						{399, "Trïng Qu¸i V­¬ng", "Thiªn S­ ®éng-2"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
		},
	},
	
	[140] = {
		nAcitvityID = 140,
		tTaskGroup = {9, 11},
		szTaskName = "Trõ gian diÖt b¹o",
		szStartName = "Th«n tr­ëng",
		nDaySeq = 1, --ÈÎÎñ±äÁ¿ÖØÖÃ±ê¼Ç
		nTaskStatus = 2, --ÈÎÎñ×´Ì¬
		tAward = {
			nAwardTag = 3, --Áì½±×´Ì¬0Î´ÁìÈ¡1ÁìÈ¡2ÒÑÁìÈ¡ÌØÊâ
			tDialog = {
				[1] = "Phæ th«ng (Tiªu hao 1 Bµn Long BÝch)",
				[2] = "¦u ®·i (Tiªu hao 3 Bµn Long BÝch)",
			},
			tCost = {
				[1] = {{2, 1, 1000, 1, "Bµn Long bÝch"}},
				[2] = {{2, 1, 1000, 3, "Bµn Long bÝch"}},
			},
			tFreeRoom = {0, 2},
			tAwardFunc = {
				[1] = "fakct_Award201411_GetAward_1()",
				[2] = "fakct_Award201411_GetAward_2()",
			},
			tSpecial = {
				bIsOpen = 0,
				nRebornLimitUp = 0,
				sTitle = "",
				tCost = {},
				nFreeRoom = {},
				sAwardFunc = "nothing()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "Phï Nghi",
				szNpcPosName = "T­¬ng D­¬ng 190/187",
				szTargetNpcTitle = "Yªu qu¸i hoµnh hµnh, d©n chóng lÇm than, ®¹i hiÖp h·y tiªu diÖt chóng ®Ó tr¶ l¹i sù b×nh yªn cho b¸ t¸nh",
				tTaskIndex = {4, 5}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{299, "Tú Bµ Tiªn Tö", "V­¬ng MÉu ®éng_1"},
						{299, "Tiªu Tiªn Tö", "V­¬ng MÉu ®éng_1"},
					},
					[2] = {
						{299, "Tú Bµ Tiªn Tö", "V­¬ng MÉu ®éng_1"},
						{299, "Tiªu Tiªn Tö", "V­¬ng MÉu ®éng_1"},
					},
					[3] = {
						{399, "§Þch tiªn Tö", "V­¬ng MÉu ®éng-3"},
						{399, "KiÕm tiªn Tö", "V­¬ng MÉu ®éng-3"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[2] = {
				szTargetNpcName = "N¹n d©n_Gi¸p",
				szNpcPosName = "Thµnh §« 228/227",
				szTargetNpcTitle = "L­u manh trong Thiªn TÇm Th¸p hµ hiÕp danh lµnh, ®¹i hiÖp h·y ®i tiªu diÖt chóng",
				tTaskIndex = {6, 7}, --Ê¹ÓÃµÄÈÎÎñ±äÁ¿Ë÷Òý¼ÇÂ¼É±¹Ö¸öÊý
				KillNpc = {
					[1] = {
						{199, "Thiªn TÇm Vâ T¨ng", "Thiªn TÇm th¸p_2"},
						{199, "Ma Ni T¨ng", "Thiªn TÇm th¸p_3"},
					},
					[2] = {
						{199, "Thiªn TÇm Vâ T¨ng", "Thiªn TÇm th¸p_2"},
						{199, "Ma Ni T¨ng", "Thiªn TÇm th¸p_3"},
					},
					[3] = {
						{299, "Thiªn TÇm Vâ T¨ng", "Thiªn TÇm th¸p_2"},
						{299, "Ma Ni T¨ng", "Thiªn TÇm th¸p_3"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
		},
	},
}