require('spec_helper')

describe(Client) do
  describe('#save') do
    it("saves client to database") do
      test_client = Client.new({:name => "Sharon", :id => nil, :stylist_id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

    describe('#name') do
      it("returns name of client") do
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => nil})
        test_client.save()
        expect(test_client.name()).to(eq("Clinton"))
      end
    end

    describe('.all') do
      it("returns all clients in database") do
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => nil})
        test_client.save()
        test_client2 = Client.new({:name => "Sharon", :id => nil, :stylist_id => nil})
        test_client2.save()
        expect(Client.all()).to(eq([test_client, test_client2]))
      end
    end

    describe('#delete') do
      it("deletes client from database") do
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => nil})
        test_client.save()
        test_client2 = Client.new({:name => "Sharon", :id => nil, :stylist_id => nil})
        test_client2.save()
        test_client.delete()
        expect(Client.all()).to(eq([test_client2]))
      end
    end

    describe('#update') do
      it("updates client name") do
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => nil})
        test_client.save()
        test_stylist = Stylist.new({:name => "Freddy", :id => nil})
        test_stylist.save()
        test_client.update({:name => "Sharon"})
        expect(test_client.name()).to(eq("Sharon"))
      end
      it("updates client stylist_id") do
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => nil})
        test_client.save()
        test_stylist = Stylist.new({:name => "Freddy", :id => nil})
        test_stylist.save()
        test_client.update({:stylist_id => test_stylist.id()})
        expect(test_client.stylist_id()).to(eq(test_stylist.id))
      end

    end

    describe('.find') do
      it("returns client by id") do
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => nil})
        test_client.save()
        expect(Client.find(test_client.id())).to(eq(test_client))
      end
    end




end
