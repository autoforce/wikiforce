Quando há algum veículo novo na página visitada ocorre a inserção do conteúdo dos dados do veículo no DataLayer. A estrutura para **veículos novos** segue o seguinte padrão:

```
  { vehicle:
    {
      brand: (Marca do Veículo),
      category: (Categoria do Veículo. Ex.: "Hatch", "Sedan" etc.),
      id: (Identificação do Veículo no Autódromo),
      image: (URL da imagem principal do veículo),
      name: (Nome do veículo),
      productionDate: (Ano de fabricação),
      vehicleModelDate: (Ano do modelo)
    }
  }
```
