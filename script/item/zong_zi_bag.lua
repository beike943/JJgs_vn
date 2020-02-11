--½Å±¾Ãû³Æ£ºôÕ×ÓÀñ°ü½Å±¾
--½Å±¾¹¦ÄÜ£ºôÕ×ÓÀñ°üÎïÆ·¶ÔÓ¦½Å±¾£¬Ê¹ÓÃôÕ×ÓÀñ°ü¿ª³ö¸÷ÖÖÏà¹Ø½±Àø
--²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-06-01
--´úÂëĞŞ¸Ä¼ÇÂ¼
--==============================¹«¹²±äÁ¿¶¨ÒåÇø========================
	zong_zi_bag_goods_ID = 1141
TB_zong_zi_bag_prize = {
	{"b¸nh İt g¹o tr¾ng",1122,1,"43%",4300},
	{"b¸nh İt ng¶i h­¬ng",1123,1,"30%",7300},
	{"b¸nh İt ch©n gµ",1124,1,"20.5%",9350},
	{"b¸nh İt B¸c B¶o",1125,1,"5%",9850},
	{"b¸nh İt vui vÎ",1126,1,"1%",9950},
	{"b¸nh İt may m¾n",1127,1,"0.45%",9995},
	{"b¸nh İt th¹ch anh",1128,1,"0.05%",10000},
}
function OnUse(goods_index)
	local prize_dialog = ""
	for i = 1, getn(TB_zong_zi_bag_prize) do
		prize_dialog = prize_dialog.."\n    <color=yellow>"..TB_zong_zi_bag_prize[i][1].."1<color>, x¸c xuÊt: "..TB_zong_zi_bag_prize[i][4]..""
	end
	Say("<color=green>Gîi ı <color>: B¹n x¸c nhËn muèn sö dông <color=yellow>Hép b¸nh İt<color> ®æi lÊy phÇn th­ëng? "..prize_dialog,
	2,
	"§ång ı/prize_chg",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function prize_chg()
	--Ğ¯´ø¼ì²â
	if GetItemCount(2,1,zong_zi_bag_goods_ID) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>Hép b¸nh İt <color>!")
		return
	end
	if DelItem(2,1,zong_zi_bag_goods_ID,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>Hép b¸nh İt <color>!")
		return
	end
	local ran_num = random(1,10000)
	for i = 1,getn(TB_zong_zi_bag_prize) do
		if ran_num <= TB_zong_zi_bag_prize[i][5] then
			local add_flag = AddItem(2,1,TB_zong_zi_bag_prize[i][2],1)
			if add_flag == 1 then
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1"..TB_zong_zi_bag_prize[i][1])
				return
			else
				WriteLog("Ho¹t ®éng TÕt §oan Ngä: Ng­êi ch¬i "..GetName().."Sö dông Hép b¸nh İt t¨ng"..TB_zong_zi_bag_prize[i][1].." thÊt b¹i, kı hiÖu:"..add_flag.."")
			end
			if i > 4 then
				Msg2SubWorld("Chóc mõng:"..GetName().."Sö dông Hép b¸nh İt ®æi lÊy 1 "..TB_zong_zi_bag_prize[i][1].."!")
				WriteLog("Ho¹t ®éng TÕt §oan Ngä: Ng­êi ch¬i "..GetName().."Sö dông Hép b¸nh İt ®æi lÊy 1 "..TB_zong_zi_bag_prize[i][1].."!")
			end
		end
	end
end
function end_dialog()
end
