# frozen_string_literal: true

module CustomMatchers
  RSpec::Matchers.define :be_a_kind_of_boolean do
    match do |actual|
      element_class = actual.class
      expect([TrueClass, FalseClass]).to include(element_class)
    end
  end
end
