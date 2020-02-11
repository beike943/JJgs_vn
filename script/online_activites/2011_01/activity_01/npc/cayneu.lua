Include("\\script\\online_activites\\2011_01\\activity_01\\head.lua");

function main()
	local tSay = {}
	local szHeader = "Chóc mõng n¨m míi T©n M·o."
	
	tinsert(tSay, "Nép M©m Ngò Qu¶./PB_give_5fruit")
	tinsert(tSay, "C©y nªu ®Ñp thËt./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end