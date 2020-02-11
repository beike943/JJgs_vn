--npcÒ¦Á¢³Ï½Å±¾
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\task_head.lua")
Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\12¼¶\\task_main.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_LEV_10_ID) == 2 then
        	SetTask(TASK_LEV_10_ID, 3);
        	Msg2Player("Tr¶ sæ s¸ch cho V­¬ng NghiÖp VÜ");
        	TaskTip("Tr¶ sæ s¸ch cho V­¬ng NghiÖp VÜ");
        	AddItem(2, 0, 32, 1);
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_LEV_10_ID) == 2 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_LEV_10_ID, 3);
            	Msg2Player("Tr¶ sæ s¸ch cho V­¬ng NghiÖp VÜ");
            	TaskTip("Tr¶ sæ s¸ch cho V­¬ng NghiÖp VÜ");
            	AddItem(2, 0, 32, 1);
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
