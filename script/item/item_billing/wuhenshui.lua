------------------------------------------------------------
-- ÎŞºÛË®µÄ½Å±¾ wuhenshui.lua
--
-- comment: Ï´µôÃØ¼®ÉÏÈÎÒâÒ»¸ö¾öÒª¡£
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,503
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	if IsBookLocked() > 0 then
		Say("MËt tŞch trang bŞ ®ang ë tr¹ng th¸i khãa, kh«ng thÓ dïng V« NgÊn thñy hñy bİ kiÕp!", 0)
		return
	end
	
	strTab = {"Sau khi dïng <color=yellow>V« NgÊn Thñy<color> sÏ sÏ hñy bá mét quyÓn bİ kiÕp bÊt kú trong mËt tŞch trang bŞ cña b¹n hiÖn t¹i. B¹n muèn hñy bá bİ kiÕp nµo?",
			  "Ta kh«ng muèn hñy bá--Hñy bá/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- Ã»ÓĞ¾öÒªÒªÏû³ı
	if (nAddendarCount == 0) then
		Say("HiÖn b¹n kh«ng thÓ hñy bá bİ kiÕp!", 0)
	end
	
	-- Ö»ÓĞÒ»¸ö¾öÒª¿ÉÒÔÏû³ı
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
	end
	
	-- ÓĞÁ½¸ö¾öÒª¿ÉÒÔÏû³ı
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
	end
	
	-- ÓĞÈı¸ö¾öÒª¿ÉÒÔÏû³ı
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
				"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end	
	end
	
	-- ÓĞËÄ¸ö¾öÒª¿ÉÒÔÏû³ıµÄ
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"Ta muèn hñy bá bİ kiÕp"..strAddendar[1].."/clear_addendar_1",
			"Ta muèn hñy bá bİ kiÕp"..strAddendar[2].."/clear_addendar_2",
			"Ta muèn hñy bá bİ kiÕp"..strAddendar[3].."/clear_addendar_3",
			"Ta muèn hñy bá bİ kiÕp"..strAddendar[4].."/clear_addendar_4",
			strTab[2])
	end
	
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- Ïû³ı¾öÒª1
function clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("Ng­¬i x¸c ®Şnh muèn hñy bá <color=yellow>"..strAddendar.."<color> chø? Sau khi hñy bá, bİ kiÕp nµy sÏ biÕn mÊt!",
		2,
		"§ång ı/confirm_clear_addendar_1",
		"Ta kh«ng muèn hñy bá--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÏû³ı¾öÒª1
function confirm_clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(0)
		Say("B¹n ®· xãa thµnh c«ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· xãa bİ kiÕp thµnh c«ng!")
	end
end;


-- Ïû³ı¾öÒª2
function clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("Ng­¬i x¸c ®Şnh muèn hñy bá <color=yellow>"..strAddendar.."<color> chø? Sau khi hñy bá, bİ kiÕp nµy sÏ biÕn mÊt!",
		2,
		"§ång ı/confirm_clear_addendar_2",
		"Ta kh«ng muèn hñy bá--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÏû³ı¾öÒª2
function confirm_clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(1)
		Say("B¹n ®· xãa thµnh c«ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· xãa bİ kiÕp thµnh c«ng!")
	end
end;


-- Ïû³ı¾öÒª3
function clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("Ng­¬i x¸c ®Şnh muèn hñy bá <color=yellow>"..strAddendar.."<color> chø? Sau khi hñy bá, bİ kiÕp nµy sÏ biÕn mÊt!",
		2,
		"§ång ı/confirm_clear_addendar_3",
		"Ta kh«ng muèn hñy bá--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÏû³ı¾öÒª3
function confirm_clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(2)
		Say("B¹n ®· xãa thµnh c«ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· xãa bİ kiÕp thµnh c«ng!")
	end
end;


-- Ïû³ı¾öÒª4
function clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("Ng­¬i x¸c ®Şnh muèn hñy bá <color=yellow>"..strAddendar.."<color> chø? Sau khi hñy bá, bİ kiÕp nµy sÏ biÕn mÊt!",
		2,
		"§ång ı/confirm_clear_addendar_4",
		"Ta kh«ng muèn hñy bá--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÏû³ı¾öÒª4
function confirm_clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(3)
		Say("B¹n ®· xãa thµnh c«ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· xãa bİ kiÕp thµnh c«ng!")
	end
end;

