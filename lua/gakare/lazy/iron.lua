return {
    {
        "vigemus/iron.nvim",
        config = function()
            local iron = require("iron.core")
            -- local view = require("iron.view")
            local common = require("iron.fts.common")

            vim.keymap.set("n", "<leader>IS", function() iron.run_motion("send_motion") end)
            vim.keymap.set("n", "<leader>IV", function() iron.send(nil, iron.mark_visual()) end)

            iron.setup {
                config = {
                    scratch_repl = true,
                    repl_definition = {
                        sh = {
                            command = { "bash" }
                        },
                        python = {
                            command = { "ipython", "--no-autoindent" },
                            format = common.bracketed_paste_python,
                            block_dividers = { "# %%", "#%%" },
                        }
                    },
                    repl_filetype = function(bufnr, ft)
                        return ft
                    end,
                    repl_open_cmd = "horizontal split",
                },
                keymaps = {
                    toggle_repl = "<space>rr", -- toggles the repl open and closed.
                    -- If repl_open_command is a table as above, then the following keymaps are
                    -- available
                    -- toggle_repl_with_cmd_1 = "<space>rv",
                    -- toggle_repl_with_cmd_2 = "<space>rh",
                    restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
                    send_motion = "<space>sc",
                    visual_send = "<space>sc",
                    send_file = "<space>sf",
                    send_line = "<space>sl",
                    send_paragraph = "<space>sp",
                    send_until_cursor = "<space>su",
                    send_mark = "<space>sm",
                    send_code_block = "<space>sb",
                    send_code_block_and_move = "<space>sn",
                    mark_motion = "<space>mc",
                    mark_visual = "<space>mc",
                    remove_mark = "<space>md",
                    cr = "<space>s<cr>",
                    interrupt = "<space>s<space>",
                    exit = "<space>sq",
                    clear = "<space>cl",
                },
                -- If the highlight is on, you can change how it looks
                -- For the available options, check nvim_set_hl
                highlight = {
                    italic = true
                },
                ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            }
        end,
    },
}
