--ãê¾©ÐÂÊÖÖ÷¶¯ÈÎÎñ
--·®ÍòËÉ 2004.01.26

function main (sel)
  UWorld1505 = GetTask(1505)
  if(GetLevel() > 4 and  UWorld1505 == 0) then
	 		Say("Vâ c«ng ta tuy cao nh­ng vÉn ch­a t×m ®­îc cao ®å, tiÓu huynh ®Ö gióp ta mét chuyÖn ®­îc kh«ng?",2,"§­îc!/yes1505","Ta bËn råi!/no1505")
 	elseif (GetLevel() > 4 and  UWorld1505 == 5) then
 			Talk(1,"","TÇn øc ®ang ë BiÖn Kinh phñ, phiÒn tiÓu huynh ®Ö!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 10) then
 			Talk(1,"","Ta nghe nãi TÇn Khiªm ®ang ë phñ ®«ng BiÖn Kinh, phiÒn tiÓu huynh ®Ö!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 15) then
 			Talk(1,"","§èi tho¹i víi TÇn Khiªm ch­a? Xem ra ®Ö tö ta cã hy väng råi!")
 	elseif (GetLevel() > 4 and  UWorld1505 == 20) then
 			Talk(1,"","TiÓu huynh ®Ö gióp gi¶i khoay sau nµy ta nhÊt ®Þnh b¸o ®¸p!")
 	else
 			Talk(1,"","µi! Vâ c«ng ta tuy cao nh­ng ®Õn giê vÉn ch­a cã mét ®å ®Ö, sao ®©y?")
 	end
end;
 	
 	function yes1505()
 		Talk(1,"","Khã kh¨n l¾m míi t×m ®­îc mét ng­êi t­ chÊt tèt, h¾n tªn TÇn øc nh­ng kh«ng chÞu b¸i ta lµm s­ phô, giê sao ®©y?")
 		Talk(1,"","Ngµi yªn t©m ®Ó t¹i h¹ ®i khuyªn h¾n!")
 		SetTask(1505,5)
 	end
 	
 	function no1505()
 		Talk(1,"","NÕu tiÓu huynh ®Ö bËn th× ta nhê ng­êi kh¸c vËy!")
 	end
 			
  
