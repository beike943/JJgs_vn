--emulation_battle.lua

function BT_SetData( taskid, value )
	if ( taskid == 1 ) then
		SetTask( 751, value )
		SyncTaskValue( 751 )
	else
		SetTask( taskid + 700, value )
		SyncTaskValue( taskid + 700 )
	end
end

function SyncTaskValue()
end

function BT_GetData(taskid)
	if( taskid == 1 ) then
		return GetTask( 751 )
	end
	return GetTask( taskid + 700 )
end

function BT_SetGameData( taskid, value )
	--SetGlbValue( glbtaskid + 40, value )
	SetMissionV(taskid + 81, value);
end

function BT_GetGameData( taskid )
	--return GetGlbValue( glbtaskid + 40 )
	local nMapid = SubWorldIdx2ID(SubWorld)
	
	if nMapid == 806 then
		nMapid = 807
	elseif nMapid == 808 then
		nMapid = 809
	else
		return GetMissionV(taskid + 81);
	end;
	
	local oldSubWorld = SubWorld
	local idx = SubWorldID2Idx(nMapid);
	if idx == -1 then
		print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		return
	end
	
	SubWorld = idx;
	local nValue = GetMissionV(taskid + 81);
	SubWorld = oldSubWorld;
	return nValue
end

function BT_GetTimer1()
	local nMapid = SubWorldIdx2ID(SubWorld)
	
	if nMapid == 806 then
		nMapid = 807
	elseif nMapid == 808 then
		nMapid = 809
	else
		return GetMissionV(MS_TIMER1);
	end;
	
	local oldSubWorld = SubWorld
	local idx = SubWorldID2Idx(nMapid);
	if idx == -1 then
		print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		return
	end
	
	SubWorld = idx;
	local nValue = GetMissionV(MS_TIMER1);
	SubWorld = oldSubWorld;
	return nValue
end

function BT_SetView( taskid )
end

function CreateChannel( channelname, channelid )
end

function DeleteChannel( channelname )
end

function LeaveChannel( roleindex, channelname )
end

function EnterChannel( roleindex, channelname )
end

function BT_SetMissionName( msname )
end

function BT_SetMissionDesc( msdesc )
end

function ST_SyncMiniMapObj()
end

function BT_UpdateMemberCount()
Msg2MSAll(MISSIONID,"Sè ng­êi hai phe Tèng Liªu hiÖn lµ"..GetMSPlayerCount(MISSIONID,1).."cïng víi "..GetMSPlayerCount(MISSIONID, 2))
end

function BT_GetBattleName()
	return "Nh¹n M«n quan chiÕn"
end

function BT_LeaveBattle()-- Çå³ýÍæ¼Ò¿Í»§¶Ëµ±Ç°µÄÅÅÃûÊý¾Ý
end

function BT_ClearPlayerData()
end

function BT_BroadView()
end

function BT_BroadAllLadder()
end

function BT_SetRestTime(gametime)
end

function BT_BroadGameData()
end

function BT_SortLadder()
end

function BT_BroadSelf()
end

function BT_BroadBattleDesc()
end

function BT_ViewBattleStart()
end

function BT_SortWorldLadder( taskid, ladderid )
end

function BT_ReportResult( camp )
end

function BT_SetTypeBonus( bonusid, camp, value )
	local offset = 60
	if( camp == 2 ) then
		offset = 110
	end
	SetGlbValue( bonusid + offset, value )
end

function BT_GetTypeBonus( bonusid, camp )
	local offset = 60
	if( camp == 2 ) then
		offset = 110
	end
	return GetGlbValue( bonusid + offset )
end

--function WriteLog( str )
--	print( str )
--end

function GetCurCamp()
	local nstate, npkcamp = GetPKFlag()
	return npkcamp
end

function SetCurCamp(camp)
	SetPKFlag( 1, camp )
end

function RestoreOwnFeature()
	--RestoreAll()		Ñª¡¢ÄÚ¡¢ÌåÈ«Âú
	Restore()		--ÑªÂú
	RestoreNeili()	--ÄÚÂú
end

--npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
--CreateNpc(Ä£°åÃû£¬ÏÔÊ¾Ãû×Ö£¬nSubWorldID, nMpsX, nMpsY)

NPCID2NPCSTENCIL = {
	[55]="Quan sø-trung niªn1",
	[49]="Nam nh©n ph­¬ng B¾c2",
	[629]="Dßng th«ng b¸o",
	[630]="Dßng th«ng b¸o",
	[625]="R­¬ng ®å Trung Nguyªn",
	[626]="KÑo hå l«",
	[627]="KÑo hå l«",
	[628]="KÑo hå l«",
	[999]="R­¬ng ®å Tr.Nguyªn",
	
}
function AddNpc(tnpcid, level, worldindex, posx, posy, removewhendeath, name)
	local OrgSubWorld = SubWorld
	local OrgPlayer = PlayerIndex
	PlayerIndex = 1
	SubWorld = worldindex
	local npcstencil = "Tèng T­íng Qu©n"
	if( NPCID2NPCSTENCIL[ tnpcid ] ~= nil ) then
		npcstencil = NPCID2NPCSTENCIL[ tnpcid ]
	end
	local index = 0
	if( name == nil ) then
		index = CreateNpc(tostring(npcstencil), tostring(npcstencil), tonumber(SubWorldIdx2ID(worldindex)), tonumber(floor(posx/32)), tonumber(floor(posy/32)))
	else
		index = CreateNpc(tostring(npcstencil), tostring(name), tonumber(SubWorldIdx2ID(worldindex)), tonumber(floor(posx/32)), tonumber(floor(posy/32)))
	end

	SubWorld = OrgSubWorld
	PlayerIndex = OrgPlayer
	return index
end

function PutMessage(str)
end

function AddSkillState()
end

function Title_ActiveTitle()
end

function SetRevPos( mapid, revid )
	local subworldidx = SubWorldID2Idx( mapid )
	if( subworldidx < 0 ) then
		print("announce:::::the map "..mapid.."not in this sever!! please check it!")
		return
	end
	SetPlayerRevivalPos( mapid, revid )
	--SetPlayerRevivalPos( mapid, revid )

end

SetPunish=SetDeathPunish

function GetCamp()
	return 0
end

function SetPos(posx, posy)
	NewWorld( SubWorldIdx2ID(SubWorld), posx, posy )
end

