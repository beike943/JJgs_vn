--Ð¡½â°ó·ûÎïÆ·½Å±¾
Include("\\script\\item\\jiebangfu.lua")

t_award = 
{
	n_gold = 400,
	n_room_need = 2,
	n_weight_need = 50,
	t_item = {
		{2,1,30470,1,"Cµng Kh«n Phï"},
		{2,2,7,40,"M¶nh Thiªn th¹ch"},
		},
}

function OnUse(nItemIdx)
	return _OnUseReal(nItemIdx)
end