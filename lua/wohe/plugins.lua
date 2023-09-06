local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    -- Packer itself
    use "wbthomason/packer.nvim"

    -- Color schemes
    use "ellisonleao/gruvbox.nvim"

    -- Fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- Git graph
    use {
        "rbong/vim-flog",
        requires = { "tpope/vim-fugitive" }
    }

    -- File browser
    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

