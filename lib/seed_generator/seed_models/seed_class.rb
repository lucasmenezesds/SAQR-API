# frozen_string_literal: true

require 'faker'
require 'active_support/core_ext/numeric/time'

Faker::Config.locale = 'pt-BR'

# Parent Class for the Models Seed Generator
class SeedClass
  attr_accessor :id
  def to_hash
    hash = Hash[instance_variables.map { |name| [name.to_s.delete('@'), instance_variable_get(name)] }]
    hash.except!('id') if hash['id'].nil?
    hash
  end

  def generate_time(min, max)
    if min.is_a?(Numeric) && max.is_a?(Numeric)
      rand(min..max)
    else
      10
    end
  end

  def add_time(received_datetime, time_to_add, time_type)
    if %w[seconds minutes hours].include?(time_type) && received_datetime.is_a?(DateTime) && time_to_add.is_a?(Numeric)
      generated_minutes = time_to_add.send(time_type)
      return received_datetime + generated_minutes
    end
    received_datetime
  end
end
