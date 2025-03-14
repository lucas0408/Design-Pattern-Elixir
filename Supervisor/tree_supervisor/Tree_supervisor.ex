defmodule DesignPattern.TreeSupervisor do
  use Application

  #função que inicializa supervisor principal
  def start(_type, _args) do

    #Cada item de children é um par, onde o primeiro elemento é o módulo do processo a ser supervisionado
    #e o segundo e o segundo é o argumento que será passado ao start_link/2
    children = [
      # Supervisor para banco de dados
      {DesignPattern.DatabaseSupervisor, []},
      
      # Supervisor para serviços web
      {DesignPattern.WebSupervisor, []},
      
    ]

    # Supervisor principal (Top-level)
    opts = [strategy: :one_for_one, name: DesignPatternSupervisor]
    #inicializa o supervisor PRINCIPAL, onde children é a lista de processos filhos e opts, defini a opção de supervisão
    Supervisor.start_link(children, opts)
  end
end

