--¾üĞè¹Ù
--ÏÖÔÚĞŞ¸ÄÎª´ò¿ª´¢ÎïÏä

Include("\\script\\battles\\battleinfo.lua")

function main(sel)
	--Say("¾üĞè¹Ù£ºÎÒÊÇ¸ºÔğºóÓªÊÂÎñµÄ¾üĞè¹Ù£¬ÄãÓĞÊ²Ã´ĞèÒªÂğ£¿",3,"¹ºÂòÒ©Æ·/salemedicine","ÑãÃÅ¹ØÖ®Õ½µÄ¹æÔò/bt_onbattleinfo","²»ÓÃÁË£¬Ğ»Ğ»/cancel")
	Say("Ta phô tr¸ch qu©n nhu, ng­¬i cÇn g×?", 3, "Më r­¬ng chøa ®å/OpenStoreBox","T×m hiÓu quy t¾c Nh¹n M«n chiÕn/bt_onbattleinfo","Kh«ng cÇn ®©u! C¸m ¬n!/cancel");
end;

--function salemedicine(sel)
--	Sale(50)
--end

function OpenStoreBox()
	OpenBox();
end;

