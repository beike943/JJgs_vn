
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ³ÇÃÅÎÀ±ø½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");

Include("\\script\\global\\maphelp.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	
	if (nState==8) then
		task_008_00();
		return
	else

		UWorld1503=GetTask(1503)
		UTask_world1504=GetTask(1504)
		
		if(UWorld1503 == 5 or UWorld1503 ==10) then
			if(UWorld1503 == 5) then
				Talk(1,"","T¹i h¹ phông lÖnh Thõa t­íng TriÖu Phæ ®Õn thóc gióc chuyÖn chiªu th­!")
				Talk(1,"","Ta võa míi d¸n xong! PhiÒn b»ng h÷u vÒ håi bÈm víi thõa t­íng!")
				SetTask(1503,10)
			end
				if(UWorld1503 == 10) then
				Talk(1,"","Sao ng­¬i ch­a th«ng b¸o cho phñ thõa t­íng?")
			end
		
		--ãê¾©¸® ³ÇÃÅÎÀ±ø
		--ãê¾©¸®ĞÂÊÖÈÎÎñ£º´ò»÷ÎŞÀµ
		-- By: ·®ÍòËÉ(2005.01.26)
		--Include("\\script\\global\\itemhead.lua")
		
		elseif (UTask_world1504 == 0 and GetLevel() > 7) then 		--ÈÎÎñÆô¶¯
						Say("GÇn ®©y bän C«n ®å ®ang hoµnh hµnh ngoµi thµnh, quÊy nhiÔu d©n chóng! H·y ®i trõng trŞ chóng!",2,"Ta ®i ngay!/W1504_get_yes","Sau nµy h·y tİnh/W1504_get_no")
		elseif (UTask_world1504 == 5  and  GetItemCount(2,1,11) >= 10 ) then		-- ÈÎÎñÍê³É
						DelItem(2,1,11,10)
						SetTask(1504,10)
						Talk(1,"","Qu¶ nhiªn th©n thñ bÊt phµm! §©y chót lÔ vËt xin nhËn lÊy!")
						--AddNote("½«10Ë«Ğå»¨Ğ¬½»¸ø³ÇÃÅÊØÎÀ£¬ÈÎÎñÍê³É¡£")
						TaskTip("Giao 10 ®«i Tó Hoa hµi cho VÖ binh thµnh m«n, hoµn thµnh nhiÖm vô!")
						--AddItem(2,1,1,1)
						Earn(400)
						ModifyExp(450)
						ModifyReputation(3,0)
		elseif (UTask_world1504 == 5  and  GetItemCount(2,1,11) < 10 ) then
						Talk(1,"","H·y trõng trŞ bän C«n ®å ngoµi thµnh vµ mang 10 ®«i Tó Hoa hµi vÒ lµm b»ng chøng!")
		else
						Say("Ta ®øng ®©y ®· h¬n 10 n¨m, tõng gÆp nhiÒu cao thñ hµo kiÖt. Muèn biÕt khu vùc luyÖn c«ng, h·y ®Õn t×m ta! Ng­¬i cã høng thó kh«ng?",2,"Xin cho biÕt khu vùc luyÖn c«ng thİch hîp./yes","Ta kh«ng muèn nghe./no")
		end

end;

end;

function yes()
	maphp()
end;

function no()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","Kinh thµnh ®ang l©m nguy, mäi ng­êi h·y gãp søc t×m ®­êng cøu v·n!")
	elseif i == 2 then  
		Talk(1,"","Mau ®i qua! §õng ®øng c¶n cæng thµnh!")
	else
		Talk(1,"","CÈn thËn! Ngoµi quan ¶i ®ang cã chiÕn sù! §õng bá sãt bän gian tÕ Liªu Quèc!")
	end
end;


function W1504_get_yes()
	SetTask(1504,5)
	Talk(1,"","H·y trõng trŞ bän C«n ®å, lÊy vÒ 10 ®«i Tó Hoa hµi cña c¸c d©n n÷ bŞ bän C«n ®å c­íp bãc!")
	Talk(1,"","§­îc! T¹i h¹ lËp tøc lªn ®­êng!")
	--AddNote("½Óµ½ÈÎÎñ£ºÊÕ¼¯10Ë«¡°Ğå»¨Ğ¬¡±£¬ÒÔ×ö³ÍÖÎÎŞÀµµÄÆ¾Ö¤¡£")
	TaskTip("NhËn nhiÖm vô: Thu thËp 10 ®«i Tó Hoa hµi, trõng trŞ bän C«n ®å!")
end;
