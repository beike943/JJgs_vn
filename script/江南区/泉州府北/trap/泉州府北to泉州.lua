--ÈªÖİ¸®±±toÈªÖİ.lua
--GGH

--ĞŞ¸Ä£ºyanjun 05-12-27
--ĞŞ¸ÄÄ¿µÄ£ºÔªµ©¶áÆì±ÈÈü²»ÈÃÓĞÆì×ÓµÄÍæ¼Ò×ßTRAPµã³öµØÍ¼
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("B¹n ®ang tham gia thi ®Êu ®o¹t cê TÕt Nguyªn §¸n, gi÷a ®­êng ®õng rêi khái khu vùc thi ®Êu!",0)
		return 0
	end
	if(GetPKValue() <= 3 ) then
		NewWorld(100,1579,2817)
		SetFightState(0);
	else
		Msg2Player("Ng­êi lµm viÖc ¸c cÊm ra vµo th«n trÊn.")
	end	
end;


