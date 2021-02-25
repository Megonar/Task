class Car 
  include ::ManufacturerName
  include ::InstanceCounter
  def initialize
    @engine = Engine.new
    @state = :closed
    @load = false
    register_instance
  end

  attr_reader :engine

  def open
    @state = :open
  end

  def load
    @load = true
  end

  def start_engine
    @engine.start
  end

  def stop_engine
    @engine.stop
  end
end

class Engine 
  include ::ManufacturerName
  include ::InstanceCounter
  def initialize
    @started = false
    register_instance
  end

  def start 
    @started = true
  end

  def stop
    @started = false
  end
end

module ManufacturerName
  attr_accessor :name
end

module InstanceCounter
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def instances 
      @instances 
    end 

    def register_instance
      @instances.to_i += 1
    end
  end

  def register_instance
    self.class.register_instance
  end
end

#Название машины методы из модуля ManufacturerName
aaa = Car.new
aaa.name = "aaabbbccc"
aaa.name
#Название двигателя 
aaa.engine.name = "asfwefwr"
aaa.engine.name

Car.instances
Engine.instance