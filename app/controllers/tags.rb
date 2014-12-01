get '/tags' do
  @tags = Tag.all
  erb :list_tags
end

get '/tags/:id' do
  @posts = Tag.find(params[:id]).posts
  erb :list_of_post_from_tags
end
