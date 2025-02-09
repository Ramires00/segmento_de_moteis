
# Segmento de Moteis  
  
# Visão geral  
  
Este app foi construído para o processo seletivo da empresa Guia de Motéis. A organização foca no   
mercado de motéis. A plataforma reúne empresas do ramo de motéis e oferece estada para as empresas listadas  
na plataforma.  
  
# O App  
  
O app é apenas uma réplica da tela inicial do aplicativo da empresa, onde realiza a listagem de motéis.  
É exibido, portanto, os mocks (dublês) dos motéis disponíveis. Informações como:   
- Nome  
- Preço  
- Imagem  
  
# Arquitetura  
  
O app está organizado em uma arquiteura cleanish-MVVM, onde aderimos aos padrões de Clean Architecture  
e utilizamos o MVVM como arquitetura principal.

Além disso, a arquitetura adere as melhores práticas do Flutter de acordo com a [documentação](https://docs.flutter.dev/app-architecture). A arquitetura está conceitualmente organizada da seguinte forma:

### Separation of Concerns (Separação de Responsabilidades)
É o um princípio de design fundamental para a criação de qualquer aplicação escalável. A separação de responsabilidades consiste em separar uma aplicação em seções distintas. SoC utiliza modularização, encapsulamento e organização em camadas de software. Cada seção é isolada e tem uma sobreposição mínima com outras seções. Cada seção foca em resolver um problema específico (por exemplo, ao criar um serviço de autenticação - AuthService - ele será responsável por somente realizar e gerenciar a autenticação de usuários).

### Arquitetura em Camadas
Não só uma aplicação em Flutter, mas praticamente todo software que é escalável é interessante ter uma arquitetura em camadas. A arquitetura em camadas é um padrão de design de software que organiza uma aplicação em diferentes camadas, cada uma com sua responsabilidade. Normalmente essas aplicações possuem de 2 a 3 camadas, dependendo de suas regras de negócio e complexidade.

![As três camadas tipicas da arquitetura de uma aplicação, a camada de UI, a camada de lógica e a camada de dados.](https://docs.flutter.dev/assets/images/docs/app-architecture/common-architecture-concepts/horizontal-layers-with-icons.png)

- **Camada de UI (UI layer)** - Aqui é onde os dados são mostrados ao usuário de forma amigável e harmonica. A camada de UI será construida de acordo como a camada de negócios é desenhada, pois ela é exposta para o usuário em forma de interações (eventos - cliques, gestos, reconhecimentos et cetera). Também é tipicamente conhecida como camada de apresentação.
- **Camada de Lógica (Logic layer) ** - Onde as regras de negócio são implementadas. É um intermédio entre a camada de UI e a camada de dados, sendo um facilitador entre eles. É uma camada opcional (porém extremamente recomendada) e geralmente é implementada se sua aplicação tem regras de negócio complexas. Para uma aplicação ser facilmente escalada, é altamente recomendável implementar esta camada, pois assim você pode criar view models (controladores ou como preferir chamar) que modelarão seu sistema de acordo com seus requisitos e ao mesmo tempo irá autodocumentar sua aplicação sem sequer uma linha de comentário, fazendo tudo ficar mais declarativo e flexível.
- **Camada de Dados (Data layer)** - Gerencia interações com fontes de dados como banco de dados ou até mesmo interações nativas. Ela permite a exposição de dados e métodos que irão moldar as regras de negócio do sistema.

### Single Source of Truth (Fonte Única de Verdade)
É uma prática de gerenciamento de dados onde centraliza os dados de múltiplas fontas em um único lugar. É uma forma de organização de dados ao invés de utilizar uma ferramenta ou sistema específico. Se os dados podem ser modificados no app, a classe responsável pela fonte única de verdade deve ser a única classe condicionada a fazer isso.
Geralmente, A SSOT para cada tipo de dado na sua aplicação é contida em uma classe chamada Repositório (Repository), na qual faz parte da camada de dados.

### Fluxo de dados unidirecional
É um padrão de design que permite que os dados fluam em apenas uma única direção. Por exemplo, o fluxo de dados parte dos componentes pais para os componentes filhos. Componentes filhos só podem chamar funções a partir dos componentes pai. A UI pode atualizar os dados, mas os dados não podem diretamente atualizar a UI. É exatamente isso que queremos mostrar no diagrama abaixo:
![As três camadas tipicas da arquitetura de uma aplicação, a camada de UI, a camada de lógica e a camada de dados. E o fluxo do estado da camada de dados até a camada de UI.](https://docs.flutter.dev/assets/images/docs/app-architecture/common-architecture-concepts/horizontal-layers-with-UDF.png)

1. [Camada de UI] Um evento acontece devido a interação do usuário. Por exemplo, um botão é clicado. O gerenciador de eventos do widget chama uma callback que invoca um método exposto pela classe na camada de lógica.
2. [Camada de lógica] A class de lógica chama métodos expostos pelo repositório que sabem como atualizar os dados.
3. [Camada de dados] O repositório atualiza os dados (se necessário) e então provê os novos dados para a classe de lógica
4. [Camada de lógica] A classe de lógica sava o seu novo estado no qual envia para a UI.
5. [Camada de UI] A UI mostra o novo estado da view model.

## Curiosidade! 

### UI é uma função de estado (imutável)
Flutter é declarativo. Isso significa que ele constrói a UI para refletiur o atual estado de sua aplicação. Quando o estado muda, seu app deverá acionar uma reconstrução da UI que dependerá desse estado. No Flutter é muito comum ouvir que "UI é uma função de estado". Ok, mas o que isso significa? Significa que a sua UI inteira é uma função que recebe algum estado (ou simplesmente dados) e retorna toda a UI rederizada. **Agora a curiosidade é** a reatividade criada no Flutter foi fundamentalmente inspirada no React. Se você é um desenvolvedor React (ou conhece React) isso deve soar bem familiar para você. Você pode conferir mais detalhes [neste link](https://docs.flutter.dev/resources/architectural-overview).

Os design patterns descritos aqui são apenas alguns dos conceitos arquiteturais fundamentas utilizados neste projeto. Introduzi aqui apenas os principais, os cores da aplicação.

# MVVM
É o padão arquitetural utilizado neste projeto. Este padrão separa uma funciondade da aplicação entre três partes:
- Model
- ViewModel
- View
Views e view models fundamentam a camada de UI de uma aplicação. Repositórios e serviços representam os dados de uma aplicação. 
![Padrão arquitetural MVVM](https://docs.flutter.dev/assets/images/docs/app-architecture/guide/mvvm-intro-with-layers.png)

Uma única funcionalidade de uma aplicação pode requerer o seguinte:
![Diagrama simplificado](https://docs.flutter.dev/assets/images/docs/app-architecture/guide/feature-architecture-simplified.png)

## Camada de UI
É construída com dos componentes arquiteturais, baseado no padrão de design MVVM:

- **Views** - descreve como apresentar os dados da aplicação para o usuário. Especificamente, eles referem-se a composição dos widgets que fundamentam uma funcionalidade. Por exemplo, normalmente uma tela possui um widget Scaffold seguido de todos os widgets abaixo na árvore de widgets. Views são responsáveis por enviar eventos para a view model em resposta a interações do usuário.
- **View models** - contém a lógica que converte os dados da aplicação em estados da UI porque os dados dos repositórios são normalmente formatados diferentemente dos dados que precisam ser apresentados. Por exemplo, talvez você precise combinar dados de múltiplos repositórios ou talvez queira filtrar uma lista de registro de dados.

Views e view models devem ter um relacionamento 1:1 (um para um).

Resumindo, uma view model gerencia os estados da UI e a view apresenta esses estados. Usando views e view models sua camada de UI pode manter estados durante mudanças de configuração (como rotação de tela) e você pode testar a lógica de sua UI independentemente de widgets.

### Views
Em Flutter, views são as classes widget de sua aplicação. Views são o método primário de renderizar a UI e não devem conter quaisquer regras de negócio. Elas devem receber todos os dados que elas precisam para renderizar a partir da view model.

### View models
 As view models expõem os dados da aplicação necessários para renderizar uma view. A maioria de lógica da aplicação Flutter reside nas view models. As principais responsabilidades das view models incluem:
 - Obter os dados da aplicação odos repositórios e transformar em um formato adequado para a apresentação da view. Por exemplo, filtrar, organizar ou reunir os dados.
 - Manter o estado atual necessário na view para que então a view possa rebuildar sem perder dados. Por exemplo, ela pode conter flags booleanas para condicionalmente renderizar widgets na view ou um campo que mapeia qual seção de um carrossel está ativa na tela.
 - Expõem callbacks (chamados de comandos) para a view que podem ser anexadas a um gerenciador de eventos como  o pressionar de um botão ou a submissão de um formulário.

Comandos são chamados dessa forma devido ao [padrão de comando](https://en.wikipedia.org/wiki/Command_pattern) e são funções em Dart que permitem que views executem regras complexas sem o conhecimento de sua implementação. Comandos são escritos como membros de view models para serem executados pelos gerenciados de gestos nas views.

## Camada de dados
A camada de dados gerencia as regras de dados e lógica (negócio). Existem duas partes da arquitetura que compõem a camada de dados: serviços e repositórios. Essas partes devem ter entradas e saídas bem definidas para simplificar sua reusabilidade e testabilidade.  

### Repositórios
Classes de repositório são a fonte de verdade para seu modelo de dados. Elas são responsáveis por obter dados a partir dos serviços e transformar dados crus em domínios (models). Domínios representam os dados que aplicação necessita, formatados de tal forma que suas view models possam consumir. Para cada tipo de dados em sua aplicação, um diferente repositório deve ser criado para gerenciar tal tipo. 

Repositórios gerenciam as regras de negócio associadas com os serviços como por exemplo:
- Caching
- Gerenciamento de erros
- Lógica de tentativas (lógica de retry)
- Atualizar os dados
- Consultar os serviços para obter novos dados
- Atualizar os dados baseado nas interações dos usuários

Os repositórios criam as saídas de dados como domínios (models). Por exemplo, uma aplicação de redes sociais pode conter um repositório chamado `UserProfileRepository` que expõe um `Stream<UserProfile?>`, no qual emite um novo valor sempre que o usuário se logar ou deslogar

As saídas de models dos repositórios são consumidas pelas view models. Repositórios e view models possuem um relacionamento muitos-para-muitos (n:n). Uma view model pode usar muitos repositórios para obter os dados que precisa, assim como um repositório pode ser usado por muitas view models.

### Serviços
Serviços estão situados na camada de mais baixo nível de sua aplicação. Eles encapsulam endpoints de APIs e expõem objetos que possuem característica assíncrona como `Future` e `Stream`. Eles são apenas utilizados para isolar carregamento de dados e não devem conter nenhum estado. Seu app deve ter um serviço por fonte de dados. Alguns exemplos de encapsulamento que a camada de serviços realiza inclui:
- A plataforma subjacente como APIs iOS ou Android
- Endpoints REST
- Arquivos locais
Como uma regra serviços são essenciais quando os dados necessários existem fora de sua aplicação. Serviços e repositórios possuem uma relação muitos-para-muitos. Um único repositório pode utilizar diversos serviços e um serviço pode ser utilizado por múltiplos repositórios.

# Organização da Aplicação

```
lib
|____ui
| |____core
| | |____ui
| | | |____<shared widgets>
| | |____themes
| |____<NOME DA FUNCIONALIDADE>	
| | |____view_model
| | | |_____<view_model class>.dart
| | |____widgets
| | | |____<feature name>_screen.dart
| | | |____<other widgets>
|____domain
| |____models
| | |____<model name>.dart
|____data
| |____repositories
| | |____<repository class>.dart
| |____services
| | |____<service class>.dart
| |____model
| | |____<api model class>.dart
|____config
|____utils
|____routing
|____main_staging.dart
|____main_development.dart
|____main.dart

// a pasta test contém testes unitátios e testes de widgets
test
|____data
|____domain
|____ui
|____utils

// a pasta testing contém dublês (mocks) e outras classes necessárias para executar os testes
testing
|____fakes
|____models
```

Toda a aplicação foi construída utilizando as melhores práticas do time do Flutter. A aplicação foi embasada de acordo com a documentação que pode ser acessada neste [link](https://docs.flutter.dev/app-architecture).