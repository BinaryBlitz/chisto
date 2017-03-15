module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Chisto'

    if page_title.empty?
      base_title
    else
      page_title + ' – ' + base_title
    end
  end

  def format_phone_number(phone_number)
    Phonelib.parse(phone_number).international || phone_number
  end
end
