module PerfectviewApi
  class Client

    attr_accessor :configuration

    #
    # Initialize the client with a configuration object and a service
    #
    def initialize(configuration)
      @configuration = configuration

      @client = Savon.client(
        wsdl: "https://api.perfectview.nl/PerfectView.asmx?WSDL",
        env_namespace: :soap,
        pretty_print_xml: true
      )
    end

    def request(action, data = {})
      @client.call(action, message: data.merge(authorization_payload))
    end

    def authorization_payload
      {
        'credentials' => {
          'ApiKey' => @configuration.api_key,
          'DatabaseId' => @configuration.database_id,
          'UserId' => @configuration.user_id,
          'UserName' => @configuration.username,
          'Password' => @configuration.password
      }}
    end
  end
end