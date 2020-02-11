Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 42;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("B¹n ®· v­ît qua cê tÝm");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_RED + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_RED);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	if EffectType == MAGIC_RR then	--Õ¨ÔÎÆäËûËùÓÐÑ¡ÊÖ
		dizzyothers();
	elseif EffectType == MAGIC_YR then	--Ëæ»úÊ¹Ò»ÃûÑ¡ÊÖÀ´µ½×Ô¼ºÉí±ß
		moverandomplayer();
	elseif EffectType == MAGIC_BR then	--Ç°ÈýÃû¶¨Éí
		fixfront3();
	else
		WriteLog("red flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyothers()
	local tempPI = PlayerIndex;
	local sName = GetName();
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_vertigo",1,3*18);
		end;
	end;
	Msg2MSAll(MISSION_ID,sName.." V­ît qua 2 lÇn cê xanh, tÊt c¶ tuyÓn thñ ®Òu bÞ cho¸ng.");
	PlayerIndex = tempPI;
end;

function moverandomplayer()
	local MapID,MapX,MapY = GetWorldPos();
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nPos = GetTask(POSITION);
	local nRandomNum = random(1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER));
	PlayerIndex = Get_Player_By_Rank(nRandomNum);
	if PlayerIndex == tempPI then
		Msg2Player("Di chuyÓn ng­êi ch¬i thÊt b¹i!");
		return 0;
	end;
	if PlayerIndex > 0 then
		if GetTask(POSITION) ~= TRAPCOUNT then
			NewWorld(MapID,MapX,MapY);
			SetTask(POSITION,nPos);
			Msg2MSAll(MISSION_ID,sName.."Liªn tiÕp v­ît qua cê vµng vµ cê ®á, di chuyÓn "..GetName().." ®Õn bªn c¹nh.");
		else
			PlayerIndex = tempPI;
			Msg2Player("Di chuyÓn ng­êi ch¬i thÊt b¹i!");
		end;
	end;
	PlayerIndex = tempPI;
end;

function fixfront3()
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nCount = 0;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		if nCount == 3 then
			break;
		end;
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_fetter",1,3*18);
			nCount = nCount + 1;
		end;
	end;
	Msg2MSAll(MISSION_ID,sName.." Liªn tiÕp v­ît qua cê xanh vµ cê ®á, 3 h¹ng ®Çu bÞ ®øng yªn.");
	PlayerIndex = tempPI;
end;