-- file:rescue.lua
-- by:Xsjcs
-- CreateDate: 2005-4-22
--  GetWorldTempTask(0)  ��¼ʱ��hour
--  GetWorldTempTask(1)  ��¼������ȡ����  (���������)
--  GetTask(250)    ��¼��ǰ����1Сʱ���Ƿ�������ȼ�Ʒ
--  ������֣��ղ��ÿ1Сʱ������������У�ÿ��һ����100���ȼ�Ʒ��ÿ��20�����µ�����ÿ��ֻ����ȡһ����ÿ���󳼴���ȡû�����ơ�


function newplayer_help()
	if (GetLevel() >= 20) then 
		Say("�ղ�󳼣����ٵ���������ˣ��Ƿ���ʥ�Ͼ�ּ������20�����ϵ���ң�Ҳ�˴���Э�����Ĵ�����Ϊ��",0)
	else 
		Say("�ղ�󳼣����ٷ�ʥ�Ͼ�ּ���������20�����µ����ˡ�������˲飬��ȷϵһ�����ˣ�����ȡ�ȼõ��ʸ�",3,"����Ӣ��������ͷ��;ȼ�Ʒ���Ұ�/present","�������ʾ�����ȡ�ȼ�/abouthelpgoods","�Ҳ���Ҫ��ȡ�ȼ�/no")
	end;
end;

function abouthelpgoods()
	Say("�ղ�󳼣��ҵ�ͬ�����ˣ���ʥ�Ͼ�ּ���ֱ�פ�����꾩���ɶ���Ȫ��������У�ר�ŷ�����Ʒ�ȼ�20�����µ����ˡ�ÿ��1Сʱ����һ�Σ�ÿ�η���100�ݾȼ�Ʒ���絽��ã�������������ջ�",0)
end;



function present()

	local nNowTime = GetWorldTempTask(0)	--������ȫ�ֱ���
	local nQuantity = GetWorldTempTask(1) 	--������ȫ�ֱ���
	local Utask250 = GetTask(250)	
	local nHour = tonumber( date( "%m%d%H" ) )	--��ǰʱ���¼

	if ( nNowTime ~= nHour ) then
		SetWorldTempTask(0,nHour)	--����ʱ���¼
		SetWorldTempTask(1,0)		--����ȡ��������
		AddLocalNews("* * *�ʶ��Ƶ��������ղ����������й㲼Ǯ�������ȼ���20���µ����˶�����ȥ��ȡ���������ޣ��ȵ��ȵá�* * *")
	end
	nNowTime = GetWorldTempTask(0)
	nQuantity = GetWorldTempTask(1)
	if ( Utask250 ~= nNowTime and nQuantity < 100 ) then
		onTake()
		SetWorldTempTask(1,nQuantity+1)
		SetTask(250,nNowTime)
--		Msg2Player("AddItem 1,total = " ..nQuantity + 1)
	elseif ( Utask250 == nNowTime ) then
		Say("�ղ�󳼣��������Ŀ಻�㣬���Ѿ���ȡ��һ�ݾȼã�������Щ��������˰ɡ�",0)
	else
		Say("�ղ�󳼣�����ɮ�����٣��ȼõ�Ǯ��գ�۾ͱ�һ�����գ�����Ҳ�ǰ�Ī��������������һ��Сʱ����������������",0)
	end		

end

function onTake()

  	i = random(1,54)
	if ( i == 1 ) then
		Earn(10)
		Msg2Player("����ղ��������ȡ��10��ͭǮ�ľȼã�")
	elseif ( i == 2 ) then
		Earn(50)
		Msg2Player("����ղ��������ȡ��50��ͭǮ�ľȼã�")
	elseif ( i == 3 ) then
		Earn(100)
		Msg2Player("����ղ��������ȡ��1�����ӵľȼã�")
	elseif ( i == 4 ) then
		Earn(200)
		Msg2Player("����ղ��������ȡ��2�����ӵľȼã�")
	elseif ( i == 5 ) then
		AddItem(1,2,1,2)
		Msg2Player("����ղ��������ȡ�����ݲغ컨��")
	elseif ( i == 6 ) then
		AddItem(1,2,2,2)
		Msg2Player("����ղ��������ȡ�����ݽ۹���")
	elseif ( i == 7 ) then
		AddItem(1,2,3,2)
		Msg2Player("����ղ��������ȡ�����ݻ�����")
	elseif ( i == 8 ) then
		AddItem(1,2,8,2)
		Msg2Player("����ղ��������ȡ�����ݰͶ���")
	elseif ( i == 9 ) then
		AddItem(1,2,9,2)
		Msg2Player("����ղ��������ȡ�����ݲ��ɣ�")
	elseif ( i == 10 ) then
		AddItem(2,2,1,2)
		Msg2Player("����ղ��������ȡ�����ݾ�����")
	elseif ( i == 11 ) then
		AddItem(2,2,2,2)
		Msg2Player("����ղ��������ȡ�����ݰ����֣�")
	elseif ( i == 12 ) then
		AddItem(1,2,1,2)
		Msg2Player("����ղ��������ȡ�����ݲغ컨��")
	elseif ( i == 13 ) then
		AddItem(2,2,9,2)
		Msg2Player("����ղ��������ȡ��������ľ��")
	elseif ( i == 14 ) then
		AddItem(2,2,10,2)
		Msg2Player("����ղ��������ȡ����������ľ��")
	elseif ( i == 15 ) then
		AddItem(2,2,15,2)
		Msg2Player("����ղ��������ȡ��������Ƥ��")
	elseif ( i == 16 ) then
		AddItem(2,2,16,2)
		Msg2Player("����ղ��������ȡ�����ݻ�Ƥ��")
	elseif ( i == 17 ) then
		AddItem(2,2,21,2)
		Msg2Player("����ղ��������ȡ�����ݺڽ���")
	elseif ( i == 18 ) then
		AddItem(2,2,22,2)
		Msg2Player("����ղ��������ȡ������֯����")
	elseif ( i == 19 ) then
		AddItem(1,3,1,2)
		Msg2Player("����ղ��������ȡ���������⣡")
	elseif ( i == 20 ) then
		AddItem(1,3,2,2)
		Msg2Player("����ղ��������ȡ�����ݼ��⣡")
	elseif ( i == 21 ) then
		AddItem(1,3,9,2)
		Msg2Player("����ղ��������ȡ�����ݹ�ͨ�飡")
	elseif ( i == 22 ) then
		AddItem(1,3,10,2)
		Msg2Player("����ղ��������ȡ���������鶹��")
	elseif ( i == 23 ) then
		AddItem(1,0,1,2)
		Msg2Player("����ղ��������ȡ�����ݱ�����")
	elseif ( i == 24 ) then
		AddItem(1,0,2,2)
		Msg2Player("����ղ��������ȡ�����ݽ�ɢ��")
	elseif ( i == 25 ) then
		AddItem(1,0,3,2)
		Msg2Player("����ղ��������ȡ������ֹѪɢ��")
	elseif ( i == 26 ) then
		AddItem(1,0,7,2)
		Msg2Player("����ղ��������ȡ������С������")
	elseif ( i == 27 ) then
		AddItem(1,0,12,2)
		Msg2Player("����ղ��������ȡ����������ɢ��")
	elseif ( i == 28 ) then
		AddItem(1,1,1,2)
		Msg2Player("����ղ��������ȡ��������ͷ��")
	elseif ( i == 29 ) then
		AddItem(1,1,2,2)
		Msg2Player("����ղ��������ȡ�����ݷ��ţ�")
	elseif ( i == 30 ) then
		AddItem(2,5,1,2)
		Msg2Player("����ղ��������ȡ�����ݼ�������")
	elseif ( i == 31 ) then
		AddItem(2,5,2,2)
		Msg2Player("����ղ��������ȡ�����ݼ�������")
	elseif ( i == 32 ) then
		AddItem(2,4,1,1)
		Msg2Player("����ղ��������ȡ��һ����سʯ��")
	elseif ( i == 33 ) then
		AddItem(2,4,8,1)
		Msg2Player("����ղ��������ȡ��һ����سʯ��")
	elseif ( i == 34 ) then
		AddItem(1,5,1,2)
		Msg2Player("����ղ��������ȡ�������꾩���ط���")
	elseif ( i == 35 ) then
		AddItem(1,5,2,2)
		Msg2Player("����ղ��������ȡ�����ųɶ����ط���")
	elseif ( i == 36 ) then
		AddItem(0,107,31,1)
		Msg2Player("����ղ��������ȡ��һ����ȭ�ף�")
	elseif ( i == 37 ) then
		AddItem(0,2,14,1)
		Msg2Player("����ղ��������ȡ��һ�����ٽ���")
	elseif ( i == 38 ) then
		AddItem(0,2,15,1)
		Msg2Player("����ղ��������ȡ��һ�����ƽ���")
	elseif ( i == 39 ) then
		AddItem(0,5,27,1)
		Msg2Player("����ղ��������ȡ��һ�����ٹ���")
	elseif ( i == 40 ) then
		AddItem(0,5,28,1)
		Msg2Player("����ղ��������ȡ��һ����ü����")
	elseif ( i == 41 ) then
		AddItem(0,1,40,1)
		Msg2Player("����ղ��������ȡ��һ�����ٰ�����")
	elseif ( i == 42 ) then
		AddItem(0,1,41,1)
		Msg2Player("����ղ��������ȡ��һ�����ʯ��")
	elseif ( i == 43 ) then
		AddItem(0,3,53,1)
		Msg2Player("����ղ��������ȡ��һ���䵶��")
	elseif ( i == 44 ) then
		AddItem(0,10,64,1)
		Msg2Player("����ղ��������ȡ��һ�������٣�")
	elseif ( i == 45 ) then
		AddItem(0,9,75,1)
		Msg2Player("����ղ��������ȡ��һ֧�йٱʣ�")
	elseif ( i == 46 ) then
		AddItem(0,8,86,1)
		Msg2Player("����ղ��������ȡ��һ�����ȣ�")
	elseif ( i == 47 ) then
		AddItem(0,100,1,1)
		Msg2Player("����ղ��������ȡ��һ�����ٲ��£�")
	elseif ( i == 48 ) then
		AddItem(0,100,2,1)
		Msg2Player("����ղ��������ȡ��һ�������£�")
	elseif ( i == 49 ) then
		AddItem(0,100,19,1)
		Msg2Player("����ղ��������ȡ��һ�������£�")
	elseif ( i == 50 ) then
		AddItem(0,100,20,1)
		Msg2Player("����ղ��������ȡ��һ�������磡")
	elseif ( i == 51 ) then
		AddItem(0,100,37,1)
		Msg2Player("����ղ��������ȡ��һ�����ѣ�")
	elseif ( i == 52 ) then
		AddItem(0,100,38,1)
		Msg2Player("����ղ��������ȡ��һ�������ѣ�")
	elseif ( i == 53 ) then
		AddItem(0,100,55,1)
		Msg2Player("����ղ��������ȡ��һ�����ѣ�")
	else 
		AddItem(0,100,56,1)
		Msg2Player("����ղ��������ȡ��һ�������ѣ�")
	end
end

function no()
	Say("�ղ�󳼣��������־������ʮ�����ͣ�ף��һ·˳�磡",0)
end
