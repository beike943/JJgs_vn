--file name:hand_in_hand_head.lua
--author:yanjun(yim)
--create date:2006-7-7
--describe:Ğ¯ÊÖÊÀ½ç±­»î¶¯Í·ÎÄ¼ş
TRIGGER_ID = 3119	--´¥·¢Æ÷×Ô¶¨ÒåID
TIME_TRIGGER_ID = 2	--Ê±¼ä´¥·¢Æ÷±íÀïµÄID

TASK_TEAMINDEX = 1687	--¼ÇÂ¼Ñ¡ÔñµÄ¶ÓÎéµÄË÷Òı
TASK_GOTCARD_TIME = 1688	--¼ÇÂ¼Íæ¼ÒÉÏ´ÎµÃµ½¿¨Æ¬µÄÊ±¼ä
TASK_GOT4TEAM_AWARD = 1689	--¼ÇÂ¼»»È¡4Ç¿¶ÓÎé¿¨Æ¬½±Àø´ÎÊı
TASK_GOTALLTEAM_AWARD = 1690	--¼ÇÂ¼»»È¡Ì×¿¨½±Àø´ÎÊı
TASK_GOTRING_AWARD = 1691	--¼ÇÂ¼»»È¡´óÁ¦ÉñÏîÁ´µÄ´ÎÊı
TASK_GOTCARD_COUNT = 1692	--¼ÇÂ¼»ñµÃ¿¨Æ¬µÄÊıÁ¿
TASK_GOTCARD_DATE = 1693	--¼ÇÂ¼»ñµÃ¿¨Æ¬µÄÈÕÆÚ
TASK_GOTAWARD_TIME = 1694	--¼ÇÂ¼Íæ¼ÒÉÏ´Î»»È¡½±ÀøµÄÊ±¼ä
TASK_GOTCHINA_CARD = 1695	--¼ÇÂ¼Íæ¼ÒµÃµ½ÖĞ¹ú¶ÓÖ®¿¨µÄ´ÎÊı
TASK_GOTPET_TIME = 1696	--¼ÇÂ¼Íæ¼Ò³èÎïµ®ÉúÊ±¼ä
TASK_GOTGROUP_AWARD = 1697	--¼ÇÂ¼Íæ¼Ò»»È¡Ğ¡×é¿¨µÄ½±ÀøµÄ´ÎÊı 

WAIT_TIME = 60*60;	--»¥¶¯¼ä¸ôÊ±¼ä,1Ğ¡Ê±
GET_AWARD_INTERVAL = 60*60;	--»»È¡½±Àø¼ä¸ôÊ±¼ä
CARD_COUNT_LIMIT = 6;	--Ã¿Ìì»ñµÃ¿¨Æ¬ÊıÁ¿µÄÏŞÖÆ

tTeamName = {
		[1] = "§øc",	
		[2] = "Costa Rica",
		[3] = "Ba Lan",
		[4] = "Ecuador",
		[5] = "Anh",
		[6] = "Paraguay",
		[7] = "Trinidad vµ Tobago",
		[8] = "Thôy §iÓn",
		[9] = "¸chentina",
		[10] = "Bê BiÓn Ngµ",
		[11] = "Nam T­",
		[12] = "Hµ Lan",
		[13] = "Bå §µo Nha",
		[14] = "Iran",
		[15] = "Angola",
		[16] = "Mª Hi C«",
		[17] = "ı",
		[18] = "Ghana",
		[19] = "Mü",
		[20] = "TiÖp Kh¾c",
		[21] = "Brazil",
		[22] = "Croatia",
		[23] = "óc",
		[24] = "NhËt B¶n",
		[25] = "Ph¸p",
		[26] = "Thôy Sü",
		[27] = "Hµn Quèc",
		[28] = "Togo",
		[29] = "Ukraina",
		[30] = "T©y Ban Nha",
		[31] = "Tunisia",
		[32] = "¶ RËp Xª ót",
		}
	
tItemCard = {	--Ãû×Ö£¬±àºÅ1,±àºÅ2,±àºÅ3,¸ÅÂÊ
		[1] = {"thÎ §øc ",2,0,410,300},
		[2] = {"thÎ Costa Rica ",2,0,411,600},
		[3] = {"Ba Lan card ",2,0,412,900},
		[4] = {"Ecuador card ",2,0,413,1200},
		[5] = {"thÎ Anh ",2,0,414,1500},
		[6] = {"thÎ Paraguay ",2,0,415,1800},
		[7] = {"thÎ Trinidad vµ Tobago ",2,0,416,2100},
		[8] = {"thÎ Thôy §iÓn ",2,0,417,2400},
		[9] = {"thÎ ¸chentina ",2,0,418,2700},
		[10] = {"thÎ Bê BiÓn Ngµ ",2,0,419,3000},
		[11] = {"thÎ Nam T­ ",2,0,420,3300},
		[12] = {"thÎ Hµ Lan ",2,0,421,3600},
		[13] = {"thÎ Bå §µo Nha ",2,0,422,3900},
		[14] = {"thÎ Iran ",2,0,423,4200},
		[15] = {"thÎ Angola ",2,0,424,4500},
		[16] = {"thÎ Mª Hi C« ",2,0,425,5400},
		[17] = {"thÎ ı ",2,0,426,4800},
		[18] = {"thÎ Ghana ",2,0,427,5100},
		[19] = {"thÎ Mü ",2,0,428,5700},
		[20] = {"thÎ TiÖp Kh¾c ",2,0,429,6000},
		[21] = {"thÎ Brazil ",2,0,430,6300},
		[22] = {"thÎ Croatia ",2,0,431,6600},
		[23] = {"thÎ óc ",2,0,432,6900},
		[24] = {"thÎ NhËt B¶n ",2,0,433,7200},
		[25] = {"thÎ Ph¸p ",2,0,434,7500},
		[26] = {"thÎ Thôy Sü ",2,0,435,7800},
		[27] = {"thÎ Hµn Quèc ",2,0,436,8100},
		[28] = {"thÎ Togo ",2,0,437,8400},
		[29] = {"thÎ Ukraina ",2,0,438,8700},
		[30] = {"thÎ T©y Ban Nha ",2,0,439,9000},
		[31] = {"thÎ Tunisia ",2,0,440,9300},
		[32] = {"thÎ ¶ RËp ",2,0,441,9600},
		[33] = {"thÎ l­u niÖm cóp thÕ giíi VLTK2",2,0,443,9995},
		[34] = {"thÎ Trung Quèc",2,0,442,10000},
		}

tItemOther = {
		present_bag = {"LÔ bao kû niÖm cóp thÕ giíi",2,1,499},
		ring = {"§¹i Lùc ThÇn H¹ng Liªn",0,102,28},
		monster_card = {"TiÓu Niªn Thó ThÇn Phï",2,1,498},
		transformer_card = {"B¸ch BiÕn TiÓu ThÇn Th«ng",2,1,497},
		intro_book = {"H­íng dÉn ho¹t ®éng cóp thÕ giíi",2,0,409},
		}

function Is_HandInHand_Open()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 060714 and nDate <= 060723 then
		return 1;	--»î¶¯ÆÚ¼ä
	elseif nDate >= 060714 and nDate <= 060806 then
		return 2;	--»î¶¯½áÊø£¬µ«»¹¿ÉÒÔÁì½±
	else
		return 0;
	end;
end;

function nothing()

end;
