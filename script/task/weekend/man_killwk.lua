--É±ÙÁ¿ÜµØÍ¼µÄtrapºÍÙÁ¿ÜµØÍ¼NPCËùÓÃ½Å±¾£¬ÓÃÓÚ³õÊ¼»¯Ö®ÀàµÄÒ»ÏµÁĞ¹¤×÷

Include("\\script\\task\\WeekEnd\\task_head.lua");

function main()
	Say("Cã viÖc g× kh«ng?",2,"Tiªu diÖt 50 tªn Oa KhÊu/start_wk", "Rêi khái/leave_map")
	--Talk(1,"start_wk", "<color=green>Ç°Ïß½«Áì<color>£ºÇë¾¡¿ÉÄÜ¿ìµÄÔÚ°ë¸öĞ¡Ê±µÄÊ±¼äÄÚÏûÃğ50ÃûÙÁ¿Ü°É£¡");
end;

function leave_map()
	NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2))
end

function start_wk()
	if GetTask(TASK_GQ_KILLWK_START) ~= 1 then
		return
	end;

	SetTask(TASK_GQ_KILLWK_START, 2);	--ÒÑ¾­ÉèÖÃ¹ı×´Ì¬
	SetPKFlag(0,0)--¹Ø±ÕPK¿ª¹Ø
    ForbidChangePK(1);  --½ûÖ¹pk
    SetFightState(1);
    SetLogoutRV(1);

    --¼ÆËãÊÇÉ±Ê²Ã´µµ´ÎµÄÙÁ¿Ü
    local szKey = "wk_";
    local nLevel = GetLevel();
    if nLevel > 0 and nLevel <= 27 then
        szKey = szKey..20;
    elseif nLevel > 27 and nLevel <= 37 then
        szKey = szKey..30;
    elseif nLevel > 37 and nLevel <= 47 then
        szKey = szKey..(40 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 47 and nLevel <= 57 then
        szKey = szKey..(50 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 57 and nLevel <= 99 then
        szKey = szKey..(60 + GetTask(TASK_WHICH_MAP));
    end;

    --³õÊ¼»¯É±¹Ö¼ÆÊı
    CreateTrigger(0, kill_trigger_table[szKey][1], kill_trigger_table[szKey][2]);
    --¼ÆÊ±
    CreateTrigger(1, time_trigger_table["wk"][1], time_trigger_table["wk"][2]);
    ContinueTimer(GetTrigger(time_trigger_table["wk"][2]));
    --rect
    CreateTrigger(2, rect_wk_table[szKey][1], rect_wk_table[szKey][2]);
    --log
    CreateTrigger(3, log_wk_table[1], log_wk_table[2]);
    SetLogType(GetTrigger(log_wk_table[2]), 1);
    --³õÊ¼»¯¼ÆÊı
    SetTask(TASK_GQ_KILLWK, 0);
end;