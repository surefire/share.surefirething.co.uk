require 'guillotine'

class Share < Guillotine::App
  set service: Guillotine::Service.new(Guillotine::MemoryAdapter.new)
end
