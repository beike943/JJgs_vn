Include("\\script\\lib\\task_main.lua");

function main()	
	if CTask:IsTaskFinish("BiÖn Kinh §«ng Th­ sinh 4")==1 then		--ÈÎÎñºó
		Say("Hõ! Ai d¸m ®ông ®Õn ta! Hi, hi kh«ng ph¶i nãi ng­¬i!", 0)
	elseif CTask:IsTaskFinish("BiÖn Kinh §«ng Th­ sinh 2")==1 then	--Íê³ÉÈÎÎñ
		Say("Ta kh«ng thÊy tªn <color=yellow>Hµ Th¹c Cö<color>, ng­êi nh­ h¾n ta trèn cßn kh«ng kŞp. B»ng h÷u ®Õn chç kh¸c t×m thö, xin tha m¹ng!", 0)
	elseif CTask:CheckCanStart("BiÖn Kinh §«ng Th­ sinh 2")==1 then	--½ÓÈÎÎñ
		StartTask002()
	else	--ÈÎÎñÇ°
		Say("Hõ! Ai d¸m ®ông ®Õn ta! Hi, hi kh«ng ph¶i nãi ng­¬i!", 0)
	end
end;


function StartTask002()		--³õ¼û¶ş»ì£¬»°²»Í¶»ú£¬¿ªÊ¼Õ½¶·
local strMain = {
	"Ph¶i ng­¬i lµ tªn c«n ®å NhŞ Hçn hµ hiÕp b¸ t¸nh kh«ng? Khai mau! Ng­¬i ®em ca ca cña Tó C« <color=yellow>Hµ Th¹c Cö<color> giÊu ë ®©u?",
	"Ai vËy! D¸m xen vµo chuyÖn cña ®¹i gia, muèn chÕt µ?",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("BiÖn Kinh §«ng Th­ sinh 2");
	ChangeNpcToFight(GetTargetNpc())	--×ª»»¶Ô»°ÀàĞÍnpcÎªÕ½¶·ÀàĞÍ
end


function OnDeath()
if CTask:IsTaskStart("BiÖn Kinh §«ng Th­ sinh 2")==1 then
		finishTask002()
end;
end


function finishTask002()
local strMain = {
	"§¹i hiÖp xin tha m¹ng!",
	"Nãi mau! Ng­¬i giÊu <color=yellow>Hµ Th¹c Cö<color> ë ®©u?",
	"Hµ Th¹c Cö nµo? §¹i hiÖp cã nhÇm kh«ng tªn ®ã ta trèn h¾n cßn kh«ng kŞp, sao l¹i ®em giÊu?",
	"ThËt sao? Nh­ng muéi muéi h¾n nãi anh ta ®Õn t×m ng­¬i ®Õn giê vÉn ch­a vÒ.",
	"Oan øc qu¸ ®i! Cã thÓ anh ta bŞ l¹c ®­êng ch¨ng? B»ng h÷u ®Õn chç kh¸c t×m thö!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("BiÖn Kinh §«ng Th­ sinh 2")
	CTask:PayAward("BiÖn Kinh §«ng Th­ sinh 2")
	TaskTip("T×m Hµ Th¹c Cö")
end
