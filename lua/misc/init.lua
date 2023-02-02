local M = {}

function M.merge(dest, src)
	for k, v in pairs(src) do
		dest[k] = v
	end
	return dest
end

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

M["unload_lua_namespace"] = function(prefix)
	local prefix_with_dot = prefix .. "."
	for key, _ in pairs(package.loaded) do
		if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then package.loaded[key] = nil end
	end
end

local function switch_isofcase(val, values)
	local vt = type(values)
	if vt == "table" then
		for _, v in ipairs(values) do
			if v == val then return true end
		end
		return false
	end
	if vt == "function" then return values(val) end
	return (values == val)
end

local function switch_test(switch, val)
	-- Iterate through case list
	for _, case in ipairs(switch.cases) do
		-- Compare with case
		-- If true, return the case func or value
		if switch_isofcase(val, case.value) then
			if case.func then return case.func(val, case.value) end
			return case.ret
		end
	end
	-- if none of the case matches, call default
	if switch.default_func then return switch.default_func(val, "default") end
	return switch.default_ret
end

local function switch_case(switch, value, fn)
	if type(fn) == "function" then
		table.insert(switch.cases, { value = value, func = fn })
	else
		table.insert(switch.cases, { value = value, ret = fn })
	end
end

local function switch_default(switch, fn)
	if type(fn) == "function" then
		switch.default_func = fn
	else
		switch.default_ret = fn
	end
end

function M.switch()
	local s = {}
	s.cases = {}
	s.test = switch_test
	s.case = switch_case
	s.default = switch_default
	return s
end
-- ^^^^ SWITCH

return M
