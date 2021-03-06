<!-- TITLE: Ambiente Staging -->
<!-- SUBTITLE: Como utilizar um link para visualizar mudanças que ainda irão ao ar -->

O ambiente Staging nada mais é do que uma cópia quase perfeita do Autódromo real. A grande diferença é que algumas configurações são modificadas para possibilitar o teste de novas funcionalidades, sem que isso interfira no funcionamento normal da plataforma. Isso irá ser disponibilizado para clientes internos e externos que requisitaram mudanças que exijam alteração de código em nossa aplicação. O Autódromo conta com 4 tipos de ambientes:

- **Test**: Aqui é onde os **testes automatizados** são rodados, geralmente contém apenas o necessário para a aplicação rodar. O código nesse ambiente pode ser altamente experimental, e é usado para checar o funcionamento das features sem a necessidade de usar a aplicação real.
- **Development**: Esse ambiente tem configurações próprias, podendo ter diferenças consideráveis com o que está no ar. Se assemelha bastante ao ambiente Test, mas é mais palpável para facilitar o trabalho do **time de desenvolvimento**
- **Staging**: Aqui é onde se tem o código a ser testado. As configurações deste ambiente se assemelham ao máximo com o Autódromo real, isso acontece pois precisamos **prever o comportamento de novas funcionalidades antes de elas irem ao ar**.
- **Production**: Esse é o Autódromo como nós conhecemos. Aqui o **código já foi testado e aprovado** nos outros 3 ambientes e nossa equipe de suporte fará os tutoriais de nossa plataforma.

---

Para fazer uso do ambiente Staging ao máximo, o ideal é que se use uma aplicação no Heroku para isso. Isso é necessário para identificar problemas que não aconteceriam caso fosse usada a sua própria máquina na viasualização de novas funcionalidades. O nosso projeto no GitHub já inicializa essas aplicações automaticamente, sendo necessário apenas alguns passos para disponibilizar um link temporário para testes.

1. A **equipe de desenvolvimento** realiza a [criação de um pull request](https://help.github.com/articles/about-pull-requests/), que é um grupo de mudanças no código que fazem parte de uma ou um conjunto de tarefas
   ![Pull Request](/uploads/uploads/pull-request.png "Pull Request")
2. No **Heroku**, após o passo 1, é necessário ativar o _review app_ clicando em **Create Review App** no pull request aberto no passo 1. Isso irá criar um link temporário permitindo que as pessoas acessem as mudanças realizadas com o formato: `autodromo-teste-pr-(numero do pull request).herokuapp.com`
   ![Create Review App](/uploads/uploads/create-review-app.png "Create Review App")

3. Agora, para visualizar as alterações em algum canal específico, se faz necessária a criação um apontamento de domínio ou subdomínio, as opções são:

   - [Modificar o seu **arquivo hosts**](/uploads/dominio-interno.sh "Dominio Interno"), apontando para o IP do link temporário algum endereço. **Vantagem:** Rápido. **Desvantagem:** Funciona apenas localmente.
   - Modificar entradas de DNS do domínio **voltadeapresentacao.com.br**, [apontando algum CNAME](https://community.cloudflare.com/t/how-do-i-add-a-cname-record/59) para o link temporário. **Vantagem:** Funciona mudialmente. **Desvantagem:** Demora na propagação.

4. Entrar na aplicação criada no passo 2 e adicionar o domínio utilizado no passo 3 em **Settings > Domains and certificates > Add Domain**
   ![Dominios Heroku](/uploads/uploads/dominios-heroku.png "Dominios Heroku")

5. Para ter acesso ao login usado normalmente no Autódromo e conseguir puxar um estado dos sites que copie o da aplicação real é necessário copiar o banco de dados para a aplicação de testes. Para isso é necessário rodar um comando do Heroku em sua máquina, logando em uma conta que tenha acesso a ambas as aplicações:

```
$ heroku pg:copy autodromo::DATABASE_URL DATABASE_URL --app autodromo-teste-pr-(numero do pull request)
```

- Esse passo deve ser repetido sempre que o pull request sofrer mudanças, pois o banco reseta no processo de deploy da aplicação.
- Caso a alteração contenha uma migração no estado do banco de dados, após rodar esse comando é necessário rodar também:

```
$ heroku run rake db:migrate --app autodromo-teste-pr-(numero do pull request)
```

6.  **(Opicional)** Entre no administrativo através do link configurado e edite um site para utilizar como domínio um endereço apontado no passo 3

Após isso, ao acessar o endereço configurado a aplicação estará disponível normalmente, lembrando que mudanças afetando esse endereço não afetam o Autódromo e mudanças no Autódromo não afetam esse endereço. Essa característica do ambiente Staging faz com que você possa testar casos extremos de configuração, então pode mudar a vontade os parâmetros do sistema sem medo de quebrar nada nos sites reais. Em casos de detecção de bugs, comportamentos inesperados, ou se você encontrar uma página de erro: **não deixe de reportá-lo para a equipe de suporte**. Desse jeito você estará contribuindo para o desenvolvimento de uma plataforma estável e alinhada com as necessidades dos usuários.

> Lembre-se de indicar nas conversões realizadas no ambiente Staging de que elas não são reais, pois os fluxos de integração e envio de alertas funcionam normalmente. **Pense nas equipes de vendas que receberão os alertas desses leads!**

---

# Troubleshooting

## Abri o link, mas deu erro no navegador

![Dns](/uploads/uploads/dns.png "Dns")

Quando isso acontece significa que o seu computador **não conseguiu se conectar ao endereço de testes**. Isso pode significar alguma das seguintes opções:

1. Apontamento feito para um IP ou endereço inválido
2. Apontamento feito para um IP que mudou, ou remanescente de uma configuração anterior
3. Má configuração no DNS ou no arquivo hosts
4. O DNS ainda não propagou para a sua área de acesso
5. Você precisa [expirar o cache de DNS](https://www.keycdn.com/support/dns-cache/) de sua máquina

Caso você não consiga realizar o apontamento DNS ou a execução do script de edição de arquivo hosts, entre em contato com a equipe de PitStop.

## Apareceu um erro do Heroku

<p>
<img src="/uploads/uploads/heroku-nosuchapp.png" alt="Heroku no such app" width="300"/>
</p>

Seu apontamento DNS foi feito com sucesso, mas você não adicionou o domínio ou o subdomínio à aplicação de testes no Heroku. Volte ao tutorial no inicio dessa página e refaça o **passo 4**. Caso você não consiga realizar o cadastro do endereço, entre em contato com a equipe de PitStop.

## Apareceu o site da AutoForce ou deu um erro 404, mas era pra ser um site específico

<p>
<img src="/uploads/uploads/404.png" alt="404" width="300"/>
</p>

Parabéns, você conseguiu configurar o ambiente de Staging corretamente, faltou apenas **configurar o canal que você deseja visualizar**. Acesse a interface administrativa do Autódromo e edite o domínio do canal alvo. Após isso, acesse novamente o endereço, caso aconteça novamente, entre em contato com a equipe de PitStop.

## Não consigo logar em uma conta que tenho certeza que existe

<p>
<img src="/uploads/uploads/nao-consigo-logar.png" alt="Não consigo logar" width="300"/>
</p>

Algo de errado aconteceu ao clonar o banco de dados do Autódromo, talvez algo de errado tenha acontecido ao executar o **passo 5**. Isso pode acontecer também nos casos que a equipe de desenvolvimento tenha atualizado o código na aplicação e não tenha concluído o processo de cópia do banco de dados. Caso você não consiga realizar a execução do comando, entre em contato com a equipe de PitStop.
