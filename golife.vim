" Convey's Game of life running on Vim
"
" Author: gmarik
" Home: http://github.com/gmarik
"
comm! GoLife  :echo 'Press CTRL-C to stop the world' | call s:golife()

let s:world = {'lines':-1}

fun! s:world.neighbours(x,y) abort
  return filter([
  \   self.at(a:x - 1, a:y - 1),
  \   self.at(a:x    , a:y - 1),
  \   self.at(a:x + 1, a:y - 1),
  \   self.at(a:x - 1, a:y    ),
  \   self.at(a:x + 1, a:y    ),
  \   self.at(a:x - 1, a:y + 1),
  \   self.at(a:x    , a:y + 1),
  \   self.at(a:x + 1, a:y + 1),
  \ ],'v:val != " "')
endf

fun! s:cell(x,y, char) abort
  call setpos('.',[0, a:y+1, a:x+1, 0])
  exec ':norm r'.a:char
endf

fun! s:world.get_lines()
  if type(self.lines) == type([])
    return self.lines
  endif
  let self.lines = getline(1,line('$'))
  return self.lines
endf

fun! s:world.at(x,y) abort 
  let lines = self.get_lines()
  if (a:y >= len(lines) || a:y < 0)
    return " "
  endif

  if (a:x >= len(lines[a:y]) || a:x < 0)
    return " "
  end

  return lines[a:y][a:x]
endf

fun! s:to_list(s)
  let i = 0
  let arr = []
  while i < len(a:s)
    call add(arr, a:s[i])
    let i = i + 1
  endwhile
  return arr
endf

fun! s:world.next() abort 
  exec ':1'

  let w = copy(s:world)

  let [x, y] = [-1, -1]

  for l in self.get_lines()
    let y = y + 1
    let x = -1
    for c in s:to_list(l)
      let x = x + 1
      call self.born(x,y)
    endfor
  endfor
  let self.lines = -1
  return w
endf

fun! s:world.born(x, y) abort
	" let self.lines = getline(1,line('$'))
  let [x,y] = [a:x, a:y]
  let cnt = len(self.neighbours(x,y))

  let cell = self.at(x,y)

  if cell =~ '\S'
    if cnt >= 2 && cnt <= 3
      " keep
      " call s:cell(x,y, cell)
    else
      " kill
      call s:cell(x,y, ' ')
    end
  else " empty
    " with 3 neighbs
    if 3 == cnt
      "newborn
      call s:cell(x,y, '#')
    else
      " epmty
      " call s:cell(x,y, ' ')
    endif
  endif
endf


fun! s:golife() abort
  let b:world = copy(s:world)
  while 1
    call b:world.next()
    redraw!
    sleep 1m
  endw
endf

"   #                                               
" # #                                               
"  ##                                               
"                                                   
"                                    ##             
"                                    ##             
"                                                   
"                                                   
"                                                   
"                                                   
"   #                     ###                           
" # #                                                   
"  ##                      #                            
"                          #                            
"                          #                            
"                                                   
"                                                   
"                                                   
"                                                   
"                                                   
"                                                   
"                               ###                 
"                                #                  
"                                #                  
"                                                   
"                                                   
"                                                   
"                                                   
"                  # #                            
"                 # # #                           
"                  # #                            
                                                  
"                  # #                            
"                 # # #                           
"                  # #                            
"                                                   
"                                                   
"                                                   
"                                                   
"                                                   
"                                                   
"                                                   

