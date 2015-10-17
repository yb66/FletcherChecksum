require 'spec_helper'
require 'fletcherchecksum/fletcherchecksum'
require 'pathname'

describe "FletcherChecksum" do

  shared_examples "A working Fletcher 16 checksum" do
    subject { FletcherChecksum.check16( filepath ) }
    it { should == checksum }
  end
  context "Given 0000" do
    let(:filepath){ Pathname(__dir__).join( "support/fixtures/all_zeroes.txt").to_path }
    let(:checksum) { 0xFFFF }
    it_should_behave_like "A working Fletcher 16 checksum"
  end
  context "Given 000000" do
    let(:filepath){ Pathname(__dir__).join( "support/fixtures/six_zeroes.txt").to_path }
    let(:checksum) { 0xFFFF }
    it_should_behave_like "A working Fletcher 16 checksum"
  end
  context "Given 12" do
    let(:filepath){ Pathname(__dir__).join( "support/fixtures/one_two.txt").to_path }
    let(:checksum) { 0x0403 }
    it_should_behave_like "A working Fletcher 16 checksum"
  end
  context "Given 1234" do
    let(:filepath){ Pathname(__dir__).join( "support/fixtures/1234.txt").to_path }
    let(:checksum) { 0x140A }
    it_should_behave_like "A working Fletcher 16 checksum"
  end
  context "Given abcde" do
    let(:filepath){ Pathname(__dir__).join( "support/fixtures/abcde.txt").to_path }
    let(:checksum) { 0xC8F0 }
    it_should_behave_like "A working Fletcher 16 checksum"
  end
  context "Given ABCDE" do
    let(:filepath){ Pathname(__dir__).join( "support/fixtures/uppercase_abcde.txt").to_path }
    let(:checksum) { 0xE650 }
    it_should_behave_like "A working Fletcher 16 checksum"
  end
end