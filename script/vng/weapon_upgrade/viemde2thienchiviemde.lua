Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\lib\\globalfunctions.lua");

--TSK_TC_BK_VD = 2707		--0987654321: 1-nhËn nv vd2tcvd; 2-nhËn nv tcvd2bkvd
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
szNPCName = "<color=green>Chñ Töu LÇu:<color> "
NV_THIENCHIVIEMDE100_FILE = "\\script\\vng\\weapon_upgrade\\change_viemde2thienchiviemde.lua";

function get_VD2TCVD()
	
	local nCheck = VNG_GetTaskPos(TSK_TC_BK_VD,1,1)
	local nCash = 1000
	if nCheck >= 1 then
		Talk(1, "", szNPCName.."§¹i hiÖp ®· nhËn nhiÖm vô råi.")
		return
	end
	if GetCash() < nCash*10000 then
		Talk(1, "", szNPCName.."§¹i hiÖp kh«ng mang ®ñ "..nCash.." vµng ®Ó nhËn nhiÖm vô")
		return
	end
	if Pay(nCash*10000) == 1 then
		VNG_SetTaskPos(TSK_TC_BK_VD,1,1,1)
		Talk(1, "", szNPCName.."§¹i hiÖp ®· nhËn nhiÖm vô ®æi trang bÞ Viªm §Õ thµnh trang bÞ Thiªn Chi Viªm §Õ.")
		gf_WriteLogEx("NHAN NV DOI VD 2 TCVD", "thµnh c«ng", 1, "nhËn nhiÖm vô")
	end
end

function finish_VD2TCVD()
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
	local tCheck = {3,4,9,8,8,1,1,1}
	local nCheck7 = VNG_GetTaskPos(TSK_TC_BK_VD,7,7)
	local nCheck8 =  VNG_GetTaskPos(TSK_TC_BK_VD,8,8)
	local nCheck9 =  VNG_GetTaskPos(TSK_TC_BK_VD,9,9)
	local nCheck0 =  VNG_GetTaskPos(TSK_TC_BK_VD,10,10)
	local nThienChi =  VNG_GetTaskPos(TSK_TC_BK_VD,1,1)
	if nThienChi < 1 then
		Talk(1, "", "§¹i hiÖp ch­a nhËn nhiÖm vô")
		return
	end
	if nThienChi >= 2 then
		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi")
		return
	end	
	if GetItemCount(2,1,30230) < 100 then
		Talk(1, "", szNPCName.."§¹i hiÖp kh«ng mang ®ñ 100 xu vËt phÈm !!!!")
		return
	end
	if nThienChi < 2 then
		if nCheck7 < tCheck[5] or nCheck8 < tCheck[6] or nCheck9 < tCheck[7] or nCheck0 < tCheck[8] then
			Talk(1, "", szNPCName.."§¹i hiÖp ch­a hoµn thµnh hÕt c¸c nhiÖm vô !!!! \nThu ho¹ch c©y B¸t Nh· Lín: "..nCheck8.."/1 c©y \nKÝch ho¹t c©y Tø Linh: "..nCheck9.."/1 c©y \nKÝch ho¹t H¹t gièng: "..nCheck0.."/1 c©y \nTham gia Thiªn M«n TrËn: "..nCheck7.."/8 lÇn")
			return
		end
		PutinItemBox("N©ng cÊp trang bÞ" ,3 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NV_THIENCHIVIEMDE100_FILE, 1)	
--		if DelItem(2,1,30230,100) == 1 then
--			VNG_SetValuePos(TSK_TC_BK_VD,2,1,1)
--			gf_WriteLogEx("NHAN NV DOI VD 2 TCVD", "thµnh c«ng", 1, "hoµn thµnh nhiÖm vô")
--			--xãa trang bÞ vµ add trang bÞ ®æi
--		end
	end
end

function set_value_nv_nangcap(nPos)
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
	local tCheck = {nil, nil, 3,4,9,8,8,1,1,1}
	local nCheck = VNG_GetTaskPos(TSK_TC_BK_VD,nPos,nPos)
	local nThienChi =  VNG_GetTaskPos(TSK_TC_BK_VD,1,1)
	local nBachKim =  VNG_GetTaskPos(TSK_TC_BK_VD,2,2)
	if nPos == 7 or nPos == 8 or nPos == 9 or nPos == 10 then
		if nThienChi == 1 then
			if nCheck < tCheck[nPos] then
				VNG_SetTaskPos(TSK_TC_BK_VD,nCheck+1,nPos,nPos)
			end
		end
	end
	if nPos == 3 or nPos == 4 or nPos ==5 or nPos == 6 then
		if nBachKim == 1 then
			if nCheck < tCheck[nPos] then
				VNG_SetTaskPos(TSK_TC_BK_VD,nCheck+1,nPos,nPos)
			end
		end
	end	
end