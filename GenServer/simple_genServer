defmodule Counter do
  use GenServer

  # API Cliente - funções que os outros módulos chamarão
  
  def start_link(initial_value \\ 0) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__) #o __MODULE__ representa o estado atual do GenServer, 
                                                                      #e está chamando a função para iniciar o GenServer
  end

  def increment(amount \\ 1) do
    GenServer.cast(__MODULE__, {:increment, amount}) # Está chamando uma função assíncrona no GenServer, passando o estádo atual __MODULE__
  end

  def decrement(amount \\ 1) do
    GenServer.cast(__MODULE__, {:decrement, amount})
  end

  def get_count() do
    GenServer.call(__MODULE__, :get_count)
  end

  def reset() do
    GenServer.cast(__MODULE__, :reset)
  end

  # Callbacks do servidor - funções internas chamadas pelo GenServer

  @impl true
  def init(initial_value) do
    # Retornando {:ok, state}
    {:ok, initial_value} #inicia o estádo atual com o valor passado na váriavel initial_value
  end

  @impl true
  def handle_cast({:increment, amount}, state) do #Uso prático do pattern matching em tuplas
    # Operação assíncrona - atualiza o estado atual, e retorna {:noreply, new_state}
    {:noreply, state + amount} 
  end

  @impl true
  def handle_cast({:decrement, amount}, state) do 
    {:noreply, state - amount}
  end

  @impl true
  def handle_cast(:reset, _state) do
    {:noreply, 0}
  end

  @impl true
  def handle_call(:get_count, _from, state) do
    # Operação síncrona - retorna {:reply, response, new_state}
    {:reply, state, state}
  end
end