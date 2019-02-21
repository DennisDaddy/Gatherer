class Project < ApplicationRecord
    attr_accessor :tasks

    def initialize
        @tasks = []
    end

    def done?
        tasks.empty?
    end   
end
