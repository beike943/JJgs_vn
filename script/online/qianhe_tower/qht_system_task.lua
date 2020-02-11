Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	if qht_activity_isopen() == 1 then
		Msg2Global("Thiªn TÇm HuyÔn C¶nh Hoµng Kim boss s¾p xuÊt hiÖn, boss ë tÇng cµng cao th× phÇn th­ëng cµng tèt.");
		AddLocalCountNews("Thiªn TÇm HuyÔn C¶nh Hoµng Kim boss s¾p xuÊt hiÖn, boss ë tÇng cµng cao th× phÇn th­ëng cµng tèt.", 2);
	end
end