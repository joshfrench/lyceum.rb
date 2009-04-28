module PostExtension
  def published
    find_by_post_status 'publish'
  end

  def draft
    find_by_post_status 'draft'
  end

  def post
    find_by_post_type 'post'
  end

  def page
    find_by_post_type 'page'
  end

  def revision
    find_by_post_type 'revision'
  end
end