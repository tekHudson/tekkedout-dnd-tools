module ApplicationHelper
  def tab(label, path, active)
    render partial: "common/tab", locals: { label: label, path: path, active: active }
  end
end
