--File name:boss_notice_ontime.lua 
--Describe:Èı½ÚÁ¬¹ı£¬´´½¨BOSSÌáÇ°¹«¸æ
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		Msg2SubWorld("Mçi tªn giang hå ¸c nh©n sÏ xuÊt hiÖn sau 30 phót, mäi ng­êi h·y chuÈn bŞ!");
		AddGlobalNews("Mçi tªn giang hå ¸c nh©n sÏ xuÊt hiÖn sau 30 phót, mäi ng­êi h·y chuÈn bŞ!");		
	end;
end;