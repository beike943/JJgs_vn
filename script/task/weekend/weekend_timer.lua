--2005-11-3 16:41

--·µ»ØĞÇÆÚ¼¸£¬0´ú±íĞÇÆÚÌì
function GetWeekDay()
	return tonumber(date("%w"))
end;

function GetLocalHour()
	nHour = date("%H");
	return tonumber(nHour)
end;

function main()
	local nWeekDay = GetWeekDay();
	if nWeekDay == 5 or nWeekDay == 6 then	--ÖÜÄ©
		if GetLocalHour() == 19 or GetLocalHour() == 20 or GetLocalHour() == 21 or GetLocalHour() == 22 then
			AddLocalNews("Ho¹t ®éng chèng giÆc Man ®· b¾t ®Çu, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man ®· b¾t ®Çu, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
		elseif GetLocalHour() == 23 then
			AddLocalNews("Ho¹t ®éng chèng giÆc Man sÏ kÕt thóc sau 20 phót");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man sÏ kÕt thóc sau 20 phót");
		elseif GetLocalHour() == 0 then
			AddLocalNews("Ho¹t ®éng chèng giÆc Man h«m nay ®· kÕt thóc");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man h«m nay ®· kÕt thóc");
		else
			AddLocalNews("Ho¹t ®éng chèng giÆc Man tõ 19 giê-24 giê, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man tõ 19 giê-24 giê, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
		end;
	elseif nWeekDay == 0 then
		if GetLocalHour() >= 14 and GetLocalHour() <= 21 then
			AddLocalNews("Ho¹t ®éng chèng giÆc Man ®· b¾t ®Çu, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man ®· b¾t ®Çu, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
		elseif GetLocalHour() >= 22 then
			AddLocalNews("Ho¹t ®éng chèng giÆc Man h«m nay ®· kÕt thóc");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man h«m nay ®· kÕt thóc");
		else
			AddLocalNews("Ho¹t ®éng chèng giÆc Man tõ 14 giê-22 giê, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
			Msg2SubWorld("Ho¹t ®éng chèng giÆc Man tõ 14 giê-22 giê, ®Ó biÕt thªm mêi ®Õn BiÖn Kinh, D­¬ng Ch©u, T­¬ng D­¬ng gÆp Ch©n Tö §¬n");
		end;
	end;
end;
