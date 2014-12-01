get '/posts/new' do
  erb :new_post
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post_content
end

post '/posts/new/success' do
  Post.create(title: params[:title], content: params[:content])
  Tag.create(tag_name: params[:tag_name])

  current_post_id = Post.last.id
  current_tag_id = Tag.last.id

  PostsTag.create(post_id: current_post_id, tag_id: current_tag_id)

  erb :success
end


get '/posts/:id/edit' do 
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/posts/:id/edit/success' do
  post = Post.find(params[:id])
  post.title = params[:title]
  post.content = params[:content]
  post.save
  erb :success
end

get '/posts/:id/delete' do
  post = Post.find(params[:id])
  post.destroy
  erb :index
end