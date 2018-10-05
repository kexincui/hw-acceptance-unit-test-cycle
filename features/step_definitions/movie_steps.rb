Given (/^the following movies exist:$/) do |table|
  table.hashes.each do |movie|
    Movie.create(movie)
  end
end

Then (/^the director of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  movie=Movie.find_by_title(arg1)
  expect(movie.director).to eq arg2
end

Then (/I should see "(.*)" before "(.*)"/) do |e1, e2|
  body=page.body
  loc1=body.index(e1)
  loc2=body.index(e2)
  if loc1==nil || loc2==nil
    fail"One of the search parameters not found"
  else
    expect(loc1<loc2).to eq true
  end
end

When (/I (un)?check the following ratings: (.*)/) do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    field = "ratings_#{rating.strip}"
    if uncheck
      uncheck field
    else
      check field
    end
  end
end


Then (/I should see all the movies/) do
  movies = Movie.all
  movies.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end