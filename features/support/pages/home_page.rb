class HomePage

  include PageObject

  PUPPY_LOOKUP = {
      'Brook' => 0,
      'Hanna' => 1
  }

  def select_puppy_number(num)
    button_element(:value => 'View Details', :index => num - 1).click
  end

  page_url = "http://puppies.herokuapp.com"
  def select_puppy(name)
    index = puppy_index_for(name)
    button_element(:value => 'View Details',:index => index).click
  end

  private

  def puppy_index_for(name)
    PUPPY_LOOKUP[name]
  end

end