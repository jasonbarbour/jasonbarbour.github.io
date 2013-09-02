require 'active_support/all'

class Post < Thor
  include Thor::Actions

  desc "new", "Creates a new post"
  argument :title
  def new
    date = Time.now.strftime("%Y-%m-%d")
    create_file "_posts/#{(date + '-' + title).parameterize}.md", <<-eos
---
layout: post
title: #{title}
description: A description
modified: #{date}
category: posts
tags: []
image:
  credit:
  creditlink:
  feature:
comments: true
share: true
---

    eos
  end

end
