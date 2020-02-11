--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:´åÂäÕù¶áÕ½³¡ÖĞË«·½Ö÷½«½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

sSongGeneral = "Phan Nh©n Mü";
sLiaoGeneral = "Gia LuËt Sa";

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch¹y th«i! Löa kĞo ®Õn n¬i råi!");
	end;
	local selTab = {
			"Bèi c¶nh/knowbackground",
			"Quy t¾c chiÕn tr­êng/knowbattlerule",
			"KÕt thóc ®èi tho¹i/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: ë Th«n trang chiÕn chñ yÕu t×m thñ lÜnh thæ d©n, tr¸nh g©y th­¬ng vong!",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: BiÕt ng­êi biÕt ta, tr¨m trËn tr¨m th¾ng, ta chñ yÕu t×m thñ lÜnh thæ d©n, nhê hä gióp ®ì");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: BiÕt ng­êi biÕt ta, tr¨m trËn tr¨m th¾ng, ta chñ yÕu t×m thñ lÜnh thæ d©n, nhê hä gióp ®ì");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Phe nµo t×m ®­îc Thñ lÜnh Thæ d©n tr­íc sÏ giµnh chiÕn th¾ng<enter>2: Thêi gian: 30 phót. NÕu 2 bªn ®Òu kh«ng t×m ®­îc Thæ d©n sÏ dùa theo b­íc ®Ó tİnh, bªn nµo cã sè b­íc hoµn thµnh nhiÒu h¬n sÏ giµnh th¾ng lîi <enter>3: NÕu sè b­íc nh­ nhau xem nh­ hßa<enter>4: Kh«ng giíi h¹n pk nh­ng khi tiªu diÖt t­íng sÜ ®èi ph­¬ng sÏ kh«ng nhËn ®­îc ®iÓm tİch lòy<enter>5: §iÓm tİch lòy cao nhÊt <color=yellow>"..POINT_LIMITED.."<color><enter>6: NhËn ®­îc phÇn th­ëng cña Hoµng ®Õ + ®iÓm tİch lòy<color=yellow>"..EMPEROR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v¹n<enter>7: §­îc bÇu lµm ng«i sao chiÕn tr­êng+®iÓm tİch lòy<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v¹n");
end;

function wantaward()

end;
