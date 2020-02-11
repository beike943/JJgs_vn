--°²È«Ç¿»¯

function OnUse()
	Say("Sö dông tİnh n¨ng c­êng hãa an toµn tiÕn hµnh c­êng hãa vò khİ, c­êng hãa thÊt b¹i sÏ kh«ng lµm rít cÊp. <color=red> (CÊp 11 trë lªn míi cã thÓ tiÕn hµnh c­êng hãa an toµn) <color>",2,"B¾t ®Çu/StartEnhance","Kh«ng cÇn ®©u/do_nothing")
end

function StartEnhance()
	if GetFightState() ~= 0 then
		Talk(1,"","HiÖn t¹i kh«ng thÓ sö dông ®¹o cô nµy");
		return 0;
	end
	EnhanceItem(3);
	return 1;
end

function do_nothing()
	--do nothing
end