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
Plugin 'flazz/vim-colorschemes'
Plugin 'Tagbar'
Plugin 'qpkorr/vim-bufkill'

Plugin 'fatih/vim-go'

" dart plus lsp
Plugin 'dart-lang/dart-vim-plugin'
" we replace it by coc Plugin 'natebosch/vim-lsc'
" we replace it by coc  Plugin 'natebosch/vim-lsc-dart'
Plugin 'neoclide/coc.nvim'
Plugin 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" tmux integration
Plugin 'benmills/vimux'
Plugin 'roxma/vim-tmux-clipboard'

Plugin 'stevearc/vim-arduino'

Plugin 'habamax/vim-godot'
Plugin 'ziglang/zig.vim'
Plugin 'eemed/sitruuna.vim'

" Telescope
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

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

" lua dev
Plugin 'rafcamlet/nvim-luapad'
Plugin 'euclidianAce/BetterLua.vim'
Plugin 'ckipp01/stylua-nvim'

" comments
Plugin 'numToStr/Comment.nvim'

Plugin 'iamcco/markdown-preview.nvim'

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
:nnoremap <C-j> <C-W>j
:nnoremap <C-k> <C-W>k
:nnoremap <C-h> <C-W>h
:nnoremap <C-l> <C-W>l

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
:colorscheme gruvbox

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


:nmap <space>E :CocCommand explorer<CR>
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

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

:set exrc

:tnoremap <leader><Esc> <C-\><C-n>

:set colorcolumn=120

"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << END
require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.5 },
      -- other layout configuration here
      horizontal = { preview_width = 0.7, width = 0.9, },
    },
    -- other defaults configuration here
    winblend=0,
  },
  -- other configuration values here
})
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
    debug = true,
})
END

autocmd filetype markdown set tw=120
nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zt :lua require('telekasten').goto_today()<CR>
nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
nnoremap <leader>zC :CalendarT<CR>
nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>

noremap <leader>p :MarkdownPreviewToggle<CR>

hi tklink ctermfg=72 cterm=bold,underline
hi tkBrackets ctermfg=gray
hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold

" note: we define [[ in **insert mode** to call insert link
" note: we don't do this anymore - maybe it makes sense to limit to markdown
" mode
inoremap <leader>[ <ESC>:lua require('telekasten').insert_link()<CR>
inoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>

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
imap eE <Plug>(emoji-start-complete)
imap <leader><leader>e <Plug>(emoji-start-complete)


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
autocmd filetype lua command Check make --no-color .
autocmd filetype lua command! Format lua require("stylua-nvim").format_file()
autocmd filetype lua command! FormatLua lua require("stylua-nvim").format_file()

