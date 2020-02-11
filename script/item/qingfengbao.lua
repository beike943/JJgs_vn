-- ¾«Ó¢°ï»áÕ½ ºì°ü
-- by windle 2009-2-13 14:35

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	if GetTask(TASKID_JYBHZ_USE_HONGBAO) >= 1 then
		Talk(1,"","Mçi ng­êi chØ cã thÓ sö dung Thanh Phong Bao 1 lÇn.!");
		return
	end
	if GetLevel() < 73 then
		Talk(1,"","§¹i hiÖp ph¶i cÊp 73 trë lªn míi cã thÓ sö dông.");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","§¹i hiÖp ph¶i gia nhËp hÖ ph¸i míi cã thÓ sö dông.");
		return
	end
	Say("Sö dôngThanh Phong Bao thu ®­îc 48000000 kinh nghiÖm, ®¹i hiÖp cã ch¾c muèn sö dông??",
		2,
		"§­îc/#onOpen("..nItemIdx..")",
		"Kh«ng cÇn ®©u/nothing");
end

function onOpen(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TASKID_JYBHZ_USE_HONGBAO, GetTask(TASKID_JYBHZ_USE_HONGBAO) + 1);		
		gf_Modify("Exp", 48000000);
		WriteLogEx("Bang hoi tinh anh 5","sö dông Thanh Phong Bao","","","",GetTongName())		
	end
end
