require 'rails_helper'

describe ChatController, type: :routing do
  specify { expect({ get: '/' }).to route_to(controller: 'chat', action: 'index') }
end
