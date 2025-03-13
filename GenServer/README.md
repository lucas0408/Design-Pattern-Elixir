### GenServer

O **GenServer** é um dos padrões mais importantes em Elixir. Ele tem o objetivo de implementar um servidor de caráter geral que mantém o estado e pode lidar com requisições síncronas e assíncronas.

O **GenServer** funciona através de processos isolados que:

- Mantêm um estado interno.
- Processam mensagens de forma sequencial.
- Respondem a chamadas síncronas (chamada e espera pela resposta).
- Processam mensagens assíncronas (envia e continua a execução).

### Componentes principais de um GenServer

1. **API Cliente**: Funções responsáveis por interagir com o GenServer.
2. **Callbacks do Servidor**: Funções do GenServer que processam mensagens.
3. **Estado**: Dados mantidos entre as chamadas.

### Callbacks importantes

- `init/1`: Inicia o estado.
- `handle_call/3`: Processa chamadas síncronas, onde o cliente espera uma resposta do GenServer.
- `handle_cast/2`: Processa chamadas assíncronas, onde o cliente não espera uma resposta do GenServer.
- `handle_info/2`: Lida com outras mensagens (timeouts, mensagens de outros processos).
- `terminate/2`: Executado quando o servidor está sendo desligado.


