-- ¾«Ó¢°ï»áÕ½ ºì°ü
-- by windle 2009-2-13 14:35

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d%H")) > 09113024 then--Ê¹ÓÃÆÚÏŞÒªĞŞ¸Ä
		return
	end
	if GetTask(TASKID_JYBHZ_USE_HONGBAO) >= 2 then
		Talk(1,"","Mçi ng­êi chØ cã thÓ sö dung Bang Héi Tinh Anh Hång Bao 2 lÇn.!");
		return
	end
	if GetLevel() <= 65 then
		Talk(1,"","§¹i hiÖp ph¶i cã cÊp 65 trë lªn míi cã thÓ sö dông.");
		return
	end
	Say("Sö dông Bang Héi Tinh Anh Hång Bao thu ®­îc 2500000 kinh nghiÖm, ®¹i hiÖp cã ch¾c muèn sö dông??",
		2,
		"§­îc/#onOpen("..nItemIdx..")",
		"Kh«ng cÇn ®©u/nothing");
end

function onOpen(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TASKID_JYBHZ_USE_HONGBAO, GetTask(TASKID_JYBHZ_USE_HONGBAO) + 1);		
		gf_Modify("Exp", 2500000);
		WriteLogEx("Bang hoi tinh anh 2","sö dông Hång Bao","","","",GetTongName())		
	end
end
