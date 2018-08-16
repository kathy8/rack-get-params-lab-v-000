class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


      @@items.each do |item|
        resp.write "#{item}\n"
      end

      eslif req.path.match(/cart/)
      @@cart.each do |item|
      resp.write "#{item}\n"
    end

    if @@cart.empty?
      resp.write "Your cart is empty"
    end


    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/add/)
      add_item = req.params["item"]
      @@cart << add_item
      resp.write "added #{add_item}\n"
    else
      resp.write "We don't have that item"
    end
      resp.write "Path Not Found"
    end

    resp.finish
  end

