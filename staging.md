<!-- TITLE: Ambiente Staging -->
<!-- SUBTITLE: Como utilizar um link para visualizar mudanças que ainda irão ao ar -->

O ambiente Staging nada mais é do que uma cópia quase perfeita do Autódromo real. A grande diferença é que algumas configurações são modificadas para possibilitar o teste de novas funcionalidades, sem que isso interfira no funcionamento normal da plataforma. O Autódromo conta com 4 tipos de ambientes:

* **Test**: Aqui é onde os **testes automatizados** são rodados, geralmente contém apenas o necessário para a aplicação rodar. O código nesse ambiente pode ser altamente experimental, e é usado para checar o funcionamento das features sem a necessidade de usar a aplicação real.
* **Development**: Esse ambiente tem configurações próprias, podendo ter diferenças consideráveis com o que está no ar. Se assemelha bastante ao ambiente Test, mas é mais palpável para facilitar o trabalho do **time de desenvolvimento**
* **Staging**: Aqui é onde se tem o código a ser testado. As configurações deste ambiente se assemelham ao máximo com o Autódromo real, isso acontece pois precisamos **prever o comportamento de novas funcionalidades antes de elas irem ao ar**.
* **Production**: Esse é o Autódromo como nós conhecemos. Aqui o **código já foi testado e aprovado** nos outros 3 ambientes e nossa equipe de suporte fará os tutoriais de nossa plataforma.
-----

