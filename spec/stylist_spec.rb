require('spec_helper')

describe(Stylist) do
  describe('#save') do
    it("saves stylist to database") do
      test_stylist = Stylist.new({:name => "Sue", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

    describe('#name') do
      it("returns name of stylist") do
        test_stylist = Stylist.new({:name => "Bill", :id => nil})
        test_stylist.save()
        expect(test_stylist.name()).to(eq("Bill"))
      end
    end

    describe('.all') do
      it("returns all stylists in database") do
        test_stylist = Stylist.new({:name => "Bill", :id => nil})
        test_stylist.save()
        test_stylist2 = Stylist.new({:name => "BoBaggins", :id => nil})
        test_stylist2.save()
        expect(Stylist.all()).to(eq([test_stylist, test_stylist2]))
      end
    end

    describe('#delete') do
      it("deletes stylist from database") do
        test_stylist = Stylist.new({:name => "Billy Zane", :id => nil})
        test_stylist.save()
        test_stylist2 = Stylist.new({:name => "Humphrey Bogart", :id => nil})
        test_stylist2.save()
        test_stylist.delete()
        expect(Stylist.all()).to(eq([test_stylist2]))
      end
    end

    describe('#update') do
      it("updates stylist name") do
        test_stylist = Stylist.new({:name => "Marky Mark", :id => nil})
        test_stylist.save()
        test_stylist.update({:name => "Mr.Funky Bunch"})
        expect(test_stylist.name()).to(eq("Mr.Funky Bunch"))
      end
    end

    describe('.find') do
      it("finds stylist by id") do
        test_stylist = Stylist.new({:name => "Marky Mark", :id => nil})
        test_stylist.save()
        expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
      end
    end

    describe('#clients') do
      it("returns clients of stylist") do
        test_stylist = Stylist.new({:name => "Marky Mark", :id => nil})
        test_stylist.save()
        test_client = Client.new({:name => "Clinton", :id => nil, :stylist_id => test_stylist.id})
        test_client.save()
        expect(test_stylist.clients()).to(eq([test_client]))
      end
    end




end
