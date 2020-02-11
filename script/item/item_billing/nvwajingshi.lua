------------------------------------------------------------
-- Å®æ´¾«Ê¯µÄ½Å±¾ nvwajingshi.lua
--
-- comment: È¡ÏÂÃØ¼®ÉÏÈÎÒâÒ»¸ö¾öÒª¡£
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,504
------------------------------------------------------------

ADDENDAR_GENRE = 2
ADDENDAR_DETAIL = 6

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	if IsBookLocked() > 0 then
		Say("MËt tŞch ®ang ë tr¹ng th¸i ®ãng, kh«ng thÓ dïng N÷ Oa tinh th¹ch lÊy bİ kiÕp ra!", 0)
		return
	end
	
	strTab = {"Sau khi sö dông <color=yellow>N÷ Oa tinh th¹ch<color> sÏ trõ 1 quyÓn bİ kiÕp trong mËt tŞch cña trang bŞ hiÖn cã. B¹n muèn bá bİ kiÕp nµo trong mËt tŞch?",
			  "Ta kh«ng lÊy--Hñy bá/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- Ã»ÓĞ¾öÒªÒªÈ¡ÏÂ
	if (nAddendarCount == 0) then
		Say("HiÖn t¹i b¹n kh«ng thÓ nhËn bİ kiÕp!", 0)
	end
	
	-- Ö»ÓĞÒ»¸ö¾öÒª¿ÉÒÔÈ¡ÏÂ
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
	end
	
	-- ÓĞÁ½¸ö¾öÒª¿ÉÒÔÈ¡ÏÂ
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
	end
	
	-- ÓĞÈı¸ö¾öÒª¿ÉÒÔÈ¡ÏÂ
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
				"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end	
	end
	
	-- ÓĞËÄ¸ö¾öÒª¿ÉÒÔÈ¡ÏÂµÄ
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"Ta muèn nhËn bİ kiÕp"..strAddendar[1].."/get_addendar_1",
			"Ta muèn nhËn bİ kiÕp"..strAddendar[2].."/get_addendar_2",
			"Ta muèn nhËn bİ kiÕp"..strAddendar[3].."/get_addendar_3",
			"Ta muèn nhËn bİ kiÕp"..strAddendar[4].."/get_addendar_4",
			strTab[2])
	end
	
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- È¡ÏÂ¾öÒª1
function get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("B¹n x¸c nhËn muèn lÊy <color=yellow>"..strAddendar.."<color> chø? Xin x¸c nhËn cßn ®ñ søc lùc vµ kho¶ng trèng trong hµnh trang kÎo ®¸nh r¬i bİ kiÕp!",
		2,
		"LÊy bİ kiÕp!/confirm_get_addendar_1",
		"Ta kh«ng lÊy--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÈ¡ÏÂ¾öÒª1
function confirm_get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(0)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp!")
	end
end;


-- È¡ÏÂ¾öÒª2
function get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("B¹n x¸c nhËn muèn lÊy <color=yellow>"..strAddendar.."<color> chø? Xin x¸c nhËn cßn ®ñ søc lùc vµ kho¶ng trèng trong hµnh trang kÎo ®¸nh r¬i bİ kiÕp!",
		2,
		"LÊy bİ kiÕp!/confirm_get_addendar_2",
		"Ta kh«ng lÊy--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÈ¡ÏÂ¾öÒª2
function confirm_get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(1)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp!")
	end
end;


-- È¡ÏÂ¾öÒª3
function get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("B¹n x¸c nhËn muèn lÊy <color=yellow>"..strAddendar.."<color> chø? Xin x¸c nhËn cßn ®ñ søc lùc vµ kho¶ng trèng trong hµnh trang kÎo ®¸nh r¬i bİ kiÕp!",
		2,
		"LÊy bİ kiÕp!/confirm_get_addendar_3",
		"Ta kh«ng lÊy--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÈ¡ÏÂ¾öÒª3
function confirm_get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(2)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp!")
	end
end;


-- È¡ÏÂ¾öÒª4
function get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("B¹n x¸c nhËn muèn lÊy <color=yellow>"..strAddendar.."<color> chø? Xin x¸c nhËn cßn ®ñ søc lùc vµ kho¶ng trèng trong hµnh trang kÎo ®¸nh r¬i bİ kiÕp!",
		2,
		"LÊy bİ kiÕp!/confirm_get_addendar_4",
		"Ta kh«ng lÊy--Hñy bá/cancel_dialog")
end;
-- È·ÈÏÈ¡ÏÂ¾öÒª4
function confirm_get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(3)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B¹n ®· hoµn thµnh thao t¸c lÊy bİ kiÕp!")
	end
end;

