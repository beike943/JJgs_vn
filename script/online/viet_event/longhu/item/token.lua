-- æ´”¢∞Ôª·’Ω ¡˙ª¢¡Ó
-- by windle 2009-2-13 14:48

Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse()
	local nDate = tonumber(date("%y%m%d%H"));
--	if nDate >= 12112900 then
--		return 0;
--	end
	local tSel = {
--		"T◊m hi”u c∏ch sˆ dÙng V‚ L©m ThÀp Nhﬁ L÷nh/#about(1)",
		"Ta muËn nhÀn vﬂng s∏ng danh hi÷u/getSfxEffect",
--		"Ta muËn nhÀn hi÷u ¯ng vÚ kh›/getWeaponSfxEffect",
--		"Ta muËn nhÀn ph«n th≠Îng cho bªng h˜u/getAward_hongbao",
		"K’t thÛc ÆËi thoπi/nothing",
	}
	
	Say("V‚ L©m ThÀp Nhﬁ L÷nh lµ n¨i ph∏t th≠Îng cho c∏c gi∂i Æ u, qu˝ ÆÂng Æπo c„ th” xem th™m th´ng tin chi ti’t b™n d≠Ìi.", getn(tSel), tSel);
end

function about(page)
	local info = {
		{
		"H≠Ìng d…n c∏ch sˆ dÙng V‚ L©m ThÀp Nhﬁ L÷nh: \n",
		"1. ChÛ th›ch ìvﬂng danh hi÷uî: C„ V‚ L©m ThÀp Nhﬁ L÷nh trong tay, qu˝ ÆÂng Æπo c„ th” nhÀn vﬂng danh hi÷u vµ hi÷u ¯ng vÚ kh› bªng c∏ch nh p vµo dﬂng ch‰n ìta muËn nhÀn vﬂng danh hi÷uî.\n",
		"L≠u ˝: Vﬂng danh hi÷u sœ bﬁ m t khi ÆÂng Æπo chuy”n b∂n ÆÂ, ho∆c ngæt k’t nËi vÌi m∏y chÒ. ß” k›ch hoπt lπi vﬂng danh hi÷u, ÆÂng Æπo h∑y nh p lπi vµo dﬂng ch‰n tr™n V‚ L©m ThÀp Nhﬁ L÷nh.\n",
		},
		{
		"2. ChÛ th›ch ìnhÀn ph«n th≠Îng cho bªng h˜uî: CÔng vÌi ìvﬂng danh hi÷uî nhÀn Æ≠Óc, ÆÂng Æπo cﬂn c„ th” nhÀn th™m c∏c ph«n quµ kh∏c Æ” t∆ng cho bªng h˜u cÒa m◊nh theo quy tæc nh≠ sau:\n",
		" _ MÁi nh©n vÀt tham gia gi∂i Æ u Bang HÈi Tinh Anh c„ th” nhÀn tËi Æa 5 Thanh Phong Bao.\n",
		" _ Chÿ c„ nh©n vÀt c p ÆÈ 73 trÎ l™n Æ∑ gia nhÀp h÷ ph∏i mÌi c„ th” sˆ dÙng Thanh Phong Bao.\n",
		" _ MÁi nh©n vÀt chÿ sˆ dÙng Æ≠Óc 1 Thanh Phong Bao trong suËt thÍi gian hoπt ÆÈng gi∂i Æ u Bang HÈi Tinh Anh.\n",
		},
		{
		"3. ChÛ th›ch ìnhÀn ph«n th≠Îng trong gi∂i Æ u Bang HÈi Tinh Anhî, C„ 2 h◊nh th¯c nhÀn th≠Îng nh≠ sau:\n",
		" - NhÀn ph«n th≠Îng tı c∏c trÀn Æ u di‘n ra trong vﬂng loπi tr˘c ti’p.\n",
		" - NhÀn ph«n th≠Îng tı c∏c trÀn Æ u di‘n ra trong vﬂng Chung K’t.\n",
		" - NhÀn ph«n th≠Îng top 10 anh hÔng (sau mÁi trÀn Æ u).",
		}
	}
	local tCallback = {"#about(2)", "#about(3)", "OnUse"};
	local msg = "";
	for k,v in info[page] do
		msg = msg..v;
	end
	Talk(1, tCallback[page], msg);
end

function getSfxEffect()
	SetCurrentNpcSFX(PIdx2NpcIdx(),921,1,1);
end

function getWeaponSfxEffect()
	BindWeaponEffect("Lπc Hµ",1)	
end

function getAward_hongbao()
	if GetTask(TASKID_JYBHZ_GET_HONGBAO) > 1 then
		Talk(1,"","MÁi nh©n vÀt chÿ c„ th” nhÀn 5 Thanh Phong Bao, Æπi hi÷p Æ∑ nhÀn rÂi mµ.");
		return
	end
	if gf_CheckInv(5,50,"") ~= 1 then
		return
	end	
	SetTask(TASKID_JYBHZ_GET_HONGBAO, 5);
	for i=1,5 do
		local nRet, nItemIdx = gf_AddItemEx({2,1,370,1,1},"Thanh Phong Bao");
		if nRet ==1 then
			SetItemExpireTime(nItemIdx,45*24*3600)
		end
	end
	WriteLogEx("Bang hoi tinh anh 8","nhÀn 5 Thanh Phong Bao","","","",GetTongName())
end
