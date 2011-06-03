require 'spec_helper'

describe Todo do
  describe "validations" do
    it "should not be valid without content" do
      todo = Todo.new
      todo.should_not be_valid
    end
  end
end
