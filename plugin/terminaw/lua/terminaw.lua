-- TODO:
-- Put the compilation results into the quickfix bag
local state = {
	job_id = -1,
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_cfg = {
		relative = "win",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_cfg)

	return { buf = buf, win = win }
end

local is_open = false
local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			is_open = true
			vim.cmd.terminal()
			if state.job_id == -1 then
				state.job_id = vim.bo.channel
			end
		end
	else
		is_open = false
		vim.api.nvim_win_hide(state.floating.win)
	end
end

local send_command = function(args)
	if args ~= "" then
		if is_open == false then
			toggle_terminal()
		end
		if state.job_id ~= -1 then
			vim.fn.chansend(state.job_id, args .. "\r\n")
		end
	end
end

vim.api.nvim_create_user_command("Terminaw", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space><c-t>", toggle_terminal)

vim.api.nvim_create_user_command("TermSend", function(cargs)
	send_command(cargs.args)
end, { nargs = "*" })

vim.keymap.set({ "n" }, "<space><c-s>", function()
	local args = vim.fn.input("Command: ")
	send_command(args)
end)
