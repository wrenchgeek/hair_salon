require('spec_helper')

describe(Stylist) do
  describe('#id') do
    it('returns the id of an individual stylist') do
      test_stylist = Stylist.new({:id => 1, :name => "Edith"})
      expect(test_stylist.id()).to(eq(1))
    end
  end

  describe('#name') do
    it('returnst the name of an individual stylist') do
      test_stylist = Stylist.new({:id => 1, :name => "Edith"})
      expect(test_stylist.name()).to(eq("Edith"))
    end
  end

  describe('.all') do
  it('returns all of the stylists') do
  expect(Stylist.all()).to(eq([]))
  end
end

end
