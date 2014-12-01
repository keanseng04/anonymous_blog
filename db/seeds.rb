post = ["First blog post"]

post.all.each do |p|
    Post.create(title: p)
    Post.create(content: "Description goes here")
end
