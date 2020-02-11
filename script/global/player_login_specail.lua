
tSpecailIpAndMac = 
{
	{"221.237.177.95", "001E-4FEB-C1C4"},
	{"221.237.177.95", "00E0-4D46-0655"}
}

function SpecailOperation(IpAddr, Mac)	
	if ChkIpMac(IpAddr, Mac) > 0 then
		SetGMSpecailState("GM_TRADE", 1)
	end
end

function ChkIpMac(IpAddr, Mac)
	for i, v in tSpecailIpAndMac do
		if v[1] == IpAddr and v[2] == Mac then
			return 1
		end
	end
	return 0
end