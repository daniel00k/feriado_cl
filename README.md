# FeriadosCl

Obtiene los feriados desde la página www.feriados.cl y obtiene los feriados que son generales, no retorna los que son específicos de algunas regiones o de algunas instituciones.

## Installation

Add this line to your application's Gemfile:

    gem 'feriados_cl'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install feriados_cl

## Basic Usage

    feriados = FeriadosCl::FetchData::Fetcher.new

	dates    = feriados.get_dates

	Example result: [2015-01-01 00:00:00 -0300, 2015-04-03 00:00:00 -0300, 2015-04-04 00:00:00 -0300, 2015-05-01 00:00:00 -0300, 2015-05-21 00:00:00 -0300, 2015-06-29 00:00:00 -0300, 2015-07-16 00:00:00 -0300, 2015-08-15 00:00:00 -0300, 2015-09-18 00:00:00 -0300, 2015-09-19 00:00:00 -0300, 2015-10-12 00:00:00 -0300, 2015-10-31 00:00:00 -0300, 2015-11-01 00:00:00 -0300, 2015-12-08 00:00:00 -0300, 2015-12-25 00:00:00 -0300] 

	To see the results on an easier way: 
	dates.each{|d| puts d.strftime("%d de %B del %Y")}
    
    01 de January del 2015
    03 de April del 2015
    04 de April del 2015
    01 de May del 2015
    21 de May del 2015
    29 de June del 2015
    16 de July del 2015
    15 de August del 2015
    18 de September del 2015
    19 de September del 2015
    12 de October del 2015
    31 de October del 2015
    01 de November del 2015
    08 de December del 2015
    25 de December del 2015

## Contributing

1. Fork it ( https://github.com/[my-github-username]/feriados_cl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request