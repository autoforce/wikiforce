Quando há algum veículo seminovo na página visitada ocorre a inserção do conteúdo dos dados do veículo no DataLayer. A estrutura para **veículos seminovos** segue o seguinte padrão:

```
  { vehicle:
    {
      id: (Identificação do veículo no Autódromo),
      name: (Nome completo do veículo),
      model: (Modelo do veículo),
      price: (Preço praticado para o veículo),
      originalPrice: (Preço antigo do veículo),
      version: (Versão do veículo),
      brand: (Marca do veículo),
      year: (Ano formatado, separado por vírgula),
      productionDate: (Ano de fabricação),
      vehicleModelDate: (Ano do modelo),
      vehicleConfiguration: (Versão do veículo),
      fuelType: (Tipo do combustível),
      fuel: (Tipo do combustível),
      gearboxType: (Tipo do câmbio),
      plate: (Final da placa do veículo),
      doors: (Nº de portas do veículo),
      condition: (Condição do veículo. Ex.: "Novo" ou "Seminovo"),
      category: (Categoria do veículo. Ex.: "Carro", "Moto" ou "Caminhão"),
      color: (Cor do veículo),
      mileageFromOdometer: (Kilometragem),
      mileage: (Kilometragem),
      available: (Disponibilidade do veículo),
      image: (Imagem principal exibida)
    }
  }
```
