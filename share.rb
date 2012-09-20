require 'guillotine'

class Share < Guillotine::App

  configure :development do
    set :service do
      adapter = Guillotine::MemoryAdapter.new

      Guillotine::Service.new(adapter)
    end
  end

  configure :production do
    set :service do
      require 'redis'

      redis   = Redis.new(url: ENV["REDISTOGO_URL"])
      adapter = Guillotine::RedisAdapter.new(redis)

      Guillotine::Service.new(adapter, default_url: "http://surefirething.co.uk")
    end
  end

  before do
    authenticate! unless request.get?
  end

  helpers do

    def authenticate!
      return if settings.development?
      return if authenticated?

      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")

      throw :halt, [401, "Not authorized\n"]
    end

    def authenticated?
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? &&
        @auth.basic? &&
        @auth.credentials &&
        @auth.credentials == [ENV['SHARE_USERNAME'], ENV['SHARE_PASSWORD']]
    end

  end

end
