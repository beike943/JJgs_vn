-- Created by TuanNa5

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\shimenguanka\\trigger.lua")
Include("\\settings\\static_script\\meridian\\meridian_zhenqi_transmission.lua")
Include("\\script\\online_activites\\201305\\refine_dan.lua")

tbMasterSkill = {
		[23] = 1032,
		[29] = 1196,
		[30] = 1230,
	}
	
function OnUse()
	local nDate = tonumber(date("%Y%m%d"))
	local tSay = {}
	tinsert(tSay,"LuyÖn B¾c §Èu Tô khİ thuËt - TruyÒn Ch©n Khİ/OnTalkZhenqiTransmission")
	tinsert(tSay,"LuyÖn 10 HuyÒn Hoµng B¶o §¬n/get_clear_pk_item")
	tinsert(tSay,"LuyÖn B¾c §Èu TruyÒn C«ng ThuËt/transfer_neili")
	tinsert(tSay,"LuyÖn B¾c §Èu D­ìng Sinh ThuËt/pratice_neili")
	tinsert(tSay,"TÈy hÕt néi, ngo¹i th­¬ng/clear_pain")
	if tbMasterSkill[GetPlayerRoute()]  then
		tinsert(tSay, "Ta muèn tu luyÖn kü n¨ng trÊn ph¸i ®Õn cÊp 10 (tiªu hao 79 xu vËt phÈm)/HoTro_LuyenTranPhai_Train")
	end
	tinsert(tSay,"§ãng/gf_DoNothing")

--	if nDate >= 20130517 and nDate <= 20130614 then
--		tinsert(tSay, 1, "LuyÖn ThÇn T¸n §¬n/Vet_201305_Refine_Dan")				  
--	end	
	Say("Th¸i B¹ch Kim Tinh khi x­a ®· dïng vËt nµy ®Ó luyÖn tiªn ®¬n, ng­¬i muèn luyÖn tiªn d­îc g×?",getn(tSay),tSay)
end

function transfer_neili()
	local nDate = tonumber(date("%Y%m%d"))
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ thùc hiÖn truyÒn c«ng thuËt.")
		return 0
	end
	local strSay = "<color=green>B¾c §Èu TruyÒn C«ng ThuËt<color> lµ vâ c«ng tu©n theo sù biÕn hãa cña ©m d­¬ng, dïng néi lùc cña ng­êi kh¸c hßa cïng linh khİ cña thiªn ®Şa t¹o thµnh nguån n¨ng l­îng cho c¬ thÓ.<color=red>Chó ı: chØ cã ®éi tr­ëng míi cã thÓ kİch ho¹t truyÒn c«ng vµ nhËn kinh nghiÖm tõ c¸c thµnh viªn.<color>"
	local tSay = {
--						"Kİch ho¹t Di Hoa TiÕp Ngäc/#activate_transfer_neili(3)",	
						"Kİch ho¹t B¾c §Èu TruyÒn C«ng ThuËt/#activate_transfer_neili(1)",	
						"Kİch ho¹t B¾c §Èu TruyÒn C«ng ThuËt §Æc BiÖt/#activate_transfer_neili(2)",	
						"Ng­ng luyÖn c«ng/StopTransfer",
						"Ta sÏ luyÖn sau/gf_DoNothing",
					  }
	if nDate < 20130429 then
		tinsert(tSay, 1, "Kİch ho¹t Di Hoa TiÕp Ngäc/#activate_transfer_neili(3)")				  
	end
	if GetTrigger(2509) ~= 0 then
		tremove(tSay,1)
		tremove(tSay,2)
		tremove(tSay,3)
	else
		tremove(tSay,4)
	end
	Say(strSay,getn(tSay),tSay)
end

function pratice_neili()
	local strSay = "<color=green>B¾c §Èu D­ìng Sinh ThuËt<color> lµ vâ c«ng tu©n theo sù biÕn hãa cña ©m d­¬ng, dïng néi lùc b¶n th©n kÕt hîp víi linh khİ cña thiªn ®Şa t¹o thµnh nguån n¨ng l­îng cho c¬ thÓ. Sau khi kİch ho¹t, cø mçi 15 gi©y ng­êi luyÖn mÊt <color=yellow>4 phót ñy th¸c c¸c lo¹i<color>, nhËn ®­îc <color=yellow>40000, 50000, 70000, 80000 ®iÓm kinh nghiÖm <color><color=red>tïy lo¹i h×nh kİch ho¹t<color>. Mçi ngµy chØ cã thÓ luyÖn tèi ®a <color=yellow> 8 tÇng<color>. Mçi tÇng chØ cã thÓ luyÖn trong vßng <color=yellow> 30 phót<color> (cã thÓ kh«ng liªn tôc).<color=red>Chó ı: c¸c tÇng B¾c §Çu D­ìng Sinh ThuËt chØ cã thÓ kİch ho¹t khi ®ñ sè thµnh viªn yªu cÇu. C¸c thµnh viªn ph¶i ®øng gÇn ®éi tr­ëng míi cã thÓ kİch ho¹t.<color>"
	local tSay = 	{
							"Kİch ho¹t B¾c §Èu D­ìng Sinh ThuËt/#pratice_neili_choose(1)",
							"Kİch ho¹t B¾c §Èu D­ìng Sinh ThuËt §Æc BiÖt/#pratice_neili_choose(2)",
							"Ng­ng luyÖn c«ng/StopTransfer",
							"Ta sÏ luyÖn sau/gf_DoNothing"	
						}
	if GetTrigger(2509) ~= 0 then
		tremove(tSay,1)	
		tremove(tSay,2)	
	else
		tremove(tSay,3)
	end
	Say(strSay,getn(tSay),tSay)
end

function pratice_neili_choose(nSkillType)
	Say("Chän tÇng muèn luyÖn:",5,"TÇng 1 D­ìng Sinh ThuËt/#active_pratice(1, "..nSkillType..")","TÇng 2 D­ìng Sinh ThuËt/#active_pratice(2, "..nSkillType..")","TÇng 3 D­ìng Sinh ThuËt/#active_pratice(3, "..nSkillType..")","TÇng 4 D­ìng Sinh ThuËt/#active_pratice(4, "..nSkillType..")","Ta sÏ luyÖn sau/gf_DoNothing")
end

function active_pratice(nType, nSkillType)
	Say("Chän lo¹i h×nh muèn luyÖn:",5,
		format("Sö dông B¹ch C©u Hoµn + §¹i B¹ch C©u Hoµn/#confirm_active_pratice(%d,%d,1)",nType, nSkillType),
		format("Sö dông B¹ch C©u Hoµn + B¹ch C©u Tiªn §¬n/#confirm_active_pratice(%d,%d,2)",nType, nSkillType),
		format("Sö dông §¹i B¹ch C©u Hoµn + B¹ch C©u Tiªn §¬n/#confirm_active_pratice(%d,%d,3)",nType, nSkillType),
		format("Sö dông B¹ch C©u Hoµn + §¹i B¹ch C©u Hoµn + B¹ch C©u Tiªn §¬n/#confirm_active_pratice(%d,%d,4)",nType, nSkillType),
		"Ta sÏ luyÖn sau/gf_DoNothing")
end


function get_clear_pk_item()
	if GetCash() < 10000 then
		Talk(1,"","B¹n kh«ng cã ®ñ 1 vµng.")
		return
	end
	if Pay(10000) == 1 then
		gf_AddItemEx2({2,0,142,10},"HuyÒn Hoµng B¶o ®¬n","Nguyet Luong Tho","nhËn",0,1)
	end
end

function clear_pain()
	if GetCash() < 50000 then
		Talk(1,"","B¹n kh«ng cã ®ñ 5 vµng trong ng­êi.")
		return
	end
	
	if Pay(50000) == 1 then
		CureWound(1)
		CureWound(2)
		Msg2Player("TÊt c¶ néi, ngo¹i th­¬ng ®· ®­îc ch÷a lµnh.")
	end
end


function HoTro_LuyenTranPhai_Check()
	local nRoute = GetPlayerRoute()
	if tbMasterSkill[nRoute] == nil then
		return 0
	end
	if GetSkillLevel(tbMasterSkill[nRoute]) < 5 then
		return -1
	end
	if GetSkillLevel(tbMasterSkill[nRoute]) >= 10 then
		return -2
	end
	return 1
end


function HoTro_LuyenTranPhai_Train()
	local nCheck = HoTro_LuyenTranPhai_Check()
	if nCheck == 0 then
		Talk(1,"","HÖ ph¸i c¸c h¹ kh«ng nhËn ®­îc hç trî nµy.")
		return 0
	end
	if nCheck == -1 then
		Talk(1,"","§¼ng cÊp kü n¨ng trÊn ph¸i hiÖn t¹i ch­a thÓ nhËn ®­îc hç trî nµy.")
		return 0
	end
	if nCheck == -2 then
		Talk(1,"","§¼ng cÊp kü n¨ng trÊn ph¸i hiÖn t¹i kh«ng cÇn hç trî thªm n÷a.")
		return 0
	end
	if nCheck ==1 then
		if GetItemCount(2,1,30230) < 79 then
			Talk(1,"","C¸c h¹ kh«ng ®ñ 79 xu vËt phÈm, h·y chuÈn bŞ thªm.")
			return 0
		end
		if DelItem(2,1,30230,79) == 1 then
			local nSkillID = tbMasterSkill[GetPlayerRoute()]
			local nSkillLevel = GetSkillLevel(nSkillID)
			for i=1, (10 - nSkillLevel) do
				LevelUpSkill(nSkillID)
			end
			gf_WriteLog("HO TRO LUYEN TRAN PHAI", "thµnh c«ng", 1, "HÖ ph¸i "..GetPlayerRoute())
			Talk(1,"","Vâ c«ng trÊn ph¸i ®· t¨ng ®Õn cÊp 10, c¸c h¹ cã thÓ tù tin hµnh tÈu giang hå.")
		end
	end
end
