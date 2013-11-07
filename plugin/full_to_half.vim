" if full_to_half was already loaded then finish"
if exists('g:full_to_half_loaded')
    finish
endif

" save default cpo
let s:save_cpo = &cpo
set cpo&vim




" define Command
command! FullToHalf call s:full_to_half.substitute()


let s:full_to_half = {}

" key   : fullwidht char
" value : halfwidth char
let s:full_to_half.table = {
\                           '　' : ' '
\                           , '（' : '('
\                           , '）' : ')'
\                           , '：' : ':'
\                           , '｜' : '|'
\                           , '＿' : '_'
\                           , '？' : '?'
\                           , '！' : '!'
\                           , '”'  : '"'
\                           , '“'  : '"'
\                           , '＠' : '@'
\                           , '～' : '\~'
\                           , '／' : '\/'
\                           , '＆' : '\&'
\                           , '＜' : '\<'
\                           , '＞' : '\>'
\                           , '’'  : "'"
\                           , '￥' : '\\'
\                           , '＊' : '*'
\                           , '０' : '0'
\                           , '１' : '1'
\                           , '２' : '2'
\                           , '３' : '3'
\                           , '４' : '4'
\                           , '５' : '5'
\                           , '６' : '6'
\                           , '７' : '7'
\                           , '８' : '8'
\                           , '９' : '9'
\                           , 'ａ' : 'a'
\                           , 'Ａ' : 'A'
\                           , 'ｂ' : 'b'
\                           , 'Ｂ' : 'B'
\                           , 'ｃ' : 'c'
\                           , 'Ｃ' : 'C'
\                           , 'ｄ' : 'd'
\                           , 'Ｄ' : 'D'
\                           , 'ｅ' : 'e'
\                           , 'Ｅ' : 'E'
\                           , 'ｆ' : 'f'
\                           , 'Ｆ' : 'F'
\                           , 'ｇ' : 'g'
\                           , 'Ｇ' : 'G'
\                           , 'ｈ' : 'h'
\                           , 'Ｈ' : 'H'
\                           , 'ｉ' : 'i'
\                           , 'Ｉ' : 'I'
\                           , 'ｊ' : 'j'
\                           , 'Ｊ' : 'J'
\                           , 'ｋ' : 'k'
\                           , 'Ｋ' : 'K'
\                           , 'ｌ' : 'l'
\                           , 'Ｌ' : 'L'
\                           , 'ｍ' : 'm'
\                           , 'Ｍ' : 'M'
\                           , 'ｎ' : 'n'
\                           , 'Ｎ' : 'N'
\                           , 'ｏ' : 'o'
\                           , 'Ｏ' : 'O'
\                           , 'ｐ' : 'p'
\                           , 'Ｐ' : 'P'
\                           , 'ｑ' : 'q'
\                           , 'Ｑ' : 'Q'
\                           , 'ｒ' : 'r'
\                           , 'Ｒ' : 'R'
\                           , 'ｓ' : 's'
\                           , 'Ｓ' : 'S'
\                           , 'ｔ' : 't'
\                           , 'Ｔ' : 'T'
\                           , 'ｕ' : 'u'
\                           , 'Ｕ' : 'U'
\                           , 'ｖ' : 'v'
\                           , 'Ｖ' : 'V'
\                           , 'ｗ' : 'w'
\                           , 'Ｗ' : 'W'
\                           , 'ｘ' : 'x'
\                           , 'Ｘ' : 'X'
\                           , 'ｙ' : 'y'
\                           , 'Ｙ' : 'Y'
\                           , 'ｚ' : 'z'
\                           , 'Ｚ' : 'Z'
\                          }


" create substitute command
function! s:full_to_half.substitute() dict
    let substitute_list =
    \           values(map(deepcopy(get(g:, 'full_to_half', self.table))
    \           , '":silent %s/" . v:key . "/" . v:val . "/ge"'))
    call s:bleiben_execute(substitute_list)
endfunction

" execute commands
function! s:bleiben_execute(cmd_list)
    let l:pos = getpos('.')
    for cmd in a:cmd_list
        execute cmd
    endfor
    call setpos('.', l:pos)
endfunction




" end process
let &cpo = s:save_cpo
unlet s:save_cpo

let g:full_to_half_loaded = 1
