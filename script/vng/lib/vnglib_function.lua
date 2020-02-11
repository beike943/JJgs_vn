-- Function to read/write data into text file
-- Created by Chimc
-- Created date 10/07/2013
Include("\\script\\lib\\globalfunctions.lua");
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2

function VNG_SetExtBit(nExtPoint, nBit, nBitValue)
	if nBit < 1 or nBit > 15 then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "Out of range")
		return 0
	end
	local nValue = GetExtPoint(nExtPoint)
	local nNewValue = SetBit(nValue, nBit, nBitValue)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nNewValue)
	if GetExtPoint(nExtPoint) == nNewValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nValue.." to "..GetExtPoint(nExtPoint))
		return 0
	end
end


function VNG_PayExtPoint(nExtPoint, nValue)
	local nOldValue = GetExtPoint(nExtPoint)
	PayExtPoint(nExtPoint, nValue)
	local nNewValue = GetExtPoint(nExtPoint)
	if nNewValue ~= nOldValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nOldValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nOldValue.." to "..nOldValue)
		return 0
	end
end


function VNG_AddExtPoint(nExtPoint, nValue)
	local nOldValue = GetExtPoint(nExtPoint)
	AddExtPoint(nExtPoint, nValue)
	local nNewValue = GetExtPoint(nExtPoint)
	if nNewValue ~= nOldValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nOldValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nOldValue.." to "..nOldValue)
		return 0
	end
end


function VNG_SetExtPoint(nExtPoint, nValue)
	local nOldValue = GetExtPoint(nExtPoint)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nValue)
	local nNewValue = GetExtPoint(nExtPoint)
	if nNewValue ~= nOldValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nOldValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nOldValue.." to "..nOldValue)
		return 0
	end
end

function GetBytePos(nValue, nPos)
	local nHeso = 10^(nPos-1)
	return mod(floor(nValue/nHeso),10)
end

function SetBytePos(nValue, nSetValue, nPos)
	local nHeso = 10^(nPos)
	local nNewValue = floor(nValue/nHeso)*nHeso + nSetValue*(nHeso/10) + mod(nValue,(nHeso/10))
	return nNewValue
end

function VNG_GetValuePos(nValue, nPos2, nPos1)
	return floor(mod(nValue,10^(nPos2))/(10^(nPos1-1)))
end

function VNG_SetValuePos(nValue, nSetValue, nPos2, nPos1)
	local nHead = floor(nValue/(10^nPos2))*(10^nPos2)
	local nTail = mod(nValue,10^(nPos1-1))
	local nBody = nSetValue*(10^(nPos1-1))
	return (nHead + nBody + nTail)
end

function VNG_GetTaskPos(nTask, nPos2, nPos1)
	local nTaskvalue = GetTask(nTask)
	nTaskvalue = VNG_GetValuePos(nTaskvalue, nPos2, nPos1)
	return nTaskvalue
end

function VNG_SetTaskPos(nTask, nSetValue, nPos2, nPos1)
	local nTaskvalue = GetTask(nTask)
	nTaskvalue = VNG_SetValuePos(nTaskvalue, nSetValue, nPos2, nPos1)
	SetTask(nTask, nTaskvalue)
	return 1
end


function GetTranslifeCount()
	return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_COUNT)
end

function GetTranslifeFaction()
	local tbHuongChuyenSinh = {"Long Tö","Hæ Tö","¦ng Tö","Phông Tö"}
	local nIndex = GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION)
	return nIndex, (tbHuongChuyenSinh[nIndex] or "")
end