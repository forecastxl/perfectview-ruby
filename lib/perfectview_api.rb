# require "numbers_api/nokogiri"
require 'savon'

module PerfectviewApi
  WSDLS = {
    main: 'https://api.perfectview.nl/PerfectView.asmx?WSDL'
  }.freeze
end

require 'perfectview-ruby/configuration'
require 'perfectview-ruby/client'
require 'perfectview-ruby/version'
