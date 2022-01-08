namespace :dev do
  desc "TODO"
  task setup: :environment do
    p "Cadastrando Taxas"
    100.times do |i|
      Tax.create!(
        shipping: Faker::Number.decimal(l_digits: 2),
        costAdd: Faker::Number.decimal(l_digits: 2),
        ipi: Faker::Number.decimal(l_digits: 2),
        icms: Faker::Number.decimal(l_digits: 2),
        description: Faker::Lorem.sentence
    )
    end 
    p "Cadastrando Enderecos"
    100.times do |i|
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
    100.times do |i|
      Client.create!(
        corporateName: Faker::Company.name,
        clientName: Faker::Artist.name,
        name: Faker::Name.name_with_middle,
        phone: Faker::PhoneNumber.cell_phone,
        cnpj: Faker::Company.brazilian_company_number,
        email: Faker::Internet.email,
        codeClient: Faker::Number.between(from: 10, to: 100),
        address: Address.all.sample
    )
    end 
    p "Cadastrando Fornecedores"
    100.times do |i|
      Provider.create!(
        corporateName: Faker::Company.name,
        proprietaryName: Faker::Artist.name,
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
    100.times do |i|
      Categorie.create!(
        nameCat: Faker::Company.type,
        codCategorie: Faker::Number.number(digits: 10)
      )
    end
    p "Cadastrando Produtos"
    100.times do |i|
      Product.create!(
        name: Faker::ElectricalComponents.active,
        price: Faker::Commerce.price,
        quantity: Faker::Number.between(from: 1, to: 500),
        unity: Faker::Measurement.height,
        description: Faker::ElectricalComponents.electromechanical,
        productCode: Faker::Barcode.ismn,
        gtin: Faker::Barcode.ean(13),
        rfid: Faker::Barcode.upc_e,
        categorie: Categorie.all.sample
    )
    end
    p "Cadastrando Vendas"
    100.times do |i|
      Sell.create!(
        price: Faker::Commerce.price,
        quantity: Faker::Number.between(from: 1, to: 500),
        discount: Faker::Number.between(from: 10, to: 100),
        measurement: Faker::Measurement.height,
        description: Faker::Commerce.product_name,
        product: Product.all.sample,
        client: Client.all.sample,
        tax: Tax.all.sample
    )
    end 
    p "Cadastrando Compras"
    100.times do |i|
      Buy.create!(
        price: Faker::Commerce.price,
        quantity: Faker::Number.between(from: 1, to: 500),
        discount: Faker::Number.between(from: 10, to: 100),
        measurement: Faker::Measurement.height,
        description: Faker::Commerce.product_name,
        provider: Provider.all.sample,
        tax: Tax.all.sample
    )
    end
    p "Cadastrando Buscas para o Bluetooh"
    100.times do |i|
      Bluetoohsearch.create!(
        rfidCode: Faker::Barcode.upc_e,
        product: Product.all.sample
    )
    end
    puts "Finalizado com sucesso"
  end
end