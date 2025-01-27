return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")

        mc.setup()

        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        -- set({ "n", "v" }, "<up>",
        -- 	function() mc.lineAddCursor(-1) end)
        -- set({ "n", "v" }, "<down>",
        -- 	function() mc.lineAddCursor(1) end)
        -- set({ "n", "v" }, "<leader><up>",
        -- 	function() mc.lineSkipCursor(-1) end)
        -- set({ "n", "v" }, "<leader><down>",
        -- 	function() mc.lineSkipCursor(1) end)

        -- Add or skip adding a new cursor by matching word/selection
        -- set({ "n", "v" }, "<leader>n",
        --     function() mc.matchAddCursor(1) end)
        -- set({ "n", "v" }, "<leader>s",
        --     function() mc.matchSkipCursor(1) end)
        -- set({ "n", "v" }, "<leader>N",
        --     function() mc.matchAddCursor(-1) end)
        -- set({ "n", "v" }, "<leader>S",
        --     function() mc.matchSkipCursor(-1) end)

        set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors, { desc = "Add all matches in the document" })

        -- You can also add cursors with any motion you prefer:
        -- set("n", "<right>", function()
        --     mc.addCursor("w")
        -- end)
        -- set("n", "<leader><right>", function()
        --     mc.skipCursor("w")
        -- end)

        -- Rotate the main cursor.
        set({ "n", "v" }, "<left>", mc.nextCursor, { desc = "Rotate the main cursor" })
        set({ "n", "v" }, "<right>", mc.prevCursor, { desc = "Rotate the main cursor" })

        -- Delete the main cursor.
        set({ "n", "v" }, "<down>", mc.deleteCursor, { desc = "Delete the main cursor" })

        -- Add and remove cursors with control + left click.
        set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add and remove cursors with control + left click" })

        -- Easy way to add and remove cursors using the main cursor.
        set({ "n", "v" }, "<up>", mc.toggleCursor, { desc = "Easy way to add and remove cursors using the main cursor" })

        -- Clone every cursor and disable the originals.
        set({ "n", "v" }, "<leader><up>", mc.duplicateCursors, { desc = "Clone every cursor and disable the originals" })

        set("n", "<esc>", function()
            if not mc.cursorsEnabled() then
                mc.enableCursors()
            elseif mc.hasCursors() then
                mc.clearCursors()
            else

            end
        end)

        -- Bring back cursors if you accidentally clear them.
        set("n", "<leader>gv", mc.restoreCursors, { desc = "Bring back cursors if you accidentally clear them" })

        -- Align cursor columns.
        set("n", "<leader>a", mc.alignCursors, { desc = "Align cursor columns" })

        -- Split visual selections by regex.
        set("v", "S", mc.splitCursors, { desc = "Split visual selections by regex" })

        -- Append/insert for each line of visual selections.
        set("v", "I", mc.insertVisual)
        set("v", "A", mc.appendVisual)

        -- match new cursors within visual selections by regex.
        set("v", "M", mc.matchCursors, { desc = "Match new cursors within visual selections by regex" })

        -- Rotate visual selection contents.
        set("v", "<leader>t",
            function() mc.transposeCursors(1) end)
        set("v", "<leader>T",
            function() mc.transposeCursors(-1) end)

        -- Jumplist support
        set({ "v", "n" }, "<c-i>", mc.jumpForward)
        set({ "v", "n" }, "<c-o>", mc.jumpBackward)

        -- Customize how cursors look.
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { link = "Cursor" })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end
}
