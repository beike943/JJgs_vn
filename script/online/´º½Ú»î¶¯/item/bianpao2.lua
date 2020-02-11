
function OnUse()
	if HaveLearnedSkill(853) == 0 then
		Say("Häc kü n¨ng nghªnh t©n niªn tèn 1 viªn ph¸o, b¹n ®ång ý häc kh«ng?",2,"V©ng, ta muèn häc./learn","Th«i, ®Ó lÇn sau./no")
	elseif HaveLearnedSkill(853) == 1 then
		Say("Muèn hñy bá kü n¨ng nghªnh t©n niªn cÇn tèn 1 viªn ph¸o, b¹n cã ®ång ý hñy bá kh«ng?",2,"V©ng, ta muèn hñy bá./forget","Th«i, h·y gi÷ l¹i./no")
	end
end

function learn()
	if DelItem(2,3,215,1) == 1 then
		LearnSkill(853)
		Say("B¹n ®· häc kü n¨ng nghªnh t©n niªn, nÕu muèn hñy bá h·y nhÊp chuét ph¶i vµo viªn ph¸o.",0)
		TaskTip("H·y chän kü n¨ng muèn sö dông trong « kü n¨ng bªn ph¶i (kh«ng ph¶i giao diÖn F5).")
	end
end

function forget()
	if DelItem(2,3,215,1) == 1 then
		RemoveSkill(853)
		Say("B¹n ®· hñy bá kü n¨ng nghªnh t©n niªn, nÕu muèn häc l¹i h·y nhÊp chuét ph¶i vµo viªn ph¸o.",0)
	end
end

function no()

end