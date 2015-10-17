require 'benchmark'
require_relative "../lib/fletcherchecksum.rb"
require_relative "../lib/fletcherchecksum/fletcherchecksum"

iterations = 100_000

Benchmark.bm do |bm|
  # joining an array of strings
  bm.report do
    iterations.times do
      FletcherChecksum.fletcher( "spec/support/fixtures/abcde.txt" )
      FletcherChecksum.fletcher( "spec/support/fixtures/uppercase_abcde.txt" )
      FletcherChecksum.fletcher( "spec/support/fixtures/six_zeroes.txt" )
      FletcherChecksum.fletcher( "spec/support/fixtures/all_zeroes.txt" )
      FletcherChecksum.fletcher( "spec/support/fixtures/one_two.txt" )
    end
  end

  # using string interpolation
  bm.report do
    iterations.times do
      FletcherChecksum.check16( "spec/support/fixtures/abcde.txt" )
      FletcherChecksum.check16( "spec/support/fixtures/uppercase_abcde.txt" )
      FletcherChecksum.check16( "spec/support/fixtures/six_zeroes.txt" )
      FletcherChecksum.check16( "spec/support/fixtures/all_zeroes.txt" )
      FletcherChecksum.check16( "spec/support/fixtures/one_two.txt" )
    end
  end
end

