class CodeRfidUpc
    include HTTParty
    base_uri 'https://upc-rfid-api-unb.herokuapp.com/bluetoothsearches'
  
    def initialize()
      @options = {}
    end
  
    def codeAPI
      self.class.get("/", @options)
    end
end