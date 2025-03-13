### Pipeline

O padrão pipeline (`|>`) em Elixir permite passar o resultado de uma expressão para o primeiro argumento da próxima função. Exemplo:

```elixir
valor |> funcao1() |> funcao2() |> funcao3()  
```

```elixir
funcao3(funcao2(funcao1(valor)))
````