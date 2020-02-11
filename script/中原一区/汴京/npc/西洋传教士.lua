Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 

szNpcName = "<color=green>Gi¸o SÜ: <color>"
szBang = {	
	[1] = {"B¹ch Hæ","1:1.78"},
	[2] = {"§¹i ¦ng","1:2"},
	[3] = {"Kú Hæ","1:1.96"},
	[4] = {"M·nh Hæ","1:1.96"},
	[5] = {"Ngò Hæ","1:1.74"},
	[6] = {"Phôc Hæ","1:1.97"},
	[7] = {"ThÇn Long","1:1.66"},
	[8] = {"Thiªn Long","1:1.96"},
	[9] = {"XÝch Long","1:1.97"},
}
	
function main()
	local tSay = {};
	--¸±»î¶¯
	local tActivityID = {102, 104, 106, 108, 113};
	for k, v in tActivityID do
		if 200 == GetWorldPos() then
			tSay = aah_GetSayDialog(tonumber(v));
		end
	end	
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20141103 and nDate <= 20141108 then
		tinsert(tSay,"Ta muèn xem t×nh tr¹ng ®Æt c­îc/show_DuDoan")
		--Event Dù ®o¸n BHTA12
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) == 0 then		
			for i = 1, getn(szBang) do
				tinsert(tSay,"Ta muèn ®¸nh c­îc Bang Héi "..szBang[i][1].."(tèn Thiªn Kiªu LÖnh - Tû lÖ "..szBang[i][2]..")/#DuDoan_02("..i..")")
			end			
		else
			local nBangHoi = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
			tinsert(tSay,"Ta muèn ®¸nh c­îc Bang Héi "..szBang[nBangHoi][1].."(tèn Thiªn Kiªu LÖnh - Tû lÖ "..szBang[nBangHoi][2]..")/#DuDoan_02("..nBangHoi..")")
		end
	end
	
	tinsert(tSay, "Tho¸t/nothing")
	Say("<color=green>Gi¸o SÜ:<color>Th­îng ®Õ chóc phóc cho b¹n!", getn(tSay), tSay);
end

function show_DuDoan()
	local nBang = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
	Talk(1,"",szNpcName.."C¸c h¹ ®· dù ®o¸n ®­îc <color=yellow>"..gf_GetTaskByte(TSK_DUDOAN_BHTA12,3).." Thiªn Kiªu LÖnh<color> cho bang héi <color=yellow>"..szBang[nBang][1].."<color>")
end

function DuDoan_02(nBang)
	if gf_CheckLevel(5,90) ~= 1 then
		Talk(1,"", szNpcName.."C¸c h¹ cÇn ®¹t Ýt nhÊt chuyÓn sinh 5 cÊp 90 ®Ó ®­îc dù ®o¸n!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) >= 50 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· dù ®o¸n ®ñ sè l­îng. Kh«ng thÓ tiÕp tôc tham gia!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= 0 then
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= nBang then
			Talk(1,"",szNpcName.."C¸c h¹ chØ ®­îc dù ®o¸n 1 bang duy nhÊt")
			return
		end
	end	
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Tr¹ng th¸i hiÖn t¹i kh«ng thÓ dù ®o¸n!")
		return
	end	
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."Søc lùc hoÆc hµnh trang kh«ng ®ñ, c¸c h¹ h·y s¾p xÕp l¹i nhÐ.")
		return 
	end

	local tSay = {}
	tinsert(tSay,format("Ta muèn ®Æt c­îc 5 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,5))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 10 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,10))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 15 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,15))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 20 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,20))
	tinsert(tSay,format("Ta muèn ®Æt c­îc 50 Thiªn Kiªu LÖnh/#DuDoan_01(%d,%d)",nBang,50))
	tinsert(tSay, "Tho¸t/nothing")
	Say(szNpcName.."C¸c h¹ muèn ®Æt c­îc thÕ nµo?", getn(tSay), tSay);
end

function DuDoan_01(nBang,nDatCuoc)

	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc > 50 then
		Talk(1,"",szNpcName.."C¸c h¹ chØ ®­îc dù ®o¸n tèi ®a <color=yellow>50<color> Thiªn Kiªu LÖnh!")
		return
	end

	if GetItemCount(2,97,236) < nDatCuoc then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng ®em ®ñ sè l­îng Thiªn Kiªu LÖnh!")
		return
	end
	
	if DelItem(2,97,236,nDatCuoc) == 1 then		
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,2,nBang)
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,3,gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc)
		gf_WriteLogEx("DU DOAN BHTA12", "du doan thanh cong", nDatCuoc, "du doan "..szBang[nBang][1])	
		Talk(1,"",szNpcName.."C¸c h¹ ®· ®Æt c­îc thµnh c«ng <color=yellow>"..nDatCuoc.."<color> cho bang héi <color=yellow>"..szBang[nBang][1].."<color>")
		return
	else
		Talk(1,"",szNpcName.."§Æt c­îc kh«ng thµnh c«ng, xin vui lßng thùc hiÖn l¹i!")
		return
	end
end