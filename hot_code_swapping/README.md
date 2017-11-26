# Hot code swapping in Elixir

```iex
iex(1)> c "nexter.v1.ex"
[Nexter]
iex(2)> {:ok, pid} = Nexter.start_link
{:ok, #PID<0.89.0>}
iex(3)> Nexter.next pid
0
iex(4)> Nexter.next pid
1
iex(5)> Nexter.next pid
2
iex(6)> c "nexter.v2.ex"
warning: redefining module Nexter (current version defined in memory)
  nexter.v2.ex:1

[Nexter]
iex(7)> Nexter.next pid
"here: 3"
iex(8)> Nexter.next pid
"here: 4"
iex(9)> :sys.suspend pid
:ok
iex(10)> c "nexter.v3.ex"
warning: redefining module Nexter (current version defined in memory)
  nexter.v3.ex:1

[Nexter]
iex(11)> :sys.change_code pid, Nexter, "2", nil
:ok
iex(12)> :sys.resume pid
:ok
iex(13)> Nexter.next pid, "Hello, world"
"here: 5. Prev person said nothing"
iex(14)> Nexter.next pid, "Hola, mundo"
"here: 6. Prev person said Hello, world"
iex(15)>
```
