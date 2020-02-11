Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("B¹n muèn t¹m thêi rêi khái L«i ®µi tû vâ ­?",2,"Muèn/yes","Kh«ng cÇn ®©u!/no")
end;

function yes()
	LeaveGame(1);
end

function no()
	return
end
