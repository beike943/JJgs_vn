--08´º½Ú·¢·Åºì°ü³õÊ¼»¯½Å±¾
--by vivi
--2008/01/11

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		SetMapTaskTemp(100,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(150,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(200,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(300,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(350,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(400,MAP_HONGBAO_NUM,0);
		Msg2SubWorld("Niªn Sø ®· ph¸t hång bao, mäi ng­êi mau ®Õn nhËn!");	
--		AddLocalNews("ÐÂÄêÊ¹ÕßÒÑ¾­ÔÚ·¢·Å´óºì°üÁË£¬´ó¼Ò¿ìÈ¥ÇÀ°¡£¡");	
	end		
end