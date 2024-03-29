return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            lua = { "luacheck" },
            c = { "cpplint" },
            cpp = { "cpplint" },
            python = { "pylint" },
            java = { "checkstyle" },
            markdown = { "vale" },
            cmake = { "cmake-lint" },
            make = { "checkmake" }
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
                -- Linters used in all filetypes
                lint.try_lint("woke")
                lint.try_lint("alex")
                lint.try_lint("codespell")
            end
        })
    end
}
