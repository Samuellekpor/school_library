class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name
  attr_accessor :age
  
  private
  def is_of_age?
    @age >= 18
  end

  public
  def can_use_services?
    is_of_age? || @parent_permission
  end
end