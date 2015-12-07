get '/bookmarks' do
  order = ['UPPER(title) ASC']
  @bookmarks = Bookmark.all({}, order)
  erb :'bookmarks/index'
end

get '/bookmarks/new' do
  @bookmark = Bookmark.new
  erb :'bookmarks/new'
end

post '/bookmarks' do
  clean_up_params(params[:bookmark])
  bookmark = Bookmark.new(params[:bookmark])
  bookmark.save
  redirect to('/bookmarks')
end

get '/bookmarks/search' do
  @attribute = params[:attribute]
  @value = params[:value]

  if @attribute == 'all'
    conditions = { :genre => @value.to_sym, :title => @value.to_sym }
  else
    conditions = { @attribute.to_sym => @value.to_sym }
  end

  order = [ params[:order] ]

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
  clean_up_params(params[:bookmark])
  bookmark.update_attributes(params[:bookmark])
  redirect to('/bookmarks')
end

post '/bookmarks/:id/delete' do
  bookmark = Bookmark.find(params[:id])
  bookmark.destroy
  redirect to('/bookmarks')
end

def clean_up_params(params)
  params[:title].strip!
  params[:genre].strip!
  params[:genre].downcase!
  params[:url].strip!
end

