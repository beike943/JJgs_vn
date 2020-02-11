Include("\\script\\global\\mate_head.lua");

function main()
	local year = tonumber(date("%Y"))
	local mon = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	local datetime = encode_datetime(year, mon, day)
	
	local player = FirstPlayer()
	while (player > 0) do
		local mate = GetMateName(player)
		if (mate ~= "") then
			dec_lovegrade(datetime, player, VALUE_DECLOVE)
		end
		player = NextPlayer(player)
	end
end



