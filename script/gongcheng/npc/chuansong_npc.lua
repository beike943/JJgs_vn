--create date:07-04-23
--author:yanjun
--describe:Õ½³¡ÀïÃæµÄÄ¹µØËÍ´«ÈË
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>TËp kÕt quan<color>: ";
function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local selTab = {};
	local tGraveyardName = {"C«ng thµnh T©y Nam doanh ®Şa","C«ng thµnh §«ng Nam doanh ®Şa","§iÓm tËp kÕt ngoµi thµnh m«n phİa T©y","§iÓm tËp kÕt ngoµi thµnh m«n phİa §«ng","§iÓm tËp kÕt trong thµnh m«n phİa T©y","§iÓm tËp kÕt trong thµnh m«n phİa §«ng","§iÓm tËp kÕt HËu cung T©y thµnh","§iÓm tËp kÕt HËu cung §«ng thµnh ","§iÓm tËp kÕt TiÒn cung T©y thµnh","§iÓm tËp kÕt TiÒn cung §«ng thµnh"};
	for i=1,getn(tGraveyardName) do
		if GetMissionV(MV_GRAVEYARD_A1+i-1) == 0 or GetMissionV(MV_GRAVEYARD_A1+i-1) == nPlayerCamp then
			tinsert(selTab,format("%s/#go_to(%d)",tGraveyardName[i],i));
		end;		
	end;
	tinsert(selTab,"§Ó ta nghÜ l¹i ®·/nothing");
	Say(g_InfoHeader.."B¹n muèn phôc sinh ë ®iÓm tËp kÕt nµo?",getn(selTab),selTab);
end;

function go_to(nPosIdx)
	local nRand = random(1,getn(tGraveyardPos[nPosIdx]));
	SetPos(tGraveyardPos[nPosIdx][nRand][1],tGraveyardPos[nPosIdx][nRand][2]);
	SetFightState(1);
	CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	GCZ_RestoreAll();
end;
