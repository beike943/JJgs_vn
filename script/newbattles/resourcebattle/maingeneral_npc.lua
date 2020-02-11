--filename:maingeneral_npc.lua
--create date:2006-06-05
--describe:Á¸²İÕù¶áÕ½³¡ÖĞË«·½Ö÷½«½Å±¾
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

sSongGeneral = "H¹ lÖnh ®å";
sLiaoGeneral = "TiÕu Lan §¹t";
-- Bit quy ®Şnh tæng tÊn c«ng cña Th¶o cèc
SONG_BIT = 2
LIAO_BIT = 6

function main()
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
	Say("<color=green>"..sNpcName.."<color>: L­¬ng th¶o cµng nhiÒu cµng cã lîi trong chiÕn ®Êu, nh­ng ph¶i cÈn thËn víi thæ d©n, hä kh«ng dÔ g× ®èi phã.",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh¹n M«n Quan-Th¶o cèc chiÕn chøa nhiÒu l­¬ng th¶o. Theo dä th¸m håi b¸o, phe Liªu cã kh¶ n¨ng cho lİnh ®Õn c­íp bÊt kú lóc nµo, v× vËy khi vµo chiÕn tr­êng cÇn ph¶i tranh thñ thêi gian!");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh¹n M«n Quan-Th¶o cèc chiÕn chøa nhiÒu l­¬ng th¶o. Theo dä th¸m håi b¸o, phe Tèng cã kh¶ n¨ng cho lİnh ®Õn c­íp bÊt kú lóc nµo, v× vËy khi vµo chiÕn tr­êng cÇn ph¶i tranh thñ thêi gian!");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Thêi gian chiÕn ®Êu 30 phót <enter>2: Phe nµo tİch lòy l­¬ng th¶o nhiÒu h¬n sÏ th¾ng<enter>3: §iÓm tİch lòy cao nhÊt<color=yellow>"..POINT_LIMITED.."<color><enter>4: Giíi h¹n pk<enter>5: NhËn ®­îc phÇn th­ëng cña Hoµng ®Õ + ®iÓm tİch lòy <color=yellow>"..EMPEROR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v¹n<enter>6: §­îc bÇu lµm ng«i sao chiÕn tr­êng+®iÓm tİch lòy <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v¹n");
end;

function wantaward()

end;