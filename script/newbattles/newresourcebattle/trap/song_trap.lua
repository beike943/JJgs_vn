-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

tReturnPos = {{1303,2906},{1286,2884}};

function main()	
	if GetTask(701) < 0 then
		SetPos(tReturnPos[1][1],tReturnPos[1][2]);
		Talk(1,"","Ng­êi cña phe Liªu kh«ng thÓ ®i vµo ®iÓm tËp kÕt phe Tèng.")		
	--else
		--SetPos(tReturnPos[2][1],tReturnPos[2][2]);	
		--Talk(1,"","Qu©n ®Þch bao v©y phÝa tr­íc, kh«ng nªn ®i ra lèi nµy!.")		
	end
	return 0;	
end;