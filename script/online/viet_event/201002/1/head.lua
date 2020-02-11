Include("\\script\\lib\\globalfunctions.lua");

TAKE_EXP_AWARD = 1541

tb_Reput_Award = {
		{3000,	3999,		50000},
		{4000,	4999,		75000},
		{5000, 	5999,		100000},
		{6000, 	6999,		125000},
		{7000, 	7999,		150000},
		{8000, 	8999,		175000},
		{9000, 	9999,		200000},
		{10000, 10999,	225000},
		{11000, 14999,	250000},
		{15000, 19999,	275000},
		{20000, 24999,	300000},
		{25000, 99999,	325000},
}

tb_Faction_Award = {
		{3000,	3999,		50000},
		{4000,	4999,		75000},
		{5000, 	5999,		100000},
		{6000, 	6999,		125000},
		{7000, 	7999,		150000},
		{8000, 	8999,		175000},
		{9000, 	9999,		200000},
		{10000, 10999,	225000},
		{11000, 14999,	250000},
		{15000, 19999,	275000},
		{20000, 24999,	300000},
		{25000, 99999,	325000},
}

function npc_xiao_talk()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20100129 or nDate > 20100228 then
		Say(szNpcName.."Ho¹t ®éng ®· kÕt thóc.",0)
		return
	end	
	local tSay ={
		"NhËn th­ëng T©n Niªn/give_new_year_exp",
		"KÕt thóc ®èi tho¹i/nothing";
	}	
	Say(szNpcName.."Sù kiÖn <color=green>Mõng Xu©n Canh DÇn<color> diÔn ra tõ ngµy <color=yellow>29-01-2010 ®Õn 24:00 ngµy 28-02-2010<color>. Th«ng tin chi tiÕt, ®ång ®¹o xem thªm trªn trang chñ http://volam2.zing.vn",getn(tSay),tSay);	
end

function give_new_year_exp()
	local nDate = tonumber(date("%d"))
	local nTaskVal = GetTask(TAKE_EXP_AWARD)
	
	if GetByte(nTaskVal, XIAO_BYTE_ID) == nDate then
		Say(szNpcName.."H«m nay c¸c h¹ ®· nhËn phÇn th­ëng råi!",0)
		return
	end
	
	local nRep = GetReputation()
	local nFaction = GetTask(336)
	local nExp = 0
	for i=1,getn(tb_Reput_Award) do
		if nRep >= tb_Reput_Award[i][1] and nRep<= tb_Reput_Award[i][2] then
			nExp	= tb_Reput_Award[i][3]
			break
		end
	end	
	for i=1,getn(tb_Faction_Award) do
		if nFaction >= tb_Faction_Award[i][1] and nFaction<= tb_Faction_Award[i][2] then
			nExp	=nExp +  tb_Faction_Award[i][3]
			break
		end
	end	
	if nExp == 0 then
		Say(szNpcName.."Kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng!",0)
		return
	end
	SetTask(TAKE_EXP_AWARD, SetByte(nTaskVal,XIAO_BYTE_ID,nDate))	
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm.")	
end

function nothing()	
end