--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:ÅÚÌ¨Õù¶áÕ½³¡ÖĞË«·½Ö÷½«½Å±¾
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

sSongGeneral = "D­¬ng T¸i H­ng";
sLiaoGeneral = "Tiªu ViÔn S¬n";
-- Bit quy ®Şnh tæng tÊn c«ng cña Ph¸o ®µi
SONG_BIT = 3
LIAO_BIT = 7

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 23 then
		return 0;
	end;
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch¹y th«i! Löa kĞo ®Õn n¬i råi!");
	end;
	local selTab = {			
			"Bèi c¶nh/knowbackground",
			"Quy t¾c chiÕn tr­êng/knowbattlerule",
			"Nguyªn So¸i ph¸t lÖnh tæng tÊn c«ng/battle_charge",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: Ph¸o ®µi lµ cø ®iÓm quan träng mµ chóng ta cÇn chiÕm lÜnh",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: ChiÕn dŞch lÇn nµy cÇn ph¶i chiÕm gi÷ ph¸o ®µi, khèng chÕ cöa ¶i Nh¹n M«n Quan. C¸c chiÕn binh! TiÕn lªn!!!");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: ChiÕn dŞch lÇn nµy cÇn ph¶i chiÕm gi÷ ph¸o ®µi, khèng chÕ cöa ¶i Nh¹n M«n Quan. C¸c chiÕn binh! TiÕn lªn!!!");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Phe nµo chiÕm lÜnh ph¸o ®µi Nh¹n M«n Quan l©u nhÊt sÏ chiÕn th¾ng<enter>2: Khu vùc chiÕn ®Êu, kh«ng h¹n chÕ pk<enter>3: §iÓm tİch lòy tèi ®a <color=yellow>"..POINT_LIMITED.."<color><enter>4: NhËn ®­îc <color=yellow>"..EMPEROR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v¹n<enter>5: §­îc bÇu lµm Ng«i sao chiÕn tr­êng+®iÓm tİch lòy <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v¹n");
end;
