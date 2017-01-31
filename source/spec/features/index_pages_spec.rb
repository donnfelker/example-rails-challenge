require "spec_helper"

describe "Report" do

  before(:each) do
    visit "/"
  end

	it "should has three lists on the screen" do
		page.all("table").count.should eql(3)
	end

  it "should has one failed list" do
    page.all("table#failed-charges").count.should eql(1)
  end

  it "should has one disputed list" do
    page.all("table#disputed-charges").count.should eql(1)
  end

  it "should has one successful list" do
    page.all("table#successful-charges").count.should eql(1)
  end

  it "should has successful charges list with 10 line items" do
  	page.all("table#successful-charges tbody tr").count.should eql(10)
 	end

  it "should has failed charges list with 5 line items" do
  	page.all("table#failed-charges tbody tr").count.should eql(5)
 	end

  it "should has disputed charges list with 5 line items" do
  	page.all("table#disputed-charges tbody tr").count.should eql(5)
 	end

end
