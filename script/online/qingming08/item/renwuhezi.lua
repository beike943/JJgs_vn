--½Å±¾Ãû³Æ£º2008ÇåÃ÷½Ú»î¶¯ÈÎÎñ¾íÖáºĞ×Ó
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖáºĞ×Ó£¬Ôö¼ÓÈÎÎñ¾íÖá
--²ß»®ÈË£ºÁõÌì
--´úÂë±àĞ´ÈË£ºÄ«ÏÉ
--´úÂë±àĞ´Ê±¼ä£º2008-03-23
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\qingming08\\head_qingming.lua")

tomb_sweep_2007_start_goodsID = 675      --ÈÎÎñ¾íÖáÒ»µÄ±àºÅ

function OnUse()
	Say("Hoan nghªnh sö dông hép nhiÖm vô! Xin hái ng­¬i muèn tiÕp nhËn mËt ®å nhiÖm vô nµo?",
	6,
	"MËt ®å nhiÖm vô 1/#add_reel_task(1)",
	"MËt ®å nhiÖm vô 2/#add_reel_task(2)",
	"MËt ®å nhiÖm vô 3/#add_reel_task(3)",
	"MËt ®å nhiÖm vô 4/#add_reel_task(4)",
	"Trang kÕ/#next_page(1)",
	"§ãng hép, t¹m thêi ta kh«ng cÇn mËt ®å nhiÖm vô./nothing"
	);
end;

function next_page(flag)
	if flag == 1 then
		Say("Hoan nghªnh sö dông hép nhiÖm vô! Xin hái ng­¬i muèn tiÕp nhËn mËt ®å nhiÖm vô nµo?",
		6,
		"MËt ®å nhiÖm vô 5/#add_reel_task(5)",
		"MËt ®å nhiÖm vô 6/#add_reel_task(6)",
		"MËt ®å nhiÖm vô 7/#add_reel_task(7)",
		"MËt ®å nhiÖm vô 8/#add_reel_task(8)",
		"Trang kÕ/#next_page(2)",
		"§ãng hép, t¹m thêi ta kh«ng cÇn mËt ®å nhiÖm vô./nothing"
		);
	else--flag
		Say("Hoan nghªnh sö dông hép nhiÖm vô! Xin hái ng­¬i muèn tiÕp nhËn mËt ®å nhiÖm vô nµo?",
		3,
		"MËt ®å nhiÖm vô 9/#add_reel_task(9)",
		"MËt ®å nhiÖm vô 10/#add_reel_task(10)",
		"§ãng hép, t¹m thêi ta kh«ng cÇn mËt ®å nhiÖm vô./nothing"
		);
	end;--if
end;

function nothing()
end;

function add_reel_task(flag)
	--Ê±¼äÅĞ¶Ï
	local date_chk = is_qingming_opened()
	if date_chk == 1 then
		
	else
		Talk(1,"","<color=green>Nh¾c nhë<color>: VËt phÈm nµy chØ sö dông trong ho¹t ®éng Thanh Minh <color=yellow>3-4-2008 ®Õn 12-4<color>.")
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then--¸ºÖØ¼ì²â
		return
	end
	if DelItem(2,0,777,1) ~= 1 then
		WriteLog("TiÕt Thanh Minh 08: Hñy hép nhiÖm vô thÊt b¹i!");
		return
	end;--if
	if AddItem(2,0,tomb_sweep_2007_start_goodsID + flag - 1,1) ~= 1 then
		WriteLog("TiÕt Thanh Minh 08: Hép nhiÖm vô t¨ng mËt ®å nhiÖm vô"..flag.."ThÊt b¹i!");
		return
	end;
	
end;