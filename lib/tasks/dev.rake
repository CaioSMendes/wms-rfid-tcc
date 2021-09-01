namespace :dev do
  desc "TODO"
  task setup: :environment do
    p "Cadastrando Taxas"
    30.times do |i|
      Tax.create!(
        shipping: Faker::Number.decimal(l_digits: 2),
        costAdd: Faker::Number.decimal(l_digits: 2),
        ipi: Faker::Number.decimal(l_digits: 2),
        icms: Faker::Number.decimal(l_digits: 2),
        description: Faker::Lorem.sentence
    )
    end 
    p "Cadastrando Enderecos"
    30.times do |i|
      Address.create!(
        city: Faker::Address.city,
        street: Faker::Address.street_name,
        neighborhood: Faker::Address.street_address ,
        number: Faker::Address.building_number,
        complement: Faker::Address.full_address,
        state: Faker::Address.state,
        zipcode: Faker::Address.zip_code
    )
    end
    p "Cadastrando Clientes"
    30.times do |i|
      Client.create!(
        corporateName: Faker::Company.name,
        fantasyName: Faker::Company.industry,
        name: Faker::Name.name_with_middle,
        phone: Faker::PhoneNumber.cell_phone,
        cnpj: Faker::Company.brazilian_company_number,
        email: Faker::Internet.email,
        codeClient: Faker::Number.between(from: 10, to: 100),
        address: Address.all.sample
    )
    end 
    p "Cadastrando Fornecedores"
    30.times do |i|
      Provider.create!(
        corporateName: Faker::Company.name,
        fantasyName: Faker::Company.industry,
        phone: Faker::PhoneNumber.cell_phone,
        cnpj: Faker::Company.brazilian_company_number,
        stateRegistration: Faker::Company.spanish_organisation_number,
        email: Faker::Internet.email,
        business: Faker::Company.type,
        codeProvider: Faker::Number.between(from: 10, to: 100),
        address: Address.all.sample
    )
    end 
    p "Cadastrando categorias"
    30.times do |i|
      Categorie.create!(
        name: Faker::Company.suffix,
        codCategorie: Faker::Number.number(digits: 10)
      )
    end
    p "Cadastrando Produtos"
    30.times do |i|
      Product.create!(
        name: Faker::ElectricalComponents.active,
        description: Faker::ElectricalComponents.electromechanical,
        quantity: Faker::Number.between(from: 1, to: 500),
        unity: Faker::Measurement.height,
        price: Faker::Commerce.price,
        date: Faker::Date.in_date_period ,
        productCode: Faker::Barcode.ismn,
        gtin: Faker::Barcode.ean(13),
        rfid: Faker::Barcode.upc_e,
        productMin: Faker::Number.between(from: 1, to: 10),
        productMax: Faker::Number.between(from: 10, to: 100),
        salePrice: Faker::Commerce.price,
        saleCost: Faker::Commerce.price,
        avaliable: Faker::Number.between(from: 10, to: 100),
        categorie: Categorie.all.sample,
        provider: Provider.all.sample
    )
    end
    p "Cadastrando Vendas"
    30.times do |i|
      Sell.create!(
        price: Faker::Commerce.price,
        quantity: Faker::Number.between(from: 1, to: 500),
        dataSell: Faker::Date.in_date_period,
        discount: Faker::Number.between(from: 10, to: 100),
        measurement: Faker::Measurement.height,
        description: Faker::ElectricalComponents.electromechanical,
        sell: Faker::Number.between(from: 1, to: 500),
        product: Product.all.sample,
        client: Client.all.sample,
        tax: Tax.all.sample
    )
    end 
    p "Cadastrando Compras"
    30.times do |i|
      Buy.create!(
        price: Faker::Commerce.price,
        quantity: Faker::Number.between(from: 1, to: 500),
        dateBuy: Faker::Date.in_date_period,
        discount: Faker::Number.between(from: 10, to: 100),
        measurement: Faker::Measurement.height,
        description: Faker::ElectricalComponents.electromechanical,
        buy: Faker::Number.between(from: 1, to: 500),
        product: Product.all.sample,
        provider: Provider.all.sample,
        tax: Tax.all.sample
    )
    end
    p "Cadastrando Carteira"
    30.times do |i|
      Wallet.create!(
        total: Faker::Number.decimal(l_digits: 2),
        sell: Sell.all.sample,
        buy: Buy.all.sample
    )
    end 
    p "Cadastrando Buscas para o Bluetooh"
    30.times do |i|
      Bluetoohsearch.create!(
        rfidCode: Faker::Barcode.upc_e,
        product: Product.all.sample
    )
    end
    puts "Finalizado com sucesso"
  end
end