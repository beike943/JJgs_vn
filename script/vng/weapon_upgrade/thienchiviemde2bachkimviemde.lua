Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\lib\\globalfunctions.lua");

szNPCName = "<color=green>Chñ Töu LÇu:<color> "
NV_BACHKIMVIEMDE100_FILE = "\\script\\vng\\weapon_upgrade\\change_thienchiviemde2bachkimviemde.lua";

function get_TCVD2BKVD()
	local nCheck = VNG_GetTaskPos(TSK_TC_BK_VD,2,2)
	local nCash = 2000
	
	if nCheck >= 1 then
		Talk(1, "", szNPCName.."§¹i hiÖp ®· nhËn nhiÖm vô råi.")
		return
	end
	if GetCash() < nCash*10000 then
		Talk(1, "", szNPCName.."§¹i hiÖp kh«ng mang ®ñ "..nCash.." vµng ®Ó nhËn nhiÖm vô")
		return
	end
	if Pay(nCash*10000) == 1 then
		VNG_SetTaskPos(TSK_TC_BK_VD,1,2,2)
		Talk(1, "", szNPCName.."§¹i hiÖp ®· nhËn nhiÖm vô ®æi trang bÞ Thiªn Chi Viªm §Õ thµnh trang bÞ B¹ch Kim Viªm §Õ.")
		gf_WriteLogEx("NHAN NV DOI TCVD 2 BKVD", "thµnh c«ng", 1, "nhËn nhiÖm vô")
	end
end

function finish_TCVD2BKVD()
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
	local tCheck = {3,4,9,8,8,1,1,1}
	local nCheck3 = VNG_GetTaskPos(TSK_TC_BK_VD,3,3)
	local nCheck4 =  VNG_GetTaskPos(TSK_TC_BK_VD,4,4)
	local nCheck5 =  VNG_GetTaskPos(TSK_TC_BK_VD,5,5)
	local nCheck6 =  VNG_GetTaskPos(TSK_TC_BK_VD,6,6)	
	local nBachKim =  VNG_GetTaskPos(TSK_TC_BK_VD,2,2)
	if nBachKim < 1 then
		Talk(1, "", "§¹i hiÖp ch­a nhËn nhiÖm vô")
		return
	end	
	if nBachKim >= 2 then
		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi")
		return
	end		
	if GetItemCount(2,1,30230) < 200 then
		Talk(1, "", szNPCName.."§¹i hiÖp kh«ng mang ®ñ 200 xu vËt phÈm !!!!")
		return
	end
	if nBachKim < 2 then
		if nCheck3 < tCheck[1] or nCheck4 < tCheck[2] or nCheck5< tCheck[3] or nCheck6 < tCheck[4] then
			Talk(1, "", szNPCName.."§¹i hiÖp ch­a hoµn thµnh hÕt c¸c nhiÖm vô !!!! \nThu ho¹ch c©y B¸t Nh· Lín: "..nCheck3.."/3 c©y \nKÝch ho¹t c©y Tø Linh: "..nCheck4.."/4 c©y \nKÝch ho¹t H¹t gièng: "..nCheck5.."/9 c©y \nTham gia Thiªn M«n TrËn: "..nCheck6.."/8 lÇn")
			return
		end
		PutinItemBox("N©ng cÊp trang bÞ" ,3 , "X¸c nhËn muèn thùc hiÖn n©ng cÊp?", NV_BACHKIMVIEMDE100_FILE, 1)			
--		if DelItem(2,1,30230,200) == 1 then
--			VNG_SetValuePos(TSK_TC_BK_VD,2,2,2)
--			gf_WriteLogEx("NHAN NV DOI TCVD 2 BKVD", "thµnh c«ng", 1, "hoµn thµnh nhiÖm vô")
			--xãa trang bÞ vµ add trang bÞ ®æi
--		end
	end
end