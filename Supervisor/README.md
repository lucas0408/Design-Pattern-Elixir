# Supervisor

O padrão Supervisor é um dos mais importantes da arquitetura OTP (Open Telecom Platform) do Elixir/Erlang. O princípio do Supervisor é simples: "Deixe falhar, mas recupere-se rapidamente".

## Funcionamento:

- Inicia processos filhos (workers ou outros supervisors)
- Monitora esses processos
- Reinicia-os quando falham, seguindo uma estratégia definida

## Principais estratégias:

- **:one_for_one** - Se um processo filho falhar, apenas esse processo é reiniciado

```elixir
Supervisor.init(children, strategy: :one_for_one)
```

- **:one_for_all** - Se um processo falhar, todos os processos filhos são terminados e reiniciados

```elixir
Supervisor.init(children, strategy: :one_for_all)
```

- **:rest_for_one** - Se um processo falhar, esse processo e todos que foram iniciados depois dele são reiniciados

```elixir
Supervisor.init(children, strategy: :rest_for_one)
```

- **:simple_one_for_one** (Depreciado em versões recentes, substituído por DynamicSupervisor) - Otimizado para quando todos os filhos são do mesmo tipo
