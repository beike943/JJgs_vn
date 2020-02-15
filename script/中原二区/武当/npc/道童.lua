function main()
	Say("大侠，有什么事?",
		2,
		"我想购买师门物品/baishibuy",
		"我逛逛，没事/qita")
end

function baishibuy()
		Say("这里有上等的装备和物品，价格40两，你要买吗?",
		2,
		"买/buyshimen",
		"不买/meiqian")
end

function buyshimen()
		Say("这是你想要的物品!", 0);
		Pay(40)	
		AddItem(0,2,14,1)
		AddItem(2,1,12,1)		
end;

function meiqian()
		Say("带够钱再来.", 0);	
end;

	
function qita()
	i=random(1,3)
	if i == 1 then
		Say("M?c d? Minh Nguy?t ta ch? lμ mét tióu ?1o ??ng nh-ng c?ng lμ ?? t? ph?i Va §ang, ng-?i xem th-êng ta μ?",0)
	elseif	i == 2 then
		Say("Minh nguy?t c? thêi h÷u, b? t?u vên thanh thian. H?m ?? s- ph? nhêt ??nh ?· uèng say nan míi ??t cho ta tan ??.",0)
	else
		Say("Kh?ng c? vi?c g× th× ??ng phi?n ta thanh tu",0)
	end
end;

