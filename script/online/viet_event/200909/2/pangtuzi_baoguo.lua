GET_PANGTUZI_ID = 2432
GET_PANGTUZI_TIME_ID = 2433

-- file thÞt nuíng
Include("\\script\\online\\viet_event\\200911\\6\\head_bachtiensinh.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\vng\\award\\feature_award.lua")

function main()
	if GetTask(TSK_THONUONG_ACCEPT) ~= 1 then
		Talk(1, "", "B¹n ch­a nhËn nhiÖm vô nªn kh«ng thÓ tham gia bµn tiÖc.");
		return 0
	end
	
	if GetLevel() < 73 then
		Talk(1,"","CÊp 73 trë lªn míi cã thÓ tham gia bµn tiÖc.")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nhËp m«n ph¸i míi cã thÓ tham gia bµn tiÖc.")
		return 0
	end
	
	local nReputation = GetReputation()
	if nReputation < 3000 then
		Talk(1,"","§¹t 3000 ®iÓm danh väng trë lªn míi cã thÓ tham gia bµn tiÖc.")
		return 0
	end

	local nDate = tonumber(date("%d"));
	local nTaskVal = GetTask(GET_PANGTUZI_ID)
	
	if GetByte(nTaskVal,1) ~= nDate then
		nTaskVal  = SetByte(nTaskVal,1,nDate)
		nTaskVal  = SetByte(nTaskVal,2,0)
		nTaskVal  = SetByte(nTaskVal,3,0)
		SetTask(GET_PANGTUZI_ID, nTaskVal)	
	end
	
	nTaskVal = GetTask(GET_PANGTUZI_ID)	
	
	-- mçi nh©n vËt thuëng thøc ®óng 180 c¸i / ngµy
	if GetByte(nTaskVal,2) >= 180 then
		Talk(1,"","Mçi ngµy chØ cã thÓ th­ëng thøc 180 ThÞt N­íng.")
		return 0
	end	
	
	-- ? gm ds SetTask( 2432, SetByte ( GetTask(2432) , 2 , value) )
	-- value: sè lÇn ¨n 	
	-- ?gm ds Msg2Player(GetByte(GetTask(100),3))	
	
	-- thêi gian gi·n c¸ch hai lÇn click vµo lß nuíng lµ 45 gi©y
	if GetTime() - GetTask(GET_PANGTUZI_TIME_ID) < 45 then
		Talk(1,"","B¹n cßn "..GetTask(GET_PANGTUZI_TIME_ID) + 45 - GetTime().." gi©y míi cã thÓ tiÕp tôc th­ëng thøc ThÞt N­íng.")
		return 0
	end
	
	-- ®iÓm danh väng = 0  kh«ng thÓ nhËn th­ëng	
	if ( GetReputation() == 0 ) then
		Talk(1,"","§iÓm danh väng kh«ng ®ñ.")
		return 0
	end
	
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	SetTask(GET_PANGTUZI_ID, SetByte(nTaskVal,2,GetByte(nTaskVal,2) + 1))
	SetTask(GET_PANGTUZI_TIME_ID,GetTime())
	local nExp, nRep, nRep1, nFaction, nFaction1 = 50000, 5, 2, 5, 2
	
	local nRand = random(1,100)
	if nRand <= 50 then	
		ModifyExp(nExp)
		Msg2Player("B¹n nhËn ®­îc "..nExp.." Kinh nghiÖm");
	else	
		AddItem(2,0,351,1)
		Msg2Player("B¹n nhËn ®­îc 1 Lé Thñy");	
	end
	
	--  phÇn th­ëng thÞch thá n­íng
	--	ThoNuong_Award()		--Expired
	
	-- sau b¶o tr× 4-12-2010 sÏ cã thªm tÝnh n¨ng nµy
	-- cã 10% bi trõ 1 ®iÓm danh väng
		
	local nRandReputation = random(1,100)
	if ( nRandReputation <= 10 ) then
		ModifyReputation ( -1,0 )   -- trõ 1 ®iÓm danh väng 
		
		if ( GetReputation() < 0 ) then
				ModifyReputation (0, 0)   -- set ®iÓm danh väng b»ng 0 l¹i
		end
	end
	
	-- doi 45 gi©y míi cã thÓ ¨n ®­îc n÷a	
	StartTimeGuage("ThÞt N­íng",45,0,1)	
		
	if GetTask(TSK_THONUONG_ACCEPT) == 1 then
		set_task_thonuong(BYTE_COUNT_COLLECT, get_task_thonuong(BYTE_COUNT_COLLECT) + 1)
		Msg2Player("Thu thËp ThÞt N­íng "..get_task_thonuong(BYTE_COUNT_COLLECT).."/20")
		if get_task_thonuong(BYTE_COUNT_COLLECT) == 20 then
			SetTask(TSK_THONUONG_ACCEPT,2)
			-- PhÇn th­ëng B¹ch Tiªn Sinh
			BachTienSinh_Award();
			ThitNuong_NhanThuong()		--function BachTienSinh_Award sÏ chuyÓn vµo function nµy
			TaskTip("Hoµn thµnh nhiÖm vô thu thËp ThÞt N­íng. Mau vÒ b¸o cho B¹ch Tiªn Sinh")
		end	
	end		
end