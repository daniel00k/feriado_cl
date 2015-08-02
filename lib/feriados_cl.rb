require "feriados_cl/version"
require 'nokogiri'
require 'open-uri'

module FeriadosCl

  module FetchData

    class Fetcher
     
      attr_accessor :table_rows, :url, :doc, :keywords, :current_year

      ROW_TO_AVOID = "Todos los Días Domingos"

      def initialize url = "http://www.feriados.cl/", keywords=['Religioso', 'Civil'], current_year=Time.now.year
        @url          =  url
        @current_year = current_year
        @keywords     =  keywords
        @doc          =  Nokogiri::HTML(open(@url))
        load_rows
      end

      def load_rows
        @table_rows = []
        @doc.xpath("//table").last.search("//tr").each do |tr|
          _regexp = keywords.map{|m| m}.join("|")
          @table_rows.push(tr) if tr.content.scan(/(#{_regexp})/).size == 1
        end
      end

      def get_dates
        month_regex  = FeriadosCl::TimeComponentNames::MONTHS.map{|m| m }.join("|")
        descriptions = get_dates_on_string_format
        
        dates        = descriptions.reduce([]) do |acc, description|
          if description != ROW_TO_AVOID
            if day = description.match(/\d+/) and month = description.match(/(#{month_regex})/)
              acc.push(Time.new(@current_year, FeriadosCl::TimeComponentNames::MONTHS.index(month[0]) + 1, day[0]))
            end
          end
          acc
        end
      end

      def get_dates_on_string_format
        @table_rows.reduce([]) do |acc, row|
          if row.children[1]
            acc.push row.children[1].content
          end
          acc
        end
      end

    end
  
  end

  module TimeComponentNames
    DAYS     = [ "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    MONTHS   = [ "Enero",  "Febrero", "Marzo", "Abril",  "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre",  "Noviembre", "Diciembre"]
  end

end
