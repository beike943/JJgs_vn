--function main()
--IdentiryAll()
--end;
-- -----------------------------------------
-- Newbie Quest Lua Scripts / Danexx 2005.01
-- -----------------------------------------
-- Include Files
Include( "\\script\\ÖĞÔ­Ò»Çø\\ãê¾©\\npc\\init_ĞÂÊÖÈÎÎñ.lua" )

-- Variable
	
-- Start of Main Function
function main()
--  ĞÂÊÖÈÎÎñÏà¹Ø
	NewbieTaskStrings =	 {"    §èi thñ th­êng sö dông vò khİ ngò hµnh mang tİnh s¸t th­¬ng giíi h¹n, chØ cÇn dïng <color=blue>vò khİ ngò hµnh<color> dùa theo tİnh t­¬ng kh¾c lµ cã thÓ t¹o ra s¸t th­¬ng lín.",
						  "    Ha! Ha! Vò khİ ngò hµnh còng cã tai h¹i khi ®èi mÆt víi thuéc tİnh t­¬ng sinh kh«ng thÓ t¹o ra s¸t th­¬ng lín nh­ng kh«ng sao chØ cÇn phèi hîp ®óng thuéc tİnh ngò hµnh th× uy lùc sÏ cao gÊp béi."}

--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {10,0}
	TaskReward	=	 	 {0,0}
	TaskItem	=		{{0,0,0},
						 {0,0,0}}
--	TaskMagic	=		{{0,0,0},
--						 {0,0,0}}
						 
    if ( GetTask(103) == 1 ) then
		Talk(1, "", NewbieTaskStrings[1])
		SetTask(103, 2)
		SetTask(100, (GetTask(100) + 1))
		ModifyExp(TaskExp[1])
		-- AddItem() ÎåĞĞÎäÆ÷
	else
		Talk(1, "", NewbieTaskStrings[2])
	end
end;

