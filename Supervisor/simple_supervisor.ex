defmodule DesignPattern.SimpleSupervisor do
  use DynamicSupervisor

  #Parte que o usuário interage 
  def start_link(init_arg) do
    # A função start_link, é responsável por criar um novo processo Erlang que atua como supervisor, 
    # chamar o callback init/1 e registrar o nome do processo
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    # é usada para configurar como o supervisor deve gerenciar seus processos filhos, 
    # retorna uma tupla que o supervisor usará para iniciar e gerenciar seus processos filhos
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  # Função para iniciar um novo worker
  def start_worker(args) do
    # Especificação do processo filho
    child_spec = {DesignPattern.Worker, args}
    
    
    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end
end


#uso prático
# Iniciar o supervisor
DesignPattern.WorkerSupervisor.start_link([])

#Iniciar workers dinamicamente
DesignPattern.WorkerSupervisor.start_worker(arg1)
DesignPattern.WorkerSupervisor.start_worker(arg2)