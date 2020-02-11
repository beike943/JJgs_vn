--ÎâÈÊµÀ
Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

tAllDialog = {
	[0] = {
			"Trong tæ ®éi cã 3 nghÒ ®Æt bÉy, quĞt dän vµ b·o kİch ®¶m b¶o sù th«ng tho¸ng trªn ®­êng v­ît ¶i.",
			"§­¬ng nhiªn kh«ng thÓ thiÕu phÇn cña PhËt muéi muéi råi.",
			"Mang ®Çy ®ñ vËt phÈm ®Õn ®©y, nÕu kh«ng c¸c h¹ ph¶i t×m t¹i h¹ lÇn n÷a.",
			"V­ît ¶i thÊt b¹i cã thÓ khiªu chiÕn l¹i, kh«ng cÇn tho¸t ra ®¨ng nhËp l¹i.",
			"T¹i h¹ sÏ nãi bİ mËt cña tõng Boss cho c¸c h¹ biÕt, bëi v× t¹i h¹ lµ Ng« Nh©n §¹o v¹n sù th«ng.",
			"Xin ®õng gian lËn nh­ thÕ sÏ lµm mÊt tİnh hÊp dÉn khi v­ît ¶i.",
		},	
	[1] = {
			"NhËm Doanh Doanh vµ H­íng VÊn Thiªn sÏ dèc søc t­¬ng trî cho c¸c h¹, h·y yªn t©m.",
			"Tr­íc khi Tiªu D­¬ng xuÊt hiÖn h·y giÕt chÕt Th«ng Thiªn Tö VÖ ®Ó gi¶m bít ¸p lùc .",
			"Khi Tiªu D­¬ng c«ng kİch sÏ nh¾c nhë tªn môc tiªu, h·y tr¸nh xa khu vùc cã ng­êi ch¬i ®ã.",
			"Môc tiªu Tiªu D­¬ng giÕt sÏ håi phôc 10% sinh lùc, h·y b¶o vÖ tİnh m¹ng NPC cña c¸c h¹ vµ h¶o h÷u .",
		},
	[2] = {
			"Háa Lùc ThÊt S¸t ph¸t næ trong 1 gi©y cã thÓ nĞ tr¸nh ®­îc.",
			"Mçi lÇn Ph¸ Qu©n tiªu hao 10% sinh lùc sÏ v« ®Şch trong mét kho¶ng thêi gian ng¾n.",
			"Tham Lang v« cïng hung d÷ nh­ng di chuyÖn rÊt chËm ch¹p.",
			"S¸t th­¬ng 3 boss, l­îng m¸u khi giÕt Ph¸ Lang sÏ gi¶m xuèng.",
			"TiÕng kªu g©y ra s¸t th­¬ng t¨ng theo thêi gian, h·y nhanh chãng tiªu diÖt.",
		},
	[3] = {
			"Ng¹c Méng Chi Hoa ®­îc Phôc Méng triÖu gäi lu«n xuÊt hiÖn t¹i vŞ trİ ®Æc biÖt, h·y s¾p xÕp ng­êi ph¸ hñy tr­íc.",
			"Ng¹c Méng Chi Hoa ®­îc Phôc Méng triÖu gäi cã søc m¹nh v« biªn, h·y cïng nhau phèi hîp tiªu diÖt .",
			"Ng¹c Méng Chi Hoa triÖu gäi kÕ tiÕp sÏ xuÊt hiÖn tr­íc mÆt c¸c h¹. ",
		},
	[4] = {
			"Hé vÖ TÊt YÓn triÖu gäi xuÊt hiÖn t¹i vŞ trİ cè ®Şnh, s¾p xÕp ng­êi ®i ph¸ hñy tr­íc.",
			"Hé vÖ TÊt YÓn triÖu gäi bŞ gi¶m tèc, sau khi ®Õn §Ønh TÕ §µn sÏ biÕn lín m¹nh kh¸c th­êng. ",
			"Tr¸nh xa ph¹m vi TÊt YÓn phãng thİch s¸t th­¬ng ®Ó gi¶m thiÓu thä th­¬ng.",
		},
	[5] = {
			"§¸nh b¹i tÊt c¶ Ma KiÕm tr­íc lóc Thu Tiªn Tö chÕt.",
			"Søc m¹nh Ma KiÕm kh¸c nhau, háa lùc còng kh¸c nhau.",
			"Trong kho¶ng thêi gian ng¾n H­íng VÊn Thiªn c¨n cø Ma KiÕm cßn l¹i trªn chiÕn tr­êng t¨ng søc c«ng kİch cho Ma KiÕm vµ ng­êi ch¬i.",
		},
	[6] = {
			"Chia c¾t hai vŞ Tr­ëng L·o ®Ó gi¶m  s¸t th­¬ng.",
			"H¾c Tr­ëng L·o ngo¹i phßng thÊp, B¹ch Tr­ëng L·o néi phßng thÊp.",
			"§õng giÕt Cæ Trïng ®­îc phãng thİch ra, h·y tr¸nh xa.",
			"Sau khi giÕt xong mét Tr­ëng L·o ng­êi cßn l¹i ph¶i bŞ ®¸nh b¹i trong 20 gi©y, nÕu kh«ng ng­êi ®ã sÏ sèng l¹i.",
		},
	[7] = {
			"Tµ Hoa Th¸nh L¹c Phi cã søc m¹nh lín rÊt h÷u İch nÕu trong tæ ®éi cã.",
			"Tµ Hoa Th¸nh L¹c Phi phãng thİch Hång T­êng Vi s¸t th­¬ng Thu Tiªn Tö, PhÊn Hoa Hång cã t¸c dông ch÷a trŞ, ®õng bá qua Hång T­êng Vi, nh­ng ph¶i gi÷ kü PhÊn Hoa Hång.",
			"NÕu kh«ng cã PhÊn Hoa Hång ch÷a trŞ cho Thu Tiªn Tö, trong 100 gi©y c¸c h¹ ph¶i ®¸nh b¹i Tµ Hoa Th¸nh L¹c Phi.",
		},
	[8] = {
			"C¸c h¹ kh«ng chó t©m cã 3 cao thñ xuÊt chóng hç trî mµ cßn thÊt b¹i…",
		},
}

g_NpcName = "<color=green>Ng« Nh©n §¹o<color>#"

function main()
	local strtab = {
			"\n rêi ¶i/wrd_leave_1",
			"\n T¹i h¹ muèn quay vÒ chiÕn tr­êng (cÇn [Th«ng Thiªn LÖnh]x1)/wrd_goto",
			"\nKÕt thóc ®èi tho¹i/nothing",
		}
	local nCurStage = GetMissionV(MV_STAGE);
	local nRand = 0;
	local strMsg = "";
	if tAllDialog[nCurStage] then
		if nCurStage == 0 then
			nRand = random(1,getn(tAllDialog[nCurStage]));
			strMsg = tAllDialog[nCurStage][nRand];
		else
			if random(1,100) <= 50 then
				nRand = random(1,getn(tAllDialog[nCurStage]));
				strMsg = tAllDialog[nCurStage][nRand];
			else
				nRand = random(1,getn(tAllDialog[0]));
				strMsg = tAllDialog[0][nRand];
			end
		end
	else
		nRand = random(1,getn(tAllDialog[0]));
		strMsg = tAllDialog[0][nRand];
	end
	Say(g_NpcName..strMsg,
		getn(strtab),
		strtab)
end

function wrd_leave_1()
	local strtab = {
			"\n ®õng nãi nhiÒu lêi, t¹i h¹ ph¶i ®i/wrd_leave_2",
			"\n ngåi quan s¸t chê th«ng quan/nothing",
		};
	Say(g_NpcName.."ThiÕu hiÖp ®õng tõ bá, ®ång ®¹o vâ l©m kh«ng ng¹i x­¬ng r¬i m¸u ®æ chiÕn ®Êu v× chİnh nghÜa, ThiÕu hiÖp nhÉn t©m rêi khái sao?",
		getn(strtab),
		strtab)
end

function wrd_leave_2()
	SetCreateTeam(0);
	LeaveTeam();
	NewWorld(500, 1736, 3043);
end

function wrd_goto()
	local nCurStage = GetMissionV(MV_STAGE);
	if tStartPos[nCurStage] then
		if DelItem(2,1,30409,1) == 1 then
			_stat_when_ib_consume(1)
			RestoreAll();
			ttd_setPos(tStartPos[nCurStage][1],tStartPos[nCurStage][2]);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", 1, 0);
			gf_WriteLogEx("tongtian mission", "death back to mission IB cost", "", "Th«ng Thiªn LÖnh", "2,1,30409,1");
		else
			Talk(1,"",g_NpcName.."C¸c h¹ kh«ng ®ñ Th«ng Thiªn LÖnh Bµi!")
		end
	end
end