require('spec_helper')

describe(Client) do
  describe('#id') do
    it('returns the id of an individual client') do
      test_client = Client.new({:id => 1, :name => "Edith"})
      expect(test_client.id()).to(eq(1))
    end
  end

  describe('#name') do
    it('returnst the name of an individual client') do
      test_client = Client.new({:id => 1, :name => "Bruno"})
      expect(test_client.name()).to(eq("Bruno"))
    end
  end

  describe('.all') do
    it('returns all of the clients') do
    expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the client to the database') do
    test_client = Client.new({:name => "Vince", :id => nil})
    test_client.save()
    expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('.find') do
    it('returns the client by his/her id') do
    test_client = Client.new({:name => "Harvey", :id => nil})
    test_client.save()
    expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end

  describe('#update') do
    it('updates the database with new information') do
      test_client = Client.new({:name => "Frederick the Fleet Footed", :id => nil})
      test_client.save()
      test_client.update({:name => "Monica the Mad"})
      expect(test_client.name()).to(eq("Monica the Mad"))
    end
  end

  describe('#delete') do
    it('deletes a client from the database') do
      test_client = Client.new({:name => "Billy Bob", :id => nil})
      test_client.save()
      test_client.delete()
      expect(Client.all()).to(eq([]))
    end
  end

end
