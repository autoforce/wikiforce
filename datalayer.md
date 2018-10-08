# DataLayer

**DataLayer** é um conjunto de informações do website ou do usuário, sendo responsável pela centralização desses dados e permitindo seu uso por diversas ferramentas de **Marketing Digital**. Essas informações contidas no DataLayer servirão para melhor configurar suas campanhas e análises de comportamento de navegação.

Normalmente, as informações passadas são definidas pela equipe de **Marketing** em conjunto com a equipe de **Negócios**, sendo importante também o envolvimento da equipe de **Desenvolvimento** para uma avaliação da viabilidade da coleta de informações.

No **Autódromo** adotamos como padrão uma grade de informações padronizadas, geralmente regidas pela estrutura do [Schema.org](https://schema.org). Esse órgão, criado por gigantes de buscas da internet(Google, Microsoft, Yandex e outros), é responsável por uma tabela de atributos que facilitam a padronização do consumo do **DataLayer** e de outros serviços relacionados como os **Dados Estruturados de HTML**, que são de altíssima relevância para o **SEO** da página.

---

# Como funciona o DataLayer do Autódromo?

A navegação dos seus clientes geram 3 tipos de registros no DataLayer das páginas, sendo eles:

### 1. Eventos de Carregamento de Conteúdo

Esse evento acontece quando há algo na página que seja relevante para o visitante. Exemplo disso são produtos como: **Novos, Seminovos, Acessórios, Peças etc.**

Além desse tipo de conteúdo há também o registro de outros elementos de interação como: **Banners, Vídeos, Galerias etc.**

Exemplo de inserção de conteúdo de um **veículo novo**:

```
  { vehicle:
    {
      brand: "Fiat"
      category: "Hatch"
      id: "2603"
      image: "comprar-1-0_1a2e99a89d.png"
      name: "Argo (Autoforce - Fiat | Site)"
      productionDate: "2018"
      vehicleModelDate: "2018"
    }
  }
```

### 2. Eventos de Conversão

Esse evento é disparado quando o visitante preenche um formulário. Ele é sempre o reflexo dos campos preenchidos e escondidos do formulário.

Exemplo de inserção de uma **conversão em um veículo novo**:

```
 { conversion: [
    { name: "version", value: "1-0" },
    { name: "name", value: "teste" },
    { name: "email", value: "teste@teste.teste" },
    { name: "phone", value: "(12) 34123-4123" },
    { name: "unit", value: "pontanegra-fiat" },
    { name: "data", value: "16/10/2018" },
    { name: "bait", value: "4" },
    { name: "phoning", value: "false" },
    { name: "mailing", value: "false" },
    { name: "mailing", value: "true" },
    { name: "phoning", value: "true" },
    { name: "utmz", value: "utmcsr=|utmccn=|utmcmd=|utmcct=|" },
    { name: "product_id", value: "argo-2018" },
    { name: "product", value: "Argo" },
    { name: "origin", value: "756d5689-ee05-4630-809d-318fb1554a0b" },
    { name: "channel", value: "Site" },
    { name: "category", value: "Clone" },
    { name: "brand", value: "Fiat" },
    { name: "fipe_id", value: "" }
  ] }
```

### 3. Eventos de Navegação

Esse evento é gravado quando há alguma interação do usuário que indique interesse em conteúdo relevante na página. Geralmente isso acontece em elementos como: Telefones, Banners, Galerias etc.

Exemplo de um clique em um **elemento de galeria**:

```
 { event: { name: "openGallery", value: "comprar-1-0_1a2e99a89d.png" } }
```
