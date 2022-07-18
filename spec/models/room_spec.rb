require 'rails_helper'

describe Room do
  it { is_expected.to have_many(:messages) }
end
