#!/usr/bin/ruby -Ks

module Subject
  def registerObserver( observer )
  end
  
  def removeObserver( observer )
  end
  
  def notifyObservers
  end
end

module Observer
  def update( temp, humidity, pressure )
  end
end

module DisplayElement
  def display
  end
end

class WeatherData
  include Subject

  @temprature
  @humidity
  @pressure
  
  def initialize
    @observers = []
  end

  def registerObserver( observer )
    @observers << observer
  end
  
  def removeObserver( observer )
    @observers.delete( observer )
  end
  
  def notifyObservers
    @observers.each {|o|
      o.update( @temprature, @humidity, @pressure )
    }
  end
  
  def measurementsChanged
    notifyObservers
  end
  
  def setMeasurements( temprature, humidity, pressure )
    @temprature = temprature
    @humidity = humidity
    @pressure = pressure
    measurementsChanged
  end
end

class CurrentConditionDisplay
  include Observer
  include DisplayElement
  
  
  def initialize( weatherData )
    @weatherdata = weatherData
    @weatherdata.registerObserver( self )
  end
  
  def update( tempreture, humidity, pressure )
    @tempreture = tempreture
    @humidity = humidity
    display
  end

  def display
    puts "現在の気象状況: 温度#{@tempreture}度 湿度#{@humidity}%"
  end
end

def main
  weatherdata = WeatherData.new
  currentDisplay = CurrentConditionDisplay.new( weatherdata )
  weatherdata.setMeasurements( 27, 65, 30.4 )
  weatherdata.setMeasurements( 28, 70, 29.2 )
  weatherdata.setMeasurements( 26, 90, 29.2 )
end

main
