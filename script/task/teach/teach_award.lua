
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���������������ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================
Include("\\script\\task\\world\\task_award.lua")

Teach_Award_List = {

	Award_01 = {
		strAwardType = "��n g�p D?T�u",
		funAwardGive = function()
			Earn(100);
			ModifyExp(20);
			ModifyReputation(20,0);
		end,
	},
	
	Award_02 = {
		strAwardType = "Ch?Ti�m v?kh",
		funAwardGive = function()
			AddItem(0,0,1,1,1,2,77);
			GivePlayerExp(SKeyXinShou,"wuqidian")
			Msg2Player("��õ�1������");
		end,
	},
	
	Award_03 = {
		strAwardType = "Ch?ti�m trang ph�c",
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
		strAwardType = "Ch?Kim ho�n",
		funAwardGive = function()
		    local i = GetBody();
		    if i==1 or i==2 then
			    AddItem(0,102,101,1,1,2,95,2,98);
			else
			    AddItem(0,102,102,1,1,2,95,2,98);
			end;
			GivePlayerExp(SKeyXinShou,"shipindian")
			Msg2Player("�����һ��װ��!");
		end,
	},
	
	Award_05 = {
		strAwardType = "Ch?D��c �i�m",
		funAwardGive = function()
			AddItem(1,0,2,20,1);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"yaodian")
			Msg2Player("�������20����ҩ");
		end,
	},
	
	Award_06 = {
		strAwardType = "Ch?T�p h�a",
		funAwardGive = function()
			AddItem(2,5,1,2,1);
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"zahuodian")
			Msg2Player("������2��������");
		end,
	},

	Award_07 = {
		strAwardType = "V?binh th�nh m�n",
		funAwardGive = function()
			Earn(50);
			GivePlayerExp(SKeyXinShou,"chengmenweibin")
			ModifyReputation(4,0);
		end,
	},
	
	Award_08 = {
		strAwardType = "V?s",
		funAwardGive = function()
			ModifyReputation(4,0);
			GivePlayerExp(SKeyXinShou,"wushi")
		end,
	},

	Award_09 = {
		strAwardType = "Ch?t�u l�u",
		funAwardGive = function()
			GivePlayerExp(SKeyXinShou,"jiulou")
			Earn(100);
			ModifyReputation(4,0);
		end,
	},
	
	Award_10 = {
		strAwardType = "Ti�u s",
		funAwardGive = function()
			GivePlayerExp(SKeyXinShou,"biaoshi")
			ModifyReputation(4,0);
			Earn(100);
		end,
	},
	
	Award_11 = {
		strAwardType = "trao ��i nhi�m v?v�i ng��i kh�c",
		funAwardGive = function()
			Earn(100);
			ModifyReputation(4,0)
			GivePlayerExp(SKeyXinShou,"yeshou2")
		end,
	},
	
	Award_12 = {
		strAwardType = "Nhi�m v?k�t giao h�o h�u",
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
			
			if (nMemCount == 0) then -- �����ҵ���һ��δ��ӣ��򷵻�
				return
			elseif (nMemCount == 1) then --�����ҵ�������������
				Earn(100);
				GivePlayerExp(SKeyXinShou,"zudui_yeshou")
			else
				
				for i=1,nMemCount do
					PlayerIndex = GetTeamMember(i)
					local i=random(getn(nGoods));
					
					AddItem(nGoods[i][1],nGoods[i][2],nGoods[i][3],1,1);
					ModifyExp(100);			
					Msg2Player("�����һ��װ��!");
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
				
				PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
				Earn(100);
				GivePlayerExp(SKeyXinShou,"zudui_yeshou")
			end;
			
		end,
	},
	
	Award_13 = {
		strAwardType = "Hi�u v?c�c m�n ph�i",
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
		strAwardType = "B�ch Hi�u Sinh nh�n x�t v?m�n ph�i",
		funAwardGive = function()
			Earn(100);
			ModifyReputation(2,0);
		end,
	},

	Award_15 = {
		strAwardType = "Chuy�n giang h",
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

-- ����ҷ����������뽱���ı������Ϊ�գ���ֱ�Ӷ�ȡĬ�ϵ� Teach_Award_List
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