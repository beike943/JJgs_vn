Include("\\script\\lib\\globalfunctions.lua")
function OnUse(nItem)
	if gf_Judge_Room_Weight(1,50) ~= 1 then
    Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
  end
  if DelItem(2,1,30387,1) == 1 then
  	AddItem(2,1,30385,50);
  	Msg2Player(format("C¸c h¹ nhËn ®­îc ch×a khãa vµng L­¬ng S¬n x%d",50));
  end
end