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

  describe('#save') do
    it('saves the stylist to the database') do
    test_stylist = Stylist.new({:name => "Fabio", :id => nil})
    test_stylist.save()
    expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('.find') do
    it('returns the stylist by his/her id') do
    test_stylist = Stylist.new({:name => "Abner", :id => nil})
    test_stylist.save()
    expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe('#update') do
    it('updates the database with new information') do
      test_stylist = Stylist.new({:name => "Samson", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Sandra"})
      expect(test_stylist.name()).to(eq("Sandra"))
    end
  end

  describe('#delete') do
    it('deletes a stylist from the database') do
      test_stylist = Stylist.new({:name => "Fritz", :id => nil})
      test_stylist.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#assign') do
    it('assigns a particular client to a particular stylist') do
      test_stylist = Stylist.new ({:name => "Robert", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Roberto", :id => nil})
      test_client.save()
      test_stylist.assign(test_client)
      expect(test_stylist.all_assigns()).to(eq([test_client]))
    end
  end
end
