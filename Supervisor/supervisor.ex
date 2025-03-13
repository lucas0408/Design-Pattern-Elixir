defmodule MyApp.WorkerSupervisor do
  use DynamicSupervisor

  #Parte que o usuário tem acesso  
  def start_link(init_arg) do
    #Chamada da função para iniciar o supervisor, o __MODULE__ indica que o supervisor que está sendo iniciado é ele mesmo
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    #inicia o supervisor
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  # Função para iniciar um novo worker
  def start_worker(args) do
    # Especificação do processo filho
    child_spec = {MyApp.Worker, args}
    
    # Inicia o processo filho sob este supervisor
    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end
end


#uso prático
# Iniciar o supervisor
MyApp.WorkerSupervisor.start_link([])

#Iniciar workers dinamicamente
MyApp.WorkerSupervisor.start_worker(arg1)
MyApp.WorkerSupervisor.start_worker(arg2)