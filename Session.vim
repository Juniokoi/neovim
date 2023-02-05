let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +10 ~/.config/wezterm/wezterm.lua
argglobal
%argdel
$argadd ~/.config/wezterm/wezterm.lua
edit ~/.config/wezterm/wezterm.lua
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <expr> <BS> v:lua.MPairs.autopairs_bs()
xnoremap <buffer> <silent>  :lua require'nvim-treesitter.incremental_selection'.node_incremental()
xnoremap <buffer> <silent> <nop> :lua require'nvim-treesitter.incremental_selection'.scope_incremental()
xnoremap <buffer> <silent> <C-Bslash> :lua require'nvim-treesitter.incremental_selection'.node_incremental()
xnoremap <buffer> <silent> <BS> :lua require'nvim-treesitter.incremental_selection'.node_decremental()
inoremap <buffer> <config.e> l<Cmd>lua require('nvim-autopairs.fastwrap').show()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal cinscopedecls=public,protected,private
setlocal colorcolumn=
setlocal comments=:--
setlocal commentstring=--\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorbind
setlocal cursorcolumn
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=\\<function\\|\\<local\\%(\\s\\+function\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'lua'
setlocal filetype=lua
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=v:lua.require('pretty-fold').foldtext.global()
setlocal formatexpr=v:lua.vim.lsp.formatexpr()
setlocal formatoptions=jcroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=\\v<((do|load)file|require)\\s*\\(?['\"]\\zs[^'\"]+\\ze['\"]
setlocal includeexpr=tr(v:fname,'.','/')
setlocal indentexpr=nvim_treesitter#indent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal linebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=v:lua.vim.lsp.omnifunc
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=noplainbuffer
setlocal statuscolumn=
setlocal statusline=%<%#lualine_c_2_command#▊\ %#lualine_c_normal#%#lualine_c_3_command#\ %#lualine_c_normal#%#lualine_c_4_command#\ \ ~/.config/nvim\ %#lualine_c_normal#%#lualine_c_filetype_DevIconLua_command#\ \ %#lualine_c_normal#%#lualine_c_normal#%#lualine_c_filename_command#\ wezterm.lua\ [+]\ %#lualine_c_normal#%#lualine_c_normal#\ 1.8k\ %#lualine_c_progress_command#\ 8%%\ %#lualine_c_normal#%#lualine_c_normal#\ %=\ %#lualine_c_normal#%=%#lualine_x_12_command#\ utf-8\ %#lualine_c_normal#%#lualine_x_fileformat_command#\ \ %#lualine_c_normal#%#lualine_x_17_command#\ LSP:\ \ %#lualine_c_normal#%#lualine_x_18_command#\ ▊
setlocal suffixesadd=.lua
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=v:lua.vim.lsp.tagfunc
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal winbar=%#LspSagaWinbarFolder#\ %*%#LspSagaWinbarFolderName#wezterm%*%#LspSagaWinbarSep#\ %*%#LspSagaWinbarFileIcon#\ %*%#LspSagaWinbarFile#wezterm.lua%*%#LspSagaWinbarSep#\ %*%#LspSagaWinbarObject#\ return%#LspSagaWinbarSep#\ %*%#LspSagaWinbarNumber#\ line_height
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal nowrap
setlocal wrapmargin=0
let s:l = 7 - ((6 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 021|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
