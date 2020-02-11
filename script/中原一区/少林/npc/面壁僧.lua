Include("\\script\\task\\global_task\\gtask_data.lua")

function main()	
	strTab = {"Ta v× trém chã ¨n thŞt mµ ®· bŞ HuyÒn Minh s­ thóc ph¹t mét th¸ng, ng­¬i ®õng ®Õn quÊy rÇy ta.",
			  "Ng­êi xuÊt gia kh«ng hÒ nãi dèi, ta cã ¨n thŞt chã thËt nh­ng lóc ®ã kh«ng ai nh×n thÊy sao s­ thóc l¹i biÕt ta ¨n chø?",
			  "§Ö tö TŞnh Th«ng t©m kh«ng tèt ®· lì ¨n mÆn, xin phËt tæ trõng ph¹t."}
	
	local i = random(3);
	if IsHaveTaskOrCanGet2(15, 16) == 1 then
		Say(strTab[i], 2,"TiÕn vµo ThiÕu L©m NghŞ Sù §­êng/entrance","Kh«ng cÇn ®©u/do_nothing")
	else
		Say(strTab[i], 0)
	end
end;

function entrance()
		NewWorld(6012,1582,3217)
		SetFightState(0);
		return 1;
end

function do_nothing()
end
