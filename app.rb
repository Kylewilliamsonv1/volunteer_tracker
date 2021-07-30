require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

# URL      GET   /projects          READ    get list of projects
# URL      GET   /projects/:id      READ    look at a single project
# URL      GET   /projects/new      READ    go to the form page for adding a new porject to the list
# Form     POST  /projects/:id      CREATE  add new project to projects
# URL      GET   /projects/:id/edit READ    go to form page for editing project
# Form     PATCH /projects/:id      UPDATE  update project
# Form     DEl   /projects/:id      DELETE  delete project from the list

# get('/') do
#   redirect to('/projects')
# end

# get('/albums') do
#   @albums = Album.all
#   erb(:albums)
# end

# get ('/albums/new') do
#   erb(:new_album)
# end

# post ('/albums') do
#   name = params[:album_name]
#   album = Album.new({:name => name, :id => nil})
#   album.save()
#   redirect to('/albums')
# end

# get ('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   erb(:album)
# end
# #
# get ('/albums/:id/edit') do
#   @album = Album.find(params[:id].to_i())
#   erb(:edit_album)
# end

# patch ('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @album.update(params[:name])
#   redirect to('/albums')
# end

# delete ('/albums/:id') do
#   @album = Album.find(params[:id].to_i())
#   @album.delete()
#   redirect to('/albums')
# end

# get ('/albums/:id/songs/:song_id') do
#   @song = Song.find(params[:song_id].to_i())
#   erb(:song)
# end

# post ('/albums/:id/songs') do
#   @album = Album.find(params[:id].to_i())
#   song = Song.new({:name => params[:song_name], :album_id => @album.id, :id => nil})
#   song.save()
#   erb(:album)
# end

# patch ('/albums/:id/songs/:song_id') do
#   @album = Album.find(params[:id].to_i())
#   song = Song.find(params[:song_id].to_i())
#   song.update(params[:name], @album.id)
#   erb(:album)
# end

# delete ('/albums/:id/songs/:song_id') do
#   song = Song.find(params[:song_id].to_i())
#   song.delete
#   @album = Album.find(params[:id].to_i())
#   erb(:album)
# end