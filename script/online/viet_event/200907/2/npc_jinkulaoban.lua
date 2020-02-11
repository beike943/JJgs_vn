--=======================================================
--create by baiyun 2009.5.31
--describe:Ô½ÄÏ°æ7ÔÂ·İ»î¶¯Ö®¶şÒ¹²İ£¬½ğ¿âÀÏ°å½Å±¾
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("Chñ Ng©n Khè: Ta chuyªn phô tr¸ch viÖc ®æi TiÓu Nh­ ı thµnh §ång TiÒn Vµng. Trong kho¶ng thêi gian tõ ngµy <color=red>19-06-2009 ®Õn 24:00 19-07-2009<color>, ®ång ®¹o dïng TiÓu Nh­ ı ®æi lÊy §ång TiÒn Vµng víi gi¸ trŞ quy ®æi nh­ sau: 1 TiÓu Nh­ ı = 1 §ång TiÒn Vµng. L­u ı: sau thêi gian nµy, TiÓu Nh­ ı sÏ kh«ng thÓ sö dông ®­îc n÷a.",
				2,
				"Ta muèn ®æi TiÓu Nh­ ı thµnh §ång TiÒn Vµng./GetTongQian",
				"T¹i h¹ chØ ghĞ ngang!/end_dialog");
	else
		Say("Ho¹t ®éng nµy ®· kÕt thóc!",0)
	end
end

--°ÑĞ¡ÈçÒâ»»³ÉÍ­Ç®
function GetTongQian()
	local nCount = GetItemCount(2, 1, 30030);
	if nCount == 0 then
		Talk(1, "", "Trªn hµnh trang kh«ng cã TiÓu Nh­ ı");
		return
	end
	AskClientForNumber("ConfirmGetTongQian",1,nCount,"NhËp sè l­îng cÇn ®æi")
end

function ConfirmGetTongQian(nCount)
	if nCount == 0 then
		return
	end
	if GetItemCount(2, 1, 30030) < nCount then
		Talk(1, "", "Sè l­îng tiÓu nh­ ı kh«ng ®ñ ®Ó ®æi"..nCount.." ®ång tiÒn vµng!");
		return
	end
	if gf_Judge_Room_Weight(2, 10, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30030, nCount) == 1 then
		gf_SetLogCaption("Hoat dong da thao tro lai");
		gf_AddItemEx({2, 1, 30094, nCount}, "§ång TiÒn Vµng");
		WriteLogEx("Hoat dong thang 6","D¹ Th¶o Trë l¹i	",1,"§ång TiÒn Vµng");
		gf_SetLogCaption("");
	end
end

--½áÊø¶Ô»°
function end_dialog()
end