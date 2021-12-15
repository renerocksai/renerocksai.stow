set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
:set laststatus=2
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tomasiser/vim-code-dark'
Plugin 'gruvbox-community/gruvbox'
Plugin 'sainnhe/gruvbox-material.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'Tagbar'
Plugin 'qpkorr/vim-bufkill'

Plugin 'fatih/vim-go'

" dart plus lsp
Plugin 'dart-lang/dart-vim-plugin'
" we replace it by coc Plugin 'natebosch/vim-lsc'
" we replace it by coc  Plugin 'natebosch/vim-lsc-dart'
" Plugin 'neoclide/coc.nvim'
" Plugin 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }


" tmux integration
Plugin 'benmills/vimux'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'stevearc/vim-arduino'

Plugin 'habamax/vim-godot'
Plugin 'ziglang/zig.vim'
Plugin 'eemed/sitruuna.vim'

" Telescope
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-media-files.nvim'
Plugin 'nvim-telescope/telescope-symbols.nvim'
Plugin 'kyazdani42/nvim-web-devicons'

" solidity
Plugin 'tomlion/vim-solidity'

"Firenvim
Plugin 'glacambre/firenvim'

" Emojis
Plugin 'kyuhi/vim-emoji-complete'
Plugin 'xiyaowong/telescope-emoji.nvim'

" telekasten.nvim 
Plugin 'renerocksai/telekasten.nvim'
Plugin 'renerocksai/calendar-vim'
"Plugin 'mattn/calendar-vim'

" lua and lsp stuff
Plugin 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plugin 'tjdevries/nlua.nvim'  " TJ's magic stuff

Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
Plugin 'hrsh7th/cmp-cmdline'
Plugin 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plugin 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plugin 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plugin 'L3MON4D3/LuaSnip' " Snippets plugin

Plugin 'jose-elias-alvarez/null-ls.nvim'
Plugin 'folke/trouble.nvim'

" lua dev
Plugin 'rafcamlet/nvim-luapad'
Plugin 'euclidianAce/BetterLua.vim'
Plugin 'ckipp01/stylua-nvim'

" comments
Plugin 'numToStr/Comment.nvim'

" markdown
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'mzlogin/vim-markdown-toc'

" harpoon
Plugin 'renerocksai/harpoon'

Plugin 'folke/tokyonight.nvim'

Plugin 'kyazdani42/nvim-tree.lua'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set softtabstop=4

autocmd FileType make setlocal noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab| set ai
autocmd FileType vhdl set tabstop=4|set shiftwidth=4|set expandtab| set ai
autocmd FileType pov set tabstop=4|set shiftwidth=4|set expandtab| set ai
autocmd FileType dart set tabstop=2|set shiftwidth=2|set expandtab| set ai

autocmd FileType pov set syntax=rrisc 
autocmd FileType asm set syntax=rrisc 

let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""
" :nnoremap <C-j> <C-W>j
" :nnoremap <C-k> <C-W>k
" :nnoremap <C-h> <C-W>h
" :nnoremap <C-l> <C-W>l

:inoremap <C-j> <C-\><C-n><C-W>j
:inoremap <C-k> <C-\><C-n><C-W>k
:inoremap <C-h> <C-\><C-n><C-W>h
:inoremap <C-l> <C-\><C-n><C-W>l

:tnoremap <C-j> <C-\><C-n><C-W>j
:tnoremap <C-k> <C-\><C-n><C-W>k
:tnoremap <C-h> <C-\><C-n><C-W>h
:tnoremap <C-l> <C-\><C-n><C-W>l

" resize windows via wasd keys if mouse cannot dig it 
nnoremap <silent> <Leader>j :exe "resize +5" <CR>
nnoremap <silent> <Leader>k :exe "resize -5" <CR>
nnoremap <silent> <Leader>l :exe "vertical resize +5" <CR>
nnoremap <silent> <Leader>h :exe "vertical resize -5" <CR>
""""""""""""""""""""""""""""""""""""""""""

set mouse=a

if !has('nvim')
  set ttymouse=xterm2
  set clipboard+=unnamedplus
endif

let g:highlightedyank_highlight_duration = 100
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"let g:airline_theme='coderene'
":colorscheme codedark

let g:gruvbox_material_background='medium'
:colorscheme gruvbox-material

command Term :term ++curwin
command Vterm :vertical term

"set splitright
set splitbelow
set bs=2
set autowrite

" Quickfix list
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
map <leader>b :make<CR>
map <C-c> :copen<CR>
nnoremap <leader>c :cclose<CR>

" GO
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
set completeopt-=preview

"enable visual bell
:set vb
:set t_vb=

:set cursorline
:hi CursorLine   cterm=NONE ctermbg=236 ctermfg=NONE guibg=grey18
:set guifont=Consolas:h16
" on laptop display:
":set guifont=Consolas:h11


" Dart
let g:lsc_auto_map = { 'defaults': v:true, 'PreviousReference': '<leader>p' }
let g:dart_style_guide = 2

" VIM's built-in netrw (explorer: VExplore / SExplore)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
nmap <leader>e :Vexplore <CR>

" Vimux
nmap <leader>T :VimuxPromptCommand <CR>
nmap <leader>t :VimuxRunLastCommand<CR>

"givm
set guifont=Consolas

" vim RC editing
nnoremap <leader>E :edit $MYVIMRC<CR>
nnoremap <leader>S :source $MYVIMRC<CR>
inoremap jk <esc>

"""""""""""""""""""""""""""""""""""""""
" COC
"""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

"set relativenumber

set number
set hlsearch
hi Search ctermfg=192 ctermbg=199

" close all buffers but this one
command! BufOnly silent! execute "%bd|e#|bd#"

set exrc

:tnoremap <leader><Esc> <C-\><C-n>

:set colorcolumn=120

" harpoon
:lua << END
require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" }
    },
    -- ... your other configs ...
})
END


"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>

lua << END
-- harpoon
require('telescope').setup({
  defaults = {
      cache_picker = false,
    layout_config = {
      vertical = { width = 0.5 },
      -- other layout configuration here
      horizontal = { preview_width = 0.7, width = 0.9, },
      prompt_position = "bottom",
    },
    -- other defaults configuration here
    winblend=0,
  },
  -- other configuration values here
  extensions = {
      media_files = {
        find_cmd = 'rg',
      },
  },
})

require("telescope").load_extension('harpoon')
require("telescope").load_extension('media_files')

print("Telescope is configured")
END

" Comment.nvim
lua require('Comment').setup()

" Telekasten
lua << END
local home = vim.fn.expand('~/zettelkasten')
require('telekasten').setup({
	home = home,
	dailies = home .. "/" .. "daily",
	weeklies = home .. "/" .. "weekly",
	templates = home .. "/" .. "templates",

	-- image subdir for pasting
	-- subdir name
	-- or nil if pasted images shouldn't go into a special subdir
	image_subdir = nil,

	-- markdown file extension
	extension = ".md",

	-- following a link to a non-existing note will create it
	follow_creates_nonexisting = true,
	dailies_create_nonexisting = true,
	weeklies_create_nonexisting = true,

	-- templates for new notes
	template_new_note = home .. "/" .. "templates/new_note.md",
	template_new_daily = home .. "/" .. "templates/daily_tk.md",
	template_new_weekly = home .. "/" .. "templates/weekly_tk.md",

	-- image link style
	-- wiki:     ![[image name]]
	-- markdown: ![](image_subdir/xxxxx.png)
	image_link_style = "markdown",

	-- integrate with calendar-vim
	plug_into_calendar = true,
	calendar_opts = {
		-- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
		weeknm = 4,
		-- use monday as first day of week: 1 .. true, 0 .. false
		calendar_monday = 1,
		-- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
		calendar_mark = "left-fit",
	},
    debug = false,

    close_after_yanking = false,
    insert_after_inserting = true,

    -- make syntax available to markdown buffers and telescope previewers
    install_syntax = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",
})
END

autocmd filetype markdown set tw=120
nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
nnoremap <leader>zC :CalendarT<CR>
nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
nnoremap <leader>zr :lua require('plenary.reload').reload_module('telekasten')<CR>
nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
nnoremap <leader>zI :lua require('telekasten').insert_img_link({i = true})<CR>
nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
nnoremap <leader>z :lua require('telekasten').panel()<CR>
nnoremap <leader>za :lua require('telekasten').show_tags()<CR>

noremap <leader>P :MarkdownPreviewToggle<CR>

" autocmd FileType markdown set syntax=telekasten

hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray

" real yellow
hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
" gruvbox
hi tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold

hi link CalNavi CalRuler
hi tkTagSep ctermfg=gray guifg=gray
hi tkTag ctermfg=175 guifg=#d3869B

if has('termguicolors')
  set termguicolors
endif

" note: we define [[ in **insert mode** to call insert link
" note: we don't do this anymore - maybe it makes sense to limit to markdown
" mode
inoremap <leader>[ <ESC>:lua require('telekasten').insert_link({i = true})<CR>
" inoremap [[ <ESC>:lua require('telekasten').insert_link({i = true})<CR>
inoremap <leader>zt <ESC>:lua require('telekasten').toggle_todo({i = true})<CR>
inoremap <leader># <cmd>lua require('telekasten').show_tags({i = true})<cr>


" fugitive
nnoremap <leader>gg :G<CR>
nnoremap <leader>gt :G commit<CR>
nnoremap <leader>gp :G push<CR>

" Firenvim
let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }
let fc = g:firenvim_config['localSettings']
" let fc['https?://[^/]+\.co\.uk/'] = { 'takeover': 'never', 'priority': 1 }
let fc['.*'] = { 'takeover': 'never', 'priority': 1 }

" Emojis
let g:emoji_complete_overwrite_standard_keymaps = 0
lua vim.api.nvim_set_keymap('i', 'eE', '<cmd>Telescope symbols<cr>', {noremap=true})

" Renes awesome umlauts
inoremap <leader><leader>a ä
inoremap <leader><leader>o ö
inoremap <leader><leader>u ü
inoremap <leader><leader>A Ä
inoremap <leader><leader>O Ö
inoremap <leader><leader>U Ü
inoremap <leader><leader>s ß
inoremap <leader>lg LG<CR>Rene<CR><CR>_________________________________________________________________________<CR>

" lua nvim coding
autocmd filetype lua setlocal makeprg=luacheck
autocmd filetype lua command! Check make --no-color .
autocmd filetype lua command! Format lua require("stylua-nvim").format_file()
autocmd filetype lua command! FormatLua lua require("stylua-nvim").format_file()

" harpoon mappings
"
" left index finger
nnoremap <space><space>f :lua require("harpoon.ui").toggle_quick_menu()<CR>
" lift the finger to do sth 'dangerous'
nnoremap <space><space>g :lua require("harpoon.mark").add_file()<CR>
"
" right home row, no finger lifting required
nnoremap <space><space>j :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <space><space>k :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <space><space>l :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <space><space>; :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <space><space>e :NvimTreeToggle<CR>
nnoremap <space><space>t :TroubleToggle<CR>

" thePrimeagen - inspired
" greatest remap ever
xnoremap <leader>p "_dP
xnoremap <leader>p "y

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d
" end of thePrimeagen
nnoremap <leader>p "+p

" tmux navigator
" write all buffers before navigating from vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" search results in the middle
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

""" lsp shit
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local lspconfig = require('lspconfig')



-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup ({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
        }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
      { name = 'path' },
  }, {
  { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = buffer }
    }
})
 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pylsp' }

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- now do the same with nlua
require('nlua.lsp.nvim').setup(lspconfig, {
    on_attach = on_attach,

    globals = {
        -- extra globals would go here
    }
})

-- now comes zls
nvim_lsp.zls.setup({
    default_config = {
        cmd = {"/home/rs/bin/zls"},
        filetypes = {"zig"},
        root_dir = lspconfig.util.root_pattern("build.zig", ".git"),
        },
    docs = {
        description = [[ ]];
        default_config = {
             root_dir = [[root_pattern("build.zig", ".git")]];
        }
    },
    on_attach = on_attach,
})

-- null-ls
local null_ls = require('null-ls')
local fmt = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    fmt.trim_whitespace.with({
      filetypes = { "text", "sh", "zsh", "yaml", "toml", "make", "conf", "lua" },
    }),
    fmt.black,
    fmt.stylua,
    fmt.markdownlint.with({
      filetypes = { "md", "markdown", "vimwiki", "telekasten" },
    }),
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
EOF

" lua-tree
lua << EOF
local nvt = require('nvim-tree')
local tree_cb = require('nvim-tree.config').nvim_tree_callback
nvt.setup({ })
EOF

" trouble
lua << EOF
require('trouble').setup({
    -- here
})
EOF

