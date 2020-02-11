Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--ÒıÓÃ×Ö·û´®´¦ÀíÖ§³Ö

function main()

local strSay = {};
	
	if GetMissionV(GAME_TYPE) == 3 then
		strSay = {
							"Thi ®Êu ®ang tæ chøc lµ §éi chiÕn (trËn thø 1), ng­êi ch¬i tham gia thi ®Êu ®Òu cã thÓ nhËn ®­îc phÇn th­ëng ®iÓm søc kháe t­¬ng øng sau khi thi ®Êu kÕt thóc.",
							"Rêi khái trËn ®Şa/LeaveMap",
							"T×m hiÓu quy t¾c l«i ®µi/#Rule_Team(2)",
							"Kh«ng cã g×/no"
							}
	elseif GetMissionV(GAME_TYPE) == 4 then
		strSay = 	{
							"Thi ®Êu ®ang tæ chøc lµ §éi chiÕn (trËn thø 2), ng­êi ch¬i tham gia thi ®Êu mçi lÇn ®¸nh b¹i ®èi thñ cã thÓ nhËn ®­îc phÇn th­ëng tiÒn nhÊt ®Şnh. §Êu thñ chiÕn th¾ng sau cïng sÏ nhËn ®­îc phÇn th­ëng phong phó.",
							"Rêi khái trËn ®Şa/LeaveMap",
							"T×m hiÓu quy t¾c l«i ®µi/#Rule_Team(3)",
							"Kh«ng cã g×/no"
							}
	else
		strSay = {
							"HiÕm khi cã dŞp ®Ó xem c¸c ®¹i hiÖp trªn giang hå biÓu diÔn vâ nghÖ, ®«i khi hä ph¶i ®¸nh ®æi c¶ gia tµi míi luyÖn thµnh. LÇn nµy ®óng dŞp may! Ch¼ng hay"..GetPlayerSex().."Cã cÇn g× kh«ng?",
							"Rêi khái trËn ®Şa/LeaveMap",
							"T×m hiÓu quy t¾c l«i ®µi/#Rule_Team(1)",
							"Kh«ng cã g×/no"
							}
	end

	SelectSay(strSay)

end


--Íæ¼ÒÒªÇóÀë¿ª±ÈÈü³¡µØ
function LeaveMap()

local i=0;

	if GetTaskTemp(PLAYER_CAMP) == 11 then
		DelMSPlayer(TEAM_MISSION_ID,0);
		return
	end

	--µ±Ç°ÉêÇëÈË²»ÊÇ¶Ó³¤
	if PlayerIndex ~= gf_GetTeamMember(0) then
		Say("§éi tr­ëng míi cã thÓ ®­a ®éi rêi khái ®Êu tr­êng!",0);
	else
		DelMSPlayer(TEAM_MISSION_ID,0);
	end
end

function GetPlayerSex()

local nSex = "";

	if GetSex() == 1 then
		nSex = "§¹i hiÖp";
	else
		nSex = "N÷ hiÖp ";
	end
	
	return nSex		

end

function Rule_Team(nType)

local strTalk = {};

	if nType == 1 then
		strTalk = {
			"QuÇn hïng chiÕn ph¶i cã 2 ®éi ngò trë lªn tham gia míi cã thÓ më chiÕn ®Şa tû vâ. Mçi ®éi ngò tham chiÕn sÏ tù m×nh lµm chñ. §éi m¹nh nhÊt chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ®éi chiÕn th¾ng!",
			"L«i ®µi lÇn nµy thİ nghiÖm tæ ®éi tû vâ 1 ®èi 1, ngoµi viÖc tr¾c nghiÖm c«ng lùc b¶n th©n cßn cÇn biÕt ®­îc s¸ch l­îc chiÕn ®Êu kh¸c nhau cña c¸c ®èi thñ m¹nh yÕu vµ biÕn hãa cña chiÕn ®Şa ®Ó giµnh ®­îc chiÕn th¾ng cuèi cïng. NÕu c¸c h¹ lµ ng­êi v« ®Şch, ch­a t×m ®­îc ®èi thñ. H·y ®Õn chøng tá b¶n lÜnh cña ®oµn ®éi trong hçn chiÕn l«i ®µi!",
			"QuÇn hïng chiÕn phæ th«ng cho phĞp ®éi cã İt nhÊt 2 ng­êi tõ cÊp 10 trë lªn ®· gia nhËp m«n ph¸i tham gia vµ kh«ng cÇn nép tiÒn. §­¬ng nhiªn, ®Êu thñ chiÕn th¾ng còng kh«ng nhËn ®­îc phÇn th­ëng nµo. Sau khi b¸o danh thµnh c«ng sÏ cã 3 phót chuÈn bŞ, hÕt thêi gian sÏ tù ®éng khai chiÕn. NÕu sè ®éi tham chiÕn İt h¬n 2 ®éi, thi ®Êu sÏ bŞ hñy bá.",
			}
	elseif nType == 2 then
		strTalk = {
			"Thi ®Êu ®ang tæ chøc lµ QuÇn hïng chiÕn (trËn thø 1), ng­êi ch¬i tham gia thi ®Êu ®Òu cã thÓ nhËn ®­îc phÇn th­ëng ®iÓm søc kháe t­¬ng øng sau khi thi ®Êu kÕt thóc.",
			"ChØ cÇn ®éi cã tõ 2 thµnh viªn trë lªn trë lªn b¸o danh, sÏ ®ñ t­ c¸ch thi ®Êu. Mçi ®éi ngò tham chiÕn sÏ tù m×nh lµm chñ. §éi m¹nh nhÊt chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ®éi chiÕn th¾ng!",
			}
	elseif nType == 3 then
		strTalk = {
			"Thi ®Êu ®ang tæ chøc lµ QuÇn hïng chiÕn (trËn thø 2), ®éi chiÕn th¾ng sau cïng sÏ nhËn ®­îc phÇn th­ëng phong phó.",
			"ChØ cÇn ®éi cã tõ 2 thµnh viªn trë lªn trë lªn b¸o danh, sÏ ®ñ t­ c¸ch thi ®Êu. Mçi ®éi ngò tham chiÕn sÏ tù m×nh lµm chñ. §éi m¹nh nhÊt chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ®éi chiÕn th¾ng!",
			}
	end

	TalkEx("#Rule_Team_1("..nType..")",strTalk)

end

function Rule_Team_1(nType)

local strTalk = {};

	if nType == 1 then
		strTalk = {
			"Mçi trËn, sè ng­êi tham gia mçi ®éi tèi ®a lµ 10 ng­êi, thêi thi ®Êu lµ 15 phót. HÕt giê thi ®Êu, ®éi cßn l¹i nhiÒu ng­êi h¬n sÏ giµnh chiÕn th¾ng.",
			"Ngoµi ra, trong khi thi ®Êu, bÊt cø lóc nµo ®éi tr­ëng bŞ rít m¹ng hoÆc vÒ thµnh th× ®éi m×nh sÏ bŞ xö thua!",   
--			"´úÖ¾Ç¿£º³ıÁËÒ»°ãÊ±¶ÎÄÚ¿ªÉèµÄ¶àÈËÀŞÌ¨³¡µØÍâ£¬{³É¶¼}»¹ÔÚÌØ¶¨µÄÊ±¼ä¾Ù°ì{ÍÅ¶Ó¼¤Õ½´óÀŞ}¡£Ê±¼ä·Ö±ğÎª {ÔçÉÏ12:00}¡¢{12:30}£¬{ÏÂÎç18:00}¡¢{18:30}ºÍ{ÍíÉÏ23:00}¡¢{23:30}¡£",
--			"´úÖ¾Ç¿£º{ÍÅ¶Ó¼¤Õ½´óÀŞ}ÔòĞèÒªÂú{60¼¶¼°ÒÔÉÏÒÑÓĞÃÅÅÉ}µÄ{2ÈËÒÔÉÏµÄ¶ÓÎé}²Î¼Ó£¬²¢ÇÒĞèÓÉ¶Ó³¤½»ÄÉ{10½ğ}×÷Îª±ÈÈüµÄÈë³¡·ÑÓÃ£¬µÚÒ»³¡±ÈÈüµÄÊ¤³ö¶ÓÎé¿ÉÒÔ»ñµÃÏàÓ¦µÄ½¡¿µ¾­Ñé½±Àø£¬¶øµÚ¶ş³¡±ÈÈüµÄÊ¤³ö¶ÓÎé¸ü¿É»ñµÃ·áºñµÄ½±½ğ¡£",
--			"´úÖ¾Ç¿£ºÏ£Íû½ìÊ±ÄÜÔÚÀŞÌ¨ÉÏÒ»¶Â"..GetPlayerSex().."ÄãµÄ·ç²É¡£",
			}
	elseif nType == 2 then
		strTalk = {
			"Mçi trËn, sè ng­êi tham gia mçi ®éi tèi ®a lµ 10 ng­êi, thêi thi ®Êu lµ 15 phót. HÕt giê thi ®Êu, ®éi cßn l¹i nhiÒu ng­êi h¬n sÏ giµnh chiÕn th¾ng.",
			"Ngoµi ra, trong khi thi ®Êu, bÊt cø lóc nµo ®éi tr­ëng bŞ rít m¹ng hoÆc vÒ thµnh th× ®éi m×nh sÏ bŞ xö thua!",   
			"L«i ®µi lÇn nµy thİ nghiÖm hçn chiÕn tû vâ, ngoµi viÖc tr¾c nghiÖm c«ng lùc b¶n th©n cßn cÇn biÕt ®­îc s¸ch l­îc chiÕn ®Êu kh¸c nhau cña c¸c ®èi thñ m¹nh yÕu vµ biÕn hãa cña chiÕn ®Şa ®Ó giµnh ®­îc chiÕn th¾ng cuèi cïng.",
			"Hy väng c¸c giang hå hiÖp kh¸ch tham gia ®«ng ®ñ!"..GetPlayerSex().."Phong th¸i cña b¹n.",
			}
	elseif nType == 3 then
		strTalk = {
			"Mçi trËn, sè ng­êi tham gia mçi ®éi tèi ®a lµ 10 ng­êi, thêi thi ®Êu lµ 15 phót. HÕt giê thi ®Êu, ®éi cßn l¹i nhiÒu ng­êi h¬n sÏ giµnh chiÕn th¾ng.",
			"Ngoµi ra, trong khi thi ®Êu, bÊt cø lóc nµo ®éi tr­ëng bŞ rít m¹ng hoÆc vÒ thµnh th× ®éi m×nh sÏ bŞ xö thua!",   
			"L«i ®µi lÇn nµy thİ nghiÖm hçn chiÕn tû vâ, ngoµi viÖc tr¾c nghiÖm c«ng lùc b¶n th©n cßn cÇn biÕt ®­îc s¸ch l­îc chiÕn ®Êu kh¸c nhau cña c¸c ®èi thñ m¹nh yÕu vµ biÕn hãa cña chiÕn ®Şa ®Ó giµnh ®­îc chiÕn th¾ng cuèi cïng.",
			"Hy väng c¸c giang hå hiÖp kh¸ch tham gia ®«ng ®ñ!"..GetPlayerSex().."Phong th¸i cña b¹n.",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end
