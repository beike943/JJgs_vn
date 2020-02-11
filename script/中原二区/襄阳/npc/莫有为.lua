Include("\\script\\task\\world\\task_award.lua")
function main()
	UWorld1511 = GetTask(1511)
	if ( UWorld1511 == 0 and  GetLevel() > 22 )  then
		Say("Cha ta l©m bÖnh, ®¹i phu cÇn <color=red>15 ®u«i hæ<color> ®Ó lµm thuèc, nh­ng biÕt t×m ë ®©u b©y giê! B»ng h÷u cã thÓ gióp ta kh«ng?",2,"§ång ı/yes1511","Kh«ng gióp/no1511")
	elseif ( UWorld1511  == 5 and  GetItemCount(2,1,19) > 14)  then	
		Talk(1,"","Vâ c«ng B»ng h÷u thËt lµ cao c­êng, míi ®ã ®· t×m ®­îc 15 ®u«i hæ! Xin nhËn chót quµ män!")
		SetTask(1511,10)
		DelItem(2,1,19,15)
		--AddItem(2,1,1,1)
		Earn(700)
		GivePlayerExp(SkeyShiJieChongFu,"moyouwei")
		ModifyReputation(8,0)
		-- AddNote(°ïÄªÓĞÎªÊÕ¼¯»¢Î²µÄÈÎÎñÍê³É)
		TaskTip("Hoµn thµnh nhiÖm vô gióp M¹c H÷u Vi t×m ®u«i hæ.")
	elseif ( UWorld1511  == 10  and  GetItemCount(2,1,19)<= 14  )  then
		Talk(1,"","§u«i hæ cã thÓ t×m ë ThiÕu L©m Tù, ng­¬i nhí cÈn thËn!")
	else
		Talk(1,"","§¹i phu cÇn 15 ®u«i hæ ®Ó lµm thuèc cho cha, lµm sao ta cã thÓ t×m ®­îc ®©y?")
	end
end;

function yes1511()
		Talk(1,"","PhiÒn b»ng h÷u ®Õn ThiÕu L©m Tù t×m <color=red>15 ®u«i hæ<color> may ra míi cã thÓ cøu ®­îc cha ta!")
		SetTask(1511,5)
		--AddNote("½ÓÊÜ°ïÄªÓĞÎªÊÕ¼¯15¸ù»¢Î²µÄÈÎÎñ")
		TaskTip("NhËn nhiÖm vô gióp M¹c H÷u Vi thu thËp ®u«i hæ.")
end;

function no1511()
		Talk(1,"","Cha ta ®­îc cøu råi!")
end;
