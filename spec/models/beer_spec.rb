require 'rails_helper'

describe Beer do
  it { should validate_presence_of(:name) }
  it do
    should validate_length_of(:name)
      .is_at_least(3)
      .with_short_message("name must be at least 3 characters long")
  end

  it { should validate_presence_of(:description) }
end
