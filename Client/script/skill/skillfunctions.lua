--����ͨ�����ݸ�ʽ

--[˵��]
--	���ܵĸ���������ֵ��һϵ�ж�ά�����ṩ;
--	������һ��һԪ����.�����Ա���Ϊ���ܵȼ�,�����Ϊ�ض�����������ֵ.����: Y = F(X) (X, ���ܵȼ�; Y, ��������ֵ; F, ����)
--	ʵ��Ӧ�õļ���������ֵ������������(Ҳ������1��)���߶����Ӷ��ɵ�.�Ե��е���ʽ����,����:
--	{���ܵȼ�X1, ����ֵY1, ����F1}, ... {���ܵȼ�Xn-1, ����ֵYn-1, ����Fn-1}, {���ܵȼ�Xn, ����ֵYn, ����Fn}, ...
--	��Xn-1 <= X <= Xn, ��Y = Fn(X)
--	����ȱʡΪLine(ֱ��)
--
--SKILL = {
--	******************************��������******************************
--	���ݸ�ʽ:
--	���������� =
--	{
--		{����A, {���ܵȼ�X1, ����ֵY1, ����F1}, {���ܵȼ�X2, ����ֵY2, ����F2}, ...},
--		{����B, {���ܵȼ�X1, ����ֵY1, ����F1}, {���ܵȼ�X2, ����ֵY2, ����F2}, ...},
--		...
--	����:
--		{"skill_use_range", {{1, 100}, {10, 300, Line}, {20, 500, Conic}}}	-- ����ʹ�÷�Χ
--	}
--
--	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
--	{
--		...
--	},
--
--	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
--	{
--		...
--	},
--
--	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
--	{
--		...
--	},
--
--	******************************ħ������******************************
--
--	����ֵ:		Min[(��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E) + �����⹦������ * F + Z), M]
--				(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��M��Z��,������˺�����Ϊ�ٷֱ���. MΪ����ֵ����)
--
--	�ɹ�����:		(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
--				(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)
--
--	���ݸ�ʽ:
--	[˵��]
--	  �˺�����,��������ȱʡΪ0
--	ħ�������� =
--	{
--		{
--			magic = ħ������1,
--			damage_factor_a = {{���ܵȼ�X1, �˺�����Y1, ����F1}, {���ܵȼ�X2, �˺�����Y2, ����F2}...}
--			...
--			damage_factor_z = {{���ܵȼ�X1, �˺�����Y1, ����F1}, {���ܵȼ�X2, �˺�����Y2, ����F2}...}
--			probability_factor_a = {{���ܵȼ�X1, ��������Y1, ����F1}, {���ܵȼ�X2, ��������Y2, ����F2}...}
--			...
--			probability_factor_x = {{���ܵȼ�X1, ��������Y1, ����F1}, {���ܵȼ�X2, ��������Y2, ����F2}...}
--		}
--		...
--		����:
--		{
--			magic = "damage_life",						--�˺�������
--			damage_factor_z = {{20,1}, {20,20}},		--�˺�����Z
--			probability_factor_x = {{100,1}, {100,20}}	--��������X
--		}
--	}
--
--	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
--	{
--		...
--	},
--
--	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
--	{
--		...
--	},
--
--	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
--	{
--		...
--	},
--}


--����ͨ�ú���

-------------------------------------------------------------
--����:	Line
--����:	ֱ��ȡֵ F(X)=aX + b
--����:	x, �����x����(���ܵȼ�)
--		(x1, y1), (x2, y2) �˵�����
--����:	x����������ֵ
-------------------------------------------------------------
function Line(x, x1, y1, x2, y2)
	if (y1 == y2) then
		return y2
	end

	return (y2 - y1) * (x - x1)/(x2 - x1) + y1
end

-------------------------------------------------------------
--����:	Conic
--����:	��������ȡֵ F(X)=aX^2 + c
--����:	x, �����x����(���ܵȼ�)
--		(x1, y1), (x2, y2) �˵�����
--����:	x����������ֵ
-------------------------------------------------------------
function Conic(x, x1, y1, x2, y2)
	if((x1 < 0) or (x2 < 0)) then
		return 0
	end

	if (y1 == y2) then
		return y2;
	end

	return x * x * (y1 - y2) / (x1 * x1 - x2 * x2) + y1 - (y1 - y2) * x1 * x1 / (x1 * x1 - x2 * x2)
end

-------------------------------------------------------------
--����:	Link(x, points)
--����:	��ȡ���ܵȼ�Ϊxʱ�ļ�������ֵ
--����:	x, ������ָ���ܵȼ�;
--		points, ���ߵ���;
--����:	���ܵȼ�Ϊxʱ�ļ�������ֵ
-------------------------------------------------------------
function Link(x, points)
	num = getn(points)
	if (num < 2) then
		return -1
	end

--	����ȱʡΪLine(ֱ��)
	for i = 1, num do
		if (points[i][3] == nil) then
			points[i][3] = Line
		end
	end

--	�߽�ֵ����
--	�±߽�
	if (x < points[1][1]) then
		return points[1][3](x, points[1][1], points[1][2], points[2][1], points[2][2])
	end
--	�ϱ߽�
	if(x > points[num][1]) then
		return points[num][3](x, points[num-1][1], points[num-1][2], points[num][1], points[num][2])
	end

	c = 2
	for i = 2, num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end

	return points[c][3](x, points[c-1][1], points[c-1][2], points[c][1], points[c][2])
end

-------------------------------------------------------------
--����:	Param2String
--����:	Param1,��Ҫ���ӵĲ���1
--		Param2,��Ҫ���ӵĲ���2
--����:  ������1�Ͳ���2�Զ��Ÿ������ɵ�һ���ַ���
-------------------------------------------------------------
function Param2String(Param1, Param2)
    return Param1..","..Param2
end

-----------------------------------------------------------
--����:	GetSkillLevelData(sType, nIndex, nlevel)
--����:	��ü��ܵȼ�������Լ�ħ������
--����:	sType, ��������
--		("SKILL_LEVEL_BASE_ATTRIB",		"SKILL_LEVEL_COST_ATTRIB",	"SKILL_LEVEL_MISSLE_ATTRIB",
--		 "SKILL_MAGIC_DAMAGE_ATTRIB",	"SKILL_MAGIC_STATE_ATTRIB",	"SKILL_MAGIC_IMME_ATTRIB")
--		nIndex,��������������sType�е�����(��1��ʼ����)
--		nlevel,���ܵȼ�
--����:	��������sType�е�nIndex�����Ե����ֵ(���ַ�����ʽ)
--��ע:	�������Է���ֵ:	"����,����ֵ"
--		ħ�����Է���ֵ:	"����,�˺�����A,�˺�����B,�˺�����C,�˺�����D,�˺�����E,�˺�����F,�˺�����X,�˺�����Y,�˺�����Z,
--						��������A,��������B,��������C,��������D,��������X"
--		����-1�����Ѷ�����������sType�е���������
-----------------------------------------------------------
function GetSkillLevelData(sType, nIndex, nlevel)
	if (sType == "SKILL_LEVEL_BASE_ATTRIB" or
		sType == "SKILL_LEVEL_COST_ATTRIB" or
		sType == "SKILL_LEVEL_MISSLE_ATTRIB") then
	--��������
		if (SKILL[sType][nIndex] == nil) then
 			return -1
		end

		value = floor(Link(nlevel,SKILL[sType][nIndex][2]))
		return Param2String(SKILL[sType][nIndex][1], value)
	else
	--ħ������
		if (SKILL[sType][nIndex] == nil) then
 			return -1
		end

		MAGIC_FACTORS = {
		--	�˺�����
			{"damage_factor_a",			0},
			{"damage_factor_b",			0},
			{"damage_factor_c",			0},
			{"damage_factor_d",			0},
			{"damage_factor_e",			0},
			{"damage_factor_f",			0},
			{"damage_factor_m",			0},
			{"damage_factor_x",			0},
			{"damage_factor_y",			0},
			{"damage_factor_z",			0},

		--	��������
			{"probability_factor_a",	0},
			{"probability_factor_b",	0},
			{"probability_factor_c",	0},
			{"probability_factor_d",	100},
			{"probability_factor_x",	100},
		}

		ResultString = SKILL[sType][nIndex]["magic"]

		for i = 1, getn(MAGIC_FACTORS) do
			if (SKILL[sType][nIndex][MAGIC_FACTORS[i][1]] == nil) then
				ResultString = Param2String(ResultString, MAGIC_FACTORS[i][2])
			else
				value = floor(Link(nlevel,SKILL[sType][nIndex][MAGIC_FACTORS[i][1]]))
				ResultString = Param2String(ResultString, value)
			end
		end

		return ResultString
	end
end
