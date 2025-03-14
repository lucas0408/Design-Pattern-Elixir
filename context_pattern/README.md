# Context Pattern

Popularizado pelo servidor Phoenix, um contexto é uma API de limite que encapsula e expõe funcionalidades relacionadas. Cada contexto define um escopo dentro do sistema onde certas regras, comportamentos e dados fazem sentido juntos.

Por exemplo, no projeto de e-commerce em que atuo como desenvolvedor back-end [link do projeto](https://github.com/lucas0408/E-commerce_back-end), temos os seguintes contextos:

- **Accounts**: Este contexto lida com todas as entidades relacionadas aos atores do sistema e suas informações, como endereços.
- **Catalog**: Este contexto gerencia todo o catálogo de produtos da plataforma de e-commerce, incluindo suas categorias.
- **ShoppingCart**: Este contexto gerencia o estado temporário dos itens selecionados pelo usuário antes da finalização da compra e transformação em um pedido real.
- **Order**: Este contexto lida com o fluxo de pedidos após a finalização da compra, mantendo registros das transações realizadas.

## Princípios do Context Pattern

- **Limite de API claro**: Cada contexto expõe uma API pública bem definida, escondendo detalhes de implementação.
- **Coesão**: Agrupa funcionalidades relacionadas que evoluem juntas.
- **Desacoplamento**: Minimiza dependências entre os contextos.
- **Encapsulamento**: Protege a lógica de negócio dentro do contexto.
- **Reusabilidade**: Facilita o reúso da lógica de negócio em diferentes partes da aplicação.

### No arquivo shopping_cart.ex vocês podem ver o contexto de shopping_cart do e-commerce que atuo como dev

