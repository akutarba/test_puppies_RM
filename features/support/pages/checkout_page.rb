class CheckoutPage
  #def initialize(browser)
  #  @browser = browser
  #
  #end
  include PageObject
  include DataMagic

=begin
  DEFAULT_DATA ={
      'name' => 'cheezy',
      'address' => '123 Main street',
      'email' => 'cheezy@example.com',
      'pay_type'=> 'Purchase order'
  }
=end
=begin
  DEFAULT_DATA ={
      'name' => Faker::Name.name,
      'address' => Faker::Address.street_address,
      'email' => Faker::Internet.email,
      'pay_type'=> 'Credit card'
  }
=end


  text_field(:name, :id => "order_name")
  text_field(:address, :id => "order_address")
  text_field(:email, :id => "order_email")
  select_list(:pay_type, :id => "order_pay_type")
  button(:place_order, :value=> "Place Order")

  def checkout(data = {})
#with data_magic
    populate_page_with data_for(:checkout_page, data)
#with constant, more simple
    #populate_page_with DEFAULT_DATA.merge(data)

#simple constant
    #data = DEFAULT_DATA.merge(data)
    #self.name = data['name']
    #self.address = data['address']
    #self.email = data['email']
    #self.pay_type = data['pay_type']
    place_order
  end
  #
  #def name=(name)
  #  @browser.text_field(:id => "order_name").set(name)
  #end
  #
  #def address=(address)
  #  @browser.text_field(:id => "order_address").set(address)
  #end
  #
  #def email=(email)
  #  @browser.text_field(:id => "order_email").set(email)
  #end
  #
  #def pay_type=(pay_with)
  #  @browser.select_list(:id =>"order_pay_type").select(pay_with)
  #end
  #
  #def place_order
  #  @browser.button(:value => "Place Order").click
  #end

end