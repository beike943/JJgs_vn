--2008Äê´º½Ú»î¶¯-Âé½«ÊÕ¼¯»î¶¯-ÎïÆ·Ê¹ÓÃº¯Êı
--´úÂë¿ª·¢ÈË£º³ÂÄ«ÏÉ
--´úÂë¿ª·¢Ê±¼ä£º2008-04-10
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("Script\\Online\\\laborday08\\mah_jong_head.lua")
MJ_MAX_DIEJIA = 999
function OnUse()
	local tTemp = {
		"Ta muèn cÊt tÊt c¶ qu©n bµi vµo hµnh trang/save_all",
		"KiÓm tra qu©n §ång cßn "..get_total(0).."Tr­¬ng/#get_mah_jong_1(0)",
		"KiÓm tra qu©n §iÒu cßn "..get_total(1).."Tr­¬ng/#get_mah_jong_1(1)",
		"KiÓm tra qu©n V¹n cßn "..get_total(2).."Tr­¬ng/#get_mah_jong_1(2)",
		"KiÓm tra qu©n T¹p cßn "..get_total(3).."Tr­¬ng/#get_mah_jong_1(3)",
		"Sau nµy h·y lÊy/nothing"
	}
	Say("B¹n cã thÓ xem sè qu©n bµi cÊt vµo hoÆc lÊy ra, c¸c qu©n bµi hÖ thèng cho sÏ mÆc ®Şnh ®­îc bá vµo trong r­¬ng nµy.",getn(tTemp),tTemp)
end

function get_total(index)
	local nTotal = 0
		if index >= 0 and index <= 2 then
		local nFor = 1
		for nFor = 1, 9, 1 do
			nTotal = nTotal + GetTask(TASK_MJ_TONG1 + index * 9 + nFor - 1)
		end
	elseif index == 3 then--ÔÓ
		local nFor = 1
		for nFor = 1, 7, 1 do
			nTotal = nTotal + GetTask(TASK_MJ_DONG + nFor - 1)
		end
	end
	return nTotal
end

function get_mah_jong_1(index)
	local tTemp = {}
	local tMJTemp = {"§ång","§iÒu","V¹n ","T¹p"}
	if get_total(index) <= 0 then
		Talk(1,"OnUse","Trong r­¬ng M¹t ch­îc cña b¹n kh«ng cã "..tMJTemp[index + 1])
		return
	end
	if index == 0 or index == 1 or index == 2 then--Í³¼ÆÓĞ¶àÉÙÍ²ÌõÍò
		local szTemp = {"§ång","§iÒu","V¹n "}
		local nFuncTemp = {0,1,2,3,4,5}
		--×÷Îª²ÎÊı´«µİ¸øget_mah_jong_2µÄ»°£¬1,3,5±íÊ¾È¡³ö1~9Í²ÌõÍò£»2£¬4£¬6±íÊ¾È¡³öÈ«²¿Í²ÌõÍò
		local nFor = 1
		tinsert(tTemp,"Ta muèn lÊy "..szTemp[index + 1].."1 ®Õn 9/#get_mah_jong_2("..nFuncTemp[index * 2 + 1]..")")
		for nFor = 1, 9, 1 do--²åÈëÈ¡³öÒ»Í²£¨Ìõ£¬Íò£©¶şÍ²£¨Ìõ£¬Íò£©¡­¡­µÄÈ«²¿Ñ¡Ïî
			local nTaskTemp = TASK_MJ_TONG1 + index * 9 + nFor - 1
			tinsert(tTemp,tMahJong[nFor + index * 9][1]..", cßn "..GetTask(nTaskTemp).."Tr­¬ng/#get_mah_jong_2("..nTaskTemp..")")
		end
		tinsert(tTemp,"Ta muèn lÊy hÕt"..szTemp[index + 1].."/#get_mah_jong_2("..nFuncTemp[index * 2 + 2]..")")
		tinsert(tTemp,"Kh«ng lÊy/OnUse")
	elseif index == 3 then--ÔÓ
		tTemp = {
			"Ta muèn lÊy §«ng Nam T©y B¾c mçi lo¹i 3 con/#get_mah_jong_2(6)",
			"§«ng, cßn "..GetTask(TASK_MJ_DONG).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_DONG..")",
			"T©y, cßn "..GetTask(TASK_MJ_XI).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_XI..")",
			"Nam, cßn "..GetTask(TASK_MJ_NAN).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_NAN..")",
			"B¾c, cßn "..GetTask(TASK_MJ_BEI).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_BEI..")",
			"Trung, cßn "..GetTask(TASK_MJ_ZHONG).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_ZHONG..")",
			"Ph¸t, cßn "..GetTask(TASK_MJ_FA).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_FA..")",
			"B¹ch, cßn "..GetTask(TASK_MJ_BAI).."Tr­¬ng/#get_mah_jong_2("..TASK_MJ_BAI..")",
			"Ta muèn lÊy toµn bé T¹p/#get_mah_jong_2(7)",
			"Kh«ng lÊy/OnUse"
		}
	end
	Say("",getn(tTemp),tTemp)
end

function get_mah_jong_2(index)
	if index > 10 then--ÓÃÊäÈë¿òÄÃ³ö¾ßÌåÄÄÒ»ÖÖµÄÂé½«
		if GetTask(index) > 0 then
			SetTaskTemp(TASK_TEMP_MJ_KIND,index)
			AskClientForNumber("comfirm_MJ",1,tonumber(GetTask(index)),"H·y nhËp vµo M¹t ch­îc b¹n muèn lÊy")
			return
		else
			local nTemp = floor((index - TASK_MJ_TONG1) / 9)
			Say("Xin lçi! Trong r­¬ng M¹t ch­îc cña b¹n kh«ng cã lo¹i M¹t ch­îc nµy!",1,"Ta biÕt råi./#get_mah_jong_1("..nTemp..")")
			return
		end
	else--ÌØÊâÈ¡³ö·½·¨
		if index == 0 or index == 2 or index == 4 then--È¡³öÍ²ÌõÍò1~9
			local nFor = 1
			if Zgc_pub_goods_add_chk(9,9) ~= 1 then
				return
			end--ifÎïÆ·¼ì²â
			for nFor = 1, 9, 1 do--±éÀú£¬È¡³ö1~9Í²
				--Âé½«Í²ÌõÍòµÄÈÎÎñ±äÁ¿ÊÇÁ¬ĞøµÄ£¬Ã¿¸ô¾Å¸öÎªÒ»¸öÏµÁĞ£¨1Í²~9Í²£¬
				--1Ìõ~9Ìõ£¬¡­¡­£©index / 2µÄÖµ´ú±íÁËµÚ¼¸¸öÏµÁĞ£¨Í²ÎªµÚÒ»¸öÏµÁĞ£¬
				--ÌõÎªµÚ¶ş¸öÏµÁĞ£¬¡­¡­£©£¬nForµÄÖµ´ú±íÁËÒ»Í²¶şÍ²µÄ1»ò2
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) <= 0 then
					--ÅĞ¶ÏÃ¿ÖÖÍ²ÓĞÃ»ÓĞÒ»¸ö
					local tMJTemp = {
						[0] = "§ång",
						[2] = "§iÒu",
						[4] = "V¹n "
					} 
					Say("Trong r­¬ng M¹t ch­îc cña b¹n kh«ng cã "..nFor..tMJTemp[index],1,"Ta biÕt råi./#get_mah_jong_1("..floor(index / 2)..")")
					--·µ»ØÉÏÒ»¸öÌáÊ¾
					return
				end--Ôö¼ÓÒ»ÕÅÂé½«
			end--forÔö¼ÓÂé½«
			for nFor = 1, 9, 1 do--±éÀú£¬È¡³ö1~9Í²
				--Âé½«Í²ÌõÍòµÄÈÎÎñ±äÁ¿ÊÇÁ¬ĞøµÄ£¬Ã¿¸ô¾Å¸öÎªÒ»¸öÏµÁĞ£¨1Í²~9Í²£¬
				--1Ìõ~9Ìõ£¬¡­¡­£©index / 2µÄÖµ´ú±íÁËµÚ¼¸¸öÏµÁĞ£¨Í²ÎªµÚÒ»¸öÏµÁĞ£¬
				--ÌõÎªµÚ¶ş¸öÏµÁĞ£¬¡­¡­£©£¬nForµÄÖµ´ú±íÁËÒ»Í²¶şÍ²µÄ1»ò2
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) >= 1 then
					--È¡³öÒ»¸öÍ²
					SetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1,GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) - 1)
					AddItem(tMahJong[nFor + floor(index / 2) * 9][2],tMahJong[nFor + floor(index / 2) * 9][3],tMahJong[nFor + floor(index / 2) * 9][4],1)

				end--Ôö¼ÓÒ»ÕÅÂé½«
			end--forÔö¼ÓÂé½«
		elseif index == 1 or index == 3 or index == 5 then--È¡³öÈ«²¿Í²£¨ÌõÍò£©
			local nFor = 1
			local nTotal = 0--ÓĞ¶àÉÙÕÅÂé½«
			local nGezi = 0--ÅĞ¶ÏĞèÒª¶àÉÙ¸ñ×Ó
			if get_total(floor(index / 2)) <= 0 then
				local tMJTemp = {
					[1] = "§ång",
					[3] = "§iÒu",
					[5] = "V¹n "
				}
				Talk(1,"OnUse","Trong r­¬ng M¹t ch­îc cña b¹n kh«ng cã g× c¶"..tMJTemp[index])
				return--·µ»Ø
			end
			for nFor = 1, 9, 1 do
				nTotal = nTotal + GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1)
				nGezi = ceil(GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) / MJ_MAX_DIEJIA) + nGezi
			end
			if Zgc_pub_goods_add_chk(nGezi,nTotal) ~= 1 then
				return
			end--ifÎïÆ·¼ì²â
			for nFor = 1, 9, 1 do
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) >= 1 then
					local nTempMJ = GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1)
					SetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1,0)
					AddItem(tMahJong[nFor + floor(index / 2) * 9][2],tMahJong[nFor + floor(index / 2) * 9][3],tMahJong[nFor + floor(index / 2) * 9][4],nTempMJ)
				end--Ôö¼ÓËùÓĞÒ»ÖÖÂé½«
			end--forÔö¼ÓÂé½«
		elseif index == 6 then--È¡³ö¶«ÄÏÎ÷±±¸÷ÈıÕÅ
			local nFor = 1
			if Zgc_pub_goods_add_chk(ceil(3/MJ_MAX_DIEJIA),3) ~= 1 then
				return
			end
			for nFor = 1, 4, 1 do
				if GetTask(TASK_MJ_DONG + nFor - 1) < 3 then
					local tszTemp = {"§«ng ","Nam ","T©y ","B¾c "}
					Say(" -"..tszTemp[nFor].." kh«ng ®ñ 3 con!",1,"Ta biÕt råi/#get_mah_jong_1(3)")
					return
				end
			end
			for nFor = 1, 4, 1 do
				if GetTask(TASK_MJ_DONG + nFor - 1) >= 3 then
					SetTask(TASK_MJ_DONG + nFor - 1,GetTask(TASK_MJ_DONG + nFor - 1) - 3)
					AddItem(tMahJong[27 + nFor][2],tMahJong[27 + nFor][3],tMahJong[27 + nFor][4],3)
				end
			end
		elseif index == 7 then--È¡³öÈ«²¿ÔÓ
			local nFor = 1
			local nTotal = 0--ÓĞ¶àÉÙÕÅÂé½«
			local nGezi = 0--ÅĞ¶ÏĞèÒª¶àÉÙ¸ñ×Ó
			if get_total(3) == 0 then
				Talk(1,"OnUse","Trong r­¬ng M¹t ch­îc cña b¹n kh«ng cã con T¹p!")
				return--·µ»Ø
			end
			for nFor = 1, 9, 1 do
				nTotal = nTotal + GetTask(TASK_MJ_DONG + nFor - 1)
				nGezi = ceil(GetTask(TASK_MJ_DONG + nFor - 1) / MJ_MAX_DIEJIA) + nGezi
			end
			if Zgc_pub_goods_add_chk(nGezi,nTotal) ~= 1 then
				return
			end--ifÎïÆ·¼ì²â
			for nFor = 1, 7, 1 do
				local nTempMJ = GetTask(TASK_MJ_DONG + nFor - 1)
				SetTask(TASK_MJ_DONG + nFor - 1, 0)
				AddItem(tMahJong[27 + nFor][2],tMahJong[27 + nFor][3],tMahJong[27 + nFor][4],nTempMJ)
			end
		end--if index
	end
	local nLast = 0
	if index == 1 or index == 3 or index == 5 or index == 7 then
		local tMJTemp = {
			[1] = "§ång",
			[3] = "§iÒu",
			[5] = "V¹n ",
			[7] = "T¹p"
		} 
		Say(" ®· lÊy toµn bé "..tMJTemp[index].."!",1,"Ta biÕt råi./OnUse")--Èç¹ûÊÇÈ¡³öÈ«²¿Í²ÌõÍò
		return
	elseif index < 10 then
		nLast = floor(index / 2)
	else
		nLast = floor((index - TASK_MJ_TONG11) / 9)
	end
	get_mah_jong_1(nLast)--·µ»ØÉÏÒ»¸öÌáÊ¾
end

function comfirm_MJ(nCount)
	if GetTask(GetTaskTemp(TASK_TEMP_MJ_KIND)) < nCount then
		Msg2Player("M¹t ch­îc trong r­¬ng kh«ng ®ñ sè l­îng b¹n nhËp vµo!")
	else
		if Zgc_pub_goods_add_chk(nCount / MJ_MAX_DIEJIA,nCount) ~= 1 then
			--²»¹»¸ºÖØ£¬·µ»Ø
			return
		end
		SetTask(GetTaskTemp(TASK_TEMP_MJ_KIND),GetTask(GetTaskTemp(TASK_TEMP_MJ_KIND)) - nCount)
		AddItem(tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][2],tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][3],tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][4],nCount)
	end
	get_mah_jong_1(floor((GetTaskTemp(TASK_TEMP_MJ_KIND) - 860)/9))
end

function nothing()--½áÊø¶Ô»°ÓÃº¯Êı
	
end

function save_all()--´æ·ÅÉíÉÏËùÓĞÂé½«
	local nFor = 1
	for nFor = TASK_MJ_TONG1,TASK_MJ_BAI,1 do
		local nMJnum = GetItemCount(tMahJong[nFor - 860][2],tMahJong[nFor - 860][3],tMahJong[nFor - 860][4])
		if nMJnum > 0 then
			if DelItem(tMahJong[nFor - 860][2],tMahJong[nFor - 860][3],tMahJong[nFor - 860][4],nMJnum) == 1 then
				SetTask(nFor,GetTask(nFor) + nMJnum)
			end
		end
	end
	Talk(1,"OnUse","B¹n ®· cÊt hÕt M¹t ch­îc vµo hµnh trang!")
end