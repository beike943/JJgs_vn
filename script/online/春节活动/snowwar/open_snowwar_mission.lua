--Create Date:2007ÄêµÚ¶þÌì
--Describe:£°£·Äê´º½ÚÑ©ÕÌ¿ªÆôMissionÖ®½Å±¾
--Author:yanjun
Include("\\script\\online\\´º½Ú»î¶¯\\snowwar\\snowwar_head.lua");
function main()
        local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091224 and nDate <= 100117 then
		for i=1,getn(tMAP_CITY_FIELD) do
			SubWorld = SubWorldID2Idx(tMAP_CITY_FIELD[i][2]);
			if SubWorld > 0 then
				OpenMission(MISSION_ID);
				Msg2SubWorld(tMAP_CITY_FIELD[i][3].."Khu vùc nÐm tuyÕt ®· më cöa, mêi mäi ng­êi vµo xem.")
			end;
			SubWorld = nOldSubWorld;
		end;
	end;
end;
