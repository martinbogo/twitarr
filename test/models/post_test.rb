require 'test_helper'
require 'base_model_test'

class PostTest < BaseModelTest
  subject { Post }
  let(:attributes) { %w(message username post_time post_id) }

  it 'starts with blank fields' do
    attributes_start_blank_test attributes
  end

  it 'reads and writes attributes' do
    attributes_start_blank_test attributes
  end

end
