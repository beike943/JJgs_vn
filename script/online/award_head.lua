--各种关卡、战场奖励集中在这里
--针对于每个人个人执行
Include("\\script\\online\\tong_feast\\tf_head.lua") --帮派盛宴

--参加跨服战场
--nKind兑换类型0直接1军功章2大军功章3辉煌军功章
function aw_kfbattle_award(nKind)
	--帮派盛宴
	tf_raiddrop_kfbattle();
end

--参加天门阵
--nKind兑换类型0直接1军功章2大军功章3辉煌军功章
function aw_tmz_award(nKind)
	--帮派盛宴
	tf_raiddrop_tmz();
end

--参加一次宋辽战场
function aw_bsBattle_award()
	--帮派盛宴
	tf_raiddrop_slbattle();
end

--梁山过关
--nStep关卡步数
function aw_ls_award(nStep)
	if nStep >= 1 and nStep <= 4 then
		tf_raiddrop_ls_14();
	elseif nStep > 4 then
		tf_raiddrop_ls_ib();
	end
end

--万剑冢过关
--nStep关卡步数
function aw_wjz_award(nStep)
	tf_raiddrop_wjz_14();
end

--通天幻境过关
--nStep关卡步数
function aw_ttd_award(nStep)
	tf_raiddrop_ttd_17();
end

--地玄宫过关
--nType类型0免费1IB
function aw_dxg_award(nType)
	if nType == 0 then
		tf_raiddrop_dxg_13();
	end
	if nType == 1 then
		tf_raiddrop_dxg_ib();
	end
end

--藏剑山庄,共9关
--nStep关数
function aw_cjsz_award(nStep)
	tf_raiddrop_cjsz();
end

--太虚幻境
--nCurRing当前是第几轮
function aw_taixu_award(nCurRing)
	tf_raiddrop_tx();
end