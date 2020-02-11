Include("\\script\\global\\mate_head.lua");

tChuHunGuo = 
{
	[1] = {2, 1, 555,"XuÊt hån qu¶"},
	[2] = {2, 1, 545,"§¹i xuÊt hån qu¶"},
}

function OnUse(item)
	if GetFollower() ~= 0 then	--Èç¹ûÉíºóÓĞ¸úËæNPC£¬ÏÈÈ·ÈÏÉ¾³ı
		local selTab = {
					"§ång ı/#confirm_use("..item..")",
					"Hñy bá/nothing",
					}
		Say("Tr­íc khi dïng XuÊt Hån Qu¶,<color=red>ngoµi thi thÓ ra th× nh÷ng kÎ ®i theo sÏ bŞ biÕn mÊt<color>. QuyÕt ®Şnh dïng XuÊt Hån Qu¶ chø?",getn(selTab),selTab);
	else
		confirm_use(item);
	end;
end

function confirm_use(item)
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","B¹n sö dông kh«ng thuéc bÊt cø lo¹i XuÊt Hån Qu¶ nµo.");
		return 0;
	end;
	KillFollower();
	local selTab = {
				"§ång ı/#confirm_use_final("..item..")",
				"Hñy bá/nothing",
				}
	Say("    Khi phèi ngÉu kh«ng ë trªn m¹ng cã thÓ dïng <color=yellow>"..tChuHunGuo[nType][4].."<color> ®Ó tİch lòy kinh nghiÖm cho ®èi ph­¬ng, cã t¸c dông trong vßng <color=yellow>2<color> tiÕng. Trong vßng 2 tiÕng ®ã toµn bé kinh nghiÖm ®· ®­îc tİch lòy sÏ chuyÓn hãa thµnh Liªn Lı Qu¶, nÕu tÆng Liªn Lı Qu¶ cho b»ng h÷u , hä sÏ céng h­ëng kinh nghiÖm khi cïng ®¸mh qu¸i, nh­ng <color=red>nÕu b»ng h÷u cña b¹n ®¨ng nhËp trß ch¬i trong lóc b¹n dïng XuÊt Hån Qu¶, th× XuÊt Hån Qu¶ sÏ lËp tøc mÊt t¸c dông, kinh nghiÖm tİch lòy ®­îc sÏ biÕn thµnh Liªn Lı Qu¶<color>.<enter> NÕu ®¨ng nhËp l¹i cã thÓ sÏ bŞ mÊt céng h­ëng, nh­ng kh«ng lµm ¶nh h­ëng ®Õn kinh nghiÖm tİch lòy.<enter> "..tChuHunGuo[nType][4].."Trong qu¸ tr×nh ph¸t huy t¸c dông nªn chõa <color=green>1 « trèng vµ 1 ®iÓm søc lùc<color> ®Ó ®Æt Liªn Lı qu¶ vµo. B¹n muèn sö dông kh«ng?",getn(selTab),selTab);
end;

function confirm_use_final(item)
	local mate = GetMateName()
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","B¹n sö dông kh«ng thuéc bÊt cø lo¹i XuÊt Hån Qu¶ nµo.");
		return 0;
	end;
	
	if DelItemByIndex(item, 1) == 1 then
		-- Ê¹ÓÃÌæÉíÍŞÍŞ
		local npc = SummonNpc("Ho¹t ®éng Ng­êi V« h×nh", mate)
		npc = GetFollower();	--¾ÍËãÉÏÃæ´´½¨Ê§°ÜÁËÒ²¸øµ±Ç°¸úËæNPCÌí¼ÓÒ»¸öĞ§¹û
		SetCurrentNpcSFX(npc, SFX_DOLL, 1, 1)
		ActivateDoll(1)
		-- ÉèÖÃÊ¹ÓÃÊ±¼äºÍ³ö»ê¹ûÀàĞÍ
		SetTask(TASKVAR_DOLLTIME, DOLL_TIME + DOLL_TIME_LIMIT * nType)
		SetTask(TASKVAR_DOLLEXP, 0);	--¾­ÑéÇå0
		SetTask(TASK_DOLL_ACTIVE,GetTime());
		WriteLog("[KÕt h«n]:"..GetName().."§· sö dông mét XuÊt hån qu¶ ");
	end;
end;

function check_state()
	if GetTask(TASK_LOVEGRADE) < 300 then
		Talk(1,"","TrŞ ®ång t©m cña b¹n qu¸ thÊp, t¹m thêi kh«ng thÓ dïng XuÊt hån qu¶. Lín h¬n <color=yellow>300<color> ®iÓm míi sö dông ®­îc.");
		return 0;
	end;
	local mate = GetMateName()
	if (mate == "") then
		Talk(1, "", "B¹n ch­a kÕt h«n kh«ng thÓ dïng XuÊt hån qu¶")
		return 0;
	end;
	if (GetMateOnlineStatus() == 1) then
		Talk(1, "", format("Phèi ngÉu <color=red>%s<color> trªn m¹ng, kh«ng thÓ dïng XuÊt hån qu¶", mate))
		return 0;
	end;
	if (IsDollActive() == 1) then
		Talk(1, "", "XuÊt hån qu¶ cña b¹n ch­a hÕt t¸c dông kh«ng thÓ tiÕp tôc sö dông")
		return 0;
	end;
end;

function get_type(nItemIdx)
	for i=1,getn(tChuHunGuo) do
		local genre,detail,particular = GetItemInfoByIndex(nItemIdx);
		if genre == tChuHunGuo[i][1] and detail == tChuHunGuo[i][2] and particular == tChuHunGuo[i][3] then
			return i;
		end;
	end;
	return 0;
end;