#!/usr/bin/python
# -*- coding: utf-8 -*-

# Head First デザインパターンを写経する - 2章 Observer パターン - ヨタの日々(2009-05-04)
# http://www.area51.gr.jp/~rin/diary/?date=20090504#p07

class Subject:
  def register_observer(self, observer):
    pass

  def remove_observer(self, observer):
    pass

  def notify_observers(self):
    pass

class Observer:
  def update(self, temp, humidity, pressure):
    pass

class DisplayElement:
  def display(self):
    pass


class WeatherData(Subject):

  def __init__(self):
    self.temprature = None
    self.humidity = None
    self.pressure = None
    self.observers = []

  def register_observer(self, observer):
    self.observers.append(observer)

  def remove_observer(self, observer):
    self.observers.delete(observer)

  def notify_observers(self):
    for o in self.observers:
      o.update( self.temprature, self.humidity, self.pressure)

  def measurements_changed(self):
    self.notify_observers()

  def set_measurements(self, temprature, humidity, pressure):
    self.temprature = temprature
    self.humidity = humidity
    self.pressure = pressure
    self.measurements_changed()


class CurrentConditionDisplay(Observer, DisplayElement):

  def __init__(self, weatherData):
    self.weatherdata = weatherData
    self.weatherdata.register_observer(self)

  def update(self, tempreture, humidity, pressure):
    self.tempreture = tempreture
    self.humidity = humidity
    self.display()

  def display(self):
    print "現在の気象状況: 温度 %d度 湿度%d%%" % (self.tempreture, self.humidity)

def main():
  weatherdata = WeatherData()
  currentDisplay = CurrentConditionDisplay(weatherdata)
  weatherdata.set_measurements(27, 65, 30.4)
  weatherdata.set_measurements(28, 70, 29.2)
  weatherdata.set_measurements(26, 90, 29.2)

main()

