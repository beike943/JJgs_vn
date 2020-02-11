-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÉ±ÊÖÁîÅÆÎÄ¼ş(Ïà¹ØNpc:ÏåÑô×¿ÌìĞĞ)                  
-- Edited by starry night                                 
-- 2005/09/15 PM 9:27                                    
                                                          
-- ======================================================

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\task\\killer\\cangbaotu_head.lua");

function main()

	Say("Khi cßn trÎ l·o phu còng tõng lµ mét ®¹i hiÖp, nh­ng b©y giê giµ råi s¸nh kh«ng b»ng víi tuæi trÎ b©y giê. Ng­¬i ®Õn t×m ta cã viÖc g× kh«ng?",
			2,
			"LÖnh bµi nµy v·n bèi xem kh«ng hiÓu, tiÒn bèi lµ ng­êi hiÓu s©u biÕt réng mong gi¶i thİch cho./Task_Check",
			"Kh«ng cã g×/Task_Exit");
			
end;
			

function Task_Check()

	if GetItemCount(2,1,195) >= 1 then --ÅĞ¶ÏÉ±ÊÖÁîÊıÁ¿
		Say("§©y lµ lÖnh bµi s¸t thñ nhÊt phÈm ®­êng T©y H¹, bªn trong cã chøa nhiÒu ®iÒu thÇn bİ trong chèc l¸t kh«ng thÓ gi¶i thİch hÕt ®­îc.",
				2,
				"§­a cho Tr¸c Thiªn Hµnh 5000 l­îng/Task_Confirm",
				"Th«i §­îc! §a t¹ tiÒn bèi/Task_Exit");
	else
		Say("LÖnh bµi cña ng­¬i ®©u?!",0);
	end;
		
end;


function Task_Confirm()

local n = 0;
local nLevel = GetLevel();

local str1 = { "<color=green>Tr¸c Thiªn Hµnh<color>:…",
						   "LÖnh bµi nµy xem ra ch¼ng cã g× ®Æc biÖt.",
						   "Ta cã mét İt th¸nh d­îc ®i l¹i trong giang hå rÊt cÇn thiÕt, tÆng ng­¬i xem nh­ kh«ng uèng c«ng cña ng­¬i vËy.",
						   "§a t¹ tiÒn bèi"}
					
local str2 = { "<color=green>Tr¸c Thiªn Hµnh<color>:…",
						 	 "Bªn d­íi lÖnh bµi cã Èn chøa mét b¶n vÏ, bªn trªn míi chØ lµ nh÷ng kı hiÖu",
               "Kı hiÖu?",
               "<color=yellow>Tµng B¶o §å<color> do ng­¬i mang ®Õn ®­¬ng nhiªnlµ ph¶i tr¶ l¹i cho ng­¬i råi. Nãi thËt ta giµ råi còng kh«ng cßn ®ñ søc ®Ó ®i qu·ng ®­êng dµi nh­ vËy.",
						   "§a t¹ tiÒn bèi chØ gi¸o!"}
						 
local str3 = { "<color=green>Tr¸c Thiªn Hµnh<color>:…",
							 "ë ®©y cßn cã <color=yellow>Ph¸o hoa truyÒn tin<color>……",
							 "Ph¸o hoa truyÒn tin?",
							 "§©y lµ vËt phÈm mµ NhÊt PhÈm §­êng S¸t Thñ hay sö dông, chØ cÇn ra ngoµi thµnh ®èt lªn th× sÏ cã S¸t thñ ®Çu môc ®Õn tiÕp øng. Ng­¬i nh©n c¬ héi nµy trõ h¹i cho ®¹i Tèng.",
							 "§a t¹ tiÒn bèi chØ gi¸o!"}

	if Pay(5000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
			if nDelItem == 1 then
			
				n = random(1,100);

				if n <= 35 then --35£¥µÃµ½ÓñÁéÉ¢10¸ö
					TalkEx("",str1);
					--AwardMedicine();
					AddItem(1,0,14,10,1);
				elseif n > 35 and n <= 50 then --15%µÃµ½Îå»¨ÓñÂ¶Íè5¸ö				
					AddItem(1,0,15,5,1);
				elseif n > 50 and n <= 65 then --15%µÃµ½ÉúÉúÔì»¯É¢5¸ö				
					AddItem(1,0,16,5,1);	
				elseif n > 65 and n <= 95 then --30£¥µÃµ½Ò»ÕÅ²Ø±¦Í¼
					TalkEx("",str2);
					local nRow = random(3,tonumber(tabPos:getRow()));
					local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
					AddItem(2,14,nParticular,1,1);		
				else --5£¥»ñÈ¡Ò»¸ö¶¥¼¶É±ÊÖ´«ĞÅÑÌ»ğ					
					AddItem(2,1,203,1,1);
					TalkEx("",str3);
				end;	 
			end;
	else
		
		Say("TiÒn cña ng­¬i ®©u?",0);
	
	end;
	
end;