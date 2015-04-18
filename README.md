# Integração Cobre Grátis x Shopify.

Esse é o código usado no middleware de integração do Cobre Grátis com o Shopify para quem deseja ter a opção de cobrança por boleto em suas lojas virtuais.

O [Cobre Grátis] [cg] é um sistema de emissão e gerenciamento de boletos bancários.

O [Shopify] [shopify] é um sistema de e-commerce.

É necessário ter contratado o Plano Pago do [Cobre Grátis] [cg] para usar este recurso.

Para usufruir da integração, não é necessário usar este código de programação. Basta usar o serviço hospedado.

## Configuração

1. Crie uma loja no Shopify

1. Entre na página de Dashboard da sua loja

1. Inclua um pagamento manual nas configurações de Checkout

	1. Clique em *Settings*

	1. Clique em *Checkout*

	1. Selecione *Custom payment method* na área *Manual Payments*

	1. No campo *Name of the custom payment method* coloque: **Boleto Bancário**

		*Atenção:* É importante colocar exatamente *Boleto Bancário* com as maiúsculas e com o acento.
		Se o termo utilizado for diferente, a integração não irá funcionar.
		Pode escrever o que quiser nas instruções de pagamento (Enter the payment instructions) como por exemplo:
		*Você irá receber por e-mail um boleto bancário para pagamento.*

	1. Clique em Save

1. Cadastre uma notificação Webhook

	1. Clique em *Settings*

	1. Clique em *Notifications*

	1. Clique em *Create a webhook* na área chamada Webhooks no final da página

	1. Seleciona *Order update* em *Event*

	1. Deixe selecionado *JSON* em *Format*

	1. Em *URL* coloque o endereço:

			http://shopify.cobregratis.com.br/TOKEN/IDMODELO/IDCONTA

		*TOKEN* é o token de autenticação do seu usuário no Cobre Grátis.
		Para pegar o *Token de Autenticação* do seu usuário, acesse a [página Meu Perfil do Cobre Grátis] [myinfo]

		*IDMODELO* é o ID do *Modelo* para o qual o boleto será gerado.
		*IDCONTA* é o ID da *Conta* que será usada para geração do boleto.

		Para pegar o ID do Modelo e o ID da Conta, acesse a [página Integração do Cobre Grátis] [integration]

	1. Clique em *Save webhook*

1. Os boletos serão gerados com vencimento para 3 dias após a data do pedido.

1. Faça uma compra de teste e verifique se o boleto bancário será gerado na sua conta do Cobre Grátis e será enviado por e-mail para o comprador.

Em caso de dúvidas, abra um ticket no [suporte] [support].

  [cg]: http://cobregratis.com.br
  [shopify]: http://pt.shopify.com/?ref=cobregratis
  [integration]: https://app.cobregratis.com.br/integration
  [myinfo]: https://app.cobregratis.com.br/myinfo
  [support]: http://suporte.cobregratis.com.br