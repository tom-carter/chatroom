require 'rails_helper'

describe ChatController, type: :routing do
  specify { expect({ post: '/messages' }).to route_to(controller: 'messages', action: 'create') }
end
