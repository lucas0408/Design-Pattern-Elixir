defmodule MyApp do
  use Application

  #função que inicializa supervisor principal
  def start(_type, _args) do

    #Cada item de children é um par, onde o primeiro elemento é o módulo do processo a ser supervisionado
    #e o segundo e o segundo é o argumento que será passado ao start_link/2
    children = [
      # Supervisor para banco de dados
      {MyApp.Database.Supervisor, []},
      
      # Supervisor para serviços web
      {MyApp.Web.Supervisor, []},
      
      # Processo worker individual
      {MyApp.BackgroundJob, []}
    ]

    # Supervisor principal (Top-level)
    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    #inicializa o supervisor PRINCIPAL, onde children é a lista de processos filhos e opts, defini a opção de supervisão
    Supervisor.start_link(children, opts)
  end
end


#seguindo a lista children, supervisor principal vai tentar iniciar esse módulo com a chamada: MyApp.Database.Supervisor.start_link([])   
defmodule MyApp.Database.Supervisor do
  use Supervisor

  #Recebe []  
  def start_link(init_arg) do
    #Supervisor interno chama init/1
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {MyApp.Database.Connection, []},
      {MyApp.Database.Cache, []}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end

defmodule MyApp.Web.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {MyApp.Web.Endpoint, []},
      {MyApp.Web.RateLimit, []}
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end