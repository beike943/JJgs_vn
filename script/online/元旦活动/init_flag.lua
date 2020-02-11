--filename:init_flag.lua
--create date:2005-12-26
--author:yanjun
--describe:³õÊ¼»¯¶áÆì»î¶¯
Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")

function main()
	local iMonth = GetCurMonth()
	local iDay = GetCurDate()
	if ((iMonth == 12 and iDay ==31) or (iMonth == 1 and iDay <= 5)) and YUANDAN_SWITCH == 1 then
		AddLocalNews("HiÖn giê ho¹t ®éng Nguyªn §¸n ®o¹t kú ®· b¾t ®Çu, h·y ®Õn Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u tham gia.")
		Msg2SubWorld("HiÖn giê ho¹t ®éng Nguyªn §¸n ®o¹t kú ®· b¾t ®Çu, h·y ®Õn Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u tham gia.")
		Init_Flag()
	end
end

function Init_Flag()
	if GetGlbValue(ID_FLAG_NUMBER_QZ) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_QZ,0)
	end
	if GetGlbValue(ID_FLAG_NUMBER_CD) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_CD,0)
	end
	if GetGlbValue(ID_FLAG_NUMBER_BJ) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_BJ,0)
	end
	local flagNo_QZ = GetGlbValue(ID_FLAG_NUMBER_QZ)
	local flagNo_CD = GetGlbValue(ID_FLAG_NUMBER_CD)
	local flagNo_BJ = GetGlbValue(ID_FLAG_NUMBER_BJ)
	SetGlbValue(ID_FLAG_NUMBER_QZ,flagNo_QZ+5)
	SetGlbValue(ID_FLAG_NUMBER_CD,flagNo_CD+5)
	SetGlbValue(ID_FLAG_NUMBER_BJ,flagNo_BJ+5)
	local npcFlag
	--=================================ÈªÖÝ¸®±±==============================
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",108,1576,2994)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",108,1571,2982)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",108,1564,2968)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",108,1553,2965)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",108,1543,2954)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	--=================================ãê¾©¸®ÄÏ==============================
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",201,1460,2808)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",201,1455,2823)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",201,1445,2831)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",201,1437,2833)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",201,1427,2830)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	--=================================³É¶¼¸®ÄÏ==============================
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",304,1396,2925)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",304,1398,2940)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",304,1402,2949)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",304,1404,2931)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
	npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",304,1407,2973)
	SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
end
