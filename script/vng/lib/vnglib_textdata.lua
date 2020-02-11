-- Function to read/write data into text file
-- Created by Chimc
-- Created date 07/06/2012

LIB_txtData = {
	DataFileName = "",
	listFormat = "(.+)	(.+)",
	tbTextData = {},
	szPattern = "[A-Za-z0-9]"
}

function LIB_txtData:Init(szFileName)
	-- Check OS
	if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
		self.DataFileName = "data\\"..szFileName;
	else
		self.DataFileName = "data/"..szFileName;
	end
	self.tbTextData = {}
end


--Load gia tri tu file data
function LIB_txtData:LoadData()
	local pf = openfile(self.DataFileName, "r");
	local str = ""
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		local _,_,nRow, nValue = strfind(str, self.listFormat);
		self.tbTextData[tonumber(nRow)] = tonumber(nValue)
	end
	closefile(pf);
end


--Add gia tri vao file data
function LIB_txtData:AddValue(nRow, Value, nMax)
	self:LoadData()
	-- Fill row
	if getn(self.tbTextData) < nRow then
		for i=getn(self.tbTextData), nRow do
			self.tbTextData[i] = 0
		end
	end
	-- Check max
	if type(nMax) == "number" then
		if self.tbTextData[nRow] >= nMax then
			return 0
		end
	end
	-- Add value
	Value = Value or 1;
	nRow = nRow or 1;
	self.tbTextData[tonumber(nRow)] = self.tbTextData[tonumber(nRow)] + Value
	local pf = openfile(self.DataFileName, "w");
	if not pf then return end
	for i=1, getn(self.tbTextData) do
		write(pf, format("%s	%s\n", i, self.tbTextData[i]));
	end
	closefile(pf);
	return 1
end


--Set gia tri vao file data
function LIB_txtData:SetValue(nRow, Value)
	self:LoadData();
	nRow = nRow or 1;
	if getn(self.tbTextData) < nRow then
		for i=getn(self.tbTextData), nRow do
			self.tbTextData[i] = 0
		end
	end
	self.tbTextData[tonumber(nRow)] = Value
	local pf = openfile(self.DataFileName, "w");
	if not pf then return end
	for i=1, getn(self.tbTextData) do
		write(pf, format("%s	%s\n", i, self.tbTextData[i]));
	end
	closefile(pf);
	return 1
end


-- Split String to table
function LIB_txtData:SplitString(szData)
--	local szCommand = "tbDataTemp = {\"" ..gsub(szData,"%s","\",\"") .. "\"}"
--	dostring(szCommand)
	tbDataTemp = {}
	while strlen(szData) > 0 do
		local nPosition = strfind(szData,"	")
		local szDataTemp = ""
		if nPosition ~= nil then
			szDataTemp = strsub(szData,1,nPosition-1)
			szData = strsub(szData, nPosition + 1, strlen(szData))
		else
			szDataTemp = szData
			szData =""
		end
		tinsert(tbDataTemp, szDataTemp)
	end
	return tbDataTemp
end


-- Load multi field data
function LIB_txtData:LoadMultiColumn()
	local pf = openfile(self.DataFileName, "r");
	if pf ~= nil then
		local str = ""
		local nRow = 0
		while 1 do
			nRow = nRow + 1
			str = read(pf, "*l");
			if not str then break end
			self.tbTextData[nRow] = self:SplitString(str)
		end
		closefile(pf);
		return 1
	else
		self.tbTextData = {}
		return 0
	end
end


-- Update multi field data
function LIB_txtData:SaveMultiColumn()
	local pf = openfile(self.DataFileName, "w");
	for i=1,getn(self.tbTextData) do
		local szData = ""
		for j=1,getn(self.tbTextData[i]) do
			szData = szData .. self.tbTextData[i][j]
			if j ~= getn(self.tbTextData[i]) then
				szData = szData .. "	"
			end
		end
		write(pf,szData.."\n");
	end
	closefile(pf);
end


-- Add new line
function LIB_txtData:AddLine(szData)
	local pf = openfile(self.DataFileName,"a");
	write(pf,szData.."\n");
	closefile(pf);
end

-- Check Valid Character
function LIB_txtData:CheckString(szData)
	local szTemp = gsub(szData,self.szPattern,"")
	return strlen(szTemp)
end

-- LIB_txtData:Init("test.txt")
-- LIB_txtData:LoadMultiColumn();