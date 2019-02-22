class Project < ApplicationRecord
    attr_accessor :tasks

    def initialize
        @tasks = []
    end

    def incomplete_tasks
        tasks.reject(&:complete?)
    end

    def done?
        tasks.all?(&:complete?)
    end  
    
    def total_size
        tasks.sum(&:size)
    end

    def remaining_size
        tasks.reject(&:complete?).sum(&:size)
    end
end
