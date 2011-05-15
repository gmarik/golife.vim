## About

During #coderetreat winnipeg we were practicing TDD-ing our solutions of [Convey's Game of Life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

After doing TDD session we were allowed to quickly hack working version. That's how [Ruby version were born](https://gist.github.com/972658)

[Some](http://twitter.com/burkelibbey) [folks](http://twitter.com/stefanpenner) were cool enough to code it to run in Browser using WebGL.

So I thought why not run it in Vim aswell?


## Instuctions

Clone

    $ git clone http://github.com/gmarik/golife.vim ~/golife.vim

Run in Vim

    $ vim ~/golife.vim/golife.vim +'source %' +'GoLife'

The Game of Life will run on the `golife.vim` itself, and you'll see something like this:

![Game of Life running in Vim](https://lh3.googleusercontent.com/_SriKiRB4s00/TdA65ZiJw6I/AAAAAAAAHOk/G3LpJwp8p-0/s512/golife.png)


PS: it was jsut a quick hack
