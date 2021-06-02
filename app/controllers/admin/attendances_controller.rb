class Admin::AttendancesController < Admin::ApplicationController
    def index
        @attendances = Attendance.order(created_at: :desc)
    end
end
