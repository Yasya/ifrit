module ApplicationHelper

  def parser(text)
    text = auto_link(text)
    text = markdown(text)
    text = simple_format(text)
  end

end
