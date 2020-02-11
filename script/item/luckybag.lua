-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ĞÒÔËÀñ°üÎÄ¼ş
-- Edited by Starry
-- 2005/11/09 PM 13:43

-- Åµ²»ÇáĞí£¬¹ÊÎÒ²»¸ºÈË£»ÑÔ²»ÇáĞÅ£¬¹ÊÈË²»¸ºÎÒ£¡

-- ======================================================
function OnUse()
	
	Say("Tr­íc khi më quµ, vui lßng x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc cña hµnh trang, tr¸nh r¬i rít vËt phÈm ra ngoµi!",
			2,
			"§ång ı/ConfirmUse",
			"L¸t sau sÏ më/CancelUse");
	
end;

function ConfirmUse()

	local bIsExist = 0;
	bIsExist = DelItem(2,0,349,1,1);
	if bIsExist ~= 1 then
		return
	end

local nBodyType = GetBody()
local i = 0;
local j = 107+random(1,3);
local k = 188+random(1,6);
local n = 22+random(1,6);

		--¿¡ÇÎÄĞÍâ×°	
		if nBodyType == 1 then
			i=random(1,18);
			AddItem(0,j,i,1,1);
		end;

		--¼¡ÈâÄĞÍâ×°	
		if nBodyType == 2 then
			i=random(19,36);
			AddItem(0,j,i,1,1);
		end;

		--ÈâÂéÅ®Íâ×°	
		if nBodyType == 3 then
			i=random(37,54);
			AddItem(0,j,i,1,1);
		end;		

		--¿É°®Å®Íâ×°	
		if nBodyType == 4 then
			i=random(55,72);
			AddItem(0,j,i,1,1);
		end;
		
		--ĞŞÂŞÃØóÅ
		if random(1,10000) <= 10 then
			AddItem(0,107,60,1,1);
		end;
		
		--1Ğ¡¿é½ğÏ¬
		if random(1,100) <= 50 then
			AddItem(2,1,148,1,1);
		end;
		
		--1¸ö30¼¶ÂíÅÆ
		if random(1,100) <= 50 then
			AddItem(0,105,1,1,1,-1,-1,-1,-1,-1,-1);
		end;  
		
		--1¸öÑÌ»¨
		if random(1,100) <= 50 then
			AddItem(2,1,k,1,1);
		end;    
		
		--1¸ö¾Å×ª»¹»êµ¤
		if random(1,100) <= 50 then
			AddItem(1,0,32,1,1);
		end;   
				
		AddItem(0,200,n,1,1);	 --1¸ö»Æ½ğ¹¤¾ß		
		AddItem(2,0,109,1,1);  --1ÅîÀ³ÏÉÂ¶
		AddItem(2,0,225,1,1);  --1½±È¯
		AddItem(2,2,8,1,1);    --1ÔÉÌú
		
end;

--¿Õº¯Êı£¬Ê²Ã´¶¼²»×ö
function CancelUse()

end;	