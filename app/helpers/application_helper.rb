module ApplicationHelper
  def display_status(status)
    if status == 1
      "未対応"
    elsif status == 2
      "対応中"
    elsif status == 3
      "完了"
    end
  end
end
