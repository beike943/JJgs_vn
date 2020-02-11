--08´º½Ú°İÄê³õÊ¼»¯½Å±¾
--by vivi
--2008/01/11

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		local nState,nActionStep = getwindstate();
		SetMapTaskTemp(100,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(100,MAP_WIND_RAND,0);
		SetMapTaskTemp(150,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(150,MAP_WIND_RAND,0);
		SetMapTaskTemp(200,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(200,MAP_WIND_RAND,0);
		SetMapTaskTemp(300,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(300,MAP_WIND_RAND,0);
		SetMapTaskTemp(350,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(350,MAP_WIND_RAND,0);
		SetMapTaskTemp(400,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(400,MAP_WIND_RAND,0);
		Msg2SubWorld("NhiÖm vô chóc tÕt vßng míi ®· b¾t ®Çu, ng­êi tham gia xin nhanh chãng ®Õn Niªn Sø nhËn nhiÖm vô!");	
	--	AddLocalNews("ĞÂµÄÒ»ÂÖ°İÄêÈÎÎñÒÑ¾­¿ªÊ¼ÁË£¬Òª²Î¼ÓµÄÈËÇë¿ì¿ìµ½ĞÂÄêÊ¹Õß´¦ÁìÈ¡ÈÎÎñ£¡");												
	end
end