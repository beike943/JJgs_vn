--2007´º½Ú»î¶¯-Âé½«ÊÕ¼¯»î¶¯-»î¶¯¹ã²¥
--´úÂë¿ª·¢ÈË£ºÕÔ¹ó´º
--´úÂë¿ª·¢Ê±¼ä£º2007-01-26
--ĞŞ¸Ä¼ÇÂ¼:

--ÕÔ¹ó´º¹«¹²ÎÄ¼ş
Include("\\script\\online\\zgc_public_fun.lua")
--=============================¹«¹²±äÁ¿¶¨ÒåÇø==============================
--===============================Ö÷Âß¼­Çø==================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local mah_seq_time = {{11,time_distance},{15,time_distance},{22,time_distance}}
	local mah_suc_seq = spring_2007_mahj_suc_seq_rtn()
	if mah_suc_seq == 0then
		local mah_jong_suc_seq = {		--Âé½«ºÍ·¢·¨ĞòÁĞ
			{11,4,16},	{12,10,7},	{18,16,15},
			{4,17,14},	{10,6,1},	{2,7,3},
			{4,19,9},	{3,1,5},	{8,11,2},
			{1,12,13},	{13,9,7},	{2,12,15},
			{16,10,6},	{17,14,19},	{18,11,3},
			{9,5,1},	{4,2,1},
		}
		mah_suc_seq = 1
		local sec_seq_now = Zgc_pub_today_sec_num_rtn()		--»ñµÃÏÖÔÚÊÇ½ñÌìµÄµÚ¶àÉÙÃë
		for i = 1, 3 do
			sec_seq_now[i].time_distance = sec_seq_now - (sec_seq_now[i][1]*3600 )
		end
		for i = 2,3 do
			if sec_seq_now[i].time_distance < sec_seq_now[i-1].time_distance then
				mah_suc_seq = i
			end
		end
		local date_seq = (zgc_pub_day_turn(1) - 13552 + 1)
		mah_suc_seq = mah_jong_suc_seq[date_seq][mah_suc_seq]
	end
	local mah_suc_name = {	"§¹i Tø Hû",		"Tø Kh¾c Tö",		"Cöu Liªn B¶o §¨ng", "ThËp Tham Yªu",	"Liªn ThÊt §èi",
							"Thanh ThÊt §èi",		"ThÊt Tinh BÊt Kh¸o",		"Thèi bÊt ®¶o",	"§¹i Tam Nguyªn",	"Thanh Yªu Cöu",
							"NhÊt S¾c Tø §ång ThuËn", 	"NhÊt S¾c Tø TiÕt Cao", 	"Tù NhÊt S¾c",	"Thanh NhÊt S¾c",
							"Toµn ®¹i",			"Toµn trung",			"Toµn tiÓu",		"Thanh Long",		"Tam Kh¾c Tö",}
	Msg2SubWorld("Ho¹t ®éng thu thËp bµi M¹c Ch­îc:"..mah_suc_name[mah_suc_seq].."!")
	Msg2SubWorld("Mäi ng­êi tham gia gia ho¹t ®éng thu thËp, ®Õn 3 thµnh thŞ chİnh gÆp Phóc ThÇn ®Ó nhËn phÇn th­ëng.")
	Msg2SubWorld("Xin ®Õn chç Phóc ThÇn nhËn  H­íng dÉn ho¹t ®éng (miÔn phİ)")
end
