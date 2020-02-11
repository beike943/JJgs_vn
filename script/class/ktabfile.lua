
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 表格文件读取函数头文件
-- 根据剑网的 KTabFile 做了些许修改
-- Edited by peres
-- 2005/04/12 PM 16:38

-- 看见的  熄灭了
-- 消失的  记住了
-- 我站在  海脚天涯
-- 听见    土壤萌芽
-- 等待    昙花再开
-- 把芬芳  留给年华
-- 彼岸    没有灯塔
-- 我依然  张望着
-- 天黑    刷白了头发
-- 紧握着  我火把
-- 他来    我对自己说
-- 我不害怕
-- 我很爱他

-- lyrics : 彼岸花
-- 村长2011-2-17增加功能
-- ======================================================

Include("\\script\\class\\mem.lua");

KTabFile = {
	__encodeType = 0,
	__new = function(self,arg)
		if (not arg) then return end
		self:load(arg[1])
	end,

	load = function(self,filename)
		self.__filename = filename
		if(TabFile_Load(filename) ==0) then
			return nil
		end
		self.__bOpen = 1;
		return 1
	end,

	getCell = function(self,row,col)
		return TabFile_GetData(self.__filename,row,col, "", self.__encodeType)
	end,

	getRow = function(self)
		return TabFile_GetRowCount(self.__filename)
	end,
	
	getCol = function(self)
		return TabFile_GetColCount(self.__filename)
	end,

	-- 根据列名取出单列作为一个单维数组
	createArray = function(self, col)
		local nRow = self:getRow();
		local ary = {};
		local i=0;

		for i=3, nRow do
			rawset(ary,	getn(ary)+1, self:getCell(i, col));
		end;

		return ary;

	end,

	-- 根据列来确定该数值的行为第几行（数字）
	selectRowNum = function(self, col, value)
		local nRow = self:getRow();
		local i=0;

		for i=3, nRow do
			if tonumber(self:getCell(i, col))==value then
				return i;
			end;
		end;

		return 0;
	end,

	-- 根据列来确定该数值的行为第几行（字符）
	selectRowString = function(self, col, value)
		local nRow = self:getRow();
		local i=0;

		for i=3, nRow do
			if self:getCell(i, col)==value then
				return i;
			end;
		end;

		return 0;
	end,
	
	--关闭
	close = function(self)
		if self.__bOpen ~= 0 then
			local bCloseFailed = 0;
			local nCnt = 10;--最多尝试删除10次
			repeat
				bCloseFailed = TabFile_Unload(self.__filename);
				nCnt = nCnt - 1;
			until bCloseFailed == 0 or nCnt <= 0;
		end
		self.__filename = nil;
		self.__bOpen = 0;
	end,
}
--========以下村长增加：函数定义==================================--
--函数原形：sf_RemoveEndSpace(str)
--作者：tanzi
--创建日期：2010-6-18
--最后修改日期：2010-6-18
--功能叙述：
--	把字符串末尾的空格去掉
--参数：
--	str：目标字符串
--返回值：
--	返回目标字符串去掉末尾所有空格的结果
--  如果目标字符串是空值，则返回该空值
--==================================================--
function sf_RemoveEndSpace(str)
	local space = " "
	local strStart = 1
	local strLength = strlen(str)
	if str == nil or str == "" then
		return str
	end
	for i = strLength, strStart, -1 do
		strEnd = strsub(str, i)
		if strEnd == space then
			str = strsub(str, strStart, (i - 1))
		else
			break
		end
	end
	return str
end
--从配置文件中读取数据，返回一个格式对应的table
--配置文件第一行为表头，第二行开始是具体数据
--以列数作为索引
function ff_GetTabFileTable(szFilePath,nDataStartLine)
	nDataStartLine = nDataStartLine or 2;	--真正的数据默认从第2行开始
	szFilePath = sf_RemoveEndSpace(szFilePath)
	local tbFile = new(KTabFile,szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	tbRet[0] = {};
	for i=1,nCol do
		tbRet[0][i] = tbFile:getCell(1,i);	--索引0为表头内容
	end;	
	for i=1,nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j=1,nCol do
			tbRet[i][j] = tbFile:getCell(i+nDataStartLine-1,j);	--读数据
		end;
	end;
	TabFile_Unload(szFilePath);
	return tbRet;
end;
--以表头字符作为索引
function ff_GetTabFileTableEx(szFilePath,nDataStartLine)
	nDataStartLine = nDataStartLine or 2;
	szFilePath = sf_RemoveEndSpace(szFilePath)
	local tbFile = new(KTabFile,szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	for i=1,nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j=1,nCol do
			local szKey = sf_Replace(tbFile:getCell(1,j)," ","");
			tbRet[i][szKey] = tbFile:getCell(i+nDataStartLine-1,j);
		end;
	end;
	TabFile_Unload(szFilePath);
	return tbRet;
end;
--配置文件处理
function ff_GetIniFileObj(szFilePath)
	szFilePath = sf_RemoveEndSpace(szFilePath)
	local objIniFile = 
	{
		szFilePath = szFilePath or "",
		bOpen = 0,
		--打开
		Open = function(self)
			self:Close();	--先关闭，这样就可以获取到最新的数据
			if IniFile_Load(self.szFilePath) == 1 then
				self.bOpen = 1;
				return 1;
			else
				return 0;
			end;
		end,
		--获取数字类型
		GetNum = function(self,szSection,szKey)
			--参数为nil直接报错
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			if self.bOpen == 1 then
				return tonumber(IniFile_GetData(self.szFilePath,szSection,szKey));
			else
				return nil;
			end;
		end,
		--获取字符串类型
		GetString = function(self,szSection,szKey)
			--参数为nil直接报错
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			if self.bOpen == 1 then
				return IniFile_GetData(self.szFilePath,szSection,szKey);
			else
				return nil;
			end;
		end,
		GetTable = function(self,szSection,szKey)	--获得一个table，如1,2返回{1,2}，1,2;3,4返回{{1,2},{3,4}}
			--参数为nil直接报错
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			if self.bOpen == 1 then
				local szTableData = IniFile_GetData(self.szFilePath,szSection,szKey);
				if strlen(szTableData) == 0 then
					return nil;
				end;
				local tb = sf_Split(szTableData,";");
				local tbRet = {};
				local nSize = getn(tb);
				if nSize == 1 then
					tbRet = sf_Split(tb[1],",");
				elseif nSize > 1 then
					for i=1,getn(tb) do
						tinsert(tbRet,sf_Split(tb[i],","));
					end;
				end;
				return tbRet;
			else
				return nil;
			end;
		end,
		GetNumTable = function(self,szSection,szKey)	--获得一个数据类型为number的table
			--参数为nil直接报错
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			local tbTable = self:GetTable(szSection,szKey)
			if type(tbTable) ~= "table" then
				return nil;
			else
				return gf_TableElementToNumber(tbTable);
			end;
		end,
		GetMixTable = function(self,szSection,szKey)
			--参数为nil直接报错
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			local tbTable = self:GetTable(szSection,szKey)
			if type(tbTable) ~= "table" then
				return nil;
			else
				return gf_TableNumberElementToNumber(tbTable);
			end;			
		end,
		--关闭
		Close = function(self)
			self.bOpen = 0;
			if DEBUG_VERSION == 1 then	--如果是调试版本就用一个循环去卸载
				local bCloseFailed = 0;
				repeat
					bCloseFailed = IniFile_Unload(self.szFilePath);
				until bCloseFailed == 0;
			else	--如果是发布版本，一般认为配置文件不会有改动，所以只卸载一次就够了！
				IniFile_Unload(self.szFilePath);
			end;
		end,
	};
	return objIniFile;
end;
--========函数定义==================================--
--函数原形：split(str,splitor)
--作者：yfeng
--创建日期：2004-6-1
--最后修改日期：2004-6-1
--功能叙述：
--	把字符串str用分裂符splitor分裂成数组形式
--参数：
--	str：被分裂的字符串
--	splitor：分裂符,如果该参数没有，默认为＂,＂
--返回值：
--	被分裂的数组．如果字符串str中没有包含分裂符splitor，
--则返回的数组只有１个元素，元素内容就是str本身．
--用例：
--	local s = "aaa,bbb,ccc,ddd"
--	local arr = splite(s,",")
--	则，arr的内容为：
--	arr[1]：aaa
--	arr[2]：bbb
--	arr[3]：ccc
--	arr[4]：ddd
--==================================================--
function sf_Split(str,splitor)
	return split(str,splitor);
end;
function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end
--把table里面的字符串转成数字
function gf_TableElementToNumber(tb)
	for k,v in tb do
		if type(v) == "string" then
			tb[k] = tonumber(v);
		elseif type(v) == "table" then
			tb[k] = gf_TableElementToNumber(v);
		end;
	end;
	return tb;
end;
--把table里面的可转换为数字的转换为数字
function gf_TableNumberElementToNumber(tb)
	for k,v in (tb) do
		if type(v) == "string" and tonumber(v) ~= nil then
			tb[k] = tonumber(v);
		elseif type(v) == "table" then
			tb[k] = gf_TableNumberElementToNumber(v);
		end;
	end;
	return tb;
end