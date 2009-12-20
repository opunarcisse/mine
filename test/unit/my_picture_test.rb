require 'test_helper'

class MyPictureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert MyPicture.new.valid?
  end
end
