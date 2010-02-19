require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  
  test "create an entry" do
    assert Factory.create(:entry)
  end
  
end
