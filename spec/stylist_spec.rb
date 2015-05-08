require('spec_helper')

describe(Stylist) do
  describe('#save') do
    it("saves stylist to database") do
      test_stylist = Stylist.new({:name => "Sue", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
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
end
