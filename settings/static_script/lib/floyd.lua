function floyd_m4n(n, m)
	if n < m then n,m = m,n end

	local s = {}
	for j = n-m+1, n do
		local t = random(1,j)
		if s[t] ~= 1 then
			s[t] = 1;
		else
			s[j] = 1;
		end
	end
	return s;
end

function gencol(s,t)
	for k,v in s do
		if k ~= 'n' and v == t then
			return k
		end
	end
	return 0
end

function floyd_rm4n(n, m)
	if n < m then n,m = m,n end
	local s = {}
	for j = n-m+1, n do
		local t = random(1, j)
		c = gencol(s, t)
		if c == 0 then
			tinsert(s, t)
		else
			tinsert(s, c, j)
		end
	end
	return s;
end

date = date or os.date;
randomseed = randomseed or math.randomseed;
random = random or math.random;
randomseed(tonumber(date("%S")*19364))

--s = floyd_rm4n(100,10)
--
--for k,v in s do
--	print(k,v)
--end
