require 'net/http'

class CEP
attr_reader :logradouro, :neighborhood, :localidade, :state

    def initialize(cep)
        cep_encontrado = encontrar(cep)
        preencher_dados(cep_encontrado)
    end

    def endereco
        "#{@logradouro} / #{@neighborhood} / #{@localidade} - #{@state}"
    end

    private
    def preencher_dados(cep)
        @neighborhood = cep["neighborhood"]
        @bairro = cep["bairro"]
        @localidade = cep["localidade"]
        @state = cep["state"]
    end

    def encontrar(cep)
        ActiveSupport::JSON.decode(
            Net::HTTP.get(
                URI("https://viacep.com.br/ws/#{cep}/json/")
            )
        )
    end
end