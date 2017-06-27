# 99 Problems

This is/was an attempt at getting the fundamentals down in Elixir. I went
[here](https://wiki.haskell.org/99_questions) and started from the beginning.

You can check them out by doing `iex 01.ex` and then

```ex
P01.last([1, 2, 3, 4])
```

and so on...

These are not the best solutions. They are me learning the language. My
previous (limited) experience in Haskell was a big help.

One thing that didn't dawn on me for a while was that you should *not* try to
account for invalid input by providing error messages and such. So if you are
writing a function that only expects positive integers, you simply state in
your function signature that `n` should be above zero.

```ex
def fix(n) when n > 0 do
    # ...
end
```

Another thing that I learned is that the type system is fairly powerful. It
seems like you never really define anything, yet the compiler catches a lot of
stuff for you. As much as I miss a more explicit and solid type system, it
isn't nearly as bad as I thought.
