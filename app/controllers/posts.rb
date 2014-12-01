get '/posts/new' do
  erb :new_post
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post_content
end

post '/posts' do
  #Find if the tag name already exists in the tags table
  #If it is non existent, create the given tag on the tags table
  #Else, store the given tag into a variable
  #Create post from the forms given
  #find and store both the id from the post table into the posts_tag table


  #find tag based on tag name and assign as variable
  #create given tag if not found and assign as variable
  #create post
  #associate post to tag

  # post = Post.create(title: params[:title], content: params[:content])
  post = Post.create(params[:post])

  multiple_tags = params[:tags] #=> "fruits, tree, yummy, healthy"

  arr = multiple_tags.split(',')
  
  arr.each do |x|
    tag = Tag.find_by(tag_name: x.strip)
    
    if tag == nil
      tag = Tag.create(tag_name: x.strip)
    end

    post.tags << tag
  end

  redirect "posts/#{post.id}"
end


get '/posts/:id/edit' do 
  @post = Post.find(params[:id])
  erb :edit_post
end

put '/posts/:id' do
  post = Post.find(params[:id])
  post.title = params[:title]
  post.content = params[:content]
  post.save
  erb :success
end

delete '/posts/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/'
end