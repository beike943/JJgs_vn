Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

szNpcName = "<color=green>B¶o R­¬ng Phßng M¸y Th©n ThiÖn: <color>"

function main()
	local tbSay ={}
	if CheckVbonus() == 1 then
		if tonumber(date("%Y%m%d")) <= 20130705 then
			tinsert(tbSay,"Ghi tªn top 10 ChuyÓn sinh 1/Top_ChuyenSinh_Reg")
		end
		tinsert(tbSay, "Xem danh s¸ch top 10 ChuyÓn sinh 1/Top_ChuyenSinh_Show")
	end
	tinsert(tbSay, "Ta chØ ghÐ xem/gf_DoNothing")
	Say("Trong r­¬ng chøa 10 m¶nh giÊy da ghi tªn 10 vÞ cao thñ chuyÓn sinh ®Çu tiªn. H·y nhanh chãng ghi tªn nhËn th­ëng.", getn(tbSay), tbSay)
end


function Top_ChuyenSinh_Reg()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh < 1 then
		Talk(1,"","§iÒu kiÖn chuyÓn sinh hoÆc ®¼ng cÊp ch­a ®óng, kh«ng thÓ ghi tªn nhËn th­ëng.")
		return 0
	end
	
	LIB_txtData:Init("vbonus_topchuyensinh.txt")
	LIB_txtData:LoadMultiColumn();
	local tbTop5 = LIB_txtData.tbTextData
	for i=1, getn(tbTop5) do
		if strupper(tbTop5[i][1]) == strupper(GetAccount()) then
			Talk(1,"","<color=green>"..GetName()..":<color> Tªn ta ®· cã ®©y råi, thËt lµ vui qu¸.")
			return 0
		end
	end
	
	if getn(tbTop5) >=10 then
		Talk(1,"","<color=green>"..GetName()..":<color> Trong r­¬ng kh«ng cßn m¶nh giÊy da nµo trèng, ta ®· ®Õn trÔ råi.")
		return 0
	end
	
	LIB_txtData:AddLine(GetAccount().."	".. GetName().."	"..date("%d-%m-%Y %H:%M:%S"))
	Talk(1,"","<color=green>"..GetName()..": <color>Ghi tªn thµnh c«ng, mau bá l¹i vµo r­¬ng...")
end


function Top_ChuyenSinh_Show()
	LIB_txtData:Init("vbonus_topchuyensinh.txt")
	LIB_txtData:LoadMultiColumn();
	local tbTop5 = LIB_txtData.tbTextData
	local nCount = min(getn(tbTop5),10)
	local szList = "C¸c cao thñ ®· ghi danh nhËn th­ëng thµnh c«ng:"
	local szList2 = "C¸c cao thñ ®· ghi danh nhËn th­ëng thµnh c«ng (tiÕp theo):"
	for i=1,nCount do
		if i < 6 then
			szList = szList.."\n  "..i.." - "..tbTop5[i][2]
		else
			szList2 = szList2.."\n  "..i.." - "..tbTop5[i][2]
		end
	end
	if nCount < 6 then
		Talk(1,"",szList)
	else
		Talk(2,"",szList, szList2)
	end
end