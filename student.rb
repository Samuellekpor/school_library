require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom: nil, name: 'Unknown', parent_permission: true)
    super(age:, name:, parent_permission:)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
