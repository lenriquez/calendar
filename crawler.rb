require 'rubygems'
require 'nokogiri'
require 'restclient'

page = Nokogiri::HTML(RestClient.get("http://www.gamespot.com/articles/every-game-release-date-in-2017/1100-6446643/"))
result = ""
page.css('td').each do |e|
  if e.children[0].name == 'a'
    result << "</tr>\n<tr>"
  end
  if e.name == 'td'
    p e.name
    
    result << ' ' + e.to_s
  end
end
result = result.gsub(/<.*table.* || <.*tbody.*>/, "");

template = %{
<!DOCTYPE html>
<html>
   <body>
      <table data-max-width="true">
         <thead>
            <tr>
               <th scope="col">Game</th>
               <th scope="col">Platform</th>
               <th scope="col">Release Date</th>
            </tr>
         </thead>
         <tbody>
            #{result}
         </tbody>
      </table>
   </body>
</html>
}

#puts template
