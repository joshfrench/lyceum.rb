module CommentExtension
  def approved
    find_by_comment_approved('1')
  end

  def not_approved
    find_by_comment_approved('0')
  end

  def spam
    find_by_comment_approved('spam')
  end

  def pingbacks
    find_by_comment_type('pingback')
  end

  def trackbacks
    find_by_comment_type('trackback')
  end
end