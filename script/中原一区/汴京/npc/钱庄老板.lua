
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ç®×¯ÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================
GOLD_COIN_2_TIME =
{
	-- ÌìÊý,	»¨·Ñ
	{ 	7,	200 },
	{ 	28, 	600 },
};
SECONDS_ONE_DAY = 24 * 3600;

best = 0;
if GOLD_COIN_2_TIME[1][1]/GOLD_COIN_2_TIME[1][2] < GOLD_COIN_2_TIME[2][1]/GOLD_COIN_2_TIME[2][2] then
	best = 2;
else
	best = 1;
end

function main()
	Say("L·o cã thÓ gióp g× cho quý kh¸ch ®©y??", 1,
--		"ÎÒÏëÊ¹ÓÃ½ð±Ò³äÓÎÏ·Ê±¼ä£¡/select_charge_style",
		"Ta nh©n tiÖn ghÐ th¨m «ng th«i mµ!/nothing" )
	return
end

function nothing()
end

function select_charge_style()
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin <= 0 then
		Say("H×nh nh­ quý kh¸ch kh«ng mang theo tiÒn xu!!", 0);
		return
	end
	Say("Quý kh¸ch cã thÓ: 1. Dïng 200 Xu ®æi 7 ngµy ch¬i. 2. Dïng 600 Xu ®æi 28 ngµy ch¬i." ,
		3,
		"Ta muèn dïng 200 Xu ®æi 7 ngµy ch¬i/#start_charge(1)",
		"Ta muèn dïng 600 Xu ®æi 28 ngµy ch¬i/#start_charge(2)",
--		"ÎÒÏë×Ô¼ºÊäÈëÒªÊ¹ÓÃµÄ½ð±ÒÊýÁ¿/customize_charge_input",
		"T¹m thêi ch­a cÇn!/nothing" );
end

function start_charge(n)
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		Say( "B¹n ®ång ý dïng"..GOLD_COIN_2_TIME[n][2].." Xu ®æi "..GOLD_COIN_2_TIME[n][1].." ngµy ch¬i chø?!?",
			2,
			"§óng råi!/#finish_charge("..n..")",
			"Th«i! Kh«ng ®æi n÷a!/nothing" );
	else
		Say( "Xin lçi! Kh¸ch quan kh«ng ®ñ xu!", 0);
	end
end

function finish_charge(n)
	print(n, type(n))
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		ChargeTimeUseCoin( GOLD_COIN_2_TIME[n][2], GOLD_COIN_2_TIME[n][1] * SECONDS_ONE_DAY);
		WriteLog("[CoinExchange]\t"..GetAccount().."\t"..GetName().."\tdïng"..GOLD_COIN_2_TIME[n][2].." Xu ®æi "..GOLD_COIN_2_TIME[n][1].." ngµy ch¬i.")		
	else
		Say( "Xin lçi! Kh¸ch quan kh«ng ®ñ xu!", 0);
	end
end

function customize_charge_input()
	AskClientForNumber("customize_charge_start", 1, GetGoldCoin(), "Xin nhËp sè Xu cÇn ®æi!");
end

function customize_charge_start(num)
	if num == nil then
		return
	end
	if num <= 0 or num > GetGoldCoin() then
		Say( "NhËp sè bÞ lçi!", 0);
		return
	end

	local n1 = floor( num / GOLD_COIN_2_TIME[best][2] );
	local m = mod( num, GOLD_COIN_2_TIME[best][2] );
	local n2 = floor( m / GOLD_COIN_2_TIME[3-best][2] );

	Say( "Quý kh¸ch võa nhËp "..num.." Xu. Theo l·o tÝnh, cã thÓ sö dông "..n1.."  "..GOLD_COIN_2_TIME[best][2].." ngµy vµ "..n2.."  "..GOLD_COIN_2_TIME[3-best][1].." ngµy. Nh­ vËy kh«ng cã vÊn ®Ò g× chø?",
		2,
		format("§óng råi! Cø nh­ vËy ®i!/#customize_charge_finish(%d,%d)", n1, n2),
		"Khoan ®·! Ta suy nghÜ chót!/nothing" );
end

function customize_charge_finish(n1, n2)
	if n1 == nil then
		n1 = 0;
	end
	if n2 == nil then
		n2 = 0;
	end
	if n1 < 0 or  n2 < 0 then
		return
	end
	if n1 == 0 and n2 == 0 then
		return
	end
	if n1 * GOLD_COIN_2_TIME[best][2] + n2 * GOLD_COIN_2_TIME[3-best][2] > GetGoldCoin() then
		return
	end
	local d1 = n1 * GOLD_COIN_2_TIME[best][1];
	local d2 = n2 * GOLD_COIN_2_TIME[3-best][1];
	if n1 > 0 then
		ChargeTimeUseCoin( n1 * GOLD_COIN_2_TIME[best][2], d1 * SECONDS_ONE_DAY );
	end
	if n2 > 0 then
		ChargeTimeUseCoin( n2 * GOLD_COIN_2_TIME[3-best][2], d2 * SECONDS_ONE_DAY );
	end
end

