require 'httparty'

class CepService
    include HTTParty
  
    URL = "https://viacep.com.br/ws/"
    FORMAT = "json"
  
    CepServiceData = Struct.new(:zipcode, :street, :complement, :neighborhood, :city, :state, keyword_init: true)
  
    attr_reader :data, :message
  
    def initialize(cep)
      @cep = cep
      @data = CepServiceData.new
    end
  
    def find
      response = call
      if success?(response)
        process_response(response)
      else
        process_error_message(response)
      end
    end
  
    private
  
    attr_reader :cep
  
    def call
      self.class.get("#{URL}#{cep}/#{FORMAT}/")
    end
  
    def process_response(response)
      parse_cep_data(response_as_object(response.body))
    end

    def parse_cep_data(response)
      data.zipcode = response.zipcode
      data.street = response.street
      data.complement = response.complement
      data.neighborhood = response.neighborhood
      data.state = response.state
      data.city = response.city
    end
  
    def success?(response)
      response.code == 200
    end
  
    def process_error_message(response)
      @message = "Algo deu errado!"
    end
  
    def response_as_object(response)
      JSON.parse(response, object_class: OpenStruct)
    end
  end