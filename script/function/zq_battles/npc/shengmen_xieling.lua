--…˙√≈–∞¡È
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if gf_GetTaskBit(ZQ_BATTLE_TASK11, 17) == 1 then
		ZQ_EvilBet_Talk();
	end
end