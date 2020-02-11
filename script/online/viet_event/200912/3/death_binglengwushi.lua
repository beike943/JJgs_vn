--=============================================
--create by baiyun 2009.11.13
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯±ùÀäÎ×Ê¦ËÀÍö½Å±¾
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
function OnDeath(nNpcIndex)
    --Ë¢Ê¥µ®Ê÷
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    local nNewIndex = CreateNpc("C©y Gi¸ng sinh 4a", "C©y  gi¸ng sinh", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNpcIndex, 0);
    SetNpcLifeTime(nNewIndex, 35 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    SetCurrentNpcSFX(nNewIndex,947,1,1);
    AddUnitStates(nNewIndex, 6, GetTime());--¼ÇÂ¼NPC´´½¨µÄÊ±

    --·ÅÑÌ»ð
    for i=1,5 do
    	DoFireworks(871, 1);
    end    
   
    --¸øÎ×Ê¦ÐÄ
    gf_AddItemEx2({2, 1, 30126, 1}, "Tr¸i Tim Phï Thñy", VIET_0912_STR_EVENT_LOG_TITLE, 0, 0, 0, 1,"Tiªu diÖt phï thñy b¨ng gi¸");

    --Ë¢100¸öÊ¥µ®ÀñºÐ    
    for i = 1, 100 do
        local nNewNpcIndex2 = CreateNpc("Event gi¸ng sinh VN", "Hép quµ gi¸ng sinh", nMapId, nMapX + random(-30, 30), nMapY + random(-30, 30));
        SetNpcLifeTime(nNewNpcIndex2, 150);
        SetNpcScript(nNewNpcIndex2, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --´ò¿ªmission£¬Ã¿3·ÖÖÓ³öÏÖ50¸öÊ¥µ®ÀñºÐ£¬³ÖÐø30·ÖÖÓ
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

