# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  it { should belong_to(:author) }
end
