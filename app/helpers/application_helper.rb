module ApplicationHelper
  def button_styles
    base = 'inline-flex items-center justify-center border border-vazBlue-700 rounded px-4 py-2 w-36 text-sm font-medium text-vazBlue-700 cursor-pointer'
    hover = 'hover:text-vazBeige-50 hover:border-vazBeige-50 hover:bg-vazBlue-700'
    transition = 'transition ease-in-out'

    "#{base} #{hover} #{transition}"
  end

  def load_projects
    # getting projects for Tag / Link dropdown
    Project.all.map { |project| [project.title, project.id] }
  end
end
