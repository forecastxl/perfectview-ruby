# Perfectview gem handling the SOAP-API of www.perfectview.nl


## Installation

    $ gem install perfectview_api


## Example Usage

  Initialize a configuration object:

    $ config = PerfectviewApi::Configuration.new(
        {
          username: 'x',
          password: 'x',
          api_key: 'x',
          database_id: 'x',
          user_id: 'x'
        }
      )

  Initialize a client

    $ client = PerfectviewApi::Client.new(config)

  Make requests with the client

    $ client.request(:user_get_databases)

### Api documentation

  https://api.perfectview.nl