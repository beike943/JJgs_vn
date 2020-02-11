--filename:maingeneral_npc.lua
--create date:2006-06-27
--describe:Ö÷Õ½³¡ÖĞË«·½Ö÷½«½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");

sSongGeneral = "D­¬ng NghiÖp";
sLiaoGeneral = "Gia LuËt H­u C¸ch";

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
	Say("<color=green>"..sNpcName.."<color>: Thêi gian quyÕt chiÕn ®· ®Õn, ta tù hµo c¸c t­íng sÜ tham gia trËn chiÕn ngµy h«m nay.",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	local sEnemyCampName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		sEnemyCampName = "Liªu";
	else
		sNpcName = sLiaoGeneral;
		sEnemyCampName = "Tèng";
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: Ngäc M«n quan ®Şa thÓ hiÓm trë víi nhiÒu ®­êng nhá th«ng suèt. Ba háa ph¸o trªn ®Ønh cã thÓ khèng chÕ toµn côc diÖn. Chİnh gi÷a chiÕn tr­êng lµ n¬i d©n lµng tu tËp, cã rÊt nhiÒu ®iÓm tµi nguyªn vµ n¹n d©n, nÕu kh«ng chÕ ®­îc hä ta tin n¾m ch¾c phÇn th¾ng. C¸c vŞ cè g¾ng lªn!");
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Trong thêi gian chiÕn ®Êu giÕt ®­îc chñ so¸i xem nh­ chiÕn th¾ng; <enter>2: HÕt thêi gian, ch­a giÕt ®­îc sÏ dùa vµo ®iÓm tİch lòy c«ng céng quyÕt ®Şnh, sè ®iÓm b»ng nhau xem nh­ hßa.<enter>3: Tİch lòy tèi ®a <color=yellow>"..POINT_LIMITED.."<color><enter>4: NhËn ®­îc <color=yellow>"..EMPEROR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v¹n<enter>5: §­îc bÇu lµm Ng«i sao chiÕn tr­êng+®iÓm tİch lòy <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> ®iÓm  ®iÓm tİch lòy, kinh nghiÖm <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v¹n");
end;
