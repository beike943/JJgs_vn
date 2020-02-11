--½Å±¾Ãû³Æ£º»ÆµÛÖØÔìÍ¼Ö½Ê¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º¸øÍæ¼ÒÏÔÊ¾ÖØÖıĞèÒªµÄ²ÄÁÏ
--²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-07-02
Tb_refound_mertiral = {
	{2,1,504,4,"N÷ Oa Tinh Th¹ch"},
	{2,0,555,2,"Cµn Kh«n phï"},
	{2,1,503,5,"V« NgÊn Thñy"},
	{2,1,1009,200,"Thiªn Th¹ch Tinh Th¹ch"},
}
function OnUse()
	local mertiral_need_dia = "<color=green>Hoµng ®Õ trïng t¹o ®å<color>: Theo ®å chØ b¹n sÏ biÕt <color=red>Bé Hoµng ®Õ<color> cÇn nh÷ng nguyªn liÖu sau"
	for i = 1, getn(Tb_refound_mertiral) do
		local num_color = "<color=red>"
		local mertiral_num = GetItemCount(Tb_refound_mertiral[i][1],Tb_refound_mertiral[i][2],Tb_refound_mertiral[i][3])
		if mertiral_num >= Tb_refound_mertiral[i][4] then
			num_color = "<color=green>"
		end
		mertiral_need_dia = mertiral_need_dia .."\n    <color=yellow>"..Tb_refound_mertiral[i][5]..Tb_refound_mertiral[i][4].."<color>, hiÖn b¹n cã"..num_color..mertiral_num.."<color>;"
	end
	Talk(1,"",mertiral_need_dia)
end