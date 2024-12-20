module ApplicationHelper
  def button_styles
    base = 'border border-vazBlue-700 rounded px-4 py-2 w-36 text-sm font-medium text-vazBlue-700'
    hover = 'hover:text-vazBeige-50 hover:border-vazBeige-50 hover:bg-vazBlue-700'
    transition = 'transition ease-in-out'

    "#{base} #{hover} #{transition}"
  end
end
