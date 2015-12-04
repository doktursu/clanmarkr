get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :'bookmarks/index'
end

get '/bookmarks/new' do
  @bookmark = Bookmark.new
  erb :'bookmarks/new'
end

post '/bookmarks' do
  bookmark = Bookmark.new(params[:bookmark])
  bookmark.save
  redirect to('/bookmarks')
end

get '/bookmarks/:id' do
  @bookmark = Bookmark.find(params[:id])
  erb :'bookmarks/show'
end

get '/bookmarks/:id/edit' do
  @bookmark = Bookmark.find(params[:id])
  erb :'bookmarks/edit'
end

post '/bookmarks/:id/edit' do
  bookmark = Bookmark.find(params[:id])
  bookmark.update_attributes(params[:bookmark])
  redirect to('/bookmarks')
end

post '/bookmarks/:id/delete' do
  bookmark = Bookmark.find(params[:id])
  bookmark.destroy
  redirect to('/bookmarks')
end