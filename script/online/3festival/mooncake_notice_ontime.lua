--File name:mooncake_notice_ontime.lua 
--Describe:Èı½ÚÁ¬¹ı£¬³õÊ¼»¯ÔÂ±ıÊıÁ¿ÌáÇ°¹«¸æ
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		Msg2SubWorld("Niªn sø sÏ ph¸t b¸nh Trung Thu sau 30 phót n÷a, mäi ng­êi h·y chuÈn bŞ!");
		AddGlobalNews("Niªn sø sÏ ph¸t b¸nh Trung Thu sau 30 phót n÷a, mäi ng­êi h·y chuÈn bŞ!");		
	end;
end;