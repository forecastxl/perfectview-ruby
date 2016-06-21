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

    def paginated_request(action, data = {})
      @client.call(action, message: data.merge(pagination_payload))
    end

    def authorization_payload
      payload = {
        'credentials' => {
          'ApiKey' => @configuration.api_key,
          #'UserId' => @configuration.user_id,
          'UserName' => @configuration.username,
          'Password' => @configuration.password
      }}

      payload['credentials'].merge!({'DatabaseId' => @configuration.database_id}) if @configuration.database_id

      payload
    end

    def pagination_payload
      authorization_payload.merge(
        {
          'pageNumber' =>  1 || @page_number,
          'pageSize' => 50 || @page_size,
          'includeFields' => true,
          'includeCounters' => true
        }
      )
    end
  end
end