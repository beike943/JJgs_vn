
szNPCName = "<color=green>Chñ Th­¬ng Héi: <color>"
szLogTitle = "NHIEM VU LAM GIAU"
function NhiemVuLamGiau_Nhan()
	if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 then
		Talk(1,"",szNPCName .. "Ng­¬i ®· nhËn nhiÖm vô h«m nay råi, mai míi ®­îc nhËn tiÕp.")
		return 0
	end
	if GetItemCount(2,1,30230) < 99 then
		Talk(1,"",szNPCName .. "Muèn lµm giµu ph¶i cã vèn liÕng. Ng­¬i kh«ng cã 99 vËt phÈm xu, ta nghÜ thö th¸ch nµy kh«ng phï hîp víi ng­¬i.")
		return 0
	end
	
	if DelItem(2,1,30230,99) == 1 then
		Talk(1,"",szNPCName .. "Chóc mõng ng­¬i ®· nhËn ®­îc nhiÖm vô. Ngµy thµnh triÖu phó ch¾n ch¾n kh«ng xa...")
		TaskTip("TiÕp nhËn nhiÖm vô lµm giµu.")
		gf_SetTaskBit(TSK_LAMGIAU, 12, 1, 0)
		gf_WriteLogEx(szLogTitle, "nhËn", 1, "NhËn nhiÖm vô")
	end
end


function NhiemVuLamGiau_Xem()
	local tbStatus = {
		[1] = "Sö dông 05 n÷ oa b¶o h¹p",
		[2] = "Hoµn thµnh 01 lÇn Th¸i H­ HuyÔn C¶nh",
		[3] = "Hoµn thµnh 01 lÇn Tµng KiÕm S¬n Trang",
		[4] = "Hoµn thµnh 03 nhiÖm vô L­¬ng S¬n B¹c",
		[5] = "Hoµn thµnh 01 lÇn nhiÖm vô Thñy Lîi",
		[6] = "Trång thµnh c«ng 01 H¹t Gièng",
		[7] = "Trång thµnh c«ng 01 B¸t Nh· Nhá",
		[8] = "Trång thµnh c«ng 01 B¸t Nh· Lín",
		[9] = "Trång thµnh c«ng 01 C©y Tø Linh",
		[10] = "NhËn th­ëng thµnh c«ng 01 lÇn Nh¹n M«n Rùc Löa",
		[11] = "GhÐp thµnh c«ng 01 Tµng R­¬ng",
	}
	if gf_GetTaskBit(TSK_LAMGIAU, 12) == 0 then
		Talk(1,"",szNPCName .. "Ng­¬i ch­a nhËn nhiÖm vô h«m nay, ta lÊy g× ®Ó cho ng­¬i xem ®©y?")
		return 0
	end
	local tbResult = {szNPCName.."TiÕn ®é hoµn thµnh nhiÖm vô h«m nay:\n"}
	for i=1, 11 do
		local nIndex = floor(i/6) + 1
		if tbResult[nIndex] == nil then
			tbResult[nIndex] = "- "..tbStatus[i]..":"
		else
			tbResult[nIndex] = tbResult[nIndex].."- "..tbStatus[i]..":"
		end
		if gf_GetTaskBit(TSK_LAMGIAU, i) == 0 then
			tbResult[nIndex] = tbResult[nIndex].." <color=red>Ch­a hoµn thµnh<color>\n"
		else
			tbResult[nIndex] = tbResult[nIndex].." <color=yellow>§· hoµn thµnh<color>\n"
		end
	end
	Talk(2,"", tbResult[1], tbResult[2])
end


function NhiemVuLamGiau_Thuong()
	if gf_GetTaskBit(TSK_LAMGIAU, 13) == 1 then
		Talk(1,"",szNPCName .. "Ng­¬i ®· nhËn phÇn th­ëng h«m nay, giê l¹i muèn nhËn thªm sao?")
		return 0
	end
	
	if GetTask(TSK_LAMGIAU) ~= 4095 then
		Talk(1,"",szNPCName .. "Ng­¬i ch­a hoµn thµnh c¸c nhiÖm vô, ta ch­a thÓ cho ng­¬i nhËn tµi léc...")
		return 0
	end
	
	Earn(5550000)
	gf_WriteLogEx(szLogTitle, "th­ëng", 1, "Hoµn thµnh nhiÖm vô")
	TaskTip("Hoµn thµnh nhiÖm vô, nhËn th­ëng 555 vµng.")
	gf_SetTaskBit(TSK_LAMGIAU, 13, 1, 0)
end