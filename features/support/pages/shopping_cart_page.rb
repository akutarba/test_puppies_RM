class ShoppingCartPage
  include PageObject

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  button(:proceed_to_checkout, :value=> "Complete the Adoption")
  button(:continue_adopting, :value => "Adopt Another Puppy")
  table(:cart_total, :index => 0)
  cell(:cart_total, :class=>"total_cell")

  def population_for(city)
    row = report_element.find {|r| r[0] == city}
    row[1]
  end
  def name_for_line_item(line_item)
    cart_line_item(line_item)[NAME_COLUMN].text
  end
  def subtotal_for_line_item(line_item)
    cart_line_item(line_item)[SUBTOTAL_COLUMN].text
  end
  #def cart_total
  #  @browser.td(:class => 'total_cell').text
  #end
  #def proceed_to_checkout
  #  @browser.button(:value => 'Complete the Adoption').click
  #end
  #def continue_adopting
  #  @browser.button(:value => 'Adopt Another Puppy').click
  #end

 private

  def row_for(line_item)
    (line_item - 1) * LINES_PER_PUPPY
  end
  def cart_line_item(line_item)
    @browser.table(:index => 0)[row_for(line_item)]
  end
end