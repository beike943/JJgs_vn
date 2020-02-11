ID_ITEMBOX = 805
function main()
	if GetTask(ID_ITEMBOX) == 0 then
		Talk(1,"","Xin lçi ng­¬i vÉn ch­a ®­îc së h÷u r­¬ng nµy")
		return 0;
	end;
	OpenBox();
end;