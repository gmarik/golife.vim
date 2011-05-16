## About

During #coderetreat winnipeg we were doing [TDD](http://wiki) for [Convey's Game of Life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

Having accomplished TDD sessions we had to hack working version. That's how [Ruby version was born](https://gist.github.com/972658)

[Some](http://twitter.com/burkelibbey) [folks](http://twitter.com/stefanpenner) were cool enough make it run in Browser using WebGL.

That lead to creation of Vim's version.


## Instuctions

Clone

    $ git clone http://github.com/gmarik/golife.vim ~/golife.vim

Run in Vim

    $ vim ~/golife.vim/golife.vim +'source %' +'GoLife'

The Game of Life will run on the `golife.vim` itself, and you'll see something like this:

![Game of Life running in Vim](https://lh3.googleusercontent.com/_SriKiRB4s00/TdA65ZiJw6I/AAAAAAAAHOk/G3LpJwp8p-0/s512/golife.png)


PS: it was jsut a quick hack
