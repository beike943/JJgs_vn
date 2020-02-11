Include("\\script\\task\\practice\\practice_head.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --ÐÞÁ¶µÄ½Å±¾

function main()
    local nFaction = GetPlayerFaction();
    local faction_table = {
        "ThiÕu L©m", "Vâ §ang", "Nga My", "C¸i Bang", "§­êng M«n", "Thiªn Ba D­¬ng phñ", "Ngò §éc"
    };
    local szMsg = "<color=green>Qu¸ ¶i hé tèng nh©n<color>: Ta lµ"..faction_table[nFaction].." Xa phu duy nhÊt n¬i nµy. CÇn ta gióp g× kh«ng?";
    if GetItemCount(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3]) >= 1 then
        Say(szMsg,
            3,
            "Rêi khái/quit_practice",
            "TiÕp tôc tu luyÖn/continue_practice",
            "Kh«ng cã g×/exit_say"
        );
    else
        Say(szMsg,
            2,
            "Rêi khái/quit_practice",
            "Kh«ng cã g×/exit_say"
        );
    end;
end;

function quit_practice()
    --practice_end();
    NewWorld(GetTask(TASK_PRACTICE), GetTask(TASK_PRACTICE + 1), GetTask(TASK_PRACTICE + 2));
    --print("practice debug : quit_practice");
end;

function continue_practice()
    --¼ÌÐøÏûºÄÒ»¸öÊ¦ÃÅÁîÅÆ
    local nFaction = GetPlayerFaction();
    if GetItemCount(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3]) >= 1 then
        DelItem(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3], 1);
        --Ë«±¶ÐÞÁ¶ËÙ¶È
        SetPopBoost(DOUBLE_SPEED);
        ContinueTimer(GetTrigger(TIME_PRACTICE));   --¼ÌÐø¼ÆÊ±£¬10Ð¡Ê±
        Msg2Player("Tèc ®é tu luyÖn t¨ng gÊp ®«i");
    else
        Talk(1,"","B¹n kh«ng mang lÖnh bµi s­ m«n, kh«ng thÓ tiÕp tôc tu luyÖn!");
    end;
    --print("practice debug : continue_practice");
end;

function exit_say()

end;