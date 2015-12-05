get '/bookmarks' do
  order = ['title ASC']
  @bookmarks = Bookmark.all({}, order)
  erb :'bookmarks/index'
end

get '/bookmarks/new' do
  @bookmark = Bookmark.new
  erb :'bookmarks/new'
end

post '/bookmarks' do
  params[:bookmark][:genre].downcase!
  bookmark = Bookmark.new(params[:bookmark])
  bookmark.save
  redirect to('/bookmarks')
end

get '/bookmarks/sort' do
  order = [ params[:order] ]
  @bookmarks = Bookmark.all({},order)
  erb :'bookmarks/index'
end

get '/bookmarks/search' do
  @attribute = params[:attribute]
  @value = params[:value]

  if @attribute == 'all'
    conditions = { :genre => @value.to_sym, :title => @value.to_sym }
  else
    conditions = { @attribute.to_sym => @value.to_sym }
  end

  order = ['title ASC']
  @bookmarks = Bookmark.all(conditions, order)
  erb :'bookmarks/search'
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
  params[:bookmark][:genre].downcase!
  bookmark.update_attributes(params[:bookmark])
  redirect to('/bookmarks')
end

post '/bookmarks/:id/delete' do
  bookmark = Bookmark.find(params[:id])
  bookmark.destroy
  redirect to('/bookmarks')
end

