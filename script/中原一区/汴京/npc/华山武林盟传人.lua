function main()
	local palyer_sex = "§¹i hiÖp"
	if GetSex() == 2 then
		palyer_sex = "N÷ hiÖp "
	end
	Say("Hoa S¬n c¶nh s¾c tuyÖt ®Ñp, nh­ng "..palyer_sex.."NÕu kh«ng sî l¹nh, ta sÏ ®­a ng­¬i ®i mét chuyÕn!",
	4,
	"§i BiÖn Kinh/#leave_huashan(1)",
	"§i Thµnh §«/#leave_huashan(2)",
	"§i TuyÒn Ch©u/#leave_huashan(3)",
	"KÕt thóc ®èi tho¹i/end_dialog"
	)
end
function leave_huashan(map_seq)
	local map_att = {
	{200,1404,2861},
	{300,1750,3555},
	{100,1421,2992},
	}
	NewWorld(map_att[map_seq][1],map_att[map_seq][2],map_att[map_seq][3])
	SetFightState(0)
end