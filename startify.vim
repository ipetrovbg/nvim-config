function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
			\ { 'type': function('s:gitModified'),  'header': ['   Git modified']},
			\ { 'type': function('s:gitUntracked'), 'header': ['   Git untracked']},
        \ { 'type': 'dir',       'header': ['   Recent project files '] },
        \ ]
