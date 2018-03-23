module ApplicationHelper
  def is_path_active?(args)
    args.include?(request.path)
  end

  def menu_class_active(*args)
    'active-option' if is_path_active?(args)
  end
end
