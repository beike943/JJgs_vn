--ãê¾©¸®ÄÏto¶şÁúÉ½
--GGH

--ĞŞ¸Ä£ºyanjun 05-12-27
--ĞŞ¸ÄÄ¿µÄ£ºÔªµ©¶áÆì±ÈÈü²»ÈÃÓĞÆì×ÓµÄÍæ¼Ò×ßTRAPµã³öµØÍ¼
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B¹n ®ang tham gia thi ®Êu ®o¹t cê TÕt Nguyªn §¸n, gi÷a ®­êng ®õng rêi khái khu vùc thi ®Êu!",0)
		return 0
	end
	NewWorld(207, 1290 ,2754)	
	SetFightState(1);	
end;
