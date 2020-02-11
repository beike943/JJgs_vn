--File name:init_mooncake_ontime.lua 
--Describe:Èı½ÚÁ¬¹ı£¬³õÊ¼»¯ÔÂ±ıÊıÁ¿
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	if Get_3festival_State() == 1 then
		SetMapTaskTemp(100,3,MAX_MOONCAKE_COUNT);
		SetMapTaskTemp(200,3,MAX_MOONCAKE_COUNT);
		SetMapTaskTemp(300,3,MAX_MOONCAKE_COUNT);
		Msg2SubWorld("Niªn sø ®ang ph¸t miÔn phİ b¸nh Trung Thu ë TuyÒn Ch©u, Thµnh §«, BiÖn Kinh, sè l­îng cã h¹n, mäi ng­êi h·y nhanh ch©n ®Õn lÊy!");
		AddGlobalNews("Niªn sø ®ang ph¸t miÔn phİ b¸nh Trung Thu ë TuyÒn Ch©u, Thµnh §«, BiÖn Kinh, sè l­îng cã h¹n, mäi ng­êi h·y nhanh ch©n ®Õn lÊy!");
	end;
end;