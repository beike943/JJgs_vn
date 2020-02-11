--File name:fireworks_item.lua 
--Describe:Èý½ÚÁ¬¹ý£¬ÑÌ»ðÎïÆ·½Å±¾
--Create Date:2006-9-9
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if tonumber(date("%y%m%d")) > 061008 then
		Talk(1,"","Xin lçi! Ph¸o hoa cña b¹n ®· hÕt h¹n sö dông.");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","Xin lçi! ChØ cã ng­êi ch¬i trªn <color=yellow>cÊp 10<color> míi cã thÓ ®èt Ph¸o hoa");
		return 0;
	end;
	if GetTaskTemp(TT_TIMER_LOOP) ~= 0 then
		Talk(1,"","B¹n ®· ®èt 1 c©y Ph¸o hoa, mét lÇn chØ cã thÓ ®èt <color=yellow>1 <color> Ph¸o hoa.");
		return 0;
	end;
	local selTab = {
				"§èt ph¸o hoa/confirm",
				"Xem thuyÕt minh/know_detail",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say("Thêi gian sö dông ph¸o hoa lµ <color=yellow>28/9-8/10<color>. B¹n muèn lµm g×?",getn(selTab),selTab);
end;

function confirm()
	if DelItem(tItemInfo[10][2],tItemInfo[10][3],tItemInfo[10][4],1) == 1 then
		local nMapID,nMapX,nMapY = GetWorldPos();
		local nNpcIndex = CreateNpc("Ng­êi V« h×nh",GetName().." ph¸o hoa",nMapID,nMapX,nMapY);
		SetNpcLifeTime(nNpcIndex,15*60);	--15·ÖÖÓ£¬±È10·ÖÖÓ³¤Ò»µã
		SetCurrentNpcSFX(nNpcIndex,936,1,1);
		SetTaskTemp(TT_FIREWORKS_MAPID,nMapID);
		SetTaskTemp(TT_FIREWORKS_MAPX,nMapX);
		SetTaskTemp(TT_FIREWORKS_MAPY,nMapY);
		SetTaskTemp(TT_FIREWORKS_Time,GetTime());
		SetTaskTemp(TT_FIREWORKS_INDEX,nNpcIndex);
		SetTaskTemp(TT_TIMER_LOOP,TIMER_LOOP);
		CreateTrigger(1,TRIGGER_TIMER,TRIGGER_TIMER_CID);
		ContinueTimer(GetTrigger(TRIGGER_TIMER_CID));
		CreateTrigger(3,TRIGGER_LOGOUT,TRIGGER_LOGOUT_CID);
	end;
end;

function know_detail()
	Talk(1,"OnUse","Thêi gian sö dông ph¸o hoa lµ <color=yellow>28-09 ®Õn 08-10<color>,  ng­êi ch¬i cÊp 10 trë lªn ®Òu cã thÓ tham gia.Thêi gian b¾n Ph¸o hoa lµ 10 phót. Ng­êi ch¬i sö dông ph¸o hoa mçi phót nhËn ®­îc 50000 ®iÓm søc kháe. Cã thÓ mêi ng­êi ch¬i kh¸c vµo ®éi hoÆc sÏ cã ng­êi rêi khái ®éi.");
end;