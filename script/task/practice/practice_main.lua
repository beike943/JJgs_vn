--±Õ¹ØĞŞÁ¶
--created by lizhi
--2005-9-10 15:52

Include("\\script\\task\\practice\\practice_head.lua");

function init_trigger(nFaction)
    --´´½¨RECT´¥·¢Æ÷
    CreateTrigger(2, rect_trigger_table[nFaction][1], rect_trigger_table[nFaction][2]);
    --´´½¨ÏÂÏß´¥·¢Æ÷
    CreateTrigger(3, 300, LEAVE_GAME);
    SetLogType(GetTrigger(LEAVE_GAME), 1);  --logout
    --´´½¨¼ÆÊ±´¥·¢Æ÷
    CreateTrigger(1, 301, TIME_PRACTICE);       --ĞŞÁ¶¼ÆÊ±Æ÷£¬10Ğ¡Ê±
    ContinueTimer(GetTrigger(TIME_PRACTICE));
    
    if IsAskQuestion == 1 then
        CreateTrigger(1, 300, TIME_RANDOM_QUESTION);    --Ëæ»úÎÊÌâ³öÏÖ¼ÆÊ±£¬1Ğ¡Ê±
        ContinueTimer(GetTrigger(TIME_RANDOM_QUESTION));
        CreateTrigger(1, 302, TIME_ANSWER);
    end;
    --print("practice debug : create trigger");
end;

function free_trigger(nFaction)
    --remove rect trigger
    RemoveTrigger(GetTrigger(rect_trigger_table[nFaction][2]));
    --remove log trigger
    RemoveTrigger(GetTrigger(LEAVE_GAME));
    --remove time trigger
    RemoveTrigger(GetTrigger(TIME_PRACTICE));
    
    if IsAskQuestion == 1 then
        RemoveTrigger(GetTrigger(TIME_RANDOM_QUESTION));
        RemoveTrigger(GetTrigger(TIME_ANSWER));
    end;
    --print("practice debug : remove trigger");
end;

function init_player_state()
    --ÅĞ¶Ï½ÇÉ«±¾ÉíÊÇ·ñÄÜ¹»Ê¹ÓÃÎä¹¦
	if GetUseSkillEnable() == -1 then		--player index ²»´æÔÚ
		print("practice_main.lua 43 line GetUseSkillEnable() get player index nil");
		return
	elseif GetUseSkillEnable() == 0 then	--²»ÄÜ¹»Ê¹ÓÃÎä¹¦
		SetTask(SKILLENABLE, 1);
	elseif GetUseSkillEnable() == 1 then	--ÄÜ¹»Ê¹ÓÃÎä¹¦
		SetTask(SKILLENABLE, 0);
	end;
    
    LeaveTeam();

    --Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
    SetLogoutRV(1);
    
    --¹Ø±Õ×é¶Ó¹¦ÄÜ
    SetCreateTeam(1);
    
    ForbitTrade(1);
    
    SetFightState(1);
    
    SetPKFlag(0,0)--¹Ø±ÕPK¿ª¹Ø
    ForbidChangePK(1);  --½ûÖ¹pk
    UseSkillEnable(0);	--½ûÖ¹Ê¹ÓÃÎä¹¦
    
    --½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
    CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
    InteractiveEnable(0);
    
    --°ÚÌ¯¿ª¹Ø
    StallEnable(0);
    
    --Ë«±¶ĞŞÁ¶ËÙ¶È
    SetPopBoost(DOUBLE_SPEED);
    --print("practice debug : init_player_state");
end;

function restore_player_state()

    SetLogoutRV(0);
    
    SetFightState(0);
        
    ForbidChangePK(0);
    
    ForbitTrade(0);
    
    SetPKFlag(0,0)--¹Ø±ÕPK¿ª¹Ø
    
    ForbidChangePK(0);
	if GetTask(SKILLENABLE) == 0 then
		UseSkillEnable(1);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
	elseif GetTask(SKILLENABLE) == 1 then
		UseSkillEnable(0);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
		SetTask(SKILLENABLE, 0);
	end;
    
    --DesaltPlayer(0);
    
    --½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
    InteractiveEnable(1);
    
    --°ÚÌ¯¿ª¹Ø
    StallEnable(1);
    
    SetPopBoost(NORMAL_SPEED);
    --print("practice debug : restore_player_state");
    Msg2Player("Tèc ®é tu luyÖn trë l¹i b×nh th­êng.");
end;

function practice_start()
    --ÉèÖÃ·µ»Øµã
    if IsFreeze() == 1 then  --Èç¹ûÓÃWG±»·â
        Talk(1,"","<color=yellow>Tµi kho¶n bŞ lçi hoÆc ®ang ®­îc sö dông!<color>");
        return
    end;
    
	local nFaction = GetPlayerFaction();
	local nMapid, nX, nY = GetWorldPos();
	if DelItem(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3], 1) == 1 then
	    init_trigger(nFaction);
	    --¼ÇÂ¼×ø±ê£¬³ö¹ØÊ±Ê¹ÓÃ
	    SetTask(TASK_PRACTICE, nMapid);
	    SetTask(TASK_PRACTICE + 1, nX);
	    SetTask(TASK_PRACTICE + 2, nY);
	    --ÉèÖÃÏàÓ¦µÄ×´Ì¬
	    init_player_state()
	    --¸ù¾İÃÅÅÉ´«ËÍµ½ÏàÓ¦µÄ·¿¼ä£¬ÒªºÍÃÅÅÉÍ¬·şÎñÆ÷£¬·ñÔò»á³öÏÖ¿ç·şÎÊÌâ
	    NewWorld(room_table[nFaction][1], room_table[nFaction][2], room_table[nFaction][3]);
	    Msg2Player("Tèc ®é tu luyÖn t¨ng gÊp ®«i");
	else
		Say("Xin x¸c ®Şnh cã ®em theo lÖnh bµi s­ m«n.",0);
	end;
end;

function practice_end()
    local nFaction = GetPlayerFaction();
    free_trigger(nFaction);
    
    --»Ö¸´ÈËÎï×´Ì¬
    restore_player_state();
    --print("practice debug : practice end");
    Msg2Player("Tèc ®é tu luyÖn trë l¹i b×nh th­êng.");
end;