--ÈªÖİ¸®±±to¶«º£º£±õ1.lua
--GGH

--ĞŞ¸Ä£ºyanjun 05-12-27
--ĞŞ¸ÄÄ¿µÄ£ºÔªµ©¶áÆì±ÈÈü²»ÈÃÓĞÆì×ÓµÄÍæ¼Ò×ßTRAPµã³öµØÍ¼
Include("\\script\\task\\world\\task_var_id.lua");

Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B¹n ®ang tham gia thi ®Êu ®o¹t cê TÕt Nguyªn §¸n, gi÷a ®­êng ®õng rêi khái khu vùc thi ®Êu!",0)
		return 0
	end
    if GetTask(TASK_YZ_FOUR) >= 1 then
    	NewWorld(103,1662,3036);
    	SetFightState(1);
    else
        Msg2Player("Phİa tr­íc rÊt nguy hiÓm, chi b»ng ®õng vµo n÷a!");
    end;
end;
