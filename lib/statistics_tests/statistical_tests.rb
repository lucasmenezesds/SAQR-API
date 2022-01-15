# frozen_string_literal: true

require 'numo/narray'
require 'numo/gsl'

# Class responsible for runing the statistical tests
class StatisticalTests
  def initialize
    @numo = Numo::DFloat
  end

  # def vai(elems)
  #   z = @numo.cast(elems)
  #   z_std = z.stddev
  #   puts "z.stddev #{z_std}"
  #   puts "z.mean #{z.mean}"
  #   puts "z.median #{z.median}"
  #
  #   nz = Numo::GSL::Pdf.gaussian(z, z_std)
  #   puts "nz = #{nz.inspect}"
  # end
end

# TODO: remove it
# arr = [3185, 1837, 3467, 3750, 1905, 3558, 2453, 2800, 2235, 3646]
# s = StatisticalTests.new
#
# s.vai(arr)
