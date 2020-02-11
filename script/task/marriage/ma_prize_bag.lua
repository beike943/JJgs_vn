--½Å±¾Ãû³Æ£º½á»éÆ¸Àñ°ü
--½Å±¾¹¦ÄÜ£º´ò¿ª½á»éÆ¸Àñ°ü£¬»ñµÃ½á»éÏà¹ØÎïÆ·
--¹¦ÄÜ²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-6-20
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Tb_prize_bag = {
	{"GÊm lam",2,1,15,10},
	{"§¹o Hoa H­¬ng",1,1,12,36},
	{"B¸nh Bét vµng",1,1,15,36},
	{"GÊm vµng",2,1,54,36},
	{"T¬ Ngò S¾c",2,9,3,36},
	{"D¹ Minh Ch©u",2,1,39,5},
}
function OnUse()
	local prize_list = ""
	for i = 1,getn(Tb_prize_bag) do
		prize_list = prize_list.."<color=yellow>"..Tb_prize_bag[i][5].."<color> <color=yellow>"..Tb_prize_bag[i][1].."<color>\n    "
	end
	prize_list = prize_list .."B¹n muèn dïng tói lÔ vËt ®İnh h«n?"
	Say("<color=green>Gîi ı<color>: Më tói lÔ vËt ®İnh h«n, nhËn ®­îc: \n    "..prize_list,
	2,
	"T«i muèn më ra/prize_bag_use",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function prize_bag_use()
	--Àñ°üĞ¯´ø¼ì²â
	if GetItemCount(2,1,585) == 0 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n cã mang <color=yellow>tói lÔ vËt ®İnh h«n<color>!")
		return
	end
	--¸ºÖØ¿Õ¼ä¼ì²â
	if Zgc_pub_goods_add_chk(6,160) ~= 1 then
		return
	end
	--Àñ°üÉ¾³ı¼ì²â
	if DelItem(2,1,585,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı<color>: Xin x¸c nhËn b¹n cã mang <color=yellow>tói lÔ vËt ®İnh h«n<color>!")
		return
	end
	--Ôö¼Ó½±Àø
	for i = 1 ,getn(Tb_prize_bag) do
		AddItem(Tb_prize_bag[i][2],Tb_prize_bag[i][3],Tb_prize_bag[i][4],Tb_prize_bag[i][5])
	end
end
