require 'bundler/setup'
Bundler.require(:default)
#require 'mechanize'

#client = HTTPClient.new
#puts client.get_content('http://www.nea.gov.sg/anti-pollution-radiation-protection/air-pollution-control/psi/historical-psi-readings/year/2015/month/10/day/25')

#mechanize = Mechanize.new
#page = mechanize.get('http://www.nea.gov.sg/anti-pollution-radiation-protection/air-pollution-control/psi/historical-psi-readings/year/2015/month/10/day/25')
#puts page.content
#
#

now = Date.today

session = Capybara::Session.new(:selenium)
(now << 36 .. now).each{
    | date | 
    outfile = "downloaded_html/%d_%02d_%02d.html" % [date.year, date.month, date.day]
    url ="http://www.nea.gov.sg/anti-pollution-radiation-protection/air-pollution-control/psi/historical-psi-readings/year/%d/month/%d/day/%d" % [date.year, date.month, date.day]
    if not File.file?(outfile)
        session.visit(url)
        sleep(1)
        puts session.save_and_open_page(outfile)
    end
    puts url
    #puts date.day.rjust(1,'0')
    #puts date.month.rjust(1,'0')
    #puts date.year 
}

#session = Capybara::Session.new(:selenium)
#session.visit "http://www.nea.gov.sg/anti-pollution-radiation-protection/air-pollution-control/psi/historical-psi-readings/year/2015/month/10/day/25"
#sleep(2)
#puts session.save_and_open_page('foo')


