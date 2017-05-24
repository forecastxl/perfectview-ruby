module PerfectviewApi
  class Configuration
    attr_accessor :username
    attr_accessor :password
    attr_accessor :api_key
    attr_accessor :database_id
    attr_accessor :user_id

    def initialize(opts = {})
      @username = opts.fetch(:username)
      @password = opts.fetch(:password)
      @api_key = opts.fetch(:api_key)
      @database_id = opts.fetch(:database_id) { nil }
      # @user_id = opts.fetch(:user_id){ nil }
    end

    def to_hash
      {
        'username' => @username,
        'password' => @password,
        'api_key' => @api_key
      }
    end
  end
end
