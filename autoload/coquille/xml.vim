
function! coquille#xml#2str(xml)
  if type(a:xml) == v:t_string
    return coquille#xml#unescape(a:xml)
  endif

  let res = ''
  for el in a:xml.child
    let res ..= coquille#xml#2str(el)
  endfor

  return res
endfunction

" CoqTop only supports &lt; , &gt; , &quot; , &apos , &amp;
" though &#34; euqals to &quot;
function! coquille#xml#escape(str) abort
  let res = a:str
  let res = substitute(res, '&', '\&amp;', 'g')
  let res = substitute(res, '<', '\&lt;', 'g')
  let res = substitute(res, '>', '\&gt;', 'g')
  let res = substitute(res, '"', '\&quot;', 'g')
  let res = substitute(res, "'", '\&apos;', 'g')
  return res
endfunction

function! coquille#xml#unescape(str) abort
  let res = a:str
  let res = substitute(res, '\c&lt;', '<', 'g')
  let res = substitute(res, '\c&gt;', '>', 'g')
  let res = substitute(res, '\c&nbsp;', ' ', 'g')
  let res = substitute(res, '\c&apos;', "'", 'g')
  let res = substitute(res, '\c&quot;', '"', 'g')
  let res = substitute(res, '\c&amp;', '\&', 'g')
  return res
endfunction

