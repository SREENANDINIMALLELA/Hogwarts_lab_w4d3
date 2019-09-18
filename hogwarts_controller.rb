require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./models/student.rb')
also_reload('./models/*')

get '/hogwarts/new' do
  erb(:new)
end

get '/hogwarts' do
  @students = Student.all()
  erb(:show)
end
post '/hogwarts'do
@student = Student.new(params)
@student.save()
erb(:create)

end
