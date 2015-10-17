# FletcherChecksum #

There's not a method for Fletcher's checksum in the standard library, so I made this. Give it a file path and it will open the file, run over the bytes checksumming them, and then return the concatenated checksums as an integer.

Only the 16 bit version is here right now.

## Example ##

    require 'fletcherchecksum/fletcherchecksum'
    # to a file containing 4 bytes of zero
    puts FletcherChecksum.check16( "path/to/file/of/zeroes" )
    # => 65535

## Benchmark ##

I've also added a pure ruby implementation with which to benchmark against, and the C version comes in 5 times faster on my system. You can find the code for that in the benchmark directory. The pure ruby fletcher is found in `lib/fletcherchecksum.rb`. It can be used thus:

    FletcherChecksum.fletcher( "spec/support/fixtures/abcde.txt")
    # => 51440

## Licence ##

See the LICENCE file. Spoiler alert! It's MIT.