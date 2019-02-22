require 'rails_helper'

RSpec.describe Project do
  let(:project) { Project.new }
  let(:newly_done) { Task.new(size: 3, completed_at: 1.day.ago) }
  let(:old_done) { Task.new(size: 2, completed_at: 6.months.ago) }
  let(:small_not_done) { Task.new(size: 1) }
  let(:large_not_done) { Task.new(size: 4) }

  before(:example) do
    project.tasks = [newly_done, old_done, small_not_done, large_not_done]
  end


  it "knows its velocity" do
    expect(project.completed_velocity).to eq(3)
  end
  
  it "knows its rate" do
    expect(project.current_rate).to eq(1.0 / 7)
  end
  
  it "knows its projected days remaining" do
    expect(project.projected_days_remaining).to eq(35)
  end
  
  it "knows if it is not on schedule" do
    project.due_date = 1.week.from_now
    expect(project).not_to be_on_schedule
  end
  
  it "knows if it is on schedule" do
    project.due_date = 6.months.from_now
    expect(project).to be_on_schedule
  end
  
  describe "estimates" do
    let(:project) { Project.new }
    let(:done) { Task.new(size: 2, completed: true) }
    let(:small_not_done) { Task.new(size: 1) }
    let(:large_not_done) { Task.new(size: 4) }

    before(:example) do 
      project.tasks = [done, small_not_done, large_not_done]
    end
    it "can calculate total size" do
      expect(project.total_size).to eq(7)
    end
    it "can  calculate remaining size" do
      expect(project.remaining_size).to eq(7)
    end
  end
end
