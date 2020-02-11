Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 25;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("B¹n ®· v­ît qua cê vµng");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_YELLOW + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_YELLOW);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	if EffectType == MAGIC_RY then	--Õ¨ÔÎ×Ô¼ºÉíÇ°µÄÑ¡ÊÖ
		dizzyfront();
	elseif EffectType == MAGIC_YY then	--Ëæ»ú½«×Ô¼º×ªÒÆµ½ÁíÒ»ÃûÑ¡ÊÖµÄÉí±ß
		moveself();
	elseif EffectType == MAGIC_BY then	--×ÔÉí¼ÓËÙ
		accelerate();
	else
		WriteLog("yellow flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyfront()
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nRank = Get_Self_Rank() - 1;
	PlayerIndex = Get_Player_By_Rank(nRank);
	if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT and PlayerIndex ~= tempPI then
		CastState("state_vertigo",1,4*18);
		Msg2Player("Ng­êi xÕp sau  "..sName.." Liªn tiÕp v­ît qua cê ®á vµ cê vµng, b¹n bÞ cho¸ng.");
	else
		PlayerIndex = tempPI;
		Msg2Player("lµm cho¸ng tuyÓn thñ xÕp trªn thÊt b¹i");
	end;
	PlayerIndex = tempPI;
end;

function moveself()
	local tempPI = PlayerIndex;
	local nRandomNum = random(1,GetMSPlayerCount(MISSION_ID,CAMP_PALYER));
	PlayerIndex = Get_Player_By_Rank(nRandomNum);
	if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
		local MapID,MapX,MapY = GetWorldPos();
		local sName = GetName();
		local nPos = GetTask(POSITION);
		PlayerIndex = tempPI;
		NewWorld(MapID,MapX,MapY);
		SetTask(POSITION,nPos);
		Msg2MSAll(MISSION_ID,GetName().."V­ît qua 2 lÇn cê vµng, di chuyÓn ®Õn bªn c¹nh "..sName.." {c¹nh}");
	else
		PlayerIndex = tempPI;
		Msg2Player("Di chuyÓn thÊt b¹i!");
	end;
end;

function accelerate()
	CastState("state_move_speed_percent_add",50,5*18)
	Msg2Player("HiÖn tèc ®é di chuyÓn cña b¹n t¨ng 50% trong 5 gi©y.");
end;