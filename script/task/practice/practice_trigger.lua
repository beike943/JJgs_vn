--ÐÞÁ¶´¥·¢Æ÷
--created by lizhi
--2005-9-10 16:26

Include("\\script\\task\\practice\\practice_head.lua"); --ÐÞÁ¶µÄ½Å±¾
Include("\\script\\task\\practice\\practice_main.lua");

randomseed(GetGameTime());

function QT_GetData(row, datatype)        --È¡µÃ¹Ì¶¨rowÐÐdatatypeÁÐµÄµ¥ÔªÄÚÈÝ
	local tempdata = QT_FILE:getCell(row, QT_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end;
end;

function Ask_Question()
    local nRow = random(2, QT_ROWCOUNT);
    local AnswerTable = {};
    local AnswerIndex = {};
    
    local szQuestion = QT_GetData(nRow, "Question");
    AnswerTable[1] = QT_GetData(nRow, "CorrectAnswer").."/right_answer";
    AnswerTable[2] = QT_GetData(nRow, "Answer2").."/wrong_answer";
    AnswerTable[3] = QT_GetData(nRow, "Answer3").."/wrong_answer";
    AnswerTable[4] = QT_GetData(nRow, "Answer4").."/wrong_answer";
    
    local szSay = "Say("..format("%q",szQuestion)..",4,";
    --Ëæ»ú¹¹Ôì´ð°¸Ë³Ðò
    for i=1, 4 do
        while 1 do
            local j = random(1, 100);
            if AnswerIndex[j] == nil then
                AnswerIndex[j] = AnswerTable[i];
                break
            end;
        end;
    end;
    local i = 0;
    for index, value in AnswerIndex do
        if i == 3 then
            szSay = szSay..format("%q", value)..","..ANSWER_TIME..")";
        else
            szSay = szSay..format("%q", value)..",";
        end;
        i = i + 1;
    end;
    dostring(szSay);
end;

function Leave_Game()
    practice_end();
    --Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);
	--print("practice debug : Leave_Game");
end;

function Leave_Map()
    practice_end();
    --print("practice debug : Leave_map");
end;

function Question_OnTimer()
    if random(0, 2) == 1 then
        --ÌáÎÊ
        Ask_Question();
        --ÔÝÊ±Ê¹ÓÃ
        ContinueTimer(GetTrigger(TIME_ANSWER));
        SetTask(TASK_ANSWER, 0);
        --
        --print("practice debug : Qustion_OnTimer");
    end;
end;

function Practice_OnTimer()
    --ÐÞÎªÔö³¤±ä³ÉÆÕÍ¨ËÙ¶È
    SetPopBoost(NORMAL_SPEED);
    PauseTimer(GetTrigger(TIME_PRACTICE));  --ÔÝÍ£¼ÆÊ±Æ÷
    Msg2Player("§ãng kÕt thóc, tèc ®é tu luyÖn trë l¹i b×nh th­êng")
    --print("practice debug : Practice_OnTimer");
end;

function Answer_OnTimer()
    SetTask(TASK_ANSWER, 1);
    PauseTimer(GetRunningTrigger());
    --print("practice debug : Answer_OnTimer");
end;

function right_answer()
    --¸øÓè½±Àø
    if GetTask(TASK_ANSWER) == 0 then   --Èç¹ûÔÚÊ±¼äÄÚ»Ø´ð
        Msg2Player("you are right");
        RemoveTrigger(GetTrigger(TIME_ANSWER));
        CreateTrigger(1, 302, TIME_ANSWER);
    end;
end;

function wrong_answer()
    --ÌáÊ¾Ò»ÏÂ£¿Ã»ÓÐ³Í·£
    RemoveTrigger(GetTrigger(TIME_ANSWER));
    CreateTrigger(1, 302, TIME_ANSWER);
end;