require 'pathname'
module FletcherChecksum

  # @example
  #   FletcherChecksum.fletcher( "spec/support/fixtures/abcde.txt" )
  def self.fletcher file, checksum_bits: 16
    block_bits = checksum_bits / 2
    pn = Pathname(file)
    modulo = ("1" * (block_bits)).to_i(2)
    directive = "C"
#       case checksum_bits.div(2)
#         when 8 then "C"
#         when 16 then "S"
#         when 32 then "L"
#         when 64 then "Q"
#       end
#     warn "directive = #{directive}"

    # 8 bits in 1 byte
    block_bytes = block_bits.div(8) # div 8 because bytes
    c0,c1 = [0,0]
    pn.open(mode: "rb") do |file|
      while chunk = file.read(block_bytes) do
        c0 = (c0 + chunk.unpack("#{directive}*").first) % modulo
        c1 = (c1 + c0) % modulo
      end
    end

    c0 = 0xFF if ( c0 == 0 )
    c1 = 0xFF if ( c1 == 0 )

    csum = c1 << (block_bits) | c0
  end
end