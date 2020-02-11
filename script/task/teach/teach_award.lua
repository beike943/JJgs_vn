
-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ½ÌÓýÈÎÎñ½±Àø·¢·ÅÎÄ¼þ
-- Edited by peres
-- 2005/05/07 PM 19:55

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëý¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖÐ£¬Õ¾ÔÚËýµÄ±³ºóÓµ±§×¡Ëý¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËýµÄÑÛ¾¦¡£
-- Ò»ÇÐÎÞ¿ÉÍì»Ø¡­¡­

-- ======================================================
Include("\\script\\task\\world\\task_award.lua")

Teach_Award_List = {

	Award_01 = {
		strAwardType = "§Õn gÆp D· TÈu",
		funAwardGive = function()
			Earn(100);
			ModifyExp(20);
			ModifyReputation(20,0);
		end,
	},
	
	Award_02 = {
		strAwardType = "Chñ TiÖm vò khÝ",
		funAwardGive = function()
			AddItem(0,0,1,1,1,2,77);
			GivePlayerExp(SKeyXinShou,"wuqidian")
			Msg2Player("B¹n nhËn ®­îc 1 mãn vò khÝ!");
		end,
	},
	
	Award_03 = {
		strAwardType = "Chñ tiÖm trang phôc",
		funAwardGive = function()
			local i=GetBody();
			if i==1 then 
				AddItem(0,100,1,1,1,2,94);
			elseif i==2 then
				AddItem(0,100,19,1,1,2,94);
			elseif i==3 then
				AddItem(0,100,37,1,1,2,94);
			else
				AddItem(0,100,55,1,1,2,94);
			end
			Earn(100);
			GivePlayerExp(SKeyXinShou,"fuzhuangdian")
			ModifyReputation(4,0);
		end,
	},
	
	Award_04 = {
		strAwardType = "Chñ Kim hoµn",
		funAwardGive = function()
		    local i = GetBody();
		    if i==1 or i==2 then
			    AddItem(0,102,101,1,1,2,95,2,98);
			else
			    AddItem(0,102,102,1,1,2,95,2,98);
			end;
			GivePlayerExp(SKeyXinShou,"shipindian")
			Msg2Player("B¹n nhËn ®­îc 1 mãn trang søc!");
		end,
	},
	
	Award_05 = {
		strAwardType = "Chñ D­îc ®iÕm",
		funAwardGive = function()
			AddItem(1,0,2,20,1);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"yaodian")
			Msg2Player("B¹n nhËn ®­îc 20 b×nh Kim S¸ng t¸n!");
		end,
	},
	
	Award_06 = {
		strAwardType = "Chñ T¹p hãa",
		funAwardGive = function()
			AddItem(2,5,1,2,1);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"zahuodian")
			Msg2Player("B¹n nhËn ®­îc 2 tÊm Gi¸m ®Þnh phï!");
		end,
	},

	Award_07 = {
		strAwardType = "VÖ binh thµnh m«n",
		funAwardGive = function()
			Earn(50);
			GivePlayerExp(SKeyXinShou,"chengmenweibin")
			ModifyReputation(4,0);
		end,
	},
	
	Award_08 = {
		strAwardType = "Vâ s­",
		funAwardGive = function()
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"wushi")
		end,
	},

	Award_09 = {
		strAwardType = "Chñ töu lÇu",
		funAwardGive = function()
			GivePlayerExp(SKeyXinShou,"jiulou")
			Earn(100);
			ModifyReputation(4,0);
		end,
	},
	
	Award_10 = {
		strAwardType = "Tiªu s­",
		funAwardGive = function()
			GivePlayerExp(SKeyXinShou,"biaoshi")
			ModifyReputation(4,0);
			Earn(100);
		end,
	},
	
	Award_11 = {
		strAwardType = "trao ®æi nhiÖm vô víi ng­êi kh¸c",
		funAwardGive = function()
			Earn(100);
			ModifyReputation(4,0)
			GivePlayerExp(SKeyXinShou,"yeshou2")
		end,
	},
	
	Award_12 = {
		strAwardType = "NhiÖm vô kÕt giao h¶o h÷u",
		funAwardGive = function()
			local nPreservedPlayerIndex = PlayerIndex
			local nMemCount = GetTeamSize()
			local z=GetBody();
			
			local nGoods = {
				{0,2,15},
				{0,5,28},
				{0,1,41},
				{0,0,2}
			}
			
			if (nMemCount == 0) then -- Èç¹ûÍæ¼Òµ½ÕâÒ»²½Î´×é¶Ó£¬Ôò·µ»Ø
				return
			elseif (nMemCount == 1) then --Èç¹ûÍæ¼Òµ¥ÈË×é¶ÓÍê³ÉÈÎÎñ
				Earn(100);
				GivePlayerExp(SKeyXinShou,"zudui_yeshou")
			else
				
				for i=1,nMemCount do
					PlayerIndex = GetTeamMember(i)
					local i=random(getn(nGoods));
					
					AddItem(nGoods[i][1],nGoods[i][2],nGoods[i][3],1,1);
					ModifyExp(100);			
					Msg2Player("B¹n nhËn ®­îc 1 mãn trang bÞ!");
				end;
			
			if z==1 then 
				AddItem(0,100,2,1,1,4,45);
			elseif z==2 then
				AddItem(0,100,20,1,1,4,45);
			elseif z==3 then
				AddItem(0,100,38,1,1,4,45);
			else
				AddItem(0,100,56,1,1,4,45);
			end
				
				PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
				Earn(100);
				GivePlayerExp(SKeyXinShou,"zudui_yeshou")
			end;
			
		end,
	},
	
	Award_13 = {
		strAwardType = "HiÓu vÒ c¸c m«n ph¸i",
		funAwardGive = function()
		    
		    local i=GetBody();
			if i==1 then 
				AddItem(0,103,2,1,1,2,11);
			elseif i==2 then
				AddItem(0,103,20,1,1,2,11);
			elseif i==3 then
				AddItem(0,103,38,1,1,2,11);
			else
				AddItem(0,103,56,1,1,2,11);
			end
		
			Earn(100);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"menpaiwenti")
	end,
	},

	Award_14 = {
		strAwardType = "B¸ch HiÓu Sinh nhËn xÐt vÒ m«n ph¸i",
		funAwardGive = function()
			Earn(100);
			ModifyReputation(2,0);
		end,
	},

	Award_15 = {
		strAwardType = "ChuyÖn giang hå",
		funAwardGive = function()
		    
		    local i=GetBody();
			if i==1 then 
				AddItem(0,101,2,1,1,2,12);
			elseif i==2 then
				AddItem(0,101,20,1,1,2,12);
			elseif i==3 then
				AddItem(0,101,38,1,1,2,12);
			else
				AddItem(0,101,56,1,1,2,12);
			end
		
			Earn(100);
			GivePlayerExp(SKeyXinShou,"yeshou4")
			ModifyReputation(4,0);
		end,
	},
};

-- ¸øÍæ¼Ò·¢½±Àø£¬´«Èë½±ÀøµÄ±í£¬Èç¹û±íÎª¿Õ£¬ÔòÖ±½Ó¶ÁÈ¡Ä¬ÈÏµÄ Teach_Award_List
function GivePlayerAward_Teach(strAward, aryAward)

	if aryAward==nil or type(aryAward) ~= "table" then
		aryAward = Teach_Award_List;
	end;

	local i,j
		for i,j in aryAward do
			if j.strAwardType==strAward then
				j:funAwardGive();
				return 1;
			end;
		end;

	return 0;
	
end;