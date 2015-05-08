# require('spec_helper')
require('rspec')
require('pg')
require('stylists')
require('clients')
require('pry')

describe(Stylist) do
  describe('#id') do
    it('returns the id of an individual stylist') do
      test_stylist = Stylist.new({:id => 1, :name => "Edith"})
      expect(test_stylist.id()).to(eq(1))
    end
  end
end
