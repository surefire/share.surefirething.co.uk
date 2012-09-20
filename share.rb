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

      Guillotine::Service.new(adapter)
    end
  end

end
