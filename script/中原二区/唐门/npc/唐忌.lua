--ÎÄ¼şËµÃ÷
--ÓëÌÆ¼É¶Ô»°µÄ½Å±¾
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_³É¶¼\\task_main.lua");

function main()
    local nStep = GetTask(TASK_CD_TWO);
    if nStep == 101 then
        task_two_01();
        return
    elseif nStep == 102 then
        task_two_02();
        return
    elseif nStep == 103 then
        task_two_03();
        return
    end;

    i=random(1,3)
	if i == 1 then
		Say("Tèn nhiÒu tiÒn ®Õn Háa khİ phßng nh­ng còng kh«ng rÌn ®­îc mãn Háa khã nµo c¶. Tæng qu¶n sím nghe lêi ta ®Çu t­ sè tiÒn ®ã vµo ¸m khİ phßng cña ta th× kh«ng ®Õn nçi nµy.",0)
	elseif	i == 2 then
		Say("Giang hå cã thËp ®¹i m«n ph¸i nh­ng ph¸i nµo l¹i kh«ng sî ¸m khİ §­êng M«n ta.",0)
	else
		Say("Thiªn H¶i häc nhiÒu hiÓu réng, hiÕu th¶o víi tr­ëng bèi, t­¬ng lai sÏ trë thµnh Tæng qu¶n ®êi kÕ tiÕp.",0)
	end
end;