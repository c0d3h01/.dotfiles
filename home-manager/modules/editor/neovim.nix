{ config, pkgs, lib ? pkgs.lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Install plugins
    plugins = with pkgs.vimPlugins; [
      vim-sensible
      vim-commentary
      vim-surround
      vim-lastplace
      vim-sleuth
      telescope-nvim
      nvim-web-devicons
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      onedark-nvim
    ];

    # Extra packages to make available to neovim
    extraPackages = with pkgs; [
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      lua-language-server
      rust-analyzer
      nil # Nix language server
      ripgrep
      fd
    ];

    # Configure Neovim with init.lua
    extraLuaConfig = ''
      -- Set colorscheme
      vim.cmd('colorscheme onedark')
      
      -- Basic settings
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.expandtab = true
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2
      vim.o.softtabstop = 2
      vim.o.ignorecase = true
      vim.o.smartcase = true
      vim.o.mouse = 'a'
      vim.o.termguicolors = true
      vim.o.updatetime = 300
      vim.o.timeoutlen = 500
      vim.o.completeopt = 'menuone,noselect'
      
      -- Setup LSP and completion
      require('lspconfig').ts_ls.setup{}
      require('lspconfig').rust_analyzer.setup{}
      require('lspconfig').nil_ls.setup{}

      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' }
        })
      })

      -- Keymaps for better navigation
      local keymap = vim.api.nvim_set_keymap
      keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
      keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
      keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

      -- Telescope setup
      local telescope = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
      vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
      vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
      vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
    '';
  };
}


