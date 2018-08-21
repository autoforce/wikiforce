<!-- TITLE: Ambiente Staging -->
<!-- SUBTITLE: Como utilizar um link para visualizar mudanças que ainda irão ao ar -->

O ambiente Staging nada mais é do que uma cópia quase perfeita do Autódromo real. A grande diferença é que algumas configurações são modificadas para possibilitar o teste de novas funcionalidades, sem que isso interfira no funcionamento normal da plataforma. O Autódromo conta com 4 tipos de ambientes:

* **Test**: Aqui é onde os **testes automatizados** são rodados, geralmente contém apenas o necessário para a aplicação rodar. O código nesse ambiente pode ser altamente experimental, e é usado para checar o funcionamento das features sem a necessidade de usar a aplicação real.
* **Development**: Esse ambiente tem configurações próprias, podendo ter diferenças consideráveis com o que está no ar. Se assemelha bastante ao ambiente Test, mas é mais palpável para facilitar o trabalho do **time de desenvolvimento**
* **Staging**: Aqui é onde se tem o código a ser testado. As configurações deste ambiente se assemelham ao máximo com o Autódromo real, isso acontece pois precisamos **prever o comportamento de novas funcionalidades antes de elas irem ao ar**.
* **Production**: Esse é o Autódromo como nós conhecemos. Aqui o **código já foi testado e aprovado** nos outros 3 ambientes e nossa equipe de suporte fará os tutoriais de nossa plataforma.
-----
Para fazer uso do ambiente Staging ao máximo, o ideal é que se use uma aplicação no Heroku para isso. Isso é necessário para identificar problemas que não aconteceriam caso fosse usada a sua própria máquina na viasualização de novas funcionalidades. O nosso projeto no GitHub já inicializa essas aplicações automaticamente, sendo necessário apenas alguns passos para disponibilizar um link temporário para testes.

1. A **equipe de desenvolvimento** realiza a [criação de um pull request](https://help.github.com/articles/about-pull-requests/), que é um grupo de mudanças no código que fazem parte de uma ou um conjunto de tarefas
2. No **Heroku**, após o passo 1, é necessário ativar o *review app* que lança um link temporário permitindo que as pessoas acessem as mudanças realizadas
3. Agora, se for necessário visualizar as alterações em algum site, é necessário apontar um domínio ou subdomínio as opções são:
	 * [Modificar o seu **arquivo hosts**](aindanaotem.com.br/script-hosts), apontando para o IP do link temporário algum endereço. **Vantagem:** Rápido. **Desvantagem:** Funciona apenas localmente. 
	 * Modificar entradas de DNS do domínio **voltadeapresentacao.com.br**, [apontando algum CNAME](https://community.cloudflare.com/t/how-do-i-add-a-cname-record/59) para o link temporário. **Vantagem:** Funciona mudialmente. **Desvantagem:** Demora na propagação.
4. Entrar na aplicação criada no passo 2 e adicionar o domínio utilizado no passo 3 em **Settings > Domains and certificates > Add Domain**
5. **(Opicional)** Entre no administrativo através do link configurado e edite um site para utilizar como domínio um endereço apontado no passo 3

Após isso, ao acessar o endereço configurado a aplicação estará disponível normalmente, lembrando que mudanças afetando esse endereço não afetam o Autódromo e mudanças no Autódromo não afetam esse endereço.

# Troubleshooting
## Abri o link, mas deu erro no navegador
![Dns](/uploads/uploads/dns.png "Dns")

Quando isso acontece significa que o seu computador não conseguiu se conectar ao endereço de testes. Isso pode significar:
1. Má configuração no DNS ou no arquivo hosts
2. O apontamento tenha sido feito para um IP inválido
3. O apontamento foi feito para um IP que mudou
4. O DNS ainda não propagou para a sua área de acesso
5. Você precisa [expirar o cache de DNS](https://www.keycdn.com/support/dns-cache/) de sua máquina
