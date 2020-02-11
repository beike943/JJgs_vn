--³É¶¼¸®ÄÏto½­½ò´å
--GGH

--ĞŞ¸Ä£ºyanjun 05-12-27
--ĞŞ¸ÄÄ¿µÄ£ºÔªµ©¶áÆì±ÈÈü²»ÈÃÓĞÆì×ÓµÄÍæ¼Ò×ßTRAPµã³öµØÍ¼
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B¹n ®ang tham gia thi ®Êu ®o¹t cê TÕt Nguyªn §¸n, gi÷a ®­êng ®õng rêi khái khu vùc thi ®Êu!",0)
		return 0
	end
UWorld1402 = GetTask(1402)
if ( UWorld1402 >= 10 )  then
	NewWorld(306, 1332 ,2843)
	SetFightState(1);
else
	Talk(1,"","Phİa tr­íc yªu ma hung ¸c, hay lµ ®Õn Thµnh §« gÆp n¹n d©n cña Giang T©n Th«n t×m hiÓu t×nh h×nh!")
end
end;
