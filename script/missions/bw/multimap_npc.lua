Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--ÒıÓÃ×Ö·û´®´¦ÀíÖ§³Ö

function main()

local strSay = {};
	
	if GetMissionV(GAME_TYPE) == 1 then
		strSay = {
							"Thi ®Êu ®ang tæ chøc lµ QuÇn hïng chiÕn (trËn thø 1), ng­êi ch¬i tham gia thi ®Êu ®Òu cã thÓ nhËn ®­îc phÇn th­ëng ®iÓm søc kháe t­¬ng øng sau khi thi ®Êu kÕt thóc.",
							"Rêi khái trËn ®Şa/LeaveTalk",
							"T×m hiÓu quy t¾c l«i ®µi/#Rule_Hundred(2)",
							"Kh«ng cã g×/no"
							}
	elseif GetMissionV(GAME_TYPE) == 2 then
		strSay = 	{
							"Thi ®Êu ®ang tæ chøc lµ QuÇn hïng chiÕn (trËn thø 2), ng­êi ch¬i tham gia thi ®Êu mçi lÇn ®¸nh b¹i ®èi thñ cã thÓ nhËn ®­îc phÇn th­ëng tiÒn nhÊt ®Şnh. §Êu thñ chiÕn th¾ng sau cïng sÏ nhËn ®­îc phÇn th­ëng phong phó.",
							"Rêi khái trËn ®Şa/LeaveTalk",
							"T×m hiÓu quy t¾c l«i ®µi/#Rule_Hundred(3)",
							"Kh«ng cã g×/no"
							}
	else
		strSay = {
							"HiÕm khi cã dŞp ®Ó xem c¸c ®¹i hiÖp trªn giang hå biÓu diÔn vâ nghÖ, ®«i khi hä ph¶i ®¸nh ®æi c¶ gia tµi míi luyÖn thµnh. LÇn nµy ®óng dŞp may! Ch¼ng hay"..GetPlayerSex().."Cã cÇn g× kh«ng?",
							"Rêi khái trËn ®Şa/LeaveTalk",
							"T×m hiÓu quy t¾c l«i ®µi/#Rule_Hundred(1)",
							"Kh«ng cã g×/no"
							}
	end

	SelectSay(strSay)

end

function LeaveTalk()

	Talk(1,"LeaveMultiMap","Hy väng lÇn sau cã dŞp trë l¹i n¬i nµy xem ®Êu l«i ®µi!"..GetPlayerSex().."Phong th¸i cña b¹n.");

end


--Íæ¼ÒÒªÇóÀë¿ª±ÈÈü³¡µØ
function LeaveMultiMap()

local nCamp = GetTaskTemp(PLAYER_CAMP)

	--¹ÛÖÚÀë³¡
	if nCamp == 2 then
		DelMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);		
	--Ñ¡ÊÖÀë³¡	
	elseif nCamp == 1 then
		Msg2MSAll(GetName().." ®· rêi khái trËn ®Şa.");
		DelMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
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

function Rule_Hundred(nType)

local strTalk = {};

	if nType == 1 then
	
		strTalk = {
		"QuÇn hïng chiÕn ph¶i do 2 hoÆc nhiÒu h¬n c¸c hiÖp kh¸ch giang hå tham gia míi cã thÓ më chiÕn ®Şa tû vâ. Mçi ®Êu sÜ tham chiÕn sÏ tù m×nh lµm chñ. §Êu thñ m¹nh mÏ chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ng­êi chiÕn th¾ng!",
		"QuÇn hïng chiÕn lÇn nµy thİ nghiÖm tû vâ 1 ®èi 1, ngoµi viÖc tr¾c nghiÖm c«ng lùc b¶n th©n cßn cÇn biÕt ®­îc s¸ch l­îc chiÕn ®Êu kh¸c nhau cña c¸c ®èi thñ m¹nh yÕu vµ biÕn hãa cña chiÕn ®Şa ®Ó giµnh ®­îc chiÕn th¾ng cuèi cïng. NÕu c¸c h¹ lµ ng­êi v« ®Şch trªn trËn ®¬n ®Êu l«i ®µi 1 ®èi 1, ch­a t×m ®­îc ®èi thñ. H·y ®Õn chøng tá b¶n lÜnh cña m×nh trong trËn QuÇn hïng chiÕn!",
		"QuÇn hïng chiÕn phæ th«ng: cho phĞp hiÖp kh¸ch giang hå cÊp 10 trë lªn ®· gia nhËp m«n ph¸i tham gia vµ kh«ng cÇn nép tiÒn. §­¬ng nhiªn, ng­êi chiÕn th¾ng còng kh«ng nhËn ®­îc phÇn th­ëng nµo. Sau khi mêi vµo chiÕn ®Şa thµnh c«ng sÏ cã thêi gian chuÈn bŞ lµ 3 phót, hÕt thêi gian sÏ tù ®éng khai chiÕn. NÕu sè ng­êi tham chiÕn İt h¬n 1 ng­êi, thi ®Êu sÏ bŞ hñy bá.",
		}
	
	elseif nType == 2 then
		strTalk = {
			"Thi ®Êu ®ang tæ chøc lµ QuÇn hïng chiÕn- trËn thø 1, ng­êi ch¬i tham gia thi ®Êu ®Òu cã thÓ nhËn ®­îc phÇn th­ëng ®iÓm søc kháe t­¬ng øng sau khi thi ®Êu kÕt thóc.",
			"Mçi ®Êu thñ tham chiÕn sÏ tù m×nh lµm chñ. §Êu thñ m¹nh mÏ chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ng­êi chiÕn th¾ng!",
			}
	elseif nType == 3 then
		strTalk = {
			"Thi ®Êu ®ang tæ chøc lµ QuÇn hïng chiÕn- trËn thø 2, ng­êi ch¬i tham gia thi ®Êu mçi lÇn ®¸nh b¹i ®èi thñ cã thÓ nhËn ®­îc phÇn th­ëng tiÒn nhÊt ®Şnh. §Êu thñ chiÕn th¾ng sau cïng sÏ nhËn ®­îc phÇn th­ëng phong phó.",
			"Mçi ®Êu thñ tham chiÕn sÏ tù m×nh lµm chñ. §Êu thñ m¹nh mÏ chiÕn ®Êu ®Õn cuèi cïng sÏ lµ ng­êi chiÕn th¾ng!",
			}
	end

	TalkEx("#Rule_Hundred_1("..nType..")",strTalk)

end

function Rule_Hundred_1(nType)

local strTalk = {};

	if nType == 1 then
	
		strTalk = {
			"Mçi trËn, sè ng­êi tham chiÕn tèi ®a lµ 100 ng­êi, thêi gian thi ®Êu lµ 15 phót. Khi kÕt thóc, bªn nµo cßn l¹i nhiÒu ng­êi h¬n sÏ chiÕn th¾ng! NÕu sè ng­êi cßn l¹i b»ng nhau th× bªn nµo lóc vµo İt h¬n sÏ chiÕn th¾ng!",
--			"´úÖ¾Ç¿£º³ıÁËÒ»°ãÊ±¶ÎÄÚ¿ªÉèµÄ¶àÈËÀŞÌ¨³¡µØÍâ£¬{³É¶¼}»¹ÔÚÌØ¶¨µÄÊ±¼ä¾Ù°ì{°ÙÈËÓ¢ĞÛ´óÀŞ}¡£Ê±¼ä·Ö±ğÎª {ÔçÉÏ11:00}¡¢{11:30}£¬{ÏÂÎç17:00}¡¢{17:30}ºÍ{ÍíÉÏ21:00}¡¢{21:30}¡£",
--			"´úÖ¾Ç¿£º{°ÙÈËÓ¢ĞÛ´óÀŞ}ÔòĞèÒªÂú{60¼¶¼°ÒÔÉÏÒÑÓĞÃÅÅÉ}µÄ½­ºşÏÀÊ¿²Î¼Ó£¬µÚÒ»³¡±ÈÈüµÄÊ¤³öÕß¿ÉÒÔ»ñµÃÏàÓ¦µÄ½¡¿µ¾­Ñé½±Àø£¬¶øµÚ¶ş³¡±ÈÈüµÄÊ¤³öÕß¸ü¿É»ñµÃ·áºñµÄ½±½ğ¡£",
--			"´úÖ¾Ç¿£ºÏ£Íû½ìÊ±ÄÜÔÚÀŞÌ¨ÉÏÒ»¶Â"..GetPlayerSex().."ÄãµÄ·ç²É¡£",
			}
	
	elseif nType == 2 then
		strTalk = {
			"Mçi trËn, sè ng­êi tham chiÕn tèi ®a lµ 100 ng­êi, thêi gian thi ®Êu lµ 15 phót. Khi kÕt thóc, bªn nµo cßn l¹i nhiÒu ng­êi h¬n sÏ chiÕn th¾ng! NÕu sè ng­êi cßn l¹i b»ng nhau th× bªn nµo lóc vµo İt h¬n sÏ chiÕn th¾ng!",
			}
	elseif nType == 3 then
		strTalk = {
			"Mçi trËn, sè ng­êi tham chiÕn tèi ®a lµ 100 ng­êi, thêi gian thi ®Êu lµ 15 phót. Khi kÕt thóc, bªn nµo cßn l¹i nhiÒu ng­êi h¬n sÏ chiÕn th¾ng! NÕu sè ng­êi cßn l¹i b»ng nhau th× bªn nµo lóc vµo İt h¬n sÏ chiÕn th¾ng!",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end
