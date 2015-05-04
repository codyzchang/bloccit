module ApplicationHelper
  def my_name
  end 

  def down_vote_link_classes(post)
    base = "glyphicon glyphicon-chevron-down "
    vote = current_user.voted(post)
    base += "voted" if vote && vote.down_vote?
    base
  end

  def up_vote_link_classes(post)
    base = "glyphicon glyphicon-chevron-up "
    vote = current_user.voted(post)
    base += "voted" if vote && vote.up_vote?
    base
  end

  def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end
end
