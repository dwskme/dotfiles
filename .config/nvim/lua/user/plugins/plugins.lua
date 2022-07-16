local utils = require "user.utils"
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
end
vim.cmd [[packadd packer.nvim]]

local _packer, packer = pcall(require, "packer")

if not _packer then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = true,
}

return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { "lewis6991/impatient.nvim" }

    -- added
    use { "nathom/filetype.nvim", commit = "b522628a45a17d58fc0073ffd64f9dc9530a8027"}
    use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }  --delete buffers without closing your windows or messing up your layout.
    use { "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" } --statusline vim
    use { "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" }
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
    use { "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" }
    use { "declancm/cinnamon.nvim" ,commit= "da5880d7fdd10cfa07df5c96b2bf22ff5d264019" }
    use { "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim"}
    use { "folke/todo-comments.nvim",requires = "nvim-lua/plenary.nvim"}
    use { "filipdutescu/renamer.nvim",branch = 'master', requires =  {"nvim-lua/plenary.nvim"} }
    use { "mvllow/modes.nvim" , commit = "095042fca156573744f7ed542f401d02c32bdd25"}
    use { "max397574/better-escape.nvim", commit ="d5ee0cef56a7e41a86048c14f25e964876ac20c1"}
    use { "gelguy/wilder.nvim",commit="86f5fb0962bc5954babf267ded6b144d992aef85" }
    use { "rcarriga/nvim-notify"}
    use { "simrat39/symbols-outline.nvim"}
    use { "liuchengxu/vista.vim" }
    use { "Raimondi/delimitMate" } --check this plugin need or not cuz its not been update . serach its alternative
    use { "danymat/neogen", config = function() require('neogen').setup {} end, requires = "nvim-treesitter/nvim-treesitter" }
    use { "dstein64/vim-startuptime" }
    use { "kevinhwang91/nvim-ufo", requires = 'kevinhwang91/promise-async'}
    use { "metakirby5/codi.vim"}
    --added








    -- UI
    use { "rmehri01/onenord.nvim" }
    use { "projekt0n/github-nvim-theme" }
    use { "ellisonleao/gruvbox.nvim" }
    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require "user.plugins.configs.icons"
        end,
    }
    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
    }
    -- use {
    --     "folke/which-key.nvim",
    -- }
    use {
        "karb94/neoscroll.nvim",
        config = function()
            require "user.plugins.configs.neoscroll"
        end,
    }
    use {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require "user.plugins.configs.feline"
        end,
    }

    -- -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        run = ":TSUpdate",
    }

    -- -- Utilities
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-node-modules.nvim",
        },
    }
    -- Telescope extensions
    use { "cljoly/telescope-repo.nvim"}
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "dhruvmanila/telescope-bookmarks.nvim"}
    use { "nvim-telescope/telescope-github.nvim"}
    -- Trying command palette
    use { "LinArcX/telescope-command-palette.nvim" }
    use { "AckslD/nvim-neoclip.lua",config = function() require("neoclip").setup()end,}
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "jvgrootveld/telescope-zoxide"}

    -- DAP
    use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
    use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
    use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }
    use { "nvim-telescope/telescope-dap.nvim", requires = {"nvim-telescope/telescope.nvim"}, commit = "b4134fff5cbaf3b876e6011212ed60646e56f060"}
    use { "theHamsta/nvim-dap-virtual-text", commit = "10368a11d175633f00ee6afb49708e42ae70ae7d"}



    use {
        "lukas-reineke/indent-blankline.nvim",
    }
    use {
        "windwp/nvim-autopairs",
        setup = function()
            -- utils.packer_lazy_load "nvim-autopairs"
        end,
    }
    use {
        "tpope/vim-surround",
        setup = function()
            -- utils.packer_lazy_load "vim-surround" --TODO:check
        end,
    }
    use {
        "norcalli/nvim-colorizer.lua",
    }
    use { "gpanders/editorconfig.nvim" }

    -- LSP
    use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
    use { "RRethy/vim-illuminate", commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" }
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "folke/lua-dev.nvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        "j-hui/fidget.nvim",
        config = function()
            require "user.plugins.configs.fidget"
        end,
    }

    -- -- Comment
    use {
        "numToStr/Comment.nvim",
        setup = function()
            -- utils.packer_lazy_load "Comment.nvim"
        end,
    }

    -- -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            --added
            "David-Kunz/cmp-npm", --TODO:check this is not working
            "petertriho/cmp-git",
            "hrsh7th/cmp-calc",
            "ray-x/cmp-treesitter",
            "lukas-reineke/cmp-rg",         --what does it do..
            "hrsh7th/cmp-emoji",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require "user.plugins.configs.cmp"
        end,
    }

    -- -- Snippets
    use {
        "dsznajder/vscode-es7-javascript-react-snippets",
        run = "yarn install --frozen-lockfile && yarn compile",
        setup = function()
            -- utils.packer_lazy_load "vscode-es7-javascript-react-snippets"
        end,
    }

    use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
    use {
        "rafamadriz/friendly-snippets",
        setup = function()
            -- utils.packer_lazy_load "friendly-snippets"
        end,
    }

    -- Tmux
    use {
        "aserowy/tmux.nvim",
        config = function()
            require "user.plugins.configs.tmux"
        end,
    }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        setup = function()
            -- utils.packer_lazy_load "gitsigns.nvim"
        end,
    }

    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
