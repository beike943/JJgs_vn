--by liubo
--Ä¾Ïä½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

function OnUse(nItem)
--	Talk(1, "", "TÝnh n¨ng t¹m ®ãng ®Ó b¶o tr×. B¹n vui lßng quay l¹i sau !!")
--	do return end

	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Thêi ®iÓm hiÖn t¹i ch­a cho phÐp ®æi r­¬ng, c¸c h¹ h·y sö dông sau nhÐ.")
			do	return	end
		end
	end
	
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[4])
        return 0
    end	
	local nNum = GetItemCount(2,1,30340)
	if nNum < 25 then
		Talk(1,"",tSTRING_TREASUER_BOX[1])
		return 0
	end
	local nNum1 = GetItemCount(2,1,30230)
	if nNum1 < 20 then
		Talk(1,"","Sè l­îng Xu vËt phÈm trong hµnh trang thiÕu hiÖp kh«ng ®ñ <color=green>20<color>")
		return 0
	end
	Say(tSTRING_TREASUER_BOX[6],2,"X¸c ®Þnh n©ng cÊp (tèn 25 Méc R­¬ng + 20 Xu vËt phÈm)/to_upgrade","Kh«ng cÇn ®©u/do_nothing")
end

function to_upgrade()
--	if Pay(500000) ==  0 then
--		Talk(1,"",tSTRING_TREASUER_BOX[2])
--		return 0
--	end
	if DelItem(2,1,30340,25) == 0 or DelItem(2,1,30230,20) == 0 then
		return 0
	end
	gf_AddItemEx2({2,1,30341,1},"Tµng R­¬ng (N©ng cÊp Méc R­¬ng)","Than Tai Bao Ruong","N©ng cÊp Méc R­¬ng",0,1)
	
--=========== Nhiem vu lam giau ============
	if CFG_NhiemVuLamGiau == 1 then
		if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 11) == 0 then
			gf_SetTaskBit(TSK_LAMGIAU, 11, 1, 0)
			TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: GhÐp 1 tµng r­¬ng.")
		end
	end
end

function do_nothing()
end