-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

tReturnPos = {{1433,3035},{1455,3063}};

function main()
	if GetTask(701) >= 0 then
		SetPos(tReturnPos[1][1],tReturnPos[1][2]);
		Talk(1,"","Ng­êi cña phe Tèng kh«ng thÓ ®i vµo ®iÓm tËp kÕt phe Liªu.")		
	--else
		--SetPos(tReturnPos[2][1],tReturnPos[2][2]);	
		--Talk(1,"","Qu©n ®Şch bao v©y phİa tr­íc, kh«ng nªn ®i ra lèi nµy!.")		
	end
	return 0;	
end;