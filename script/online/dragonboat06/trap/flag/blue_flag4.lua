Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 12;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("B¹n ®· v­ît qua 1 cæng cê mµu xanh.");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_BLUE + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_BLUE);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	local sName = GetName();
	if EffectType == MAGIC_RB then	--Õ¨ÔÎµÚÒ»Ãû
		dizzyfirst();
	elseif EffectType == MAGIC_YB then	--È«Ìå»ìÂÒ£¨°üº¬×Ô¼º£©
		OP_AllMSPlayer(chaos,{},CAMP_PLAYER);
		Msg2MSAll(MISSION_ID,sName.." B¹n liªn tiÕp v­ît qua cê vµng vµ cê xanh, toµn bé ng­êi ch¬i bÞ lo¹n.");
	elseif EffectType == MAGIC_BB then	--È«Ìå·âÕÐ
		speedslow();
		Msg2MSAll(MISSION_ID,sName.." V­ît qua 2 lÇn cê xanh, tÊt c¶ tuyÓn thñ bÞ gi¶m 40% tèc ®é di chuyÓn trong 5 gi©y.");
	else 
		WriteLog("blue flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyfirst()
	local sName = GetName();
	local tempPI = PlayerIndex;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_vertigo",1,5*18);
			Msg2MSAll(MISSION_ID,sName.." Liªn tiÕp v­ît qua cê ®á vµ cê xanh, lµm cho ng­êi ®øng nhÊt: "..GetName().." bÞ cho¸ng.");
			break;
		end;
	end;
	PlayerIndex = tempPI;
end;

function chaos(tArg)
	if GetTask(POSITION) ~= TRAPCOUNT then
		CastState("state_confusion",1,5*18);
	end;
end;

function speedslow()
	local tempPI = PlayerIndex;
	local sName = GetName();
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_slow",40,5*18);
		end;
	end;
	PlayerIndex = tempPI;
end;