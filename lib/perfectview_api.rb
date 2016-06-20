# require "numbers_api/nokogiri"
require "savon"

module PerfectviewApi

  WSDLS = {
    :main => "https://api.perfectview.nl/PerfectView.asmx?WSDL",
  }

end

require "perfectview_api/configuration"
require "perfectview_api/client"
require "perfectview_api/version"