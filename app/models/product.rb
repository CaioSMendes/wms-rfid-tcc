class Product < ApplicationRecord
    belongs_to :categorie #certo
    has_many :sells
    #has_many :buys #certo
    #has_many :categories
    #belongs_to :provider
    has_one_attached :image
    #accepts_nested_attributes_for :categorie
    #accepts_nested_attributes_for :provider
    validates :name, :quantity, :unity, :price, :rfid, presence: true

    def name_categorie
        self.categorie.name
    end

    def cod_categorie
        self.categorie.codCategorie
    end

    def as_json(options={})
        super(
            root: true,
            methods: [:name_categorie, :cod_categorie, :corporateName_provider, :fantasyName_provider]
        )
    end
end
