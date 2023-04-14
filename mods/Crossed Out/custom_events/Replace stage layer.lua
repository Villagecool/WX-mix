function onEvent(name, value1, value2)
	if name == 'Replace stage layer' then
		setProperty(value1..'.alpha', 1)
		setProperty(value2..'.alpha', 0)
	end
end